class ContactMailer < ApplicationMailer

  def post_mail(message)
    @message = message
    mail(from:'pictgram@co.jp',to:@message.email,subject:'問い合わせありがとうございます。')
  end
  def my_post_mail(message)
    @message = message
    mail(from:@message.email,to:'myaddress@co.jp',subject:'問い合わせがありました。')
  end
end
