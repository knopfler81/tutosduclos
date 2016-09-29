class Tuto < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :category
  validates :category_id, presence: true


  def self.search(search)
    if search
     where(["title LIKE ?","%#{search}%"]).order('created_at DESC')
    else
      all
    end
  end

end

# scope :ruby,   -> { where(category_id: 1)}
# scope :rails4, -> { where(category_id: 2)}
# scope :rails5, -> { where(category_id: 3)}
# scope :heroku, -> { where(category_id: 4)}
# scope :aws,    -> { where(category_id: 5)}
