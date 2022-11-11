class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def shipping_cost
    @item = Item.find_by(shipping_cost_id: params[:id])
    @items = Item.where(shipping_cost_id: params[:id]).order('created_at DESC')
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :prefecture_id, :shipping_cost_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    return if user_signed_in?

    redirect_to '/users/sign_in'
  end
end
