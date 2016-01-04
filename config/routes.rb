Bloccit::Application.routes.draw do
    resources :topics do
     resources :posts, except: [:index]
     resources :sponsored_posts, except: [:index]
   end
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
