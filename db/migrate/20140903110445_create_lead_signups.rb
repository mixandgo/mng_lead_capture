class CreateLeadSignups < ActiveRecord::Migration
  def change
    create_table :lead_signups do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
