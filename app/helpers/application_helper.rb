# encoding: utf-8

module ApplicationHelper
  def render_menu
    PAGES.map { |name, url| content_tag :li, link_to(name, url) }.join.html_safe
  end

  def subnav(scope)
    links = SUBPAGES[scope].map { |param, name| content_tag :li, link_to(name, "#{url_for(scope)}/#{param}") }
    content_tag :ul, links.join.html_safe
  end
end
