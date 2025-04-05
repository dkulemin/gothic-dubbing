//--------------------- Функции вывода текста ---------------------------------
func int zMessageBox(var string zsParam1);
// выводит на экран строку текста text, как OutputUnits текст (аналогично выводу из OU файла).
func void Print(var string text); 

// выводит текст на экран, объединяя строки параметров text1 - text5 в одну строку.
func void PrintMulti(var string text1, var string text2, var string text3, var string text4, var string text5); 

// выводит на экран строку текста text (имя шрифта – font)
// с координатами x, y (диапазон от 0 до 99% размера экрана, 
// -1 означает вывод по центру соответствующей оси экрана) на время timeSec (в секундах).
// Возвращаемое значение всегда = 0.
func int PrintScreen(var string text, var int x, var int y, var string font, var int timeSec); 
 
// выводит текст строки text через zSpy или в лог. файл, 
// работает только в отладочном режиме (включается (Alt+D))
func void PrintDebug(var string text); 
 
// выводит текст строки text через zSpy или в лог. файл для инстанции self в отладочном режиме.
func void PrintDebugInst(var string text);
 
// выводит текст строки text через zSpy или в лог. Файл для инстанции self канала ch в отладочном режиме
// (каналы определены в файле PrintDebug.d).
func void PrintDebugInstCh(var int ch, var string text); 
 
// выводит текст строки text через zSpy или в лог. файл для канала ch в отладочном режиме
func void PrintDebugCh(var int ch, var string text); 
 
// работает аналогично функции PrintScreen, только вывод осуществляется 
// в окно диалога c номером dialogNr (координаты в % действуют внутри окна диалога).
func int PrintDialog(var int dialogNr, var string text, var int x, var int y, var string font, var int timeSec);

//--------------------- Функции преобразования типов --------------------------

// преобразовывает целое число value в строку.
func string IntToString(var int value); 
 
// преобразовывает число с плавающей точкой value в строку.
func string FloatToString(var float value); 
 
// преобразовывает число с плавающей точкой value в целое число.
func int FloatToInt(var float value);
 
// преобразовывает целое число value в число с плавающей точкой.
func float IntToFloat(var int value); 
 
// результирующей строкой является объединение двух строк text1 и text2.
func string ConcatStrings(var string text1, var string text2); 

//--------------------- Функции работы со звуком ------------------------------

// воспроизвести звуковой эффект, где nameSFX имя производной от класса C_SFX. 
func void Snd_Play(var string nameSFX); 
 
// воспроизвести звуковой эффект для НПС npc, где nameSFX имя производной от класса C_SFX. 
func void Snd_Play3D(var C_NPC npc, var string nameSFX); 
 
// проверить, является ли НПС npc источником звука (return > 0) и установить ссылку other на этого НПС.
func int Snd_IsSourceNpc(var C_NPC npc); 
 
// проверить, является ли у НПС npc предмет источником звука (return > 0) и установить ссылку item на этот предмет
func int Snd_IsSourceItem(var C_NPC npc); 
 
// выдать расстояние в сантиметрах до источника звука от НПС npc.
func int Snd_GetDistToSource(var C_NPC npc); 

//--------------------- Вспомогательные функции -------------------------------

// сгенерировать случайное целое число в диапазоне от 0 до bound - 1.
func int Hlp_Random(var int bound); 
 
// сравнивает две строки text1 и text2, 
// возвращает TRUE при равенстве строк или FALSE при неравенстве.
func int Hlp_StrCmp(var string text1, var string text2); 
 
// если ссылка на НПС npc существует, то возвращает TRUE, иначе – FALSE.
func int Hlp_IsValidNpc(var C_NPC npc); 
 
// если ссылка на предмет item существует, то возвращает TRUE, иначе – FALSE.
func int Hlp_IsValidItem(var C_ITEM item); 
 
// проверяет принадлежность предмета item к соответствующему типу instanceName, 
// возвращает TRUE при соответствии, иначе – FALSE.
func int Hlp_IsItem(var C_ITEM item, var int instanceName); 
 
// возвращает ссылку на НПС, принадлежащему к типу instanceName.
func C_NPC Hlp_GetNpc(var int instanceName); 
 
// получить ID номер НПС или предмета по ссылке на соответствующий класс instanceName.
func int Hlp_GetInstanceID(var C_NPC or C_ITEM instanceName); 
 
//------ Функции работы с документами (свитки, книги, записки, карты) ---------

// создает новый документ и возвращает номер его обработчика.
func int Doc_Create();
 
// создает новую карту и возвращает номер её обработчика.
func int Doc_CreateMap(); 
 
// устанавливает уровень мира worldZEN (формат ZEN) для документа handle.
// Задает имя мира для создания карты.
func void Doc_SetLevel(var int handle, var string worldZEN); 
 
// задает кол-во отображаемых страниц pages для документа handle.
func void Doc_SetPages(var int handle, var int pages); 
 
// устанавливает параметры страницы page 
// (если параметр page = -1, то применяется ко всем страницам) документа handle
// pageImage – имя файла изображения страницы в формате TGA, 
// scale = 0 - применять масштабируемось, 
// scale = 1 - не использовать масштабируемость (применяется для карт).
func void Doc_SetPage(var int handle, var int page, var string pageImageTGA, var int scale); 
 
// задать шрифт для страницы page документа handle, где fontTGA – имя файла шрифта в формате TGA.
func void Doc_SetFont(var int handle, var int page, var string fontTGA); 
 
// установить границы вывода текста на странице page документа handle, 
// где left, top, right, bottom – соответственно левая, верхняя, правая и нижняя границы, 
// pixel – кол-во пикселей на единицу границы.
func void Doc_SetMargins(var int handle, var int page, var int left, var int top, var int right, var int bottom, var int pixel); 
 
// выводит строку текста text на странице page документа handle.
func void Doc_PrintLine(var int handle, var int page, var string text); 
 
// выводит текст text в несколько строк на странице page документа handle.
func void Doc_PrintLines(var int handle, var int page, var string text); 
 
// выводит созданный документ handle на экран.
func void Doc_Show(var int handle); 
 
// открывает документ с именем picName, как рисунок на заднем плане 
func void Doc_Open(var string picName); 
 
// задает для документа шрифт font
func void Doc_Font(var string font); 
 
// выводит текст text документа на экран
func void Doc_Print(var string text); 
 
// инициализирует карту с именем уровня levelName, 
// где gamex1, gamey1, gamex2, gamey2 – координаты углов карты, соответствующие координатам уровня
// pixelx1, pixely1, pixelx2, pixely2 – соответственно коодинаты пикселей углов карты
func void Doc_MapCoordinates(var string levelName, var float leftLevel, var float topLevel, var float leftMap, var float topMap, var float rightLevel, var float bottomLevel, var float rightMap, var float bottomMap); 

// устанавливает границы области, отображаемой на карте (границы задаются в абсолютных координатах уровня), где: 
// handle – обрабатываемый документ, 
// left, top, right и bottom – задаваемые границы.
func void Doc_SetLevelCoords(var int handle, var int left, var int top, var int right, var int bottom); 
 
//--------------------- Функции работы с журналом квестов ---------------------

// создать в журнале тему с именем topic в разделе section 
// (предопределены два раздела LOG_MISSION или LOG_NOTE).
func void Log_CreateTopic(var string topic, var int section); 
 
// установить статус status темы с именем topic 
// (предопределены следующие статусы - LOG_RUNNING, LOG_SUCCESS, LOG_FAILED, LOG_OBSOLETE).
func void Log_SetTopicStatus(var string topic, var int status); 
 
// записать в тему topic текст из строки text.
func void Log_AddEntry(var string topic, var string text); 

