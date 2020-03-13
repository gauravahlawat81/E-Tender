class Doc7sController < ApplicationController
  before_action :set_tender
  before_action :set_doc7, only: [:show, :edit, :update, :destroy,:download]

  # GET tenders/1/doc7s
  def index
    @doc7s = @tender.doc7s
  end

  # GET tenders/1/doc7s/1
  def show
  end

  # GET tenders/1/doc7s/new
  def new
    @doc7 = @tender.doc7s.build
  end

  # GET tenders/1/doc7s/1/edit
  def edit
  end

  def download
    @doc2s = @tender.doc5s
    @doc1s=  @tender.doc1s
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "DOC7",
        page_size: 'A4',
        template: "doc7s/download.pdf.erb",
        layout: "application.html.erb",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end    
  end


  # POST tenders/1/doc7s
  def create
    @doc7 = @tender.doc7s.build(doc7_params)

    if @doc7.save
      redirect_to([@doc7.tender, @doc7], notice: 'Doc7 was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT tenders/1/doc7s/1
  def update
    if @doc7.update_attributes(doc7_params)
      redirect_to([@doc7.tender, @doc7], notice: 'Doc7 was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE tenders/1/doc7s/1
  def destroy
    @doc7.destroy

    redirect_to tender_doc7s_url(@tender)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tender
      @tender = Tender.find(params[:tender_id])
    end

    def set_doc7
      @doc7 = @tender.doc7s.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doc7_params
    end
end
