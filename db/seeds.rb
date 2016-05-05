# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

Category.destroy_all
Post.destroy_all
Subpost.destroy_all
Partner.destroy_all

dogs = Category.create!(name: 'dogs')
horses = Category.create!(name: 'horses')
cats = Category.create!(name: 'cats')
small_pets = Category.create!(name: 'small_pets')
events = Category.create!(name: 'events')
status = Category.create!(name: 'status')
methods = Category.create!(name: 'methods')
illness = Category.create!(name: 'illness')

Partner.create!(
  position: 1,
  name: 'test',
  description: 'hovno',
  contact: '0918 555 555',
  link: 'www.google.sk',
)

Post.create!(
  format: 'article',
  title: 'Maly smrad',
  description: 'Tak toto nám doma behá pod nohy :( ...',
  text: 'texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext',
  #image_url: 'bahia.jpg',
  created_at: '21.4.2016',
  date: 'Thu Apr 21 2016 11:44:53',
  category: small_pets,
)

Post.create!(
  format: 'article',
  title: 'Random pissed cat',
  description: 'nasrala sa no...',
  text: 'texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext, texttexttexttext',
  #image_url: 'ela.jpg',
  created_at: '21.4.2016',
  date: 'Thu Apr21 2016 11:40:53',
  category: cats,
)

