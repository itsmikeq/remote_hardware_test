RemoteHardwareTest::Application.routes.draw do
  resources :adb_device_tests

  resources :uploads

  resources :devices

  resources :companies

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  # get ':adb_device_test/:start/:id/with_user/:user_id'
  # get ':controller/:action/:id/with_user/:user_id'
  match '/adb_device_test/start/:id/user/:user_id', to: 'adb_device_tests#start', via: [:get, :post]
end