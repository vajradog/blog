class CategoriesController < ApplicationController
  before_action :require_admin, except: [:show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'The new Category was saved'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @category = Category.find_by(slug: params[:id])
  end

  def edit
    @category = Category.find_by(slug: params[:id])
  end

  def update
    @category = Category.find_by(slug: params[:id])

    if @category.update(category_params)
      flash[:notice] = 'Category name updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find_by(slug: params[:id])
    @category.destroy
    flash[:notice] = 'Category name destroyed'
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
  
end