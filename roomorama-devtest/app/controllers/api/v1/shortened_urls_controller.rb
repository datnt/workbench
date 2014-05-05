class Api::V1::ShortenedUrlsController < ApplicationController
  def create
    check = validate_link(params[:link][:url])
    @source_link = params[:link][:url]

    if  !check.nil?
      obj_params = params.require(:link).permit(:url)
      @saved_obj = Shortener::ShortenedUrl.new(obj_params)
      @saved_obj.save
    end
  end
  
  def stats
    prepare_profile
    get_city_data
  end
  
  private
  def validate_link(s_url)
    check = nil
    if s_url.first(4) != "http"
      s_url = "http://#{s_url}" #fix the issue with link without http; e.g: google.com
    end
    begin
      check = Mechanize.new.get(s_url)
    rescue => e
      logger.info "#{e.backtrace.join("\n")}"
    end
    check
  end
end
