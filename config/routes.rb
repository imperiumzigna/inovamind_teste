Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
scope '/api' do
  post '/login' => "auth#login", as: "login"
  post '/register' => "auth#register", as: "register"

  scope '/quotes' do
    get '/' => "quotes#index", as: "quotes"
    get '/:search_tag' => "quotes#search", as: "search_quotes"
  end
end

end
