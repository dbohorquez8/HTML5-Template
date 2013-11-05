class User < ActiveRecord::Base
  
  attr_accessible :email
  validates_uniqueness_of :email
  validates_format_of   :email, :with => %r{.+@.\w+(\.\w+)+}, :allow_blank => false
  
end
