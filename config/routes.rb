Rails.application.routes.draw do

  get '/students', to: 'students#index'

  get '/teachers/:id', to: 'teachers#show'

end