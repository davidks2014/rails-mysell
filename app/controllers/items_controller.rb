class ItemsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def new
    # We need @restaurant in our `simple_form_for`
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user = @user


    if @item.save
      redirect_to user_path(@user), notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(@item.user), notice: "Item was successfully removed.", status: :see_other
  end

  private
  def item_params
    params.require(:item).permit(:price, :category, :name, :description, :status, photos: [])
  end

end
