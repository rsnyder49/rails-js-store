class ReviewsController < ApplicationController
  before_action :require_log_in, except: [:show, :index]

  def index
    @reviews = Review.where(item_id: params[:item_id])
    @item = Item.find_by(id: params[:item_id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(user_id: current_user.id, item_id: params[:item_id], content: params[:review][:content])

    redirect_to item_path(params[:item_id])
  # else
  #    flash[:error] = "error"
  #   render 'new'
  # end
  end

  def show
    @reviews = Review.where(item_id: params[:item_id])
    @review = Review.find(params[:id])
    @user = User.find_by(id: @review.user_id)
    @item = Item.find_by(id: @review.item_id)
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :item_id)
  end

end
