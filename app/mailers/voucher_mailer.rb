class VoucherMailer < ApplicationMailer
  after_deliver :update_status_to_sended
  default from: 'notifications@cabott.com'

  def send_voucher
    @voucher = params[:voucher]
    @activity = params[:activity]
    @provider = params[:provider]
    mail(to: [@voucher.contact_email, @provider.contact_email], subject: "Registration confirmed for #{@activity.name} ")
  end

  private
    def update_status_to_sended
      @voucher.update(status: :sended)
    end
end
