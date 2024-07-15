class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
