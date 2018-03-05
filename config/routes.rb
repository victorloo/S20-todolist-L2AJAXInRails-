Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "todos#index"
  resources :todos do
    member do
      post :toggle_check
      # 負責「完成／未完成」的 toggle_check action。
    end
  end
end
