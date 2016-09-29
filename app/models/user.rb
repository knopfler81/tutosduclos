class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name,  presence: true, length: { minimum: 3, maximum: 20 }
  validates :nickname,   presence: true, length: { minimum: 3, maximum: 20 }
  has_many :tutos

  def full_name
    "#{first_name} #{last_name} "
  end

  def self.select(select)
    if select
     where(["first_name LIKE ?","%#{select}%"])
    else
      all
    end
  end


end
