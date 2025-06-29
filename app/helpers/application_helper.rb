module ApplicationHelper
  def website_name(url)
    uri = URI.parse(url)
    host = uri.host
    domain = host.sub(/^www\./, '')
    domain.split('.').first.capitalize
  rescue URI::InvalidURIError, NoMethodError
    nil
  end
end
