Rails.application.routes.draw do
  root 'sms_texts#index'
  resources :sms_texts
end
