class AnchoringsController < ApplicationController
  # GET /anchorings
  # GET /anchorings.json
  def index
    @anchorings = Anchoring.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anchorings }
    end
  end

  # GET /anchorings/1
  # GET /anchorings/1.json
  def show
    @anchoring = Anchoring.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @anchoring }
    end
  end

  # GET /anchorings/new
  # GET /anchorings/new.json
  def new
    @anchoring = Anchoring.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @anchoring }
    end
  end

  # GET /anchorings/1/edit
  def edit
    @anchoring = Anchoring.find(params[:id])
  end

  # POST /anchorings
  # POST /anchorings.json
  def create
    @anchoring = Anchoring.new(params[:anchoring])

    respond_to do |format|
      if @anchoring.save
        format.html { redirect_to @anchoring, notice: 'Anchoring was successfully created.' }
        format.json { render json: @anchoring, status: :created, location: @anchoring }
      else
        format.html { render action: "new" }
        format.json { render json: @anchoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /anchorings/1
  # PUT /anchorings/1.json
  def update
    @anchoring = Anchoring.find(params[:id])

    respond_to do |format|
      if @anchoring.update_attributes(params[:anchoring])
        format.html { redirect_to @anchoring, notice: 'Anchoring was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @anchoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anchorings/1
  # DELETE /anchorings/1.json
  def destroy
    @anchoring = Anchoring.find(params[:id])
    @anchoring.destroy

    respond_to do |format|
      format.html { redirect_to anchorings_url }
      format.json { head :no_content }
    end
  end
end
