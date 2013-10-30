class AnchorageGround < ActiveRecord::Base
  attr_accessible :name
  has_many :anchorings do
    def confirmed
      where(:status => "confirmed")
    end

    def anchored
      where(:status => 'anchored')
    end
  end

end
