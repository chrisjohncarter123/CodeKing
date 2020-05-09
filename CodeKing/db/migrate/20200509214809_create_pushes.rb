class CreatePushes < ActiveRecord::Migration[5.2]
  def change
    create_table :pushes do |t|
      t.integer :repo_id
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
