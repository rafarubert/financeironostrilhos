class DriveFixed < ActiveRecord::Base
  def valor
    self.entry ? self.value : self.value * -1
  end
end
