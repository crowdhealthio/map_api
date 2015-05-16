class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.string :name
      t.text :long_description
      t.st_point :lonlat, geographic: true
      t.string :type
    end
  end
end
