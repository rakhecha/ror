class InvoicesController < ApplicationController
    def index
        @invoices  = Invoice.paginate(:page => params[:page], :per_page=>2)
        # @invoices = Invoice.all
    end
    
    def show
        @invoice = Invoice.find(params[:id])
    end
    
    def create
        @invoice = Invoice.new(invoice_params)
        if @invoice.save
          flash[:notice] = 'Invoice successfully added'
          redirect_to invoices_path
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
          redirect_to invoices_path
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
        redirect_to invoices_path
    end
    
    private
      def invoice_params      
        params.require(:invoice).permit(:amount, :currency, :contract_type, :payment_cycle, :client_id, :day_of_month, :day_of_week)
      end
    
end
    