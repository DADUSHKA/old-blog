class Post < ActiveRecord::Base
  include Twitter::Extractor
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable

  before_save :parse_hash_tags

  belongs_to :category

  state_machine :initial => :not_published do
    state :published
    state :not_published

    event :publish do
      transition :not_published => :published
    end

    event :remove_from_publication do
      transition :published => :not_published
    end
  end

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
