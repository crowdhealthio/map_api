class Artifact < ActiveRecord::Base

  belongs_to :type
  store_accessor :properties
  acts_as_mappable default_units: :miles

  def nearest(lat, lng)
    self
  end

  def self.types
    self.uniq.pluck(:artifact_type).map do |artifact|
      { type: artifact }
    end
  end
end
