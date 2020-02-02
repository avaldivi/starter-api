Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users,
    path: '',
    path_names: {
      sign_in: :login,
      sign_out: :logout,
      registration: :signup
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
    resource :user, only: [:show, :update, :create]
  end
end
