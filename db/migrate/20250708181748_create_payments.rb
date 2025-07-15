# db/migrate/001_create_payments.rb
class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.string :correlation_id, null: false
      t.decimal :amount, precision: 15, scale: 2, null: false
      t.datetime :requested_at
      t.integer :processor_type, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.datetime :processed_at

      t.timestamps
    end

    add_index :payments, :correlation_id, unique: true
    add_index :payments, :processor_type
    add_index :payments, :status
    add_index :payments, :requested_at
    add_index :payments, [ :processor_type, :status ]
  end
end
