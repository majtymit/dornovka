Rails.application.routes.draw do
  get '/' => 'home#index', as: :home

  get 'ajax' => 'home#ajax_index', as: :ajax_home

  scope 'o-mne' do
    get '/' => 'about#index', as: :about
  end

  scope 'metody' do
    get '/' => 'methods#index', as: :methods
  end

  scope 'kontakt' do
    get '/' => 'contact#index', as: :contact
  end

  match '/send_mail', to: 'contact#send_mail', via: 'post'

  scope 'partneri' do
    get '/' => 'partners#index', as: :partners
  end

  scope 'blog' do
    get '/' => 'blog#index', as: :blog
    get ':id' => 'blog#show', as: :post
  end

  mount Upmin::Engine => '/admin'

end
