class Pet < ActiveRecord::Base
  def self.search(zip)
    where(:zip => zip)
  end
end