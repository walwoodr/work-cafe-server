Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/cafes/:id', :controller => 'cafes', :action => 'options', via: [:options]
  get 'cafes/:zipcode', to: 'cafes#search'
  post 'cafes/:id', to: 'cafes#update'

end