Post.create!(
  format: 'article',
  title: 'Prolaps platničky',
  description: 'V poslednom období sa doslova roztrhlo vrece s buldočkami s prolapsom platničky. Mnohí ľudia zúfalo prosia o pomoc a o rady na facebooku. Niekedy žiaľ vyhľadajú odbornú pomoc príliš neskoro, alebo aj pomoc vyhľadajú, avšak ...',
  text: 'V poslednom období sa doslova roztrhlo vrece s buldočkami s prolapsom platničky. Mnohí ľudia zúfalo prosia o pomoc a o rady na facebooku. Niekedy žiaľ vyhľadajú odbornú pomoc príliš neskoro, alebo aj pomoc vyhľadajú, avšak u veterinára, ktorý sa nešpecializuje na neurológiu. Vzhľadom k zvýšenému počtu otázok k tejto problematike, sme sa rozhodli vytvoriť príspevok . Získate tu informácie o počiatočných príznakoch, priebehu, prípadnej operácii a následnej rehabilitácii, no v neposlednom rade aj o prevencii. Nejedná sa o odborný príspevok, ale o jednoduché rady a vysvetlenie.
UPOZORNENIE!!! Ak má Váš psík príznaky, ktoré spomíname, neznamená to, že má nutne túto diagnózu, ale určite netreba nič podceňovať a treba vyhľadať odbornú pomoc !!!

PRÍZNAKY: (podľa opisu tých, ktorí to zažili).
- Psík si pri chôdzi občas sadá, niekedy sa nevie postaviť na zadné nožičky. Motá ho zo strany na stranu. Nie je ochotný pohybovať sa.
- Nevie otáčať hlavičkou, alebo len do určitej miery. Ťažko sa skláňa k miske. Tras, zášklby v hrudníku.
- Únava, prejavy bolesti, niekedy psík od bolesti plače. Plače pri zdvíhaní na ruky.
- Porucha močenia a vyprázdňovania
- Neochota skákať
- Bolesť a slabosť v zadných nohách (neistota v stoji alebo počas chôdze)
- Utiahnutosť
- Svalové kŕče v zadnej časti tela alebo krku
- Zhrbený chrbát alebo šija s napätými svalmi
- Znížená chuť do jedla a úroveň aktivity
ČO ROBIŤ?:
1. Psíka držať v kľudovom režime, bez pohybu a okamžite vyhľadať veterinára!
2. Okamžite dať urobiť neurologické vyšetrenie. RTG nemusí odhaliť prolaps (výhřez).
3. Treba podstúpiť kontrastné vyšetrenie – myelografiu, počítačovú tomografiu - CT alebo magnetickú rezonanciu MRI. Na základe jedného z týchto vyšetrení neurológ ľahko určí, či sa jedná o túto, alebo inú diagnózu. Ale vie ju stanoviť!!!
4. Čím skôr vyhľadáte odborníka, tým priaznivejšia je prognóza liečby.

ČO BY SA NEMALO STÁVAŤ:
1. Nečakať, že to samé prejde!
2. Psík by nemal dostať injekciu proti bolesti. Pri tejto diagnóze, to môže mať fatálne následky. Prestane mať bolesti a robí pohyby, ktoré mu môžu prerušiť miechu. Pokiaľ je injekcia na utíšenie bolesti nutná, treba dbať na kľudový režim!!!
3. Bez lekárskeho vyšetrenia neaplikovať Dornovu metódu, bankovanie, masáže a podobne.

Skúsení terapeuti Dornovej metódy vás okamžite pošlú na vyšetrenie k spolupracujúcemu veterinárovi a až na základe jeho odporučení psíka ošetria. Bohužiaľ sú aj takí, čo sa na to podujmú a spôsobia nezvratné poškodenia. Pes s týmito problémami nepatrí do rúk neskúseného terapeuta, ani keď vám ho odporučí kamarát/ka, ale zásadne do rúk veterinárneho lekára.
OCHORENIE MEDZISTAVCOVÝCH PLATNIČIEK
Funkcia medzistavcovej platničky je tlmenie nárazov pri ohýbaní a kompresií stavcov. Platnička sa skladá z dvoch častí: nucleus pulposus – z mäkkej, rôsolovitej časti a z pevnej obálky z väziva - annulus fibrosus.
Existujú dva typy poškodení medzistavcových platničiek, ktoré pôsobia na miechu:

Hansen typ I – postihuje hlavne krátkonohé plemená psovs dlhým telom, ako sú jazvečík, corgi, pekinský palácový psík, lhasa apso a ich krížence. Tieto plemená majú narušený vývoj chrupavky v dlhých kostiach, čoho dôsledkom majú skrátené končatiny. Prichádza u nich ku mineralizácii želatínového centra platničky. Pri skoku, páde, prudkom otočení a pod. tento tuhý materiál ľahko pretrhne väzivový obal a natlačí miechu do chrbticového kanálu. Jazvečíky majú mnohonásobne vyššie riziko poškodenia platničky ako iné plemená, u mačiek je tento problém zriedkavý.

Hansen typ II – ide o pomalší, chronický priebeh ochorenia. Klinické príznaky závisia od stupňa utlačenia miechy a lokalizácie poškodenej platničky. Pri postihnutí krčnej chrbtice sú psi extrémne bolestiví, nehýbu krkom, krk je často stuhnutý a agresívne reagujú aj pri miernej manipulácii. Dôsledkom útlaku dýchacích dráh môže dôjsť až ku smrti. Najčastejšie býva platnička vyskočená v oblasti konca hrudnej a začiatku bedrovej chrbtice. Príznaky
môžu byť od miernych (nekľud, nespavosť), až po najvážnejšie – krívanie, neschopnosť postaviť sa, ale aj úplná paralýza bez citlivosti panvových končatín. Pri paralýze je veľmi dôležité odstrániť útlak miechy v časovom horizonte tzv. „golden hours“ (8 – 12 hodín od postihnutia), aby pes neostal natrvalo postihnutý.
Diagnostika
RTG v prípade poškodenia platničky má malú vypovedaciu hodnotu. Dokáže len vylúčiť niektoré ochorenia a zlomeniny. Myelogram je v tomto prípade ako diagnostická metóda vhodnejší, ale ani on nemusí zachytiť všetky zmeny na mieche. Lepšia diagnostická metóda je CT a najsenzitívnejšia MRI.

OPERÁCIA vs. DORNOVA METÓDA

Operácia je cca 2 hodinový zákrok, kde už je zahrnuté vyšetrenie MRI. Po zákroku ostáva psík na klinike približne 4 až 7 dní, záleží od samotného zotavenia sa. Na klinike začínajú so psíkom rehabilitovať, cvičiť a vykonávať masáže, s ktorými treba pokračovať aj po prepustení do domáceho liečenia. Veterinár by vás mal riadne poučiť a názorne vám tieto cviky predviesť, prípadne dať k dispozícii DVD s cvičeniami a masážami. Odporúča sa aj hydroterapia, fyzioterapia, prípadne Dornova metóda. Všetky tieto možnosti treba konzultovať s veterinárom.

Dornova metóda je veľmi jemná manuálna terapia, pomocou ktorej sa posunuté stavce a kĺby jemným tlakom palca alebo celej ruky uvádzajú do správnej polohy. Nepoužívajú sa žiadne prudké, trhavé a násilné pohyby , preto nedochádza k poškodeniu šliach, väzív alebo svalov. V porovnaní s inými metódami naprávania, pri Dornovej metóde sa nesmie prekročiť prah bolesti . Základným predpokladom úspechu Dornovej metódy je aktívna spolupráca zvieraťa pri ošetrovaní. Pohybom končatín a dodržaním presnej techniky sa pri naprávaní do správnej polohy obchádza svalová ochrana. Keďže pri terapii je potrebná aktívna spolupráca zvieraťa, nie je možné ju robiť v sedácii. Výnimkou sú život ohrozujúce stavy, kedy sa terapia robí zásadne pod dozorom veterinárneho lekára. Tu však musíme pripomenúť, že treba byť naozaj veľmi opatrný. Dornova metóda dokáže pomôcť, ale aj ublížiť. Akútne a hlavne bolestivé stavy sa nemôžu riešiť týmto typom terapie a už vôbec nie za pomoci rôznych sedatív a pod.!!! Taktiež si treba správne vybrať terapeuta DM, najlepšie so statusom "Doporučený terapeut". Bolestivé a akútne stavy nepatria do rúk začiatočníka, nech máte akékoľvek odporúčania od známych a kamarátov. Zoznam terapeutov pre Slovensko a Českú republiku nájdete na stránkach Dornova metoda zvířata, v sekcii Doporučení terapeuti.

REHABILITÁCIA:

1. Nakoľko prvé týždne po operácii nesmie mať psík veľa pohybu, je dôležité niekoľko krát za deň cvičiť špeciálne cviky na posilnenie svalstva (vysvetlí veterinár) a robiť strečing.
2. Niekoľko krát za deň masírovať svalstvo v oblasti chrbtice a na nožičkách. Tieto masáže je vhodné robiť jeden krát denne aj po zotavení.
3. Odporúča sa aj fyzioterapia.

PREVENCIA: (neznamená, že sa to psíkovi nikdy nestane, ale určite sa mu odľahčí chrbtica).

1. V prvom rade je veľmi dôležité nosiť postroj /kšíri/. Obojok pri ťahaní veľmi zaťažuje krčné stavce a tým napomáha k ich opotrebeniu a poškodeniu.
2. Psík by nikdy nemal chodiť po schodoch, hlavne nie smerom dolu. Takisto obmedziť skákanie hlavne smerom nadol. Pri náraze totiž celá váha tela tlačí na krčné stavce, ktoré tento tlak musia znášať dennodenne. Pre predstavu: stavce = domino sa pri skoku nadol zosunú smerom na krk a tlačia na seba.
3. Nosenie a dvíhanie psíkov v polohe bábätka. Jednou rukou psíka držíte za hrudník, pričom ruku máte vloženú medzi prednými labkami a druhú ruku vsuniete pod psíka pozdĺž brucha, pričom ruku máte vloženú medzi zadnými labkami. Chrbtica by mala byť vždy v rovine.
4. Misky by mali byť na podložke, alebo na stojane v takej výške, aby psík nemusel zohýbať hlavu.
5. Správna životospráva – kvalita stravy pre udržanie optimálneho zdravia je tiež veľmi dôležitým faktorom. Neprekrmovať a zamedziť nadváhe psíkov – príjem vs. výdaj.
6. Pravidelná “údržba” tela psíka Dornovou metódou podľa potreby 1-4x ročne. U starších psíkov častejšie, u mladších menej často. Platí hlavne pre športujúce psy (aglity, dogfreesbee, dogdancing, dogtreking a pod.), nízkonohé psy jazvečíkového a buldočkovitého typu.
7. Pred športovou aktivitou je potrebné psíka zahriať a “rozcvičiť”, predíde sa tak zbytočným problémom a úrazom.
Autor: AMY´s HOPE
MVDr. Viktor Paluš Dip ECUN, MRCUS,RCVS in Veterinary neurolog,
klinika Sibra, www.sibra.sk
Ing.Mária Zámečníková Ph.D DoTh',
  #image_url: 'ill_animals.jpg',
  created_at: '20.4.2016',
  date: 'Wed Apr 20 2016 11:30:53',
  category: illness,
)

