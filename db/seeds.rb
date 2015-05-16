# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artifact.create(
  name: 'Cyprus000162',
  artifact_type: 'defibrillator',
  address: "6 Salem Road, London, W2 4BU",
  lng: "54.0",
  lat: "-2.5",
  source: 'OpenStreetMap',
  source_id: "1_234",
  long_description: "N/A"
)
