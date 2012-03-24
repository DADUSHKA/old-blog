class Post < ActiveRecord::Base
  include Twitter::Extractor
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable
  before_save :parse_hash_tags

  private
  def parse_hash_tags
    tag_list.clear

    extend PostHelper
    html = markdown body
    doc = Hpricot html
    paragraphs = doc.search("//p").join
    
    tags = extract_hashtags paragraphs
    tag_list.add tags
  end
end
