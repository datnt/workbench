class Shortener::ShortenedUrlsController < ApplicationController
  def show
    token = /^([#{Shortener.key_chars.join}]*).*/.match(params[:id])[1]

    sl = ::Shortener::ShortenedUrl.find_by_unique_key(token)
    @str_link = ""

    if sl
      Thread.new do
        sl.increment!(:use_count)
        ActiveRecord::Base.connection.close
      end
      correct_url = view_context.source_url(sl.id)
      
      @str_link = correct_url
    else
      @str_link = '/'
    end
    render :layout => "analytics"
  end
  def new
    @obj = Shortener::ShortenedUrl.new
  end
  def create
    check = validate_link(params[:shortener_shortened_url][:url])

    if  !check.nil?
      obj_params = params.require(:shortener_shortened_url).permit(:url)
      @saved_obj = Shortener::ShortenedUrl.new(obj_params)
      @saved_obj.save
    end
    #prepare for next link
    @obj = Shortener::ShortenedUrl.new
  end
  def   list
    @urls = Shortener::ShortenedUrl.all.order("created_at DESC")
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
