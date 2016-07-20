class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences, :id => false do |t|
      t.uuid :id, :primary_key => true
      t.string :title
      t.text :body, :null => false

      t.timestamps null: false
    end
  end
end
