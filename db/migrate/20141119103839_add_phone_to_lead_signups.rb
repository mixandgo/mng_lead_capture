class AddPhoneToLeadSignups < ActiveRecord::Migration
  def change
    add_column :lead_signups, :phone, :string
  end
end
