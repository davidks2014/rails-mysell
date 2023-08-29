class ItemsController < ApplicationController

  def index
    # raise
    @items = Item.all
    if params[:search]
      @items = Item.where("name LIKE ?", "%#{ params[:search][:query]}%")
    end
  end

  def show
    #@user = User.find(params[:user_id])
    @item = Item.find(params[:id])
    @user = @item.user
    authorize @item
  end

  def new
    @user = current_user
    @item = Item.new
    authorize @item
  end

  def create
    @user = current_user
    @item = Item.new(item_params)
    @item.user = @user
    authorize @item

    if @item.save
      redirect_to user_path(@user), notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def category
    @items = Item.where(category: params[:category])
    raise
  end

  def destroy
    authorize @item
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(@item.user), notice: "Item was successfully removed.", status: :see_other
  end

  private
  def item_params
    params.require(:item).permit(:price, :category, :name, :description, :status, photos: [])
  end
end
