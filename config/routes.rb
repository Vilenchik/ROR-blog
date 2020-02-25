Rails.application.routes.draw do

  devise_for :users
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'posts#index'
    resources :posts
  end

end
