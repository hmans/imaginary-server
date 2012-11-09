class TransformsController < ApplicationController
  def serve
    @bucket = Bucket.find(params[:bucket_id])
    @image = @bucket.images.find_by_name!(params[:name])

    # start with the source image
    @job = @image.image

    options = {}
    if params[:options].present?
      params[:options].split(',').each do |option|
        key, value = option.split('_')
        case key
          when 'w' then options[:width] = value
          when 'h' then options[:height] = value
          when 'c' then options[:crop_mode] = value
          when 'g' then options[:gravity] = value
          else raise "Unrecognized option #{option}."
        end
      end
    end

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
