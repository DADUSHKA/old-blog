class Renderer < Redcarpet::Render::HTML
  include Twitter::Autolink
  def header(text, level)
    level += 1
    "<h#{level}>#{text}</h#{level}>"
  end
 
  def paragraph(text)
    options = { 
      :hashtag_url_base => '/post/tags/', 
      :suppress_no_follow => true }
    result = auto_link_hashtags text, options
    "<p>#{result}</p>\n"
  end
end
