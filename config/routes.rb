Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:new, :create, :show, :edit, :update]

  get 'login-teacher', to: "teachers#login"
  post 'login-teacher', to: "teachers#validate_login"
end
