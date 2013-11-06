class AnchoringsController < ApplicationController
  before_filter :admin_permission, except: [:show, :confirm, :anchor_sail]

  # GET /anchorings
  # GET /anchorings.json
  def index
    @anchorings = Anchoring.all

    respond_to do |format|
      format.html # index.html.erb format.json { render json: @anchorings }
    end
  end

  # GET /anchorings/1
  # GET /anchorings/1.json
  def show
    @anchoring = Anchoring.find(params[:id])
    @anchorage_grounds = AnchorageGround.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @anchoring }
    end
  end

  # GET /anchorings/1
  # GET /anchorings/1.json
  def history 
    @anchoring = Anchoring.find(params[:id])

    respond_to do |format|
      format.html # history.html.erb
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
    
    if @anchoring.status != nil
      render 'edit_anchor_sail'
    end

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
  
  def confirm
    @anchoring = Anchoring.find(params[:id])
    @anchoring.update_attributes(status: 'confirmed')

    respond_to do |format|
      if @anchoring.update_attributes(params[:anchoring])
	format.html { redirect_to index_anchorings_anchorage_grounds_path, notice: 'Anchoring was confirmed.'}
	format.json { head :no_comment }
      else
	@anchorage_grounds = AnchorageGround.all
	format.html { render action: "show" }
        format.json { render json: @anchoring.errors, status: :unprocessable_entity }
      end
    end
  end

  def anchor_sail
    @anchoring = Anchoring.find(params[:id])

    if @anchoring.status == 'confirmed'
      @anchoring.actual_anchor_date = params[:actual_anchor_date]
      @anchoring.status = 'anchored'
      notice = 'anchor datetime has been updated'
    elsif @anchoring.status == 'anchored'
      @anchoring.actual_sail_date= params[:actual_sail_date]
      @anchoring.status = 'sailed'
      notice = 'sail datetime has been updated'
    end

    @anchoring.save

    respond_to do |format|
      format.html { redirect_to index_anchorings_anchorage_grounds_path, notice: notice }
      format.json { head :no_comment }
    end

  end

end
