class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only:[:index, :create]

  def index
    @transaction = Transaction.new
    if current_user.id == @item.user_id
      redirect_to  root_path
    end

    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:postal_code, :region_id, :municipality, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency: 'jpy'
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end
end
