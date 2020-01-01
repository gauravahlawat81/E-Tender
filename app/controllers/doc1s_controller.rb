class Doc1sController < ApplicationController
  load_and_authorize_resource :tender
  load_and_authorize_resource :doc1, through: :tender

  before_action :set_tender
  before_action :set_doc1, only: [:show, :edit, :update, :destroy,:download]

  # GET tenders/1/doc1s
  def index
    @doc1s = @tender.doc1s
    
  end

  # GET tenders/1/doc1s/1
  def show
    if @tender.locked? 
      @doc1.locked!
      redirect_to tenders_path
    end
    end

  # GET tenders/1/doc1s/new
  def new
    if @tender.locked?
      @doc1.locked!
    else
        @doc1 = @tender.doc1s.build
      end
  end

  # GET tenders/1/doc1s/1/edit
  def edit
  end

  def download
    if @tender.locked?
      @doc1.locked!
    else
      @doc1s = @tender.doc1s
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "DOC1",
          page_size: 'A4',
          template: "doc1s/download.pdf.erb",
          layout: "application.html.erb",
          orientation: "Portrait",
          lowquality: true,
          zoom: 1,
          dpi: 75
        end
      end   
    end 
  end

  # POST tenders/1/doc1s
  def create
    @doc1 = @tender.doc1s.build(doc1_params)
      @doc1.user_id = @tender.user_id
      if @doc1.save
        redirect_to([@doc1.tender, @doc1], notice: 'Doc1 was successfully created.')
      else
        render action: 'new'
      end
    
  end

  # PUT tenders/1/doc1s/1
  def update
    if @tender.locked? 
      @doc1.locked!
    else
      if @doc1.update_attributes(doc1_params)
        redirect_to([@doc1.tender, @doc1], notice: 'Doc1 was successfully updated.')
      else
        render action: 'edit'
      end
    end
  end

  # DELETE tenders/1/doc1s/1
  def destroy
    @doc1.locked!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:tender_id])
    end

    def set_doc1
      @doc1 = @tender.doc1s.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doc1_params
      params.require(:doc1).permit(
        :debit_head,
        :item_name,
        :quantity,
        :estimated_cost,
        :type_of_tender
        )
    end
end
