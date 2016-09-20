class Tuto < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :category
  validates :category_id, presence: true

end
