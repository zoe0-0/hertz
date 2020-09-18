Rails.application.routes.draw do

  root 'main#main'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    match 'users/info' => 'users/registrations#info', via: [:get, :patch]
  end
  get 'main/main'

  resources :timetables

  resources :channels
  post 'diaries/maxupdate' => 'diaries#max_update'

  resources :diaries

  resources :stories

  # get 'stories/index'
  # get 'stories/new'
  # get 'stories/create'
  # get 'stories/show'
  # get 'stories/edit'
  # get 'stories/update'
  # get 'stories/destroy'

  get '/:frequency' => 'channels#show', :frequency => /\d{2,3}(\.\d{0,3})?/

end
