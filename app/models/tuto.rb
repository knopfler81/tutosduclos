class Tuto < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :category
  validates :category_id, presence: true

  scope :ruby,   -> { where(category_id: 1)}
  scope :rails4, -> { where(category_id: 2)}
  scope :rails5, -> { where(category_id: 3)}
  scope :heroku, -> { where(category_id: 4)}
  scope :aws,    -> { where(category_id: 5)}

  def self.search(search)
    if search
      where(["title LIKE ?","%#{search}%"])
    elsif :ruby
      where(["name LIKE ?","%{}%"])
    elsif :rails4
      where(["name LIKE ?","%"])
    elsif :rails5
      where(["name LIKE ?","%"])
    elsif :heroku
      where(["name LIKE ?","%"])
    elsif :aws
      where(["name LIKE ?","%"])
    else




      all
    end
  end
end
