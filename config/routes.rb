Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "users#signup"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'dashboard', to: 'users#dashboard', as: :user_dashboard

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

end
