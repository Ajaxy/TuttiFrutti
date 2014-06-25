# encoding: utf-8

module ApplicationHelper
  def render_menu
    PAGES.map { |name, url|
      if url.is_a? Hash
        content_tag :li, link_to(name, url.values[0]) + dhtml_menu(url), class: 'dhtml_menu_trigger'
      else
        content_tag :li, link_to(name, url)
      end
    }.join.html_safe
  end

  def subnav(scope)
    links = SUBPAGES[scope].map { |param, name| content_tag :li, link_to(name, "#{url_for(scope)}/#{param}") }
    content_tag :ul, links.join.html_safe
  end

  private

  def dhtml_menu(items)
    content_tag :ul, items.map { |name, url| content_tag :li, link_to(name, url) }.join.html_safe, class: 'dhtml_menu'
  end
end
