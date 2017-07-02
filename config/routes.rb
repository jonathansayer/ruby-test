Rails.application.routes.draw do
  get "/" => "home#index"
  post "/" => "home#create"
end
