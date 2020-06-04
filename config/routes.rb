Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get '/signup', to: 'devise/registrations#new'
  end

  get '/mods/:slug', to: 'mods#show', as: 'view_mod'

  get '/tools', to: 'page#tools', as: 'tools'
  get '/lua-scripts', to: 'page#lua', as: 'lua_scripts'

  get '/search', to: 'page#search', as: 'search'

  root to: 'page#home'

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_WEB_USERNAME"] && password == ENV["SIDEKIQ_WEB_PASSWORD"]
  end
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