//--------------------- Функции работы с инвентарем ---------------------------

// создает в инвентаре НПС npc предмет с ID itemInstance.
func void CreateInvItem(var C_NPC npc, var int itemInstance); 
 
// создает в инвентаре НПС npc предметы с ID itemInstance количеством amount.
func void CreateInvItems(var C_NPC npc, var int itemInstance, var int amount); 
 
// экипировать НПС npc предметом с ID itemInstance.
func void EquipItem(var C_NPC npc, var int itemInstance); 
 
// создает в контейнере с именем mobName (например сундук) предметы с ID itemInstance и количеством amount.
func void Mob_CreateItems(var string mobName, var int itemInstance, var int amount); 
 
// получить количество предметов с ID itemInstance, находящихся в контейнере с именем mobName.
func int Mob_HasItems(var string mobName, var int itemInstance); 

//--------------------- Функции анимации --------------------------------------

// запустить файл анимации fileMDS с расширением mds для НПС npc.
func void Mdl_ApplyOverlayMds(var C_NPC npc, var string fileMDS); 
 
// отключить от НПС npc файл анимации fileMDS.
func void Mdl_RemoveOverlayMDS(var C_NPC npc, var string fileMDS); 
 
// запустить файл анимации fileMDS для НПС npc на время time
func void Mdl_ApplyOverlayMDSTimed(var C_NPC npc, var string fileMDS, var int time); 
 
// запустить случайные анимации ani для НПС npc в последовательности анимационных состояний alias.
func void Mdl_ApplyRandomAni(var C_NPC npc, var string ani, var string alias); 
 
// устанавливает частоту выборки freq случайных анимационных состояний ani для НПС npc.
func void Mdl_ApplyRandomAniFreq(var C_NPC npc, var string ani, var float freq); 
 
// запускает анимацию ani лица для НПС npc с интенсивностью intensity в % (1 – 100%) 
// и временем удержания holdTime (1 – постоянно).
func void Mdl_StartFaceAni(var C_NPC npc, var string ani, var float intensity, var float holdTime); 
 
// запускает случайную анимацию ani лица для НПС npc со следующими параметрами:
// timeStart, timeStop – диапазон времени воспроизведения анимации в сек, 
// timeStartVar, timeStopVar – отклонения от значений timeStart, timeStop в сек, 
// probably – вероятность использования отклонения (от 0 до 1) от нижней до верхней границы.
func void Mdl_ApplyRandomFaceAni(var C_NPC npc, var string ani, var float timeStart, var float timeStartVar, var float timeStop, var float timeStopVar, var float probably); 
 
// задать для НПС npc файл изображения с именем fileMDS (формат MDS)
func void Mdl_SetVisual(var C_NPC npc, var string fileMDS); 
 
// установить параметры изображения НПС npc, где : bodyMesh – имя mesh файла изображения тела, 
// bodyTex – номер текстуры тела, skinColor – номер палитры цвета кожи, 
// headMMS – имя MMS файла изображения головы, headTex – номер текстуры головы, 
// toothTex – номер текстуры зубов, armor – номер одетой брони (- 1 – брони нет).
func void Mdl_SetVisualBody(var C_NPC npc, var string bodyMesh, var int bodyTex, var int skinColor, var string headMMS, var int headTex, var int toothTex, var int armor); 
 
// установить масштаб mesh изображения модели НПС npc по координатам x, y, z в % (1 -100%).
func void Mdl_SetModelScale(var C_NPC npc, var float x, var float y, var float z); 
 
// установить жирность mesh изображения модели НПС npc в % (1 - 100%).
func void Mdl_SetModelFatness(var C_NPC npc, var float fatness); 

//--------------------- Функции распорядка дня --------------------------------

// для НПС npc задается функция распорядка дня state, 
// где startHour и startMin – время в часах и минутах начала выполнения функции, 
// stopHour и stopMin – соответственно время окончания функции, 
// waypoint – имя точки, в которой выполняется функция.
func void TA_Min(var C_NPC npc, var int startHour, var int startMin, var int stopHour, var int stopMin, var func state, var string waypoint); 
 
// выполняет все то, что и предыдущая функция, только без привязки к минутам.
func void TA(var C_NPC npc, var int startHour, var int stopHour, var func state, var string waypoint); 
 
// функция, выполняемая последней в списке функций распорядка дня для НПС npc, 
// где csName – имя файла CS (Cutscene), 
// roleName – роль НПС, которая должна выполняться.
func void TA_CS(var C_NPC npc, var string csName, var string roleName); 
 
// начать выполнять заявленный распорядок дня для НПС npc.
func void TA_BeginOverlay(var C_NPC npc); 
 
// закончить выполнять заявленный распорядок дня для НПС npc.
func void TA_EndOverlay(var C_NPC npc); 
 
// удалить заявленный распорядок дня для НПС npc.
func void TA_RemoveOverlay(var C_NPC npc); 

//--------------------- Функции работы с диалогами ----------------------------

// показывает, завершен ли диалог (возвращает 0 во время диалога и 1 после окончания диалога).
func int InfoManager_HasFinished(); 
 
// добавляет в меню диалога menu строку выбора действия text, 
// action – функция, которая активируется при выборе данного пункта меню.
func void Info_AddChoice(var C_INFO menu, var string text, var func action); 
 
// удалить тему диалога menu.
func void Info_ClearChoices(var C_INFO menu);

//--------------------- Функции различного назначения -------------------------

// просто всегда возвращает 1.
// В английской версии экзешника еще есть функции - int GameInitEnglish () и int GameInitEngintl (), 
func int GameInitGerman();
 
// просто всегда возвращает 1 (только для английской версии экзешника).
func int GameInitEnglish();
 
// просто всегда возвращает 1 (только для английской версии экзешника).
func int GameInitEngintl();
 
// просто закончить игру.
func void ExitGame(); 
 
// используется вместо функции ExitGame (), хотя она тоже сохранена.
func void ExitSession();
 
// показать видео файл videoBIK (c расширением BIK), возвращает 1, если видео показано, 0 – в случае ошибки.
func int PlayVideo(var string videoBIK); 
 
// показать видео файл videoBIK (c расширением BIK), 
// возвращает 1, если видео показано, 0 – в случае ошибки. 
func int PlayVideoEx(var string videoBIK, var int BlendTime, var int ExitSession); 
 
// установить процент percBar отображения полоски в окне загрузки (ProgressBar), значение от 0 до 100.
func void SetPercentDone(var int percBar); 
 
// вывести на экран окно новой главы, где chapter – номер главы, 
// text – название главы, fileTGA – файл заставки главы (формат TGA), 
// soundWAV – звуковой файл (формат WAV), time – время показа заставки.
func void IntroduceChapter(var string chapter, var string text, var string fileTGA, var string soundWAV, var int time);
 
// переопределить значение таланта value для константы tal 
// (например, определены константы NPC_TALENT_PICKLOCK, NPC_TALENT_MAGE и т.д.).
func void Tal_Configure(var int tal, var int value); 
 
// устанавливает дальность действия range пассивного восприятия percID в сантиметрах.
func void Perc_SetRange(var int percID, var int range); 
 
// заменяет функции oldRoutine распорядка дня НПС npc на новые функции newRoutine. 
// (Имя функции должно начинаться с RTN_ и заканчиваться идентификатором НПС скрипта).
func void Rtn_Exchange(var string oldRoutine, var string newRoutine); 
 
// информирует, игралась ли Cutscene с именем csName (0 – нет, 1 – да).
func int Hlp_CutscenePlayed(var string csName); 

//--------------------- Функции работы с миром Готики -------------------------