Post.create!(
  format: 'article',
  title: 'Syndróm Cauda Equina',
  description:
  'Jedná sa o ochorenie prevažne psov veľkých plemien. Typickým predstaviteľom je nemecký ovčiak. Tento pojem zahŕňa skupinu neurologických ochorení so širokou škálou klinických ...',
  text:
  'Jedná sa o ochorenie prevažne psov veľkých plemien. Typickým predstaviteľom je nemecký ovčiak. Tento pojem zahŕňa skupinu neurologických ochorení so širokou škálou klinických príznakov.<br />
  Problém je lokalizovaný v zadnej časti chrbtice na prechode bedrovej a krížovej. V tomto mieste už v miechovom kanáli nie je lokalizovaná miecha ale len korene nervov odborne nazývané cauda equina. SCE vzniká následkom zužovania miechového kanálu v tejto oblasti, dochádza ku kompresii, deštrukcii alebo k posunu nervových vlákien. Zúženie kanálu môže mať mnoho príčin a najčastejšia býva vysunutie medzistavcovej platničky medzi posledným bedrovým stavcom a krížovou kosťou. Alebo sa jedná o zosilnenie stien stavcov tvoriacich miechový kanál, prípadne k zhrubnutiu väzivových vlákien, ktoré spájajú jednotlivé stavce medzi sebou.<br />
  <br />
  <strong>Prejavuje sa:</strong><br />
  Neochota chodiť po schodoch, opatrné sadanie si, problematické vstávanie, neskôr bolestivosť bedrovo-krížového spojenia a chvosta pri manipulácii, hryzenie si chvosta, bolesť chrbtice už na dotyk, atrofia stehenných svalov, nekontrolované močenie až ochrnutie panvových končatín.<br />
  <strong>Čo ošetrenie DM spôsobí?</strong><br />
  Dornova metóda uvedie všetky kosti do fyziologickej polohy, čím už niekedy dôjde k úľave a následne sa aplikuje a pracuje výhradne s bankami. Dornova metóda je spolu s bankovaním veľkou pomocou od bolesti a cesty ako nastoliť opäť rovnováhu s pohybom a zvýšiť regeneráciu nervov kt. bývajú útlakom poškodené. Pomocou týchto metód sa odďaľuje zhoršovanie stavu a zlepšuje pohyblivosť zvieraťa.
  Zdroj: MVDr. Leoš Krkoška, Ph.D.',
  #image_url: 'ill_animals.jpg',
  created_at: '20.4.2016',
  date: 'Sun Apr 20 2014 11:40:53',
  category: illness,
)

