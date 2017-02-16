Rails.application.routes.draw do
  resources :teachers, only: [:new, :create, :show, :edit, :update]
  resources :students, only: [:new, :create, :show, :edit, :update]

  get 'login-teacher', to: "teachers#login"
  post 'login-teacher', to: "teachers#validate_login"

  get 'login-student', to: "students#login"
  post 'login-student', to: "students#validate_login"
end
