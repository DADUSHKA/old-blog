class Post < ActiveRecord::Base
  include Twitter::Extractor

  acts_as_taggable
  before_save :parse_hash_tags

  private
  def parse_hash_tags
    self.tag_list.add extract_hashtags body
  end
end
