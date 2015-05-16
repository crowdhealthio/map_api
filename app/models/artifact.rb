class Artifact < ActiveRecord::Base

  acts_as_mappable default_units: :miles

end
