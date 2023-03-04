class AddReferenceToUserInDeal < ActiveRecord::Migration[7.0]
  def change
    add_reference :deals, :user, foreign_key: true, null: true
  end
end
