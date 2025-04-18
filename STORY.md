## Вступление

Как-то в конце ноября - начале декабря 2024 года решил перепройти одну из моих любимых игр - Готику. По счастью она у меня была уже куплена в Steam.
После нескольких запусков, заметил, что Стим предлагает альтернативный запус с модами. Так, интересно, подумал я, и начал играть в моды :)

Очень скоро обнаружилось, что практически во всех дилогах, добавленных в модах либо отсутсвует озвучка, либо присутствует, но не качественная/любительская.
Подумал, а вот было бы круто, если бы кто-нибудь прикрутил нейронку и нагенерил озвучку, ведь сейчас же полно взяких дипфейков для голоса в том числе!...
А почему бы не сделать самому? Кажется, крутая идея для Pet-проекта.

## Создание DEMO

Не сказать, что активно занялся проектом, так как конец года, да и просто банальная лень :)
В декабре 2024 только успел накидать примерный план в канбане гитхаба и нагуглил несколько реп TTS, и немного про voice-transfer.
В числе найденного оказался интересный проект TTS от [Silero](https://github.com/snakers4/silero-vad).
У них так же есть тг-бот @silero_voice_bot с кучей голосов из игр/фильмов/прочего, в том числе в HD качестве.
Решил, что раз уж я такая ленивая задница, то запилю хотябы видос с (пере)озвучкой какого нибудь NPC из Готики, кажется дел на часик-два. 

Январь 2025.

Сначала думал что подойдет тот знаменитый диалог Безымянного с Демоном в башне Ксардаса, тем более, что у Силеро в боте есть голоса из Варкрафта.
Нооо после поска нужного диалога в этих ваших летсплеях, оказалось, что Демон говорит только в голове Безымянного :(((

Задачка усложнилась, немного расстроишись машинально потыкал в соседние видео и наткнулся на прохождение мода "Народ Миненталя". Там первый же NPC... заговорил, но любительским голосом.
Решил найти первого попавшегося NPC, которого не было в оригинальной серии с (не поворачивается язык сказать "некачественной", ребята старались, им только респект!) озвучкой.
Им оказался Феофил и его, уже засевшие у меня в голове фразы: "Эй! Постой! Ты не мог бы мне помочь?..."

Решено! берем этот диалог и переозвучиваем!

Это было где-то вечером в пятницу 17го января, случайно выбрал голоса из Властелина Колец в боте Силеро, выбрал Арагорна, вставил текст "Ты не мог бы мне помочь?" ииии... Нет что-то не так звучит... А ну ка Леголас? вооо! уже лучше! :)

Нагенерировал с помощью бота несколько фраз Феофила голосом Леголаса, вдохновился, показал домашним - вроде топ!

Утром следующего дня было время засесть и подумать, как подсунуть новый голос да еще и не в оригинал игры, а в мод.
Информации по модостроению, да еще и для Готики 1, надо сказать не очень много :) Больше всего мне, скорее всего, помог форум [WorldOfPlayers](https://worldofplayers.ru/forums/353/), там нашел созданный неким VAM-ом локальный HTML справочник по модостроению, который помог мне "вскрыть" мод "Народ Миненталя" и подменить несколько файлов... Звучит просто, правда? :)
На деле у меня это заняло несколько часов и изрядно намучившись у меня получить заменить только фразу "Эй! Постой!", но какой это был кайф :)) Как сказал В.В. Жириновский: "Жизнь - это большие провалы и маленькие успехи", вроде как-то так, точно не помню :D

Отдельно надо упомянуть встроенную запись в Стиме - экпорт видео в ней не работает, что бы я не пробовал. В общем забив на запись в Стиме, использовал Виндовый Xbox видеозахват, подрихтовав диалоги, на следующий день получил две записи до/после, помотреть можно [тут](https://drive.google.com/drive/folders/1-03pSJen02kXvuox3JCle2nPppAW582R?usp=drive_link)

## Что дальше?
Нужно распарсить скрипты мода на предмет диалогов без озвучки либо с любительскими голосами, которые лежат в файлах с расширением .DAT, фиг знает чем их открывать :D

Нужно найти готовую модель voice-transfer с возможностью дообучения. Нужно же переозвучить добавленные диалоги персонажей, которые уже были в игре. Безымянного в первую очередь!

А обучить модель с нуля, да еще и качественно, кажется, пока не подъемно для меня:(

А пока я решил немного насладиться получившейся демкой и поиграть в Готику ;P

## 1 марта

Дааа, подзабил я на проект (
А тут Силеро выпустили классное обновление своего бота - теперь можно добавлять свои голоса (с некоторыми условиями). С помощью утилиты GothicVDFS вытащил оригинальные диалоги игры, склеил почти двух минутный разговор Безымянного и засунул аудио в бота. Получилось очень даже! В итоге 3 марта обновил демку диалога с Феофилом, можно заценить в гугл диске :) Заодно принял участие в конкурсе эпичных голосов от Силеро, вдруг дадут годовой прем в боте :D

## 5-10 апреля

Наконец-то решил заняться парсингом диалогов. Long story short: декомпилировать с помощью GothicSorcer мод "Народ Миненталя" не получилось - прога крашилась, зато получилось декомпилировать Gothic.DAT "Золотого мода". Также на просторах Интернета нашел файлы оригинальной игры и с помощью не хитрого Python скрипта собрал ID диалогов мода, которых не было в оригинале. Дальше дело за малым - подсунуть файлы и скомпилить мод обратно... Но! это не сработало! В итоге решил сделать полноценный Steam аддон для мода, такой вариант мне даже больше нравится :) К счастью, в папке игры любезно был предоставлен пример аддона "Example mod", сделал по аналогии и вуаля - Безымянный заговорил!
