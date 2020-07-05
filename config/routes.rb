Rails.application.routes.draw do
  resources :ingresos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'autenticar', to: 'authentication#autenticar'
  resources :usuarios, only: [:create, :show]
  resources :gastos
end
