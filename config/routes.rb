Rails.application.routes.draw do
  get "/products" => "products#index" 
  post "/products" => "products#create"
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"