class SendMailerJob < ApplicationJob
  queue_as :default
  rescue_from ActiveJob::DeserializationError do |exception|
    flash.now[:error] =- "User is invalid!"
  end

  def perform(user)
  	user.send_welcome_email!
  end
end
