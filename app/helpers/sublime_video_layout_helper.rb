module SublimeVideoLayoutHelper

  def body_class
    klass = [request.subdomain]
    klass << params[:page]
    klass << @body_class
    h(klass.compact.join(' '))
  end

  def page_title
    title = []
    title << "[#{Rails.env.upcase}]" unless Rails.env.production?
    title << (@page_title_prefix || "SublimeVideo - HTML5 Video Player")
    title << "- #{@page_title}" if @page_title
    h(title.compact.join(' '))
  end

  def li_menu_link(name, options = {})
    url = custom_url(options[:page] || name)
    li_options = { onclick: "SublimeVideo.makeSticky(this, '#menu')" }
    li_options[:class] = 'active' if request.url == url

    content_tag :li, li_options do
      link_to name, url
    end
  end

  def my_url(path)
    custom_url(path, subdomain: 'my', protocol: 'https')
  end

  def docs_url(path)
    custom_url(path, subdomain: 'docs')
  end

  def custom_url(path, options = {})
    protocol   = options[:protocol] || 'http'
    protocol   = 'http' if %w[development test].include?(Rails.env)
    subdomain  = "#{options[:subdomain]}." if options[:subdomain].present?
    "#{protocol}://#{subdomain}#{request.domain}/#{path}"
  end

end
