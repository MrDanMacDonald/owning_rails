Routes = Router.new do
  # Here we're passing a block to the router object
  match '/' => 'home#index'
  match '/h' => 'home#index'
  match '/home/index' => 'home#index'
  match '/echo' => 'echo#index'
  match '/users' => 'users#index'
  match '/users/show' => 'users#show'
end