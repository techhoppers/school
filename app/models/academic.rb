class Academic < ActiveRecord::Base
  validates :year, :presence => true
  
  has_many :standards
end
