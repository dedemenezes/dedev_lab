class QrCodeMailer < ApplicationMailer
  default from: 'qr_code@mailer.com'

  def new_qr_code_mail
    @qr_code_url = params[:qr_code_url]
    @user = params[:user]

    mail to: @user.email
  end
end