// эта функция инициализирует глобальную переменную скриптов other, отличную от НПС npc, 
// где instanceNpc – производная от класса C_NPC, которая должна быть найдена и проинициализирована (-1 – любая производная),
// guild – гильдия, членом которой должен быть искомый НПС (-1 – любая гильдия), 
// aiState – функция AI состояния, в котором должен находится искомый НПС (NOFUNC – любое AI состояние).
// Функция возвращает 
// 1 - в случае успешного завершения (other инициализирован найденным НПС), 
// 0 – неудача (other не определен).
func int Wld_DetectNpc(var C_NPC npc, var int instanceNpc, var func aiState, var int guild); 
 
// эта функция инициализирует глобальную переменную скриптов other, отличную от НПС npc, 
// где instanceName – производная от класса C_NPC, которая должна быть найдена и проинициализирована 
// (-1 – любая производная), 
// guild – гильдия, членом которой должен быть искомый НПС (-1 – любая гильдия), 
// state – функция AI состояния, в котором должен находится искомый НПС (NOFUNC – любое AI состояние). 
// Функция возвращает 1 в случае успешного завершения (other инициализирован найденным НПС), 
// 0 – неудача (other не определен), 
// параметр detectPlayer указывает, исключить ли игрока (ГГ) из поиска (0 – исключить, 1 – нет). 
// В этой функции, по сравнению с Wld_DetectNpcEx, добавлен параметр Attitude - отношение НПС к гильдии. 
func int Wld_DetectNpcExAtt(var C_NPC npc, var int instanceName, var func state, var int guild, var int detectPlayer, var int Attitude); 
 
// возвращает 1, если идет дождь, иначе – 0.
func int Wld_IsRaining(); 
 
// выполняет все тоже, что и предыдущая функция, 
// дополнительный параметр detectPlayer указывает, исключить ли игрока (ГГ) из поиска 
// (0 – исключить, 1 – нет).
func int Wld_DetectNpcEx(var C_NPC npc, var int instanceNpc, var func aiState, var int guild, var int detectPlayer); 
 
// эта функция инициализирует глобальную переменную скриптов item предметом, 
// возможно находящимся у НПС npc и имеющим флаг flagsItem, 
// возвращает 1 при успешном поиске и инициализации, иначе – 0.
func int Wld_DetectItem(var C_NPC npc, var int flagsItem); 
 
// возвращает 1, если ГГ есть НПС npc, иначе – 0.
func int Wld_DetectPlayer(var C_NPC npc); 
 
// установить отношение между гильдиями, где 
// guild1, guild2 – гильдии, между которыми устанавливается отношение, 
// attitude – отношение между гильдиями 
// (определены отношения ATT_HOSTILE, ATT_FRIENDLY, ATT_NEUTRAL, ATT_ANGRY).
func void Wld_SetGuildAttitude(var int guild1, var int attitude, var int guild2); 
 
// получить отношение между гильдиями guild1 и guild2.
func int Wld_GetGuildAttitude(var int guild1, var int guild2); 
 
// проверяет, есть ли MOB с именем mobName в окрестности 10 метров от НПС npc, 
// возвращает TRUE, если MOB существует и свободен, иначе FALSE.
func int Wld_IsMobAvailable(var C_NPC npc, var string mobName); 
 
// определяет состояние MOB с именем mobName для НПС npc, 
// возвращает состояние или -1, если MOB не найден.
func int Wld_GetMobState(var C_NPC npc, var string mobName); 
 
// проверяет, есть ли FP с именем freepoint в окрестности 20 метров от НПС npc,
// возвращает TRUE, если FP существует и свободен, иначе FALSE.
func int Wld_IsFPAvailable(var C_NPC npc, var string freepoint); 
 
// работает аналогично предыдущей функции, но проверится ближайшая точка, если freepoint блокирована.
func int Wld_IsNextFPAvailable(var C_NPC npc, var string freepoint); 
 
// получить текущий день, отсчет дней идет от дня старта (Gamestart) = 0.
func int Wld_GetDay(); 
 
// возвращает 1, если текущее время находится между границами 
// (hourLow, minLow – нижняя граница, hourHigh, minHigh – верхняя граница в часах и минутах), 
// иначе возвращает 0.
func int Wld_IsTime(var int hourLow, var int minLow, var int hourHigh, var int minHigh); 
 
// установить текущее время в часах hour и минутах min.
func void Wld_SetTime(var int hour, var int min); 
 
// разместить в мире одного НПС, где instanceNpc – ссылка на НПС, 
// spawnPoint – имя точки размещения (может быть как WP, так и FP).
func void Wld_InsertNpc(var int instanceNpc, var string spawnPoint); 
 
// выполняется аналогично предыдущей функции, 
// только НПС после смерти будет оживлен в заданной точке через spawnDelay секунд.
func void Wld_InsertNpcAndRespawn(var int instanceNpc, var string spawnPoint, var int spawnDelay); 
 
// НПС npc около себя создает НПС (ссылка на него instanceNpc) количеством number на время жизни timeLife.
// Используется в заклинаниях вызова.
func void Wld_SpawnNpcRange(var C_NPC npc, var int instanceNpc, var int number, var float timeLife); 
 
// удалить из мира НПС (ссылке на него instanceNpc).
func void Wld_RemoveNpc(var int instanceNpc); 
 
// разместить в мире один предмет, где instanceItem – ссылка на предмет, 
// insertPoint – имя точки размещения (может быть как WP, так и FP),
// если пойнт не найден, то предмет будет вставлен в координатный центр игрового мира
func void Wld_InsertItem(var int instanceItem, var string insertPoint); 
 
// удалить из мира предмет по item ссылке на него, 
// возвращает 1 – успешное удаление, иначе – 0.
func int Wld_RemoveItem(var C_ITEM item); 
 
// разместить в мире визуальный объект objName в точке с именем point (может быть как WP, так и FP).
func void Wld_InsertObject(var string objName, var string point); 
 
// объект с именем objName (VOB объект) перейдет в состояние state 
// в момент времени hour, min (часы и минуты).
func void Wld_SetObjectRoutine(var int hour, var int min, var string objName, var int state); 
 
// выполняется как и предыдущая функция, только для MOB объекта.
func void Wld_SetMobRoutine(var int hour, var int min, var string objName, var int state); 
 
// активировать функцию VOB объекта с именем vobName. 
// Функция прописывается в параметрах VOB объекта в Спейсере.
// Используется для активизации триггеров через скрипты.
func void Wld_SendTrigger(var string vobName); 
 
// деактивировать функцию VOB объекта с именем vobName.
func void Wld_SendUntrigger(var string vobName); 
 
// установить взаимоотношения между гильдиями, где tableName – имя таблицы заданных отношений.
func void Wld_ExchangeGuildAttitudes(var string tableName); 
 
// устанавливает гильдию guild владельцем пространства room.
func void Wld_AssignRoomToGuild(var string room, var int guild); 
 
// устанавливает НПС owner владельцем пространства room.
func void Wld_AssignRoomToNpc(var string room, var C_NPC owner); 
 
// получить ссылку на НПС, которому принадлежит помещение, в котором сейчас находится ГГ
func C_NPC Wld_GetPlayerPortalOwner();
 
// получить номер гильдии, которой принадлежит помещение, в котором сейчас находится ГГ
func int Wld_GetPlayerPortalGuild();
 
// получить ссылку на НПС, которому принадлежит помещение, которое только что покинул ГГ
func C_NPC Wld_GetFormerPlayerPortalOwner();
 
// получить номер гильдии, которой принадлежит помещение, которое только что покинул ГГ
func int Wld_GetFormerPlayerPortalGuild(); 
 
