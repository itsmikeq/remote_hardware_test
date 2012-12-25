RemoteHardwareTest::Application.routes.draw do
  resources :uploads

  resources :devices

  resources :companies

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end