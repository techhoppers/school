class Standard < ActiveRecord::Base
  validates :standard_name, :presence => true
  
  has_many :divisions
  belongs_to :academic
end
