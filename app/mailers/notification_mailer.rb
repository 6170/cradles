class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"
  def message_notification(message)
    @from = "no-reply@cradles.herokuapps.com"
    @recipients = message.to     
    @subject = "#{message.to} has sent you a message on VolunteerNet"     
   	@body["message"] = message
  end
end
