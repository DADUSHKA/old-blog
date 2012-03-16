module PostHelper
  def markdown(text)
    options = {
      :autolink      => true,
      :tables        => true,
      :strikethrough => true}
    render = ::Renderer.new #:hard_wrap => true
    markdown = Redcarpet::Markdown.new render, options
    html = markdown.render text
    html.html_safe
  end
end
