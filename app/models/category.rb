class Category < ActiveRecord::Base
  has_many :posts
  has_ancestry
  attr_accessible :name
  validates :name, :presense => true, :uniqueness => true
end
