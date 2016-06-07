Rails.application.routes.draw do

  mount Rich::Engine => '/rich', :as => 'rich'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/' => 'home#index', as: :home

  scope 'o-mne' do
    get '/' => 'about#index', as: :about
    post '/' => 'about#create'
  end

  scope 'partneri' do
    get '/' => 'partners#index', as: :partners
    get ':id' => 'partners#show', as: :partner
  end

  scope 'blog' do
    get '/' => 'blog#index', as: :blog
    get 'ajax' => 'blog#ajax_index', as: :ajax_blog
    get ':id' => 'blog#show', as: :post
  end

  scope 'metody' do
    get '/' => 'methods#index', as: :methods
  end

  scope 'otazky-a-odpovede' do
    get '/' => 'faqs#index', as: :faqs
  end

end
