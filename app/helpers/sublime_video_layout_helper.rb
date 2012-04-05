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
    url = custom_url(options[:path] || name, options)
    classes = Array(options[:class])
    classes << 'active' if request.url == url
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
    protocol   = options[:protocol] || (request.ssl? ? 'https' : 'http')
    protocol   = 'http' if %w[development test].include?(Rails.env)
    if options[:subdomain]
      subdomain = "#{options[:subdomain]}."
    elsif options[:subdomain] != false
      subdomain = "#{request.subdomain}."
    end
    "#{protocol}://#{subdomain}#{request.domain}/#{path.sub(%r{\A/}, '')}"
  end

end
