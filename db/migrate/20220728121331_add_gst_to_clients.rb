class AddGstToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :gst, :string
  end
end