Post.create!(
  format: 'article',
  title: 'Luxácia pately',
  description: 'Dochádza k nej následkom úrazu ale aj degeneratívnymi zmenami ...',
  text: 'Dochádza k nej následkom úrazu ale aj degeneratívnymi zmenami.
Prejavuje sa:
Krívanie bez príznaku bolesti, rozvolenie končatiny od kĺbu dole, odľahčovanie končatiny – nedošliapnutie, vynechávanie
Čo ošetrenie DM spôsobí?
Pomocou dornovej metódy uvedieme patellu do pôvodnej polohy a fyziologickým pohybom fixujeme. Pravidelným usádzaním prispievame k natvarovaniu chrupavky a spevneniu. Dornova metóda môže byť úspešne vykonávaná  len v prípade nepoškodenia kolenných väzov a samotného kolenného kĺbu. V opačnom prípade je už nutný operačný zásah.
Zdroj: Andrea Dunová',
  #image_url: 'ill_animals.jpg',
  created_at: '20.4.2016',
  date: 'Mon Apr 21 2014 11:40:53',
  category: illness,
)

Post.create!(
  format: 'article',
  title: 'Spondylóza',
  description: 'Je degeneratívne ochorenie chrbtice, pri ktorom vznikajú artrotické zmeny na medzistavcových kĺboch a kĺbnych výbežkoch. Degeneruje sa medzistavcová platnička a vznikajú kostné výrastky (osteofyty) na ...',
  text: 'Je degeneratívne ochorenie chrbtice, pri ktorom vznikajú artrotické zmeny na medzistavcových kĺboch a kĺbnych výbežkoch. Degeneruje sa medzistavcová platnička a vznikajú kostné výrastky (osteofyty) na telách stavcov, ktoré sa postupne zväčšujú až sa môžu spojiť čím dôjde k zníženiu pohyblivosti daného úseku a bolestivosti.
Toto ochorenie sa prejavuje pomerne často u starších zvierat a pri plemenách s genetickou náklonnosťou na toto ochorenie (boxer, nemecký ovčiak, labradorský retriever). Vznik ochorenia má buď genetický základ alebo k nemu dochádza vplyvom rotácie a degenerácie stavcov.
Prejavuje sa:
Zatuhnutosť chrbta, krívanie, zmeny kroku, neochota k pohybu, bolestivosť chrbta na dotyk.
Čo ošetrenie DM spôsobí?
Vzhľadom k tomu, že na vznik ochorenia sa podieľajú aj mechanické posuny stavcov DM je veľmi vhodná ako PREVENCIA! Pravidelným ošetrovaním môžeme predísť alebo ochorenie výrazne spomaliť. Pri stredných až vážnejších problémoch je dornova metóda spolu s bankovaním veľkou pomocou od bolesti a cesty ako nastoliť opäť rovnováhu s pohybom a zvýšiť regeneráciu nervov kt. bývajú útlakom poškodené.
DM pracuje s ochorením do 3. stupňa, keď ešte nedochádza k zrastaniu stavcov. V 5. a 6. stupni sa už pracuje len s bankovaním na uvoľňovanie okolitých tkanív pretože stavce sú úž zrastené.

Zdroj: MVDr. Jana Sekvencová, DoTh.; Andrea Dunová',
  #image_url: 'ill_animals.jpg',
  created_at: '20.4.2016',
  date: 'Mon Apr 21 2014 11:40:53',
  category: illness,
)

