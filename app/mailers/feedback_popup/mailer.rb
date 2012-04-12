class FeedbackPopup::Mailer < ActionMailer::Base
  def feedback(message)
    @message = message

    mail(
      :from    => FeedbackPopup.mail_from,
      :to      => FeedbackPopup.mail_to,
      :subject => t('feedback_popup.email.subject')
    )
  end
end

