class AddTypeIdToArtifact < ActiveRecord::Migration
  def change
    add_column :artifacts, :type_id, :integer
  end
end
