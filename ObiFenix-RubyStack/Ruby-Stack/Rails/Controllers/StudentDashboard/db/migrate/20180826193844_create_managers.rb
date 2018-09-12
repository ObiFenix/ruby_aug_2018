class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      # t.integer  :dojo_id
      t.references :dojo, index: true, foreign_key: true
      t.string   :password_digest

      t.timestamps null: false
    end
  end
end
