Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts
resources :destinations
resources :bloggers

post "/posts/:id/like", to: "posts#like", as: "like"
post "/posts/:id/unlike", to: "posts#unlike", as: "unlike"

end
