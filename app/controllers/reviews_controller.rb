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

    @review = Review.new(user_id: current_user.id, item_id: params[:item_id], content: params[:review][:content])
    @review.item = Item.find(params[:item_id])
    @review.user = current_user
    @review.save

    redirect_to item_path(params[:item_id])
  # else
  #    flash[:error] = "error"
  #   render 'new'
  # end
  end

  def show
    @item = Item.find(params[:item_id])
    @reviews = Review.where(item_id: params[:item_id])
    @review = Review.find(params[:item_id])
    # @user = User.find_by(id: @review.user_id)
    # @item = Item.find_by(id: @review.item_id)
  end

  # private
  #
  # def review_params
  #   params.require(:review).permit(:content, :user_id, :item_id)
  # end

end
