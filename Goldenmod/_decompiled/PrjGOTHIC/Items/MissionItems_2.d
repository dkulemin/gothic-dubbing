
instance ItWrFocusmapPsi(C_Item)
{
	name = "Карта Ю'Бериона к юнитору";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseFocusmapPsi;
	description = name;
	text[1] = "Эта карта показывает путь к юнитору, ";
	text[2] = "который нужен Ю'Бериону для вызова";
	text[3] = "Спящего.";
};


func void UseFocusmapPsi()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_FocusPSI.tga",1);
	Doc_Show(nDocID);
};


instance Focus_1(C_Item)
{
	name = "Юнитор со скалы у океана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Один из пяти юниторов, использовавшихся";
	text[2] = "для создания магического барьера.";
};

instance ItMi_Stuff_Gearwheel_01(C_Item)
{
	name = "Шестеренка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Gearwheel_01.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItAt_Crawlerqueen(C_Item)
{
	name = "Яйцо ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItAt_Crawlerqueen.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Такие яйца откладывает королева";
	text[1] = "ползунов.";
	text[2] = "В них содержится то же вещество, что и в ";
	text[3] = "челюстях ползунов, но концентрация его выше.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrFokusbuch(C_Item)
{
	name = "Альманах";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseItWrFokusbuch;
	description = name;
	text[0] = "Эта старинная книга содержит магические";
	text[1] = "формулы, относящиеся к использованию";
	text[2] = "так называемых камней-юниторов.";
};


func void UseItWrFokusbuch()
{
	var int nDocID;
	if((Wissen_Almanach == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		Wissen_Almanach = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Глава 23");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"Фокусирование сил");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Силы продолжают накапливаться в камне, до тех пор пока слова мага не освободят их. Будет ли это продолжительное действие или единый, мощный выброс - решать магу.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Но после того как силы высвобождены, юнитор становится всего лишь пустой скорлупой.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Сами слова, освобождающие силу юнитора, ныне доступны многим. К сожалению, даже наука наделения нового артефакта магической силой в наши времена стала скорее ремеслом, нежели секретным знанием.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Но вот то, как снова зарядить юниторы - этот секрет по-прежнему знают лишь единицы. Эта древняя формула служит знаком, отличающим истинных магов.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"А теперь, о ищущий знаний, открой свой разум для слов древней силы.");
	Doc_Show(nDocID);
};

