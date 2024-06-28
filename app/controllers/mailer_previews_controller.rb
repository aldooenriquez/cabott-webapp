class MailerPreviewsController < ApplicationController
  def preview_voucher
    @voucher = Voucher.find(params[:voucher_id])
    @activity = Activity.find(params[:activity_id])
    @provider = Provider.find(params[:provider_id])
    render template: 'voucher_mailer/send_voucher', layout: 'pdf'
  end
end
