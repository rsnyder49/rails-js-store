class ItemsController < ApplicationController

  def index
    @items = Item.all
    @order_item = current_order.order_items.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to item_path(@item)
    else
      flash[:notice]
      redirect_to 'items/new'
    end
  end

  def show
    @item = Item.find(params[:id])
    @transaction = Transaction.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :quantity, :img_url)
  end


end
