class ChangeExcerptFormatInPosts < ActiveRecord::Migration
  def change
    change_column :posts, :excerpt, :text, :default => 0
  end
end
