Rails.application.routes.draw do
  get '/' => 'home#index', as: :home

  scope 'o-mne' do
    get '/' => 'about#index', as: :about
  end

  scope 'metody' do
    get '/' => 'methods#index', as: :methods
  end

  scope 'partneri' do
    get '/' => 'partners#index', as: :partners
  end

  scope 'blog' do
    get ':id' => 'home#show', as: :post
  end

  mount Upmin::Engine => '/admin'

end
