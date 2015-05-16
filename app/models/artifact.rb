class Artifact < ActiveRecord::Base

  acts_as_mappable default_units: :miles

  def self.types
    self.uniq.pluck(:artifact_type)
  end

end