// проиграть визуальный эффект
// nameVfx - имя эффекта (из файла Scripts\System\VisualFX\VisualFxInst.d)
// instOrigin - инстанция персонажа или предмета, от которого исходит эффект
// instTarget - инстанция персонажа или предмета, на который накладывается эффект
// EffectLevel - уровень эффекта
// Damage - наносимое повреждение
// DamageType - тип повреждения
// IsProjectile - активация коллизий эффекта
func void Wld_PlayEffect(var string nameVfx, var C_NPC instOrigin, var C_NPC instTarget, var int EffectLevel, var int Damage, var int DamageType, var int IsProjectile);

// останавливает проигрывание эффекта с именем nameVfx, запущенного функцией Wld_PlayEffect.
func void Wld_StopEffect(var string nameVfx); 

//--------------------- Функции работы с NPC  ---------------------------------

// возвращает номер гильдии, к которой принадлежит НПС npc.
func int Npc_GetTrueGuild(var C_NPC npc); 
 
// установить принадлежность НПС npc к гильдии guild.
func int Npc_SetTrueGuild(var C_NPC npc, var int guild); 
 
// установить постояноое отношение attitude НПС npc ко всем остальным НПС.
func void Npc_SetAttitude(var C_NPC npc, var int attitude); 
 
// установить временное отношение attitude НПС npc ко всем остальным НПС.
func void Npc_SetTempAttitude(var C_NPC npc, var int attitude); 
 
// получить текущее отношение НПС npc к НПС other.
func int Npc_GetAttitude(var C_NPC npc, var C_NPC other); 
 
// получить постоянное отношение НПС npc к НПС other.
func int Npc_GetPermAttitude(var C_NPC npc, var C_NPC other); 
 
// получить отношение НПС npc к НПС other, как отношение между гильдиями, а не личностями.
func int Npc_GetGuildAttitude(var C_NPC npc, var C_NPC other); 
 
// эта функция задает, что НПС npc знаком с НПС player (ГГ).
func void Npc_SetKnowsPlayer(var C_NPC npc, var C_NPC player) ; 
 
// проверить, знаком ли НПС npc с НПС player, возвращает TRUE, если знаком, иначе FALSE.
func int Npc_KnowsPlayer(var C_NPC npc, var C_NPC player); 
 
// проверить, принадлежит ли предмет item npc, возвращает 1, если принадлежит, иначе - 0.
func int Npc_OwnedByNpc(var C_ITEM item, var C_NPC npc); 
 
// проверить, принадлежит ли предмет item гильдии guild, возвращает 1, если принадлежит, иначе - 0.
func int Npc_OwnedByGuild(var C_ITEM item, var int guild); 
 
// возвращает название WP, в которой расположен НПС npc.
func string Npc_GetNearestWP(var C_NPC npc); 
 
// возвращает название соседней точки WP, рядом с которой расположен НПС npc.
func string Npc_GetNextWP(var C_NPC npc); 
 
// возвращает 1, если путь НПС npc прегражден препятствием, иначе – 0.
func int Npc_IsWayBlocked(var C_NPC npc); 
 
// проверяет, находится ли НПС npc в точке FP с именем freepoint, возвращает 1 – да, иначе – 0.
func int Npc_IsOnFP(var C_NPC npc, var string freepoint); 
 
// возвращает 1, если НПС npc мертв, иначе – 0.
func int Npc_IsDead(var C_NPC npc); 
 
// возвращает номер заклинания, которое НПС npc применил последним.
func int Npc_GetLastHitSpellID(var C_NPC npc); 
 
// возвращает категорию заклинания, которое НПС npc применил последним.
func int Npc_GetLastHitSpellCat(var C_NPC npc); 
 
// проверяет, является ли активное заклинание у НПС npc свитком, если да – возвращает 1, иначе – 0.
func int Npc_GetActiveSpellIsScroll(var C_NPC npc); 
 
// очищает весь инвентарь у НПС npc.
func void Npc_ClearInventory(var C_NPC npc); 
 
// возвращает расстояние в см. по высоте между НПС npc и other.
func int Npc_GetHeightToNpc(var C_NPC npc, var C_NPC other); 
 
// возвращает расстояние в см. по высоте между НПС npc и предметом item.
func int Npc_GetHeightToItem (var C_NPC npc, var C_ITEM item); 
 
// инициализирует глобальную переменную target ссылкой на НПС, на которого смотрит НПС npc.
func C_NPC Npc_GetLookAtTarget(var C_NPC npc); 
 
// остановить проигрывание анимации ani для НПС npc.
func void Npc_StopAni(var C_NPC npc, var string ani); 
 
// возвращает номер оружия, которое НПС npc держит в руках, иначе – 0.
func int Npc_IsDrawingWeapon(var C_NPC npc); 
 
// возвращает номер заклинания, которое применяет НПС npc, иначе – 0.
func int Npc_IsDrawingSpell(var C_NPC npc); 
 
// возвращает 1, если НПС npc находится в помещении, которое принадлежит ГГ, иначе – 0.
func int Npc_IsInPlayersRoom(var C_NPC npc); 
 
// возвращает НПС-владельца помещения (области), в котором находится НПС npc.
func C_NPC Npc_GetPortalOwner(var C_NPC npc); 
 
// возвращает номер гильдии владельца помещения (области), в котором находится НПС npc. 
func int Npc_GetPortalGuild(var C_NPC npc); 

// возвращает TRUE, если НПС npc уже получил информацию instanceInfo, иначе FALSE.
func int Npc_KnowsInfo(var C_NPC npc, var int instanceInfo); 
 
// проверяет, имеет ли НПС npc действительную информацию для игрока, 
// в этом случае возвращается 1 и начинается диалог, иначе 0, 
// где important – важность информации (1 – важная, 0 – обычная).
func int Npc_CheckInfo(var C_NPC npc, var int important); 
 
// работает аналогично предыдущей функции
func int Npc_GiveInfo(var C_NPC npc, var int important); 
 
// проверяет, имеет ли npc миссию в состоянии missionState (AVAILABLE, RUNNING) 
// с важностью important, возвращает 1, если имеет, иначе – 0.
func int Npc_CheckAvailableMission(var C_NPC npc, var int missionState, var int important); 
 
// работает аналогично предыдущей функции, только проверяется миссия в состоянии текущего выполнения.
func int Npc_CheckRunningMission(var C_NPC npc, var int important); 
 
// работает аналогично предыдущей функции, только проверяется миссия 
// в которой НПС npc может что-то предложить игроку.
func int Npc_CheckOfferMission(var C_NPC npc, var int important); 
 
// возвращает кол-во секунд, которые НПС npc находится в текущем состоянии, заданном в "Loop" цикле.
func int Npc_GetStateTime(var C_NPC npc); 
 
// установить кол-во секунд seconds, как долго НПС npc может находится в этом состоянии.
func void Npc_SetStateTime(var C_NPC npc, var int seconds); 
 
// возвращает состояние, в котором находится НПС npc (BS_константы).
func int Npc_GetBodyState(var C_NPC npc); 
 
// проверяет, установлен ли у НПС npc флаг состояния bodyFlag, возвращает 1, если установлен, иначе – 0.
func int Npc_HasBodyFlag(var C_NPC npc, var int bodyFlag); 
 
// возвращает 1, если проверяемый НПС npc является ГГ.
func int Npc_IsPlayer(var C_NPC npc); 
 
// возвращает 1, если НПС npc чувствует (видит, слышит и т.д.) НПС other, иначе – 0.
func int Npc_HasDetectedNpc(var C_NPC npc, var C_NPC other); 
 
// запрос на текущее состояние фигуры НПС npc, где state – функция состояния фигуры, 
// возвращает TRUE, если НПС находится в этом состоянии, иначе – FALSE.
func int Npc_IsInState(var C_NPC npc, var func state); 
 
