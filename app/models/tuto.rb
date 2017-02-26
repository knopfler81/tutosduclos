class Tuto < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :category
  validates :category_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true


  scope :by_date, -> { order(created_at: :desc) }


  def self.search(search)
    if search
     where(["lower(title) LIKE ?","%#{search.downcase}%"]).order('created_at DESC')
    else
      all
    end
  end

end

