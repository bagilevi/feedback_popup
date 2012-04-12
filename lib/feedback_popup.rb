module FeedbackPopup
  class Engine < Rails::Engine

    initializer 'feedback_popup.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper FeedbackPopup::FeedbackPopupHelper
      end
    end

  end

  mattr_accessor :mail_from
  mattr_accessor :mail_to

  # Makes possible configuration with block:
  #
  # FeedbackPopup.setup do |config|
  #   config.mail_from = "dummy@example.com"
  #   config.mail_to   = "dummy@example.com"
  # end
  def self.setup
    yield self
  end
end
