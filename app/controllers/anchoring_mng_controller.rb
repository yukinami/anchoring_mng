class AnchoringMngController < ApplicationController
  def index
    @anchorings = Anchoring.where(:status => nil)
  end

  def history
    @anchorings = Anchoring.where(:status => 'sailed')
  end

end
