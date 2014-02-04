class StudentDivision < ActiveRecord::Base
  belongs_to :user
  belongs_to :division
end
