require 'open-uri'

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :qr_code
  after_create :qr_code_job

  def qr_code_job
    QrCodeJob.perform_later self
  end

  def attach_qr_code
    generate_upload_and_attach_new_qr_code
  end

  private

  def generate_upload_and_attach_new_qr_code
    qr = RQRCode::QRCode.new(url)
    png_qr_code = qr.as_png
    file = StringIO.new(png_qr_code.to_s)
    @cloud_response = Cloudinary::Uploader.upload(file)
    attach_qr_code_and_email_it
  end

  def attach_qr_code_and_email_it
    qr_code.attach(
      io: URI.open(@cloud_response['secure_url']),
      filename: "#{title.gsub(/\W/, '_')}.png",
      content_type: 'image/png'
    )
    # SEND EMAIL
    QrCodeMailer.with(qr_code_url: @cloud_response['secure_url'], user: user)
                .new_qr_code_mail
                .deliver_later
  end
end
