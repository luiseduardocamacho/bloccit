Bloccit::Application.routes.draw do

  resources :advertisements
  resources :posts
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
