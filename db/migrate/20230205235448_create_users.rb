class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :phone
      t.string :password_digest
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
