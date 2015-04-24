# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Post.destroy_all

featured = Category.create(name: 'featured')
dogs = Category.create(name: 'dogs')
horses = Category.create(name: 'horses')
cats = Category.create(name: 'cats')
small_pets = Category.create(name: 'small_pets')
events = Category.create(name: 'events')
status = Category.create(name: 'status')
quote = Category.create(name: 'quote')



Post.create(
  title: 'Henka dnes pôjde za psíkom',
  description: 'niekam do bratislavy alebo aj mimo nej',
  text: '',
  image_url: 'pes.jpg',
  created_at: '15.2.2015',
  category: dogs,
  visits: 227,
)

Post.create(
  title: 'Posudzovanie fretiek na medzinárodnej výstave fretiek v Brnenských Lužánkách',
  description: 'udialo sa v CZ a bola to fajn sobota',
  text: 'Trošku som sa toho obávala, pretože som už celkom zabudla posudzovať, už len čo chytím dornujem. Celkovo mi prešlo rukami cez 30 zvierat. Z čoho polovica mala blokady krížovej kosti, prvých chvostových stavcov. Mala som aj 4 zrotované panvy a 1 atlas. Ostatní rozhodcovia na mna čakali, lebo okrem posudzovania sa aj dornovalo, tak som skončila viac ako 30min po nich :). Výsledok je taký, že aj zviera, ktoré na prvý pohlaď je maximálne pružné elastické (viac ako mačka) má naozaj skoro 50% pravdepodobnosť posunu a problémov v pohybovom aparáte, akurat vzhladom na dlžku ich života, aktivitu a štýl pohybu to zatiaľ chovatelia a veterinári neriešia, nakoľko sa ten pohybový problém často prejaví s ochorením (hypertrofia-slabosť končatín, šmachtlanie nohami; po opatrnej dornovke zvieratá už chodia viacmenej normálne a pod.).\nŠkoda, že nebolo času na prednášku nech sa aj fretkári trošku s dornovkou oboznámia, lebo ich zvery by to potrebovali.',
  image_url: 'vystava_CZ.jpg',
  created_at: '2015-02-02',
  category: events,
  visits: 110,
)
