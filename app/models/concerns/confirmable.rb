# Style according to: http://stackoverflow.com/a/15078070 
module Confirmable
  extend ActiveSupport::Concern
  
  included do
    before_save :confirm
  end
  
  def confirm
    self.confirmation_token = Digest::MD5.hexdigest title + SecureRandom.hex
    # self.save!  
  end
end