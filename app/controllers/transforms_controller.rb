class TransformsController < ApplicationController
  def serve
    @bucket = Bucket.find(params[:bucket_id])
    @image = @bucket.images.find_by_name!(params[:name])

    # start with the source image
    @job = @image.image

    # collect options
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

    # process image
    if options.any?
      case (options.delete(:crop_mode) || :stretch).to_sym
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

    # render new jpg
    render text: @job.data, content_type: 'image/jpeg'
  end
end