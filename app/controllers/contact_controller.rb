class ContactController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST for contact page.
  def contact
    MessageMailer.message_mailer(params[:email], params[:name], params[:message]).deliver
    render plain: 'success'
  end
end
