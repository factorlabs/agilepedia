class Sentence < ActiveRecord::Base
  include ActiveUUID::UUID
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_nested_set
end
