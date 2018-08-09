Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  resources :sign_ups, only: [:new, :create] do
    collection do
      get '/:token/verify', to: "sign_ups#verify", as: "verify"
    end
  end
  passwordless_for :users, at: '/', as: :auth

  root to: "homepage#index"
end
