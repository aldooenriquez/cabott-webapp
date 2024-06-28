class VoucherMailer < ApplicationMailer
  after_deliver :update_status_to_sended
  default from: 'notifications@cabott.com'

  def send_voucher
    @voucher = params[:voucher]
    @activity = params[:activity]
    @provider = params[:provider]
    attachments['registration_info.pdf'] = generate_pdf(voucher: @voucher, activity: @activity, provider: @provider)
    mail(to: [@voucher.contact_email, @provider.contact_email], subject: "Registration confirmed for #{@activity.name} ")
  end

  private
    def update_status_to_sended
      @voucher.update(status: :sended)
    end

    def generate_pdf(voucher:, activity:, provider:)
      url = Rails.application.routes.url_helpers.mailers_preview_voucher_url(voucher_id: voucher.id, activity_id: activity.id, provider_id: provider.id)
    html = Net::HTTP.get(URI.parse(url))

      WickedPdf.new.pdf_from_string(html)
    end
end
