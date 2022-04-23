class Api::V1::CategoriesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    render json: @category
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.json { render json: @category, status: :created }
      else
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.json { render json: @category, status: :ok }
      else
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.json { render json: { :success => true } }
    end
  end

  private
    # Use callbacks to share current category between actions for show/update/delete.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.permit(:name)
    end
end