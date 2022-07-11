class InvoicesController < ApplicationController
    def index
        @invoices = Invoice.all
    end
    
    def show
        @invoice = Invoice.find(params[:id])
    end
    
    def create
        @invoice = Invoice.new(invoice_params)
        if @invoice.save
          flash[:notice] = 'Invoice successfully added'
          redirect_to '/invoices'
        else
          render :new, status: :unprocessable_entity
        end
    end
    def edit
        @invoice = Invoice.find(params[:id])
    end
    
    def update
        @invoice = Invoice.find(params[:id])
    
        if @invoice.update(invoice_params)
          flash[:notice] = 'Invoice successfully updated'
          redirect_to '/invoices'
        else
          render :edit, status: :unprocessable_entity
        end
    end
    
    def new
        @invoice = Invoice.new
        @clients  = Client.all
    end
    
    def destroy
        @invoice = Invoice.find(params[:id])
        @invoice.destroy
        flash[:notice] = 'Invoice successfully deleted'
        redirect_to '/invoices'
    end
    
    private
        def invoice_params      
          params.require(:invoice).permit(:amount, :currency, :contract_type, :payment_cycle, :client_id)
        end
    
end
    