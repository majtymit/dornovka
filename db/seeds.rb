# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Post.destroy_all
Subpost.destroy_all
Partner.destroy_all

featured = Category.create(name: 'featured')
dogs = Category.create(name: 'dogs')
horses = Category.create(name: 'horses')
cats = Category.create(name: 'cats')
small_pets = Category.create(name: 'small_pets')
events = Category.create(name: 'events')
status = Category.create(name: 'status')
quote = Category.create(name: 'quote')

Post.create(
  format: 'article',
  title: 'Henka dnes pôjde za psíkom',
  description: 'niekam do bratislavy alebo aj mimo nej',
  text: '',
  image_url: 'pes.jpg',
  created_at: '15.2.2015',
  category: dogs,
  visits: 227,
  subposts: [
    Subpost.new(icon: "dm-podkova.png", text: "bola som tam zase", happened_at: "21.05.2015"),
    Subpost.new(icon: "dm-laba.png", text: "prva navsteva", happened_at: "19.05.2015"),
  ]
)

Post.create(
  format: 'article',
  title: 'Akita Kuma',
  description: '6,5r Akita Kuma, DM robena preventívne no nájdených dosť problemov: najvýraznejší je prepad L-Sacr. spojenia, krížovej kosti, ktorý sa už odzrkadloval aj na chôdzy, posun panvy a aj atlasu. Končatiny pukajúce, bolo ich potrebné usadiť pre zlepšenie látkovej výmeny v klboch. A znovu neštastné tylo...',
  text: '',
  image_url: 'akita-kuma.jpg',
  created_at: '26.4.2015',
  category: dogs,
  visits: 2,
)

Post.create(
  format: 'quote',
  title: 'Miško',
  description: '',
  text: 'Rene je čurák!',
  image_url: '',
  created_at: '15.2.2015',
  category: quote,
  visits: 0,
)

Post.create(
  format: 'quote',
  title: 'Heňa',
  description: '',
  text: 'Vikend s Equine Touch, alebo vzdelania nikdy nie je dost — cítim sa motivovaná.',
  image_url: '',
  created_at: '24.4.2015',
  category: quote,
  visits: 6,
)

Post.create(
  format: 'article',
  title: 'Posudzovanie fretiek na medzinárodnej výstave fretiek v Brnenských Lužánkách',
  description: 'udialo sa v CZ a bola to fajn sobota',
  text: 'Trošku som sa toho obávala, pretože som už celkom zabudla posudzovať, už len čo chytím dornujem. Celkovo mi prešlo rukami cez 30 zvierat. Z čoho polovica mala blokady krížovej kosti, prvých chvostových stavcov. Mala som aj 4 zrotované panvy a 1 atlas. Ostatní rozhodcovia na mna čakali, lebo okrem posudzovania sa aj dornovalo, tak som skončila viac ako 30min po nich :). Výsledok je taký, že aj zviera, ktoré na prvý pohlaď je maximálne pružné elastické (viac ako mačka) má naozaj skoro 50% pravdepodobnosť posunu a problémov v pohybovom aparáte, akurat vzhladom na dlžku ich života, aktivitu a štýl pohybu to zatiaľ chovatelia a veterinári neriešia, nakoľko sa ten pohybový problém často prejaví s ochorením (hypertrofia-slabosť končatín, šmachtlanie nohami; po opatrnej dornovke zvieratá už chodia viacmenej normálne a pod.).\nŠkoda, že nebolo času na prednášku nech sa aj fretkári trošku s dornovkou oboznámia, lebo ich zvery by to potrebovali.',
  image_url: 'vystava_CZ.jpg',
  created_at: '15.2.2015',
  category: events,
  visits: 110,
)

Partner.create(
  name: 'Jozko',
  description: 'nieco',
  link: '',
  #logo: '',
)

Post.create(
  format: 'article',
  title: 'Rysy',
  description: 'Rysy - 2r fenočka Border teriera. Rysy pozná dornovku veľmi dobre, pretože je pravidelná účastníčka kurzov ľudskej dornovky v Bratislave, kde so svojou paničkou asistuje. Panička chcela poriešiť prepadajúci sa stavec, a celkovo preventívne zhodnotiť, nakoľko sa s fenkou pripravujú na Agility. Rysinka mala rozvolnenú patellu na ľavej labke (panička dostala D.ú. usádzať) a toršku rozhádzaný krk (C1, C6) a posun posledného L stavčeka (nedávno dostala bočný náraz od vacšieho šteniatka, čo predpokladáme, že mohlo spsobiť posun L a C6 stavca). Na konci Rysy zhodnotila, že bude radšej aj nadalej chodiť radšej na tie ludské dornovky než na svoje tam jej krk nenaprávajú',
  text: '',
  image_url: 'rysy.jpg',
  created_at: '02.04.2015',
  category: dogs,
  visits: 3,
)

Post.create(
  format: 'article',
  title: 'Merci',
  description: 'Merci, cca 2r nádherná múdra mojkacia fenočka adoptovaná z útulku z LM. Má za sebou resekciu ľavého bedrového kĺbu, a dornovku pozná veľmi dobre. Operovanú nohu už celkom slušne používa. Akurat poslednu dobu začala divne chodiť na druhú pravú nôžku, tak prišli preventívne na ošetrenie. Kedže sme nič výrazné nenašli (len posun krčných stavcov) dostala ešte kompletnú bowenovu masáž, lebo problém bude v makkých tkanivách a v pretažovaní zdravej končatiny. Kedže sa blíži leto, chystajú sa s merci plávať, tak veríme, že nožičky zosilnejú ',
  text: '',
  image_url: 'merci.jpg',
  created_at: '10.04.2015',
  category: dogs,
  visits: 17,
)