Post.create!(
  format: 'article',
  title: 'Dysplázie',
  description: 'Je degeneratívne ochorenie kĺbov , ktoré vzniká opotrebovaním chrupavky. K opotrebovaniu a poškodeniu chrupaviek dochádza vplyvom ...',
  text: 'DKK – dysplázia bedrového kĺbu
  Jedná sa o dedičné vývinové ochorenie  - chybný vývin bedrového kĺbu (hlavica kĺbu alebo jamka v panve). Pri dysplázii hlavica nesedí pevne v jamke, uvoľňuje sa čím dochádza k nadmernému treniu kĺbu v nefyziologickej polohe, dochádza k vzniku artózy, väzy bedrového klbu sa čoraz viacej rozvoľňujú, jamka sa obrusuje až dôjde k úplnemu oddialeniu sa kĺbu. Dyplázia má 4. Stupne.
  Dornovou metódou pracujeme kým pohyb a samotné usádzanie nie je pre psa bolestivé. DKK je progresívne ochorenie, v prípade neriešenia problému dochádza k zhoršovaniu. Vo vážnejších prípadoch je už nutný ortopedický zásah, ktorému sa však vďaka DM dá predísť.
  Prejavuje sa:
  Krívanie, odľahčovanie končatín, neochota k pohybu...
  Čo ošetrenie DM spôsobí?
  DM jemným a pravidelným usádzaním pomáha usadiť hlavicu kĺbu do jamky, zlepšuje pohyblivosť kĺbu a rozsah pohybu, dochádza tým k zmierneniu napätia v mäkkých tkanivách a odznievaniu  bolestivosti. Vďaka regeneračnej schopnosti chrupavky dochádza po usadení kĺbu do správnej polohy zahájenie samoobnovovacieho procesu. Pokiaľ sa zviera pohybuje s neusadeným dysplázickým kĺbom, dochádza v ňom k palotologickému treniu a zväčšovaniu opotrebovanosti chrupavky a následnej bolestivosti.
  Zdroj: Andrea Dunová',
  #image_url: 'ill_animals.jpg',
  created_at: '20.4.2016',
  date: 'Mon Apr 21 2014 11:40:53',
  category: illness,
)

