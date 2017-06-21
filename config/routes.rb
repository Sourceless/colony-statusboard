Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :views
  devise_for :users

  root to: 'team#index'

  get '/control_panel', to: 'user#control_panel'
  post '/set_status', to: 'user#set_status'

  mount ActionCable.server => '/cable'
end
