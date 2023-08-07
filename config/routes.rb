Rails.application.routes.draw do
  
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  root to: 'public/homes#top'
  
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :post_records, only: [:index, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :categories, only: [:index, :create, :edit, :update]
    
  end

  scope module: :public do
    resources :users, only: [:index, :edit, :update]
    resources :post_records do
      resource :favorites, only: [:index, :create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
