class Doc5sController < ApplicationController
  before_action :set_tender
  before_action :set_doc5, only: [:show, :edit, :update, :destroy,:download]

  # GET tenders/1/doc5s
  def index
    @doc5s = @tender.doc5s
  end

  # GET tenders/1/doc5s/1
  def show
  end

  # GET tenders/1/doc5s/new
  def new
    @doc5 = @tender.doc5s.build
  end

  # GET tenders/1/doc5s/1/edit
  def edit
  end

  def download
    @doc2s = @tender.doc5s
    @doc1s=  @tender.doc1s
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "DOC5",
        page_size: 'A4',
        template: "doc5s/download.pdf.erb",
        layout: "application.html.erb",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end    
  end


  #POST tenders/1/doc5s
  def create
    @doc5 = @tender.doc5s.build(doc5_params)

    if @doc5.save
      redirect_to([@doc5.tender, @doc5], notice: 'Doc5 was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT tenders/1/doc5s/1
  def update
    if @doc5.update_attributes(doc5_params)
      redirect_to([@doc5.tender, @doc5], notice: 'Doc5 was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tenders/1/doc5s/1
  def destroy
    @doc5.destroy

    redirect_to tender_doc5s_url(@tender)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:tender_id])
    end

    def set_doc5
      @doc5 = @tender.doc5s.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doc5_params
    end
  
end
