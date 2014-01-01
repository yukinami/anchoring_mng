class AnchoringsController < ApplicationController
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
  def apply
    @anchoring = Anchoring.find(params[:id])
    @anchorage_grounds = AnchorageGround.all

    respond_to do |format|
      format.html # apply.html.erb
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

    puts @anchoring
    
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
    @anchoring.status = 'confirmed'
    @anchoring.confirm_attn_id = session[:user_id]
    @anchoring.save

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
      @anchoring.update_attributes(params[:anchoring])
      @anchoring.status = 'anchored'
      @anchoring.anchor_attn_id = session[:user_id]

      notice = 'anchor datetime has been updated'
    elsif @anchoring.status == 'anchored'
      @anchoring.update_attributes(params[:anchoring])
      @anchoring.status = 'sailed'
      @anchoring.sail_attn_id = session[:user_id]
    
      notice = 'sail datetime has been updated'
    end

    @anchoring.save

    respond_to do |format|
      format.html { redirect_to index_anchorings_anchorage_grounds_path, notice: notice }
      format.json { head :no_comment }
    end

  end

  def import
    f = params[:import_file].tempfile
    anchoring_params = [:report_org, :category, :ship_name, :ship_name_en,
			:country, :ship_type, :ship_length, :cargo, :amount,
			:gt, :nt, :max_draft, :power, :anchor_reason,
			:anchor_date, :sail_date, :pier, :ship_contact,
			:contacter, :cellphone, :fax]

    begin
      @anchoring = Anchoring.new create_anchoring_from_anchoring_params(f, anchoring_params)
    rescue 
      flash[:notice] = I18n.t('msg.import_file_is_incorrect')
      @anchoring = Anchoring.new
    end

    respond_to do |format|
      format.html { render 'new' }
      format.json { render json: @anchoring }
    end
  end

  private
    def create_anchoring_from_anchoring_params(source, params)
      anchoring_params = Hash.new
      params.each do |p|
	anchoring_params[p] = ANCHORING_RESOLVER.resolve source, 'anchoring', p
      end
      
      format = I18n.translate('time.formats.default')
      anchor_date = DateTime.strptime(anchoring_params[:anchor_date], format)
      sail_date = DateTime.strptime(anchoring_params[:sail_date], format)

      anchoring_params[:'anchor_date(1i)'] = anchor_date.year.to_s
      anchoring_params[:'anchor_date(2i)'] = anchor_date.month.to_s
      anchoring_params[:'anchor_date(3i)'] = anchor_date.day.to_s
      anchoring_params[:'anchor_date(4i)'] = anchor_date.hour.to_s

      anchoring_params[:'sail_date(1i)'] = sail_date.year.to_s
      anchoring_params[:'sail_date(2i)'] = sail_date.month.to_s
      anchoring_params[:'sail_date(3i)'] = sail_date.day.to_s
      anchoring_params[:'sail_date(4i)'] = sail_date.hour.to_s
      
      anchoring_params.except(:anchor_date, :sail_date)
    end

end
