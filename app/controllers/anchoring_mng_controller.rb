class AnchoringMngController < ApplicationController
  def index
    @anchorings = Anchoring.where(:status => nil)
  end
end