Post.create(
  format: 'article',
  title: 'Igi (Gidran)',
  description: 'Včera sme navštívili Igiho aby podstúpil 2. ošetrenie DM. Do 2 týždnoch po prvej dornovke sa igimu postupne polepšilo, prestal krívať na predné nohy, pri poslednej vychádzke si však trošku viac vyhodil z kopýtka, takže trošku zakríval, ale 2. terapia bola aj tak potrebná pre upevnenie všetkých kostí, lebo nie všetky nam ostali ok. Igi podstúpil klasicky uvolnenie celého tela a blokád bowenovou masážou a následne Dorn. Usádzali sme ľavé rameno, ktoré bolo ešte stále o dosť vpredšie, po uplnom uvolnení a odlepení lopatiek, ktoré boli už v lepšom stave ako minule sa objavil posunutý 6. stavec, ku ktorému sme sa cez blokády pri 1. terapii nedostali. A ešte sa upravila panva, ktoré bola trošku ľavou lopatou vpredu. Igorko bol znovu úplne ukážkový pacient.',
  text: '',
  image_url: 'igi.jpg',
  created_at: '25.02.2015',
  category: horses,
  visits: 9,
)

Post.create(
  format: 'article',
  title: 'Portoriko',
  description: '15r, Westfalsky valach, Miloslavov, zameranie: parkúr',
  text: 'Ďna 3.4.2015 sme navštívili stajnu Plameň v Miloslavove aby sme sa pozreli na Portorikove telo, nakoľko je vynikajúci skokan, ale veľmi ťažko jazditelný. Už na prvý pohlad bol jasne viditeľný problém a blokáda krčných stavcov. Na úvod podstúpil bowenovu masáž pre kone, na celkové uvolnenie svalstva, následne dornovu metódu. Prvý krčný stavec bol výrazne zrotovaný a aj vpáčený do hlavy, čoho následkom je aj opuch lymfatických uzlín, ktoré mal výrazne zväčšené. Dalej to bol posun 3. a 4. krčného stavca do prava. A zrotovaná panva - pravou lopatou dopredu a ľavou dohora, pridružila sa aj blokáda krížovej kosti v pravo. S Portom sa veľmi dobre pracovalo a aj keď mal krk bolestivý, pomáhal ako mohol.

    27.4.2015 sme sa vybrali na kontrolu. Hneď po nutnom oddychu nám majiteľka písala, že má pod sedlom iného koňa, inak nosí krk a
    hlavu, nedriape sa až tak dopredu a jazdenie je teda príjmenejšie. Ale nedostatky tam stále sú práca na parkúre je dosť nestabilná,
    dúfame, že sú to všetko len prechodné stavy.
    Ľavá panvová lopata bola ešte jemne hore, krížová kosť bola tiež tým pádom ešte bloknutá. Prvý krčný stavec v lepšom stave, rotácia
    už nie je, ale stále je príliž natlačený na hlavu, takže musíme v jemných uvolnovaniach pokračovať. Na záver dostal Porto základné vybalansovanie tela pomocou the equine touch techniky + ošetrenie hlavy a krku na uvolnenie lymfatického toku krku a hlavy. Za mesiac prídeme opať na návštevu povenovať sa problémovej C1.
',
  image_url: 'portoriko.jpg',
  created_at: '27.04.2015',
  category: horses,
  visits: 9,
)

Post.create(
  format: 'article',
  title: 'Portoriko',
  description: '15r, Westfalsky valach, Miloslavov, zameranie: parkúr',
  text: 'Ďna 3.4.2015 sme navštívili stajnu Plameň v Miloslavove aby sme sa pozreli na Portorikove telo, nakoľko je vynikajúci skokan, ale veľmi ťažko jazditelný. Už na prvý pohlad bol jasne viditeľný problém a blokáda krčných stavcov. Na úvod podstúpil bowenovu masáž pre kone, na celkové uvolnenie svalstva, následne dornovu metódu. Prvý krčný stavec bol výrazne zrotovaný a aj vpáčený do hlavy, čoho následkom je aj opuch lymfatických uzlín, ktoré mal výrazne zväčšené. Dalej to bol posun 3. a 4. krčného stavca do prava. A zrotovaná panva - pravou lopatou dopredu a ľavou dohora, pridružila sa aj blokáda krížovej kosti v pravo. S Portom sa veľmi dobre pracovalo a aj keď mal krk bolestivý, pomáhal ako mohol.

    27.4.2015 sme sa vybrali na kontrolu. Hneď po nutnom oddychu nám majiteľka písala, že má pod sedlom iného koňa, inak nosí krk a
    hlavu, nedriape sa až tak dopredu a jazdenie je teda príjmenejšie. Ale nedostatky tam stále sú práca na parkúre je dosť nestabilná,
    dúfame, že sú to všetko len prechodné stavy.
    Ľavá panvová lopata bola ešte jemne hore, krížová kosť bola tiež tým pádom ešte bloknutá. Prvý krčný stavec v lepšom stave, rotácia
    už nie je, ale stále je príliž natlačený na hlavu, takže musíme v jemných uvolnovaniach pokračovať. Na záver dostal Porto základné vybalansovanie tela pomocou the equine touch techniky + ošetrenie hlavy a krku na uvolnenie lymfatického toku krku a hlavy. Za mesiac prídeme opať na návštevu povenovať sa problémovej C1.
',
  image_url: 'portoriko.jpg',
  created_at: '27.04.2015',
  category: horses,
  visits: 9,
)