Post.create!(
  format: 'article',
  title: 'Artróza',
  description: 'Je degeneratívne ochorenie kĺbov , ktoré vzniká opotrebovaním chrupavky. K opotrebovaniu a poškodeniu chrupaviek dochádza vplyvom ...',
  text: 'Je degeneratívne ochorenie kĺbov, ktoré vzniká opotrebovaním chrupavky. K opotrebovaniu a poškodeniu chrupaviek dochádza vplyvom záťaže a vekom , alebo pri nesprávnej degeneratívnej polohe kostí aj u mladších zvierat.  Pri artóze dochádza k praskaniu kolagénových vlákien chrupavky a ku znižovaniu kyseliny hyaulrónovej, dochádza tiež ku štrukturálnym zmenám kosti pod chrupavkou.
    br
    br
    Prejavuje sa:
    <br />
    Obmedzená pohyblivosť kĺbov, bolesťou kĺbov až bolesťou pri pohybe.
    Čo ošetrenie DM spôsobí?
    Počas terapie dôjde k jemnému usadeniu kĺbov do kĺbového púzdra čím sa spustí regeneračný proces postihnutej chrupavky a    zlepší sa celková pohyblivosť kĺbu.
    V AKÚTNEJ FÁZE OCHORENIA (opuch kĺbov, zápalové procesy) SA ZVIERA NESMIE DM OŠETROVAŤ. ODPORÚČAME VYHĽADAŤ VETERINÁRNU POMOC.
    <br />
    Zdroj: Andrea Dunová',
  #image_url: 'ill_animals.jpg',
  created_at: '20.4.2016',
  date: 'Mon Apr 21 2014 11:40:53',
  category: illness,
)

Post.create!(
  format: 'article',
  title: 'Henka dnes pôjde za psíkom hovno',
  description: 'niekam do bratislavy alebo aj mimo nej',
  text: 'niekam do bratislavy alebo aj mimo nej',
  #image_url: 'pes.jpg',
  created_at: '15.2.2015',
  date: 'Mon Apr 21 2014 11:40:53',
  category: dogs,
  subposts: [
    Subpost.new(icon: "dm-podkova.png", text: "bola som tam zase", happened_at: "21.05.2015"),
    Subpost.new(icon: "dm-laba.png", text: "prva navsteva", happened_at: "19.05.2015"),
  ]
)

Post.create!(
  format: 'article',
  title: 'Akita Kuma',
  description: '6,5r Akita Kuma, DM robena preventívne no nájdených dosť problemov: najvýraznejší je prepad L-Sacr. spojenia, krížovej kosti, ktorý sa už odzrkadloval aj na ...',
  text: '6,5r Akita Kuma, DM robena preventívne no nájdených dosť problemov: najvýraznejší je prepad L-Sacr. spojenia, krížovej kosti, ktorý sa už odzrkadloval aj na chôdzi, posun panvy a aj atlasu. Končatiny pukajúce, bolo ich potrebné usadiť pre zlepšenie látkovej výmeny v klboch. A znovu neštastné tylo...',
  #image_url: 'akita-kuma.jpg',
  created_at: '26.4.2015',
  date: 'Mon Apr 21 2014 11:40:53',
  category: dogs,
)

Post.create!(
  format: 'status',
  title: 'Miško',
  description: '',
  text: 'Rene je čurák!',
  #image_url: '',
  created_at: '15.2.2015',
  date: 'Mon Apr 21 2014 11:40:53',
  category: status,
)

