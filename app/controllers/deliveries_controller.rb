class DeliveriesController < ApplicationController
  def index
  	@delivery = Delivery.new
  	@deliveries = current_end_user.deliveries
  end

  def create
  	@delivery = Delivery.new(delivery_params)
  	@delivery.end_user_id = current_end_user.id
  	@delivery.save
  	redirect_to deliveries_path
  end

  def edit
  	@delivery = Delivery.find(params[:id])
  end

  def update
  	@delivery = Delivery.find(params[:id])
  	@delivery.update(delivery_params)
  	redirect_to deliveries_path
  end

  def destroy
  	@delivery = Delivery.find(params[:id])
  	@delivery.destroy
  	redirect_to deliveries_path
  end

  private
  def delivery_params
  	params.require(:delivery).permit(:end_user_id, :name, :postal_code, :address)
  end
end
