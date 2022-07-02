class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = 'Client successfully added'
      redirect_to '/clients'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      flash[:notice] = 'Client successfully updated'
      redirect_to '/clients'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @client = Client.new
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = 'Client successfully deleted'
    redirect_to '/clients'
  end

  private
    def client_params      
      params.require(:client).permit(:company_name, :billing_address, :phone_number)
    end

end
