Rails.application.routes.draw do
  namespace :feedback_popup do
    resources :messages, :only => :create
  end
  match 'feedback' => 'feedback_popup/messages#new'
end

