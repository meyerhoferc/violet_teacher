Rails.application.routes.draw do
  resources :teachers, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :courses do
      resources :assignments, only: [:new, :create, :show, :edit, :update, :index, :destroy]
    end
  end

  resources :students, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :subjects
  resources :enrollments, only: [:new, :create]

  get 'login-teacher', to: "teachers#login"
  post 'login-teacher', to: "teachers#validate_login"
  get 'logout-teacher', to: "teachers#logout"

  get 'login-student', to: "students#login"
  post 'login-student', to: "students#validate_login"
  get 'logout-student', to: "students#logout"
end