// аналогично предыдущей функции, только запрос на предыдущее состояние фигуры НПС.
func int Npc_WasInState(var C_NPC npc, var func state); 
 
// проверяет, находится ли НПС npc в функции state, возвращает TRUE если находится, иначе – FALSE.
func int Npc_IsInRoutine(var C_NPC npc, var func state); 
 
// поменять у НПС npc распорядок дня routine.
func void Npc_ExchangeRoutine(var C_NPC npc, var string routine); 
 
// возвращает 1, если НПС npc находится во время проигрывания Cutscene, иначе – 0.
func int Npc_IsInCutscene(var C_NPC npc); 
 
// возвращает 1, если НПС npc разговаривает, иначе – 0.
func int Npc_IsVoiceActive(var C_NPC npc); 
 
// удаляет все команды для НПС npc из очереди AI_Queue.
func void Npc_ClearAIQueue(var C_NPC npc); 
 
// воспроизвести анимацию ani для НПС npc.
func void Npc_PlayAni(var C_NPC npc, var string ani); 
 
// установить счетчик отказа от диалога для НПС npc на timeSec секунд.
func void Npc_SetRefuseTalk(var C_NPC npc, var int timeSec); 
 
// проверить, истек ли счетчик отказа от диалога для НПС npc, 
// возвращает TRUE, если счетчик не истек, иначе – FALSE.
func int Npc_RefuseTalk(var C_NPC npc); 
 
// возвращает 1, если НПС other находится на расстоянии не менее 3 метров от НПС npc, иначе – 0.
func int Npc_IsNear(var C_NPC npc, var C_NPC other); 
 
// возвращает расстояние в см. между НПС npc и other.
func int Npc_GetDistToNpc (var C_NPC npc, var C_NPC other); 
 
// возвращает расстояние в см. между НПС npc и WP waypoint.
func int Npc_GetDistToWP(var C_NPC npc, var string waypoint); 
 
// возвращает расстояние в см. между НПС npc и предметом item.
func int Npc_GetDistToItem(var C_NPC npc, var C_ITEM item); 
 
// возвращает расстояние в см. между НПС npc и ГГ.
func int Npc_GetDistToPlayer(var C_NPC npc); 
 
// данная функция записывает для НПС npc новости, 
// где source – источник новостей (определено два источника: 
// NEWS_SOURCE_WITNESS – есть свидетель произошедшего, 
// NEWS_SOURCE_GOSSIP – сплетня), 
// newsID – идентификатор новости (определены новости: 
// NEWS_MURDER - убийство, NEWS_ATTACK – атака, NEWS_THEFT – воровство, NEWS_DEFEAT – поражение, 
// NEWS_NERVE – переживание, NEWS_INTERFERE – вмешательство, NEWS_HASDEFEATED – победа), 
// offender – НПС преступник, victim – НПС жертва.
func void Npc_MemoryEntry(var C_NPC npc, var int source, var C_NPC offender, var int newsID, var C_NPC victim); 
 
// работает аналогично предыдущей функции, только жертвой является вся гильдия.
func void Npc_MemoryEntryGuild(var C_NPC npc, var int source, var C_NPC offender, var int newsID, var C_NPC victimguild); 
 
// эта функция проверяет, имеет ли НПС npc новость с идентификатором newsID 
// о жертве victim и преступнике offender, 
// возвращает 1, если имеет, иначе – 0. 
// (Вместо ненужных параметров можно записать 0).
func int Npc_HasNews(var C_NPC npc, var int newsID, var C_NPC offender, var C_NPC victim); 
 
// возвращает 1, если новость для НПС npc является сплетней, иначе – 0.
func int Npc_IsNewsGossip(var C_NPC npc, var int newsID); 
 
// возвращает ссылку на свидетеля в новости newsID для НПС npc.
func C_NPC Npc_GetNewsWitness(var C_NPC npc, var int newsID); 
 
// возвращает ссылку на жертву в новости newsID для НПС npc.
func C_NPC Npc_GetNewsVictim(var C_NPC npc, var int newsID); 
 
// возвращает ссылку на преступника в новости newsID для НПС npc.
func C_NPC Npc_GetNewsOffender(var C_NPC npc, var int newsID); 
 
// удаляет новость newsID для НПС npc, возвращает 1, исли удаление успешно, иначе – 0.
func int Npc_DeleteNews(var C_NPC npc, var int newsID); 
 
// изменяет значение атрибута attribute на кол-во единиц value для НПС npc.
func void Npc_ChangeAttribute(var C_NPC npc, var int attribute, var int value); 
 
// НПС npc создает заклинание spell, оно становится активным, но еще не применяется.
func void Npc_CreateSpell(var C_NPC npc, var int spell); 
 
// НПС npc выучил заклинание spell и может его использовать.
func void Npc_LearnSpell(var C_NPC npc, var int spell); 
 
// возвращает номер заклинания, которое имеет активным НПС npc, иначе - -1.
func int Npc_GetActiveSpell(var C_NPC npc); 
 
// возвращает номер категории активного заклинания у НПС npc. 
// Существуют три категории заклинаний: SPELL_GOOD, SPELL_NEUTRAL, SPELL_BAD.
func int Npc_GetActiveSpellCat(var C_NPC npc); 
 
// задает любое значение value для активного заклинания у НПС npc, 
// это значение может использоваться в скриптах, экзешник на него не реагирует. 
// Возвращаемое значение неизвестно.
func int Npc_SetActiveSpellInfo(var C_NPC npc, var int value); 
 
// возвращает уровень активного заклинания у НПС npc.
func int Npc_GetActiveSpellLevel(var C_NPC npc); 
 
// возвращает 1, если НПС npc может использовать заклинание spell, иначе – 0.
func int Npc_HasSpell(var C_NPC npc, var int spell); 
 
// функция активации восприятия perc у НПС npc, где action – функция обработки восприятия.
func void Npc_PercEnable(var C_NPC npc, var int perc, var func action); 
 
// функция деактивации восприятия perc у НПС npc.
func void Npc_PercDisable(var C_NPC npc, var int perc); 
 
// установка времени реакции в секундах seconds НПС npc на событие для активного восприятия.
func void Npc_SetPercTime(var C_NPC npc, var float seconds); 
 
// функция посылки пассивного восприятия perc от npc, где victim – жертва, offender – преступник.
func void Npc_SendPassivePerc(var C_NPC npc, var int perc, var C_NPC victim, var C_NPC offender); 
 
// функция посылки восприятия perc от НПС npc к НПС target.
func void Npc_SendSinglePerc(var C_NPC npc, var C_NPC target, var int perc); 
 
// разрешает НПС npc воспринимать все объекты в зоне действия восприятия, 
// затем можно использовать функции Wld_DetectNpc и Wld_DetectItem.
func void Npc_PerceiveAll(var C_NPC npc); 
 
// возвращает имя MOB (Move Object) объекта, который распознал НПС npc. 
// Например: если имя MOB объекта " DOOR_OCR _135", то функция возвратит " DOOR ".
func string Npc_GetDetectedMob(var C_NPC npc); 
 
// возвращает TRUE, если npc может видеть НПС other, иначе – FALSE.
func int Npc_CanSeeNpc(var C_NPC npc, var C_NPC other); 
 
// возвращает TRUE, если НПС npc может видеть НПС other по прямой, без учета угла обзора, иначе – FALSE.
func int Npc_CanSeeNpcFreeLOS(var C_NPC npc, var C_NPC other); 
 
// возвращает TRUE, если npc может видеть предмет item, иначе – FALSE.
func int Npc_CanSeeItem(var C_NPC npc, var C_ITEM item); 
 
// возвращает TRUE, если НПС npc может видеть источник звука, иначе – FALSE.
func int Npc_CanSeeSource(var C_NPC npc); 
 
