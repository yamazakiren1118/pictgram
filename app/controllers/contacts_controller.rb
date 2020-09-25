class ContactsController < ApplicationController
  def new
    @message = Contact.new
  end

  def create
    @message = Contact.new(name: params[:contact][:name],email: params[:contact][:email],message: params[:contact][:message])
    if @message.save
      ContactMailer.post_mail(@message).deliver_now
      ContactMailer.my_post_mail(@message).deliver_now
      redirect_to contacts_new_path,success: '投稿に成功しました。'
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
end
