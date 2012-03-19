ActsAsTaggableOn::Tag.class_eval do
  extend FriendlyId
  friendly_id :name
end
