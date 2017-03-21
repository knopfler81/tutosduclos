class HomeController < ApplicationController
  def landing
    @tutos = Tuto.find(:all, order: "DESC", :limit => 5).reverse
  end
end
