class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, :styles => { medium:  "300x300>", thumb: "100x100#" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name,  presence: true, length: { minimum: 3, maximum: 20 }
  validates :nickname,   presence: true, length: { minimum: 3, maximum: 20 }
  has_many :tutos
  attr_accessor :avatar

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
