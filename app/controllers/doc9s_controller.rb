class Doc9sController < ApplicationController
  before_action :set_tender
  before_action :set_doc9, only: [:show, :edit, :update, :destroy,:download]

  # GET tenders/1/doc9s
  def index
    @doc9s = @tender.doc9s
  end

  # GET tenders/1/doc9s/1
  def show
  end

  # GET tenders/1/doc9s/new
  def new
    @doc9 = @tender.doc9s.build
  end

  # GET tenders/1/doc9s/1/edit
  def edit
  end

  def download
    @doc2s = @tender.doc5s
    @doc1s=  @tender.doc1s
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "DOC9",
        page_size: 'A4',
        template: "doc9s/download.pdf.erb",
        layout: "application.html.erb",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end    
  end


  # POST tenders/1/doc9s
  def create
    @doc9 = @tender.doc9s.build(doc9_params)

    if @doc9.save
      redirect_to([@doc9.tender, @doc9], notice: 'Doc9 was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT tenders/1/doc9s/1
  def update
    if @doc9.update_attributes(doc9_params)
      redirect_to([@doc9.tender, @doc9], notice: 'Doc9 was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tenders/1/doc9s/1
  def destroy
    @doc9.destroy

    redirect_to tender_doc9s_url(@tender)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:tender_id])
    end

    def set_doc9
      @doc9 = @tender.doc9s.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doc9_params
      
    end
end
