Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: [:index] do
    collection do
      get ':user_id', to: "messages#private_chat", as: :private_chat
    end
  end
  resources :sessions, only: [:new, :create] do
    collection do
      delete 'sign_out'
    end
  end
  mount ActionCable.server => '/cable'

  root 'sessions#new'
end
