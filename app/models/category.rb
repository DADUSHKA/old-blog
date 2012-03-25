class Category < ActiveRecord::Base
  has_many :posts
  has_ancestry
  attr_accessible :name
  validates :name, :presence => true, :uniqueness => true
end
