Rails.application.routes.draw do
  get '/' => 'home#index', as: :home

  scope 'o-mne' do
    get '/' => 'about#index', as: :about
  end

  scope 'metody' do
    get '/' => 'methods#index', as: :methods
  end

  scope 'kalendar' do
    get '/' => 'calendar#index', as: :calendar
  end

  scope 'partneri' do
    get '/' => 'partners#index', as: :partners
  end

  scope 'blog' do
    get '/' => 'blog#index', as: :posts
    get ':id' => 'blog#show', as: :post
  end

  mount Upmin::Engine => '/admin'

end
