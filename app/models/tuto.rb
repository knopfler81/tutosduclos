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
    else
      all
    end
  end

  def self.filter(filter)
    if filter
      where(["name LIKE ?", "%#{filter}%"])
    else
      all
    end
  end

end



