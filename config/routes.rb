Tutti::Application.routes.draw do
  root to: "page#index"

  get "/about"            => "page#about", as: :about
  get "/card"             => "page#card", as: :card
  get "/career/(:page)"   => "page#career", as: :career
  post "/career/(:page)"  => "responses#create", as: :career

  scope "/tastes" do
    get "/"           => "tastes#index", as: :tastes
    get "/top/(:max)" => "tastes#top"
    get "/topings"    => "tastes#topings"
    get "/show/:code" => "tastes#show", as: :taste
  end

  get    "/api/vote"  => "votes#index"
  put    "/api/vote"  => "votes#create"
  delete "/api/vote"  => "votes#destroy"

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: "sessions#failure"
  get "signout", to: "sessions#destroy", as: "signout"
end
