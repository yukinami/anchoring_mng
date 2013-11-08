class AnchoringMngController < ApplicationController
  skip_before_filter :authorize, only: :index
  def index
    @anchorings = Anchoring.where(:status => nil)
    @anchorings = @anchorings.paginate(:page => params[:page], :per_page => PER_PAGE)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anchorings }
    end
  end

  def history
    @anchorings = Anchoring.where(:status => 'sailed')
    if !params[:report_org].blank?
      @anchorings = @anchorings.where("report_org LIKE ?", "%#{params[:report_org]}%")
    end

    if !params[:ship_name].blank?
      @anchorings = @anchorings.where("ship_name LIKE ?", "%#{params[:ship_name]}%")
    end

    if !params[:anchorage_ground_name].blank?
      @anchorings = @anchorings.joins(:anchorage_ground).where("name LIKE ?", "%#{params[:anchorage_ground_name]}%")
    end

    if !params[:anchor_month].blank? 
      begin
	anchor_date = Date.strptime(params[:anchor_month], '%Y-%m')
	@anchorings = @anchorings.where(created_at: anchor_date.midnight..anchor_date.next_month.midnight)
      rescue ArgumentError
	@anchorings = Anchoring.none
	
	flash[:notice] = 'Format of anchor month is not corrected. '
      end

    end

    order_by = ORDERBY_MAP[params[:order_by]]
    order = ORDER_MAP[params[:order]]

    if order_by and order
      @anchorings = @anchorings.order("#{order_by} #{order}")
    end
    
    @anchorings = @anchorings.paginate(:page => params[:page], :per_page => PER_PAGE)

    respond_to do |format|
      format.html # history.html.erb
      format.json { render json: @anchorings }
    end
  end

end
