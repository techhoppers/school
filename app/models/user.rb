class User < ActiveRecord::Base
   ROLES = %w[ADMIN STUDENT TEACHER PRINCIPAL MANAGER]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :presence => true 
  validates :phone1, :presence => true 
  validates :role, :presence => true 
  validates :encrypted_password, :presence => true
  
  def is_admin?
    role == "ADMIN"
  end

  def is_student?
    role == "STUDENT"
  end

  def is_teacher?
    role == "TEACHER"
  end

  def is_principal?
    role == "PRINCIPAL"
  end

  def is_manager?
    role == "MANAGER"
  end

  def set_default_password
   self.password = "password"
   self.password_confirmation = "password"
  end
end
