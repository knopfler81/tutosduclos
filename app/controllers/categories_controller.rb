class CategoriesController < ApplicationController

  private

    def category_params
      params.require(:categories).permit(:name, :description, :id)
    end

end
