class AddNewsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :news, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :users, :news
  end
end
