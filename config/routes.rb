Rails.application.routes.draw do
  root to: "violet#main"
  resources :teachers do
    resources :courses do
      resources :assignments
    end
  end

  resources :students, except: [:index]
  resources :subjects
  resources :enrollments, only: [:new, :create]

  get 'login-teacher', to: "sessions#teacher_login"
  post 'login-teacher', to: "sessions#teacher_validate_login"
  get 'logout-teacher', to: "sessions#teacher_logout"

  get 'login-student', to: "sessions#student_login"
  post 'login-student', to: "sessions#student_validate_login"
  get 'logout-student', to: "sessions#student_logout"

  get 'courses', to: "violet#courses"
  get 'about', to: "violet#about"
end
