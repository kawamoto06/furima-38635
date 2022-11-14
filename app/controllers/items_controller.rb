class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :ensure_user, only: [:edit]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
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

  def ensure_user
    @items = current_user.items
    @item = @items.find_by(id: params[:id])
    redirect_to root_path unless @item
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