// возвращает TRUE, если ГГ находится в помещении НПС npc или в помещении его гильдии, иначе – FALSE.
func int Npc_IsPlayerInMyRoom(var C_NPC npc); 
 
// возвращает TRUE, если ГГ ранее находился в помещении НПС npc или в помещении его гильдии, иначе – FALSE.
func int Npc_WasPlayerInMyRoom(var C_NPC npc); 
 
// возвращает 1, если НПС npc имеет друзей, иначе – 0.
func int Npc_GetComrades(var C_NPC npc); 
 
// возвращает значение > 0, если НПС owner является владельцем MOBа, который использует НПС npc.
func int Npc_IsDetectedMobOwnedByNpc(var C_NPC npc, var C_NPC owner); 
 
// возвращает значение > 0, если гильдия ownerGuild является владельцем MOBа, который использует НПС npc.
func int Npc_IsDetectedMobOwnedByGuild(var C_NPC npc, var int ownerGuild); 
 
// НПС npc получает предмет item от НПС other.
func void Npc_GiveItem(var C_NPC npc, var C_ITEM item, var C_NPC other); 
 
// проверяет все модули ItemReact реакции на предмет item, полученный НПС npc от НПС other, 
// запускает соответствующую функцию Reaction и возвращает TRUE, если находит модуль, иначе – FALSE.
func int Npc_StartItemReactModules(var C_NPC npc, var C_NPC other, var C_ITEM item); 
 
// проверяет, имеет ли НПС other предмет instanceItem для передачи НПС npc, 
// возвращает TRUE, если предмет имеется, иначе – FALSE.
func int Npc_HasOffered(var C_NPC npc, var C_NPC other, var int instanceItem); 
 
// получить ссылку на предмет, который имеет НПС npc с номером instanceItem.
func C_ITEM Npc_GetInvItem(var C_NPC npc, var int instanceItem); 
 
// возвращает количетво предметов instanceItem у НПС n0.
func int Npc_HasItems(var C_NPC npc, var int instanceItem); 
 
// возвращает кол- во предметов, которые находятся у НПС npc, 
// где category – категория инвентаря 
// (INV_WEAPON, INV_ARMOR, INV_RUNE, INV_MAGIC, INV_FOOD, INV_POTION, INV_DOC, INV_MISC) 
// slot – номер слота предмета.
func int Npc_GetInvItemBySlot(var C_NPC npc, var int category, var int slot); 
 
// предмет instanceItem удаляется из инвентаря НПС npc и из игры.
func void Npc_RemoveInvItem(var C_NPC npc, var int instanceItem); 
 
// указанное кол-во amount предметов instanceItem удаляется из инвентаря НПС npc и из игры.
func void Npc_RemoveInvItems(var C_NPC npc, var int instanceItem, var int amount); 
 
// возвращает оружие ближнего радиуса поражения, которым экипирован НПС npc.
func C_ITEM Npc_GetEquippedMeleeWeapon(var C_NPC npc); 
 
// возвращает оружие дальнего радиуса поражения, которым экипирован НПС npc.
func C_ITEM Npc_GetEquippedRangedWeapon(var C_NPC npc); 
 
// возвращает доспехи, которыми экипирован НПС npc.
func C_ITEM Npc_GetEquippedArmor(var C_NPC npc); 
 
// возвращает 1, если НПС npc экипирован оружием, иначе - 0.
func int Npc_HasEquippedWeapon(var C_NPC npc); 
 
// возвращает 1, если НПС npc экипирован оружием ближнего радиуса поражения, иначе - 0.
func int Npc_HasEquippedMeleeWeapon(var C_NPC npc); 
 
// возвращает 1, если НПС npc экипирован оружием дальнего радиуса поражения, иначе - 0.
func int Npc_HasEquippedRangedWeapon(var C_NPC npc); 
 
// возвращает 1, если НПС npc экипирован доспехами, иначе - 0.
func int Npc_HasEquippedArmor(var C_NPC npc); 
 
// ставит НПС npc в режим кулачного боя.
func void Npc_SetToFistMode(var C_NPC npc); 
 
// ставит НПС npc в режим боя с соответствующим оружием weapon.
func void Npc_SetToFightMode(var C_NPC npc, var int weapon); 
 
// возвращает 1, если НПС npc находится в боевом режиме fightMode, иначе - 0. 
// Заданы следующие боевые режимы: 
// FMODE_NONE – небоевой режим, 
// FMODE_FIST – режим кулачного боя, 
// FMODE_MELEE – боевой режим с оружием ближнего радиуса поражения, 
// FMODE_FAR - боевой режим с оружием дальнего радиуса поражения, 
// FMODE_MAGIC – боевой режим с магией.
func int Npc_IsInFightMode(var C_NPC npc, var int fightMode); 
 
// возвращает ссылку на оружие, которое НПС npc держит в руке.
func C_ITEM Npc_GetReadiedWeapon(var C_NPC npc); 
 
// возвращает 1, если НПС npc держит любое оружие в руке, иначе - 0.
func int Npc_HasReadiedWeapon(var C_NPC npc); 
 
// возвращает 1, если НПС npc держит в руке оружие ближнего радиуса поражения, иначе - 0.
func int Npc_HasReadiedMeleeWeapon(var C_NPC npc); 
 
// возвращает 1, если НПС npc держит в руке оружие дальнего радиуса поражения, иначе - 0.
func int Npc_HasReadiedRangedWeapon(var C_NPC npc); 
 
// возвращает 1, если НПС npc держит в руке или имеет в инвентаре оружие 
// дальнего радиуса поражения с боеприпасами, иначе - 0.
func int Npc_HasRangedWeaponWithAmmo(var C_NPC npc); 
 
// возвращает TRUE, если НПС npc имеет цель для поражения 
// (в качестве цели выступает глобальная переменная other), иначе – FALSE.
func int Npc_GetTarget(var C_NPC npc); 
 
// выполняется активный поиск цели для НПС npc. 
// Если цель находится, то она становится внутренней целью и записывается в глобальную переменную other, 
// если цель не найдена, то внутренняя цель удаляется и other становится недействительным. 
// Критерий поиска цели - в качестве цели возмется враждебный противник, 
// который не мертв или находится не в бессознательном состоянии. 
// Возвращает TRUE, если цель найдена, иначе – FALSE. 
// Внимание: Поиск основывается на активном восприятии НПС npc, поэтому, 
// если активное восприятие не установлено, то сначала следует применять функцию Npc_PerceiveAll(). 
func int Npc_GetNextTarget(var C_NPC npc); 
 
// работает аналогично предыдущей функции, только ни внутренняя цель, ни переменная other не инициализируются.
func int Npc_IsNextTargetAvailable(var C_NPC npc); 
 
// устанавливает для НПС npc в качестве внутренней цели для поражения НПС other.
func void Npc_SetTarget(var C_NPC npc, var C_NPC other); 
 
// выявляет более сильного НПС среди npc и other по следующему алгоритму: 
// если сумма уровней всех НПС (людей и монстров), которые враждебны к npc и дружелюбны к other, 
// более чем в два раза превышает сумму уровней всех НПС (людей и монстров), 
// которые дружелюбны к npc и враждебны к other, 
// то other сльнее и возвращается FALSE, 
// иначе сильнее npc и возвращается TRUE. 
// Замечания: 
// 1. НПС, которые враждебны к обоим, не учитываются. 
// 2. НПС, который враждебен к одному и дружелюбен к другому, будет участвовать в подсчете два раза.
func int Npc_AreWeStronger(var C_NPC npc, var C_NPC other); 
 
