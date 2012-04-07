module ApplicationHelper
  def display_tree (roots, options = {}, &block)
    return '' if roots.empty?
    items = roots.inject('') do |string, node|
      item = yield(node) + display_tree(node.children, options, &block)
      string + content_tag(:li, item, options[:li], false)
    end
    content_tag :ul, items, options[:ul], false
  end
end
