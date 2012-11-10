class TransformsController < ApplicationController
  def serve
    # Munge rails' :format parameter. No, setting `format: false` in routes.rb
    # won't work, as Rails placeholders will still ignore dots. Eep!
    #
    if params[:format].present?
      params[:name] = "#{params[:name]}.#{params.delete(:format)}"
    end

    # Extract signature from params, if present
    if params[:name] =~ /^(.+)-(.+)$/
      params[:name] = $1
    end

    # Load the data we need.
    @bucket = Bucket.find_by_name(params[:bucket_id]) || Bucket.find(params[:bucket_id])
    @image = @bucket.images.find_by_name!(params[:name])

    # Check signature
    raise "Signature was rejected." if request.fullpath != transform_url(@image, params[:options])

    # Collect options
    options = {}
    if params[:options].present?
      params[:options].split('/').each do |option|
        if ['stretch', 'fit', 'crop', 'thumb'].include?(option)
          options[:crop_mode] = option
        elsif ['n', 'ne', 'e', 'se', 's', 'sw', 'w', 'nw'].include?(option)
          options[:gravity] = option
        elsif option =~ /^(\d*)(x(\d*))?$/
          options[:width] = $1
          options[:height] = $3
        else
          raise "Unknown option #{option}."
        end
      end
    end

    # Start with the source image.
    @job = @image.image

    # Process image, if requested.
    if options.any?
      case (options.delete(:crop_mode) || :thumb).to_sym
        when :stretch
          @job = @job.process(:resize, "#{options[:width]}x#{options[:height]}!")
        when :fit
          @job = @job.process(:thumb, "#{options[:width]}x#{options[:height]}>")
        when :crop
          @job = @job.process(:crop, options)
        when :thumb
          @job = @job.process(:resize_and_crop, options)
        else
          raise "Unrecognized crop mode."
      end
    end

    # Render the result!
    expires_in 30.days, public: true
    render text: @job.data, content_type: @job.mime_type
  end

  def welcome
  end
end
