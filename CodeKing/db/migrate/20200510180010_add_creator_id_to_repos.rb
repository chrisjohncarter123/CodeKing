class AddCreatorIdToRepos < ActiveRecord::Migration[5.2]
  def change
    add_column :repos, :creator_id, :integer
  end
end
