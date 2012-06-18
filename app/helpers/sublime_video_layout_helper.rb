require 'site_token'

module SublimeVideoLayoutHelper

  def body_class
    h([request.subdomain, @body_class].compact.join(' '))
  end

  def page_title
    title = []
    title << "[#{Rails.env.upcase}]" unless Rails.env.production?
    title << (@page_title_prefix || "SublimeVideo - HTML5 Video Player")
    title << "- #{@page_title}" if @page_title
    h(title.compact.join(' '))
  end

  def li_menu_link(name, options = {})
    url = custom_url(options[:path] || name, options)
    classes = Array(options[:class])
    classes << 'active' if URI(request.url) == URI(url)
    content_tag :li, { class: classes.join(' ') } do
      link_to name, url
    end
  end

  def layout_li_menu_link(name, options = {})
    li_menu_link(name, options.merge(subdomain: false, protocol: 'http'))
  end

  def layout_url(path)
    custom_url(path, subdomain: false, protocol: 'http')
  end

  def my_url(path)
    custom_url(path, subdomain: 'my', protocol: 'https')
  end

  def docs_url(path)
    custom_url(path, subdomain: 'docs', protocol: 'http')
  end

  def custom_url(path, options = {})
    protocol  = options[:protocol] || (request.ssl? ? 'https' : 'http')
    protocol  = 'http' if %w[development test].include?(Rails.env)
    subdomain = if options[:subdomain]
      "#{options[:subdomain]}."
    elsif options[:subdomain] != false
      request_subdomain ? "#{request_subdomain}." : ''
    end
    port = request.port ? ":#{request.port}" : ''

    "#{protocol}://#{subdomain}#{request_domain}#{port}/#{path.sub(%r{\A/}, '')}"
  end

  def sublimevideo_include_tag(ssl_request, name)
    %(<script src="#{ssl_request ? "https://4076.voxcdn.com" : "http://cdn.sublimevideo.net"}/js/#{::SiteToken[name.to_sym]}.js" type="text/javascript"></script>)
  end

  private

  def request_subdomain
    if request.domain == 'xip.io'
      subdomains = request.subdomain.split('.')
      if subdomains.size == 6
        subdomains.shift
      else
        nil
      end
    else
      request.subdomain.empty? ? nil : request.subdomain
    end
  end

  def request_domain
    if request.domain == 'xip.io'
      subdomains = request.subdomain.split('.')
      subdomains.shift if subdomains.size == 6
      subdomains.join('.') << '.xip.io'
    else
      request.domain
    end
  end

end
