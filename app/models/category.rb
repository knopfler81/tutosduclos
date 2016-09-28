class Category < ActiveRecord::Base
  has_many :tutos

  def self.filter(filter)
    if filter
      #where(["name LIKE '%#{filter}%'"]).order('created_at DESC')
      #where("name LIKE '%#{filter}%'").order(created_at: :desc)
     where("name LIKE ?", "%#{filter}%").order('created_at DESC')
    else
      all
    end
  end
end
