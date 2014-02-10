class Academic < ActiveRecord::Base
  validates :year, :presence => true
end
