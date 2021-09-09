Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", {to:"welcome#index", as: "root"})

  get("/contact", {to:"contact#index"})

  post("/contact_submit", {to:"contact#create", as: "contact_submit" }) 

  get("/cart", {to:"cart#index"})

  post("/books/add_to_cart/:id", {to:"books#add_to_cart", as: "add_to_cart"})

  delete("/books/remove_from_cart:id", {to:"books#remove_from_cart", as:"remove_from_cart"})

  resources :books do
    resources :comments, only: [:create, :destroy]
    resources :payments, only: [:new, :create]
    get '/payments/complete', to: 'payments#complete'
    resources :likes, shallow: true, only: [:create, :destroy]
  end


  resources :custumers, only:[:new, :create]
  resource :sessions, only:[:new, :create, :destroy]
end
