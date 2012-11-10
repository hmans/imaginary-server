class TransformsController < ApplicationController
  def serve
    # Munge rails' :format parameter. No, setting `format: false` in routes.rb
    # won't work, as Rails placeholders will still ignore dots. Eep!
    #
    if params[:format].present?
      params[:name] = "#{params[:name]}.#{params.delete(:format)}"
    end

    # Load the data we need.
    @bucket = Bucket.find_by_name(params[:bucket_id]) || Bucket.find(params[:bucket_id])
    @image = @bucket.images.find_by_name!(params[:name])

    # Start with the source image.
    @job = @image.image

    # Collect options
    options = {}
    if params[:options].present?
      params[:options].split('/').each do |option|
        if ['stretch', 'fit', 'fill'].include?(option)
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

    # Process image, if requested.
    if options.any?
      case (options.delete(:crop_mode) || :fill).to_sym
        when :stretch
          @job = @job.process(:resize, "#{options[:width]}x#{options[:height]}!")
        when :fit
          @job = @job.process(:resize, "#{options[:width]}x#{options[:height]}")
        when :fill
          @job = @job.process(:resize_and_crop, options)
        else
          raise "Unrecognized crop mode."
      end
    end

    # Render the result!
    render text: @job.data, content_type: @job.mime_type
  end
end
