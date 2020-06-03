Rails.application.routes.draw do

  get '/mods/:slug', to: 'mods#show', as: 'view_mod'

  get '/tools', to: 'page#tools', as: 'tools'
  get '/lua-scripts', to: 'page#lua', as: 'lua_scripts'

  get '/search', to: 'page#search', as: 'search'

  root to: 'page#home'

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'admin' && password == 'password'
  end
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
