class Division < ActiveRecord::Base
  validates :division_name, :presence => true
  
  belongs_to :standard
end
