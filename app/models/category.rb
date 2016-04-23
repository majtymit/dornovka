class Category < ActiveRecord::Base
  has_many :posts

  def self.non_empty
    all.reject do |category|
      category.posts.count == 0
    end
  end

  def sk_name
    {
    'featured' => 'Zvýraznené',
    'dogs' => 'Psy',
    'horses' => 'Kone',
    'cats' => 'Mačky',
    'small_pets' => 'Malé zvieratá',
    'events' => 'Udalosti',
    'status' => 'Statusy',
    'methods' => 'Metódy',
    'illness' => 'Choroby',
    }[name]
  end
end
