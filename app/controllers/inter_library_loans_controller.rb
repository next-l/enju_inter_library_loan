class InterLibraryLoansController < ApplicationController
  before_action :store_page, only: :index
  before_action :set_inter_library_loan, only: [:show, :edit, :update, :destroy]
  before_action :check_policy, only: [:index, :new, :create]
  before_action :get_item

  # GET /inter_library_loans
  # GET /inter_library_loans.json
  def index
    if @item
      @inter_library_loans = @item.inter_library_loans.page(params[:page])
    else
      @inter_library_loans = InterLibraryLoan.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inter_library_loans }
      format.rss  { render layout: false }
      format.atom
    end
  end

  # GET /inter_library_loans/1
  # GET /inter_library_loans/1.json
  def show
    @inter_library_loan = InterLibraryLoan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inter_library_loan }
    end
  end

  # GET /inter_library_loans/new
  # GET /inter_library_loans/new.json
  def new
    @inter_library_loan = InterLibraryLoan.new
    @libraries = Library.where('id != ?', current_user.profile.try(:library_id))

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inter_library_loan }
    end
  end

  # GET /inter_library_loans/1/edit
  def edit
    @inter_library_loan = InterLibraryLoan.find(params[:id])
    @libraries = Library.where('id != ?', current_user.profile.try(:library_id))
  end

  # POST /inter_library_loans
  # POST /inter_library_loans.json
  def create
    @inter_library_loan = InterLibraryLoan.new(params[:inter_library_loan])
    item = Item.where(item_identifier: params[:inter_library_loan][:item_identifier]).first
    @inter_library_loan.item = item

    respond_to do |format|
      if @inter_library_loan.save
        @inter_library_loan.sm_request!
        flash[:notice] = t('controller.successfully_created', model: t('activerecord.models.inter_library_loan'))
        format.html { redirect_to(@inter_library_loan) }
        format.json { render json: @inter_library_loan, status: :created, location: @inter_library_loan }
      else
        @libraries = Library.where('id != ?', current_user.profile.try(:library_id))
        format.html { render action: "new" }
        format.json { render json: @inter_library_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inter_library_loans/1
  # PUT /inter_library_loans/1.json
  def update
    @inter_library_loan = InterLibraryLoan.find(params[:id])
    @item = @inter_library_loan.item

    case @inter_library_loan.state
    when 'requested'
      @inter_library_loan.sm_ship!
    when 'shipped'
      @inter_library_loan.sm_receive!
    when 'received'
      @inter_library_loan.sm_return_ship!
    when 'return_shipped'
      @inter_library_loan.sm_return_receive!
    when 'return_received'
    end

    respond_to do |format|
      if @inter_library_loan.update_attributes(params[:inter_library_loan])
        flash[:notice] = t('controller.successfully_updated', model: t('activerecord.models.inter_library_loan'))
        format.html { redirect_to(@inter_library_loan) }
        format.json { head :no_content }
      else
        @inter_library_loan.item = @item
        @libraries = Library.where('id != ?', current_user.profile.try(:library_id))
        format.html { render action: "edit" }
        format.json { render json: @inter_library_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inter_library_loans/1
  # DELETE /inter_library_loans/1.json
  def destroy
    @inter_library_loan = InterLibraryLoan.find(params[:id])
    @inter_library_loan.destroy

    respond_to do |format|
      if @item
        format.html { redirect_to item_inter_library_loans_url(@item) }
        format.json { head :no_content }
      else
        format.html { redirect_to inter_library_loans_url }
        format.json { head :no_content }
      end
    end
  end

  private
  def set_inter_library_loan
    @inter_library_loan = InterLibraryLoan.find(params[:id])
    authorize @inter_library_loan
  end

  def check_policy
    authorize InterLibraryLoan
  end

  def inter_library_loan_params
    params.require(:inter_library_loan).permit(:item_id, :borrowing_library_id)
  end
end
