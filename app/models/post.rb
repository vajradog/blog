class Post < ActiveRecord::Base
  include Sluggable
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  sluggable_column :title

def previous_post
  self.class.first(:conditions => ["title < ?", title], :order => "updated_at desc")
end

def next_post
  self.class.first(:conditions => ["title > ?", title], :order => "updated_at desc")
end
end