class Sentence < ActiveRecord::Base
  include ActiveUUID::UUID
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_nested_set
  belongs_to :user, autosave: true
  accepts_nested_attributes_for :user
  validates :title, :body, presence: true
  include Confirmable
  

  def autosave_associated_records_for_user
    if existing_user = User.find_by(email: user.email)
      self.user = existing_user
    else
      user.save!
      self.user = user
    end
  end

end
