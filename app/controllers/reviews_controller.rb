class ReviewsController < ApplicationController
 before_action :find_list, only: [:create, :new]

  def new
    @review = Review.new
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def create
    @review = Review.new(review_params)
    # link the review to the restaurant
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
