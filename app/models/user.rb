class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :first_name, :with => /\A[a-z]{2,}\Z/is
  validates_format_of :last_name, :with => /\A[a-z]{2,}\Z/is
  validates_format_of :organisation, :with => /\A^[-a-z0-9]{2,}\Z/is
end
