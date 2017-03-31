class Tuto < ActiveRecord::Base
  #acts_as_votable
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :category
  validates :category_id, presence: true
  validates :title, presence: true#, length: { maximum: 20 }
  validates :content, :description, presence: true


  scope :by_date, -> { order(created_at: :desc) }



  def self.search(search)
    if search
     where(["lower(title) LIKE ?","%#{search.downcase}%"]).order('created_at DESC')
    else
      all
    end
  end

  def rating_average
    sum = 0
    reviews.each do |review|
      sum += review.rating.to_i
    end
    average = sum / reviews.count
    return average
  end

end

