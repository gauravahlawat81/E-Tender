class Doc6sController < ApplicationController
  before_action :set_tender
  before_action :set_doc6, only: [:show, :edit, :update, :destroy]

  # GET tenders/1/doc6s
  def index
    @doc6s = @tender.doc6s
  end

  # GET tenders/1/doc6s/1
  def show
  end

  # GET tenders/1/doc6s/new
  def new
    @doc6 = @tender.doc6s.build
  end

  # GET tenders/1/doc6s/1/edit
  def edit
  end

  # POST tenders/1/doc6s
  def create
    @doc6 = @tender.doc6s.build(doc6_params)

    if @doc6.save
      redirect_to([@doc6.tender, @doc6], notice: 'Doc6 was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT tenders/1/doc6s/1
  def update
    if @doc6.update_attributes(doc6_params)
      redirect_to([@doc6.tender, @doc6], notice: 'Doc6 was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tenders/1/doc6s/1
  def destroy
    @doc6.destroy

    redirect_to tender_doc6s_url(@tender)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:tender_id])
    end

    def set_doc6
      @doc6 = @tender.doc6s.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doc6_params
      params.require(:doc6).permit(:debit_head, :item_name, :type, :number_bids_received, :number_bidder_representative, :number_of_bids_accepted, :name_of_accepted_firms, :number_of_bids_rejected, :name_of_rejected_firms, :date_of_financial_bid_opening)
    end
end
