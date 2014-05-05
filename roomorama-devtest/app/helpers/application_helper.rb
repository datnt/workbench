module ApplicationHelper
  def source_url(id)
    obj = Shortener::ShortenedUrl.find(id)
    s_url = ""
    #if obj.url.split("http://").size > 1
    if obj.url.first(4) == "http"
      s_url = obj.url
    else
      s_url = "http://#{obj.url}"
    end
    s_url
  end
  def shortened_url(id)
    obj = Shortener::ShortenedUrl.find(id)
    s_url = "#{ROOMORAMA_DOMAIN}/#{obj.unique_key}"
    s_url
  end
end
