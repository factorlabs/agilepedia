class AddSlugToSentence < ActiveRecord::Migration
  def change
    add_column :sentences, :slug, :string
    add_index :sentences, :slug, unique: true
  end
end
