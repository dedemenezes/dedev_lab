class PostMailer < ApplicationMailer
  default from: 'post_mailer@email.com'

  def destroy_post_mail
    @url = "http://www.test.com"
    @user = params[:user]

    mail to: 'matmenezes@hotmail.com'
  end

  def update_post_mail
    @url = "http://www.test.com"
    @user = params[:user]

    mail to: 'matmenezes@hotmail.com'
  end

  def new_post_mail
    @url = "http://www.test.com"
    @user = params[:user]

    mail to: 'matmenezes@hotmail.com'
  end
end
