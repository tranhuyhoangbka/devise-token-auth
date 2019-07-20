Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {omniauth_callbacks: 'omniauth_callbacks',}

  mount_devise_token_auth_for 'Admin', at: 'admin_auth'

  mount_devise_token_auth_for 'Operator', at: 'operator_auth'
  as :operator do
    # Define routes for Operator within this block.
  end
  # as :admin do
    # Define routes for Admin within this block.
    
  # end
  devise_scope :admin do
    get 'users' => 'users#index'
  end
  resources :books
end
