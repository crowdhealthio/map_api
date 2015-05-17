class AddPropertiesToArtifact < ActiveRecord::Migration
  def up
    add_column :artifacts, :properties, :hstore
  end

  def down
    remove_column :artifacts, :properties
  end
end