Post.create!(
  format: 'status',
  title: 'Heňa',
  description: '',
  text: 'Vikend s Equine Touch, alebo vzdelania nikdy nie je dost — cítim sa motivovaná.',
  #image_url: '',
  created_at: '24.4.2015',
  date: 'Mon Apr 21 2014 11:40:53',
  category: status,
)

Post.create!(
  format: 'article',
  title: 'Posudzovanie fretiek - výstava Lužánky',
  description: 'udialo sa v CZ a bola to fajn sobota',
  text: 'Trošku som sa toho obávala, pretože som už celkom zabudla posudzovať, už len čo chytím dornujem. Celkovo mi prešlo rukami cez 30 zvierat. Z čoho polovica mala blokady krížovej kosti, prvých chvostových stavcov. Mala som aj 4 zrotované panvy a 1 atlas. Ostatní rozhodcovia na mna čakali, lebo okrem posudzovania sa aj dornovalo, tak som skončila viac ako 30min po nich :). Výsledok je taký, že aj zviera, ktoré na prvý pohlaď je maximálne pružné elastické (viac ako mačka) má naozaj skoro 50% pravdepodobnosť posunu a problémov v pohybovom aparáte, akurat vzhladom na dlžku ich života, aktivitu a štýl pohybu to zatiaľ chovatelia a veterinári neriešia, nakoľko sa ten pohybový problém často prejaví s ochorením (hypertrofia-slabosť končatín, šmachtlanie nohami; po opatrnej dornovke zvieratá už chodia viacmenej normálne a pod.).\nŠkoda, že nebolo času na prednášku nech sa aj fretkári trošku s dornovkou oboznámia, lebo ich zvery by to potrebovali.',
  #image_url: 'vystava_CZ.jpg',
  created_at: '15.2.2015',
  date: 'Mon Apr 21 2014 11:40:53',
  category: events,
)

Post.create!(
  format: 'article',
  title: 'Rysy',
  description: 'Rysy - 2r fenočka Border teriera. Rysy pozná dornovku veľmi dobre, pretože je pravidelná účastníčka kurzov ľudskej dornovky v Bratislave, kde so svojou paničkou asistuje. Panička chcela poriešiť ...',
  text: 'Rysy - 2r fenočka Border teriera. Rysy pozná dornovku veľmi dobre, pretože je pravidelná účastníčka kurzov ľudskej dornovky v Bratislave, kde so svojou paničkou asistuje. Panička chcela poriešiť prepadajúci sa stavec, a celkovo preventívne zhodnotiť, nakoľko sa s fenkou pripravujú na Agility. Rysinka mala rozvolnenú patellu na ľavej labke (panička dostala D.ú. usádzať) a toršku rozhádzaný krk (C1, C6) a posun posledného L stavčeka (nedávno dostala bočný náraz od vacšieho šteniatka, čo predpokladáme, že mohlo spsobiť posun L a C6 stavca). Na konci Rysy zhodnotila, že bude radšej aj nadalej chodiť radšej na tie ludské dornovky než na svoje tam jej krk nenaprávajú.',
  #image_url: 'rysy.jpg',
  created_at: '02.04.2015',
  date: 'Mon Apr 21 2014 11:40:53',
  category: dogs,
)

Post.create!(
  format: 'article',
  title: 'Merci',
  description: 'Merci, cca 2r nádherná múdra mojkacia fenočka adoptovaná z útulku z LM. Má za sebou resekciu ľavého bedrového kĺbu, a dornovku pozná veľmi dobre. Operovanú nohu už celkom slušne ...',
  text: 'Merci, cca 2r nádherná múdra mojkacia fenočka adoptovaná z útulku z LM. Má za sebou resekciu ľavého bedrového kĺbu, a dornovku pozná veľmi dobre. Operovanú nohu už celkom slušne používa. Akurat poslednu dobu začala divne chodiť na druhú pravú nôžku, tak prišli preventívne na ošetrenie. Kedže sme nič výrazné nenašli (len posun krčných stavcov) dostala ešte kompletnú bowenovu masáž, lebo problém bude v makkých tkanivách a v pretažovaní zdravej končatiny. Kedže sa blíži leto, chystajú sa s merci plávať, tak veríme, že nožičky zosilnejú.',
  #image_url: 'merci.jpg',
  created_at: '10.04.2015',
  date: 'Mon Apr 21 2014 11:40:53',
  category: dogs,
)

