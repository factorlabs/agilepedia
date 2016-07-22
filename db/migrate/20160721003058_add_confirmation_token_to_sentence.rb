class AddConfirmationTokenToSentence < ActiveRecord::Migration
  def change
    add_column :sentences, :confirmation_token, :string
  end
end
