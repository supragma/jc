Rails.application.routes.draw do
  post 'register', to: 'register#new'
  get 'register', to: 'register#register'
  get 'success', to: 'register#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "contact", to: 'contact#contact'
end
