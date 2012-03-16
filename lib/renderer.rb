class Renderer < Redcarpet::Render::HTML
  include Twitter::Autolink
  def header(text, level)
    level += 1
    "<h#{level}>#{text}</h#{level}>"
  end
  
  def postprocess(text)
    options = { 
      :hashtag_url_base => '/tags/', 
      :suppress_no_follow => true }
    auto_link_hashtags text, options
  end
end
