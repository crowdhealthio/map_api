class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.string :name
      t.text :address
      t.text :long_description
      t.float :lat
      t.float :lng
      t.string :artifact_type
      t.string :source
      t.string :source_id
    end
  end
end
