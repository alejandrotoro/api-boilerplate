Rails.application.routes.draw do
  jsonapi_resources :pages
  jsonapi_resources :page_contents
end
