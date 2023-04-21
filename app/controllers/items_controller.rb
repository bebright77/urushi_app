class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.all
    #@user = User.find(params[:id])
  end

  def new
    #@user = User.find(params[:id])
    if #@item.user.id == 1
      @item = Item.new
    else
      redirect_to root_path
    end
    
  end

  def create
    #@user = User.find(params[:id])
    if current_user.id == 1
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path(@item)
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :concept, :material, :category_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
