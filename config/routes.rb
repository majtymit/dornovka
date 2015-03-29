Rails.application.routes.draw do
  get '/' => 'home#index', as: :home

  scope 'o-mne' do
    get '/' => 'about#index', as: :about
  end

  scope 'kontakt' do
    get '/' => 'contact#index', as: :contact
  end

  scope 'blog' do
    get '/' => 'blog#index', as: :posts
    get ':id' => 'blog#show', as: :post
  end
end
