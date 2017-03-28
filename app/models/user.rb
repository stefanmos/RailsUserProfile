class User < ApplicationRecord
  has_one :profile, :dependent => :destroy
  before_create :create_profile
    
  def create_profile
    profile = build_profile(:name => "Person Name", :surname => "Person Surname",  :contact => "000 000 0000",)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
