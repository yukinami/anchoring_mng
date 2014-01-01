class AnchorageGroundsController < ApplicationController
  #before_filter :admin_permission, except: :index_anchorings

  # GET /anchorage_grounds
  # GET /anchorage_grounds.json
  def index
    @anchorage_grounds = AnchorageGround.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anchorage_grounds }
    end
  end

  # GET /anchorage_grounds/1
  # GET /anchorage_grounds/1.json
  def show
    @anchorage_ground = AnchorageGround.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @anchorage_ground }
    end
  end

  # GET /anchorage_grounds/new
  # GET /anchorage_grounds/new.json
  def new
    @anchorage_ground = AnchorageGround.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @anchorage_ground }
    end
  end

  # GET /anchorage_grounds/1/edit
  def edit
    @anchorage_ground = AnchorageGround.find(params[:id])
  end

  # POST /anchorage_grounds
  # POST /anchorage_grounds.json
  def create
    @anchorage_ground = AnchorageGround.new(params[:anchorage_ground])

    respond_to do |format|
      if @anchorage_ground.save
        format.html { redirect_to @anchorage_ground, notice: 'Anchorage ground was successfully created.' }
        format.json { render json: @anchorage_ground, status: :created, location: @anchorage_ground }
      else
        format.html { render action: "new" }
        format.json { render json: @anchorage_ground.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /anchorage_grounds/1
  # PUT /anchorage_grounds/1.json
  def update
    @anchorage_ground = AnchorageGround.find(params[:id])

    respond_to do |format|
      if @anchorage_ground.update_attributes(params[:anchorage_ground])
        format.html { redirect_to @anchorage_ground, notice: 'Anchorage ground was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @anchorage_ground.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anchorage_grounds/1
  # DELETE /anchorage_grounds/1.json
  def destroy
    @anchorage_ground = AnchorageGround.find(params[:id])
    @anchorage_ground.destroy

    respond_to do |format|
      format.html { redirect_to anchorage_grounds_url }
      format.json { head :no_content }
    end
  end

  def index_anchorings
    @anchorage_grounds = AnchorageGround.all

    respond_to do |format|
      format.html # index_anchoring.html.erb
      format.json { render json: @anchorage_grounds }
    end
  end

end
