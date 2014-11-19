class LeadSignup < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :phone, :format => /[\(\)0-9\- \+\.]{10,20} *[extension\.]{0,9} *[0-9]{0,5}/, :allow_nil => true, :allow_blank => true
end
