class AddNestedSetToSentence < ActiveRecord::Migration
  def change
    add_column :sentences, :parent_id, :integer, :null => true, :index => true
    add_column :sentences, :lft, :integer, :null => false, :index => true, :default => 1
    add_column :sentences, :rgt, :integer, :null => false, :index => true, :default => 1
    add_column :sentences, :depth, :integer, :null => false, :default => 0
    add_column :sentences, :children_count, :integer, :null => false, :default => 0
  end
end