// возвращает 1, если НПС other целится в НПС npc из оружия дальнего радиуса поражения или магией, иначе – 0.
func int Npc_IsAiming(var C_NPC npc, var C_NPC other); 
 
// возвращает уровень навыка talent, который имеет НПС npc.
// Определены следующие способности: 
// NPC_TALENT _1 H – владение одноручником, 
// NPC_TALENT _2 H – владение двуручником, 
// NPC_TALENT_BOW – владение луком, 
// NPC_TALENT_CROSSBOW – владение арбалетом, 
// NPC_TALENT_PICKLOCK – умение вскрывать замки, 
// NPC_TALENT_PICKPOCKET – карманная кража, 
// NPC_TALENT_MAGE – владение магией, 
// NPC_TALENT_SNEAK – умение подкрадываться, 
// NPC_TALENT_REGENERATE – способность восстанавливать здоровье, 
// NPC_TALENT_FIREMASTER – способность мастерски обращаться с огнем, 
// NPC_TALENT_ACROBAT – акробатика.
func int Npc_GetTalentSkill(var C_NPC npc, var int talent); 
 
// возвращает кол-во единиц навыка talent, которые имеет НПС npc.
func int Npc_GetTalentValue(var C_NPC npc, var int talent); 
 
// установить уровень level навыка talent, которым владеет НПС npc.
func void Npc_SetTalentSkill(var C_NPC npc, var int talent, var int level); 
 
// установить кол-во единиц value навыка talent, которым владеет НПС npc.
func void Npc_SetTalentValue(var C_NPC npc, var int talent, var int value); 

//----------- Функции искусственного интеллекта (AI_ функции)   ---------------

// НПС npc переводится на sec секунд в состояние ожидания, 
// в этом состоянии он не делает ничего, но наносимый ущерб регистрируется и работает пассивное восприятие.
func void AI_Wait(var C_NPC npc, var float sec); 
 
// воспроизвести звуковой файл с именем snd для НПС npc. 
func void AI_Snd_Play(var C_NPC npc, var string snd); 
 
// воспроизвести звуковой файл с именем snd для НПС npc. 
func void AI_Snd_Play3D(var C_NPC npc, var C_NPC other, var string snd); 
 
// воспроизвести видео-файл с именем video для НПС npc. 
func void AI_PlayFX(var C_NPC npc, var C_NPC other, var string video); 
 
// остановить воспроизведение видео-файла с именем video для НПС npc. 
func void AI_StopFX(var C_NPC npc, var string video); 
 
// для НПС npc проигрывается анимация ani (ani обязательно пишется заглавными буквами).
func void AI_PlayAni(var C_NPC npc, var string ani); 
 
// если НПС npc находится в состоянии анимации, то проигрывается соответствующее движение, 
// если НПС npc находится на MOBSI объекте (стул, кровать и т.д.), то он встает.
func void AI_StandUp(var C_NPC npc); 
 
// в отличии от предыдущей функции никаких движений не проигрывается, 
// НПС npc сразу переводится в стоячее состояние.
func void AI_StandUpQuick(var C_NPC npc); 
 
// НПС npc быстро бросает взгляд на НПС other. Выполняется только движение головой в течение 2 секунд.
func void AI_QuickLook(var C_NPC npc, var C_NPC other); 
 
// НПС npc смотрит на определенную точку на местности или на объект, 
// где point – имя точки местности или имя VOB объекта.
func void AI_LookAt(var C_NPC npc, var string point); 
 
// НПС npc смотрит на НПС other.
func void AI_LookAtNpc(var C_NPC npc, var C_NPC other); 
 
// НПС npc снова смотрит прямо перед собой.
func void AI_StopLookAt(var C_NPC npc); 
 
// НПС npc указывает на определенную точку на местности или на объект, 
// где point – имя точки местности или имя VOB объекта.
func void AI_PointAt(var C_NPC npc, var string point); 
 
// НПС npc указывает на НПС other.
func void AI_PointAtNpc(var C_NPC npc, var C_NPC other); 
 
// НПС npc прекращает указывать на что-нибудь или кого-нибудь.
func void AI_StopPointAt(var C_NPC npc); 
 
// НПС npc берет (принимает) предмет item.
func void AI_TakeItem(var C_NPC npc, var C_ITEM item); 
 
// НПС npc выбрасывает на землю или на пол предмет instanceItem.
func void AI_DropItem(var C_NPC npc, var int instanceItem); 
 
// НПС npc использует предмет instanceItem.
func void AI_UseItem(var C_NPC npc, var int instanceItem); 
 
// НПС npc использует предмет instanceItem до указанного состояния state (-1 – используется полностью).
func void AI_UseItemToState(var C_NPC npc, var int instanceItem, var int state); 
 
// НПС npc берет (принимает) MOB (рюкзак, корзину и т.д.) с именем mobName.
func void AI_TakeMob(var C_NPC npc, var string mobName); 
 
// НПС npc выбрасывает на землю или на пол имеющийся MOB.
func void AI_DropMob(var C_NPC npc); 
 
// НПС npc использует MOB с именем mobName до указанного состояния state. 
// Если указанное состояние у MOBа уже имеется, НПС npc приближается к нему, но ничего не делает.
func int AI_UseMob(var C_NPC npc, var string mobName, var int state); 
 
// НПС npc переводится на msec миллисекунд в состояние ожидания, 
// в этом состоянии он не делает ничего, но наносимый ущерб регистрируется и работает пассивное восприятие.
func void AI_Waitms(var C_NPC npc, var int msec); 
 
// НПС npc может увидеть НПС other, где see – какая-то функция (описания не нашел)
func void AI_CanSeeNpc(var C_NPC npc, var C_NPC other, var func see); 
 
// установить режим передвижения moveMode для НПС npc. 
// Определены следующие режимы: 
// NPC_RUN – бег, 
// NPC_WALK – ходьба шагом, 
// NPC_SNEAK – подкрадывание, 
// NPC_RUN_WEAPON – бег с оружием, 
// NPC_WALK_WEAPON – ходьба с оружием, 
// NPC_SNEAK_WEAPON – подкрадывание с оружием.
func void AI_SetWalkmode(var C_NPC npc, var int moveMode); 
 
// НПС npc перемещается в указанную WP waypoint.
func void AI_GotoWP(var C_NPC npc, var string waypoint); 
 
// НПС npc перемещается в указанную FP freepoint, расположенную в пределах 20 метров. 
// Критерий поиска FP аналогичен используемому в функции Wld_IsFPAvailable.
func void AI_GotoFP(var C_NPC npc, var string freepoint); 
 
// работает аналогично предыдущей функции, 
// только критерий поиска FP аналогичен используемому в функции Wld_IsNextFPAvailable.
func void AI_GotoNextFP(var C_NPC npc, var string freepoint); 
 
// НПС npc перемещается к НПС other.
func void AI_GotoNpc(var C_NPC npc, var C_NPC other); 
 
// НПС npc перемещается к предмету item.
func void AI_GotoItem(var C_NPC npc, var C_ITEM item); 
 
// НПС npc перемещается к источнику звука.
func void AI_GotoSound(var C_NPC npc); 
 
// телепортирует НПС npc в новую локацию waypoint.
func void AI_Teleport(var C_NPC npc, var string waypoint); 
 
// НПС npc поварачивается к НПС other лицом.
func void AI_TurnToNpc(var C_NPC npc, var C_NPC other); 
 
// НПС npc поварачивается к НПС other спиной.
func void AI_TurnAway(var C_NPC npc, var C_NPC other); 
 
// НПС npc быстро поварачивается к НПС other лицом. (Делает оборот).
func void AI_WhirlAround(var C_NPC npc, var C_NPC other); 
 
// НПС npc быстро поворачивается лицом к какому-то источнику.
func void AI_WhirlAroundToSource(var C_NPC npc); 
 