Post.create!(
  format: 'article',
  title: 'Igi (Gidran)',
  description: 'Včera sme navštívili Igiho aby podstúpil 2. ošetrenie DM. Do 2 týždnoch po prvej dornovke sa igimu postupne polepšilo, prestal krívať na predné nohy, pri poslednej vychádzke si však trošku ...',
  text: 'Včera sme navštívili Igiho aby podstúpil 2. ošetrenie DM. Do 2 týždnoch po prvej dornovke sa igimu postupne polepšilo, prestal krívať na predné nohy, pri poslednej vychádzke si však trošku viac vyhodil z kopýtka, takže trošku zakríval, ale 2. terapia bola aj tak potrebná pre upevnenie všetkých kostí, lebo nie všetky nam ostali ok. Igi podstúpil klasicky uvolnenie celého tela a blokád bowenovou masážou a následne Dorn. Usádzali sme ľavé rameno, ktoré bolo ešte stále o dosť vpredšie, po uplnom uvolnení a odlepení lopatiek, ktoré boli už v lepšom stave ako minule sa objavil posunutý 6. stavec, ku ktorému sme sa cez blokády pri 1. terapii nedostali. A ešte sa upravila panva, ktoré bola trošku ľavou lopatou vpredu. Igorko bol znovu úplne ukážkový pacient.',
  #image_url: 'igi.jpg',
  created_at: '25.02.2015',
  date: 'Mon Apr 21 2014 11:40:53',
  category: horses,
)

Post.create!(
  format: 'article',
  title: 'Portoriko',
  description: '15r, Westfalsky valach, Miloslavov, zameranie: parkúr',
  text: 'Ďna 3.4.2015 sme navštívili stajnu Plameň v Miloslavove aby sme sa pozreli na Portorikove telo, nakoľko je vynikajúci skokan, ale veľmi ťažko jazditelný. Už na prvý pohlad bol jasne viditeľný problém a blokáda krčných stavcov. Na úvod podstúpil bowenovu masáž pre kone, na celkové uvolnenie svalstva, následne dornovu metódu. Prvý krčný stavec bol výrazne zrotovaný a aj vpáčený do hlavy, čoho následkom je aj opuch lymfatických uzlín, ktoré mal výrazne zväčšené. Dalej to bol posun 3. a 4. krčného stavca do prava. A zrotovaná panva - pravou lopatou dopredu a ľavou dohora, pridružila sa aj blokáda krížovej kosti v pravo. S Portom sa veľmi dobre pracovalo a aj keď mal krk bolestivý, pomáhal ako mohol.

    27.4.2015 sme sa vybrali na kontrolu. Hneď po nutnom oddychu nám majiteľka písala, že má pod sedlom iného koňa, inak nosí krk a
    hlavu, nedriape sa až tak dopredu a jazdenie je teda príjmenejšie. Ale nedostatky tam stále sú práca na parkúre je dosť nestabilná,
    dúfame, že sú to všetko len prechodné stavy.
    Ľavá panvová lopata bola ešte jemne hore, krížová kosť bola tiež tým pádom ešte bloknutá. Prvý krčný stavec v lepšom stave, rotácia
    už nie je, ale stále je príliž natlačený na hlavu, takže musíme v jemných uvolnovaniach pokračovať. Na záver dostal Porto základné vybalansovanie tela pomocou the equine touch techniky + ošetrenie hlavy a krku na uvolnenie lymfatického toku krku a hlavy. Za mesiac prídeme opať na návštevu povenovať sa problémovej C1.',
  #image_url: 'portoriko.jpg',
  created_at: '27.04.2015',
  date: 'Mon Jan 21 2014 11:40:53',
  category: horses,
)

AdminUser.create!(
  email: 'admin@dornovka.sk',
  password: 'akvonrod',
  password_confirmation: 'akvonrod'
)