class VouchersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin, only: %i[ edit update destroy ]
  before_action :set_voucher, only: %i[ show edit update destroy ]

  # GET /vouchers or /vouchers.json
  def index
    @vouchers = Voucher.all if current_user.admin?
    @vouchers = Voucher.where(user_id: current_user.id) if current_user.seller?
  end

  # GET /vouchers/1 or /vouchers/1.json
  def show
  end

  # GET /vouchers/new
  def new
    @voucher = Voucher.new
  end

  # GET /vouchers/1/edit
  def edit
  end

  # POST /vouchers or /vouchers.json
  def create
    @voucher = Voucher.new(voucher_params)

    respond_to do |format|
      if @voucher.save
        format.html { redirect_to voucher_url(@voucher), notice: "Voucher was successfully created." }
        format.json { render :show, status: :created, location: @voucher }
        VoucherMailer.with(voucher: @voucher, activity: @voucher.activity, provider: @voucher.activity.provider).send_voucher.deliver_later
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vouchers/1 or /vouchers/1.json
  def update
    respond_to do |format|
      if @voucher.update(voucher_params)
        format.html { redirect_to voucher_url(@voucher), notice: "Voucher was successfully updated." }
        format.json { render :show, status: :ok, location: @voucher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1 or /vouchers/1.json
  def destroy
    @voucher.destroy!

    respond_to do |format|
      format.html { redirect_to vouchers_url, notice: "Voucher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def activities
    @target = params[:target]
    @activities = Activity.where(provider_id: params[:provider])
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    def ensure_admin
      if !current_user.admin?
        raise ActionController::RoutingError, 'Not Found'
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_voucher
      @voucher = Voucher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def voucher_params
      params.require(:voucher).permit(:contact_name, :contact_email, :activity_id, :user_id, :payment_type, :payment_tax, :total, :comment, :reservation_date, :total_adults, :total_minors)
    end
end
