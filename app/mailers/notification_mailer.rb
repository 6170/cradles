class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"
  def notification(message)
  	@message = message
  	@from = "no-reply@cradles.herokuapps.com"
    @recipients = @message.to     
    @subject = "#{message.to} has sent you a message on VolunteerNet"     
   	@message = message
	@sent_on = Time.now
	@headers = {}
  	mail(:to => @message.to) do |format|
      format.html
    end
  end
end
