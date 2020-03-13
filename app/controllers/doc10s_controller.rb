class Doc10sController < ApplicationController
  before_action :set_tender
  before_action :set_doc10, only: [:show, :edit, :update, :destroy,:download]

  # GET tenders/1/doc10s
  def index
    @doc10s = @tender.doc10s
  end

  # GET tenders/1/doc10s/1
  def show
  end

  # GET tenders/1/doc10s/new
  def new
    @doc10 = @tender.doc10s.build
  end

  # GET tenders/1/doc10s/1/edit
  def edit
  end


  def download
    @doc2s = @tender.doc5s
    @doc1s=  @tender.doc1s
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "DOC10",
        page_size: 'A4',
        template: "doc10s/download.pdf.erb",
        layout: "application.html.erb",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end    
  end

  # POST tenders/1/doc10s
  def create
    @doc10 = @tender.doc10s.build(doc10_params)

    if @doc10.save
      redirect_to([@doc10.tender, @doc10], notice: 'Doc10 was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT tenders/1/doc10s/1
  def update
    if @doc10.update_attributes(doc10_params)
      redirect_to([@doc10.tender, @doc10], notice: 'Doc10 was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tenders/1/doc10s/1
  def destroy
    @doc10.destroy

    redirect_to tender_doc10s_url(@tender)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:tender_id])
    end

    def set_doc10
      @doc10 = @tender.doc10s.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doc10_params

    end
end
