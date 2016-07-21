class AddUserToSentence < ActiveRecord::Migration
  def change
    add_reference :sentences, :user, index: true, foreign_key: true
  end
end
