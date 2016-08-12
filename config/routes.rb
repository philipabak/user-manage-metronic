Rails.application.routes.draw do

  #=== Root routes ===#

  root to: 'visitors#index'

  get 'signin' => 'users#signin'

  post 'do_signin' => 'users#do_signin'

  get 'signout' => 'users#signout'

  post 'check_user' => 'users#check_user'

  get 'signup' => 'users#signup'
  post 'do_signup' => 'users#do_signup'

  post 'check_email' => 'users#check_email'

  get 'profile' => 'visitors#profile'

  get 'create' => 'users#create'

  #make this your last route.
  # get '*unmatched_route', :to => 'application#raise_not_found!'

  # unless Rails.application.config.consider_all_requests_local
  #   get '*not_found', to: 'visitors#redirect', :format => false
  # end

end
