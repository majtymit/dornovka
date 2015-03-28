Rails.application.routes.draw do
  get '/' => 'home#index', as: :home

  scope 'blog' do
    get '/' => 'blog#index', as: :posts
    get ':id' => 'blog#show', as: :post
  end
end
