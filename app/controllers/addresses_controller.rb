class AddressesController < ApplicationController
  before_action :set_search
  before_action :set_category

  def edit
    @address = current_user.address
  end

  def update
    @address = Address.find(current_user.address)
    if @address.update(address_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def address_params
    params.require(:address).permit(:post_number, :prefecture_id, :city, :town, :building, :phone_number, :user_id)
  end
end
