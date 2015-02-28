class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name

      t.timestamps null:false
    end
  end
end
