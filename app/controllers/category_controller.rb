class CategoryController < ApplicationController
  
  def index 
    @categories = Category.all.order(name: :asc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  
        if @category.save
          
          redirect_to new_post_path
        else
           render :new, status: :unprocessable_entity
        end
    
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_index_path 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