// НПС npc поварачивается лицом к источнику звука.
func void AI_TurnToSound(var C_NPC npc); 
 
// НПС npc выравнивается в WP точке по направлению стрелки, заданной в Spacer.
func void AI_AlignToWP(var C_NPC npc); 
 
// НПС npc выравнивается в FP точке по направлению стрелки, заданной в Spacer.
func void AI_AlignToFP(var C_NPC npc); 
 
// НПС npc отклоняется назад. (Способ защиты при атаке противника).
func void AI_Dodge(var C_NPC npc); 
 
// для НПС npc проигрывается анимация ani для определенного состояния тела state. 
func void AI_PlayAniBS(var C_NPC npc, var string ani, var int state); 
 
// для НПС npc проигрывается Cutscene с именем csName, заданная в скриптах.
func void AI_PlayCutscene(var C_NPC npc, var string csName); 
 
// НПС npc вытаскивает оружие, которым экипирован.
func void AI_DrawWeapon(var C_NPC npc); 
 
// НПС npc прячет оружие.
func void AI_RemoveWeapon(var C_NPC npc); 
 
// НПС npc готовит оружие ближнего радиуса поражения к бою.
func void AI_ReadyMeleeWeapon(var C_NPC npc); 
 
// НПС npc готовит оружие дальнего радиуса поражения к бою.
func void AI_ReadyRangedWeapon(var C_NPC npc); 
 
// НПС npc начинает сражение (эта функция должна вызываться внутри ZS_Attack_Loop). 
// Атакуется внутренняя цель, которая была задана функцией Npc_SetTarget или Npc_GetNextTarget.
func void AI_Attack(var C_NPC npc); 
 
// НПС npc убивает НПС other (завершающее движение мечом).
func void AI_FinishingMove(var C_NPC npc, var C_NPC other); 
 
// НПС npc парирует удар противника (защищается). Выполняется только во время атаки противника.
func void AI_Defend(var C_NPC npc); 
 
// НПС npc убегает от противника (эта функция должна вызываться внутри ZS_Loop). 
// Предварительно функцией Npc_SetTarget должна быть установлена внутренняя цель, 
// от которой НПС npc должен убежать.
func void AI_Flee(var C_NPC npc); 
 
// НПС npc целится из оружия дальнего радиуса поражения в НПС target.
func void AI_AimAt(var C_NPC npc, var C_NPC target); 
 
// НПС npc прекращает целиться из оружия дальнего радиуса поражения.
func void AI_StopAim(var C_NPC npc); 
 
// НПС npc стреляет из оружия дальнего радиуса поражения в НПС target.
func void AI_ShootAt(var C_NPC npc, var C_NPC target); 
 
// реакция НПС npc на повреждение во время боя.
func void AI_CombatReactToDamage(var C_NPC npc); 
 
// функция показывает определенный предмет instanceItem, который имеется у НПС npc. 
func void AI_LookForItem(var C_NPC npc, var int instanceItem); 
 
// в инвентаре НПС npc ищется самое лучшее оружие ближнего радиуса поражения и вешается на пояс или спину.
func void AI_EquipBestMeleeWeapon(var C_NPC npc); 
 
// в инвентаре НПС npc ищется самое лучшее оружие дальнего радиуса поражения и вешается на спину.
func void AI_EquipBestRangedWeapon(var C_NPC npc); 
 
// в инвентаре НПС npc ищутся и одеваются самые лучшие доспехи.
func void AI_EquipBestArmor(var C_NPC npc); 
 
// все экипированное оружие НПС npc убирается в инвентарь.
func void AI_UnequipWeapons(var C_NPC npc); 
 
// одетые доспехи НПС npc убираются в инвентарь.
func void AI_UnequipArmor(var C_NPC npc); 
 
// НПС npc одевает доспехи instanceItem, которые должны находиться в его инвентаре.
func void AI_EquipArmor(var C_NPC npc, var int instanceItem); 
 
// НПС npc берет в руку заклинание spell с кол-вом инвестированной маны investMana.
func void AI_ReadySpell(var C_NPC npc, var int spell, var int investMana); 
 
// НПС npc прячет в инвентарь заклинание, которое имеет в руке.
func void AI_UnreadySpell(var C_NPC npc); 
 
// данная функция реализует диалог, 
// НПС npc говорит фразу nameWAV (имя .wav файла) для НПС target. 
// Текст фразы должен располагаться в скриптах в виде комментария к функции. 
// (например: AI_Output() //текст фразы).
func void AI_Output(var C_NPC npc, var C_NPC target, var string nameWAV); 
 
// данная функция реализует SVM (Standart Voice Module) диалог, 
// НПС npc говорит фразу nameSVM для НПС target. 
// Текст фразы должен располагаться в скриптах в файле svm.d (в одном из соответствующих SVM_ модулей) 
// в виде комментария к строке с именем nameSVM. (например: StopMagic = nameSVM; //текст фразы).
func void AI_OutputSVM(var C_NPC npc, var C_NPC target, var string nameSVM); 
 
// выполняется аналогично предыдущей функции, фраза выдается быстро, 
// нет ожидания при разговоре следующей AI_ команды. 
// Используется для комментариев перед сражением и во время сражения.
func void AI_OutputSVM_Overlay(var C_NPC npc, var C_NPC target, var string nameSVM); 
 
// выводит на экран строку текста text (имя шрифта – font) 
// с координатами x, y (диапазон от 0 до 99% размера экрана, 
// -1 означает вывод по центру соответствующей оси экрана) на время timeSec (в секундах).
func int AI_PrintScreen(var string text, var int x, var int y, var string font, var int timeSec); 
 
// НПС npc ждет от НПС other ответа на свою фразу. 
// (Не выполняется перед функцией AI_OutputSVM_Overlay).
func void AI_WaitTillEnd(var C_NPC npc, var C_NPC other); 
 
// определяет, как НПС npc будет отвечать на сказанную фразу, 
// при выборе ответа «Да» - выполняется функция answerYes, иначе – функция answerNo. 
// Эти функции должны быть описаны заранее.
func void AI_Ask(var C_NPC npc, var func answerYes, var func answerNo); 
 
// работает аналогично предыдущей функции, 
// только для вариантов ответов (кроме функций) могут быть заданы фразы ответов textYes, textNo.
func void AI_AskText(var C_NPC npc, var func answerYes, var func answerNo, var string textYes, var string textNo); 
 
// НПС npc ждет ответа или вопроса в течение 20 секунд, 
// если в это время он поступает, то выполняется функция action.
func void AI_WaitForQuestion(var C_NPC npc, var func action); 
 
// эта функция запускает диалог для НПС npc с возможностью выбора вариантов ответов/вопросов.
func void AI_ProcessInfos(var C_NPC npc); 
 
// режим диалога НПС npc, начатый предыдущей функцией, заканчивается.
func void AI_StopProcessInfos(var C_NPC npc); 
 
// переводит НПС npc в соответствующее состояние, описанное функцией state, 
// где behaviour = 0 – переход в новое состояние осуществляется немедленно, 
// 1 – переход в новое состояние осуществляется после полного завершения текущего состояния, 
// waypoint – имя WP точки смены состояния (если "", то состояние изменяется на месте расположения НПС).
func void AI_StartState(var C_NPC npc, var func state, var int behaviour, var string waypoint); 
 
// переводит всех НПС, находящихся от НПС npc на расстоянии radius сантиметров, 
// в соответствующее состояние, описанное функцией state.
func void AI_SetNpcsToState(var C_NPC npc, var func state, var int radius); 
 
// продолжает выполнение распорядка дня НПС npc.
func void AI_ContinueRoutine(var C_NPC npc); 
