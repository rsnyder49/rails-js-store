class TransactionsController < ApplicationController
  before_action :require_log_in, only: :create

  def create
    if valid_transaction?
      transaction = Transaction.create(user_id: current_user.id, item_id: params[:item_id], quantity: params[:transaction][:quantity])
    end
    redirect_to items_path
  end

  private

  def valid_transaction?
    item = Item.find_by(id: params[:item_id])
    quantity = Integer(params[:transaction][:quantity])
    total_price = quantity * item.price
    user = current_user
    if quantity <= item.quantity
      if user.balance >= total_price
        item.quantity -= quantity
        user.balance -= total_price
        item.save
        user.save
        flash[:success] = "Thank you for your purchase!"
      else
        flash[:error] = "Insufficient balance. Please add required funds"
      end
    else
      flash[:error] = "Insufficient stock. Please try another item"
      nil
    end
  end

end
