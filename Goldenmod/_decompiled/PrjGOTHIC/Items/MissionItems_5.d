
instance ItWrTemplemap(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTemplemap;
	description = "Набросок храма";
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseTemplemap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Temple.tga",1);
	Doc_Show(nDocID);
};


instance ItMiAlarmhorn(C_Item)
{
	name = "Рог";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 9;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_WOOD;
	scemeName = "HORN";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Idol_Sleeper_01(C_Item)
{
	name = "Статуэтка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "Статуэтка представляет некое создание";
	text[1] = "в маске.";
	text[2] = "Маска окружена шестью большими жалами.";
};

instance Weltenspalter(C_Item)
{
	name = "Раскалывающий миры";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Этот меч принадлежал бессмертному высшему";
	text[1] = "священнику Варраг-Хашору.";
	text[2] = "Очевидно, что как оружие этот меч явно";
	text[3] = "бесполезен.";
	text[4] = "Возможно, его можно использовать для";
	text[5] = "других целей.";
};

instance Lichtbringer(C_Item)
{
	name = "Клинок света";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Этот меч принадлежал бессмертному высшему";
	text[1] = "священнику Варраг-Касоргу.";
	text[2] = "Очевидно, что как оружие этот меч явно";
	text[3] = "бесполезен.";
	text[4] = "Возможно, его можно использовать для";
	text[5] = "других целей.";
};

instance Zeitenklinge(C_Item)
{
	name = "Клинок времен";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Этот меч принадлежал бессмертному высшему";
	text[1] = "священнику Варраг-Унхилькту.";
	text[2] = "Очевидно, что как оружие этот меч явно";
	text[3] = "бесполезен.";
	text[4] = "Возможно, его можно использовать для";
	text[5] = "других целей.";
};

instance Daemonenstreich(C_Item)
{
	name = "Удар демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Этот меч принадлежал бессмертному высшему";
	text[1] = "священнику Варраг-Руушку.";
	text[2] = "Очевидно, что как оружие этот меч явно";
	text[3] = "бесполезен.";
	text[4] = "Возможно, его можно использовать для";
	text[5] = "других целей.";
};

instance Bannklinge(C_Item)
{
	name = "Клинок наказания";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Этот меч принадлежал бессмертному высшему";
	text[1] = "священнику орков Граш-Варраг-Арушату.";
	text[2] = "Очевидно, что как оружие этот меч явно";
	text[3] = "бесполезен.";
	text[4] = "Возможно, его можно использовать для";
	text[5] = "других целей.";
};

instance Mythrilklinge(C_Item)
{
	name = "Странный меч";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Меч восхитительного качества.";
	text[1] = "Клинок покрыт древними рунами.";
	text[2] = "Может быть, Ксардас и сможет их прочитать.";
	text[3] = "В любом случае до той поры мне не стоит";
	text[4] = "его использовать.";
};

instance Mythrilklinge01(C_Item)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Ксардас сказал, что меч носит имя УРИЗЕЛЬ и";
	text[1] = "он очень древний. Много лет назад он обладал";
	text[2] = "огромной силой, но магия ушла.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge02(C_Item)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_FIRE] = 30;
	damage[DAM_INDEX_MAGIC] = 120;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_02.3DS";
	description = name;
	text[0] = "Это меч Уризель.";
	text[1] = "В нем заключена магическая сила.";
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dam_Fire;
	count[3] = damage[DAM_INDEX_FIRE];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge03(C_Item)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Магический камень был удален из него. Это не";
	text[1] = "мешает Уризелю оставаться отличным оружием,";
	text[2] = "но магия его ушла.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Scroll4Milten(C_Item)
{
	name = "Передача силы";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWrScroll.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Заклинание для передачи";
	text[1] = "силы в Уризель.";
	text[2] = "Я не могу использовать его.";
};

instance ItKe_SunkenTower(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает двери в затопленной";
	text[1] = "башне.";
};

instance DungeonKey(C_Item)
{
	name = "Ключ к подземелью";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает подземелья";
	text[0] = "в Старом Лагере.";
};

instance UrizielRune(C_Item)
{
	name = "Волна Смерти УРИЗЕЛЯ";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItAr_Rune_14.3ds";
	material = MAT_STONE;
	spell = SPL_MASSDEATH;
	mag_circle = 6;
	description = name;
	text[0] = "Эта мощная магическая руна содержит";
	text[1] = "древнюю силу меча УРИЗЕЛЬ.";
	text[2] = NAME_Mag_Circle;
	count[2] = mag_circle;
	text[3] = NAME_Manakosten;
	count[3] = SPL_SENDCAST_MASSDEATH;
	text[4] = NAME_Dam_Magic;
	count[4] = SPL_DAMAGE_MASSDEATH;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITWR_OLD_FIRE_LETTER_01(C_Item)
{
	name = "Запечатанное письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = useoldfireletter;
	scemeName = "MAPSEALED";
	description = "Магическая обстановка в долине";
	text[1] = "Печать не срывать!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void useoldfireletter()
{
	var int nDocID;
	CreateInvItem(hero,itwr_old_fire_letter_02);
	B_GiveXP(100);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Мастер Корристо,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Мы очень обеспокоены магическими возмущениями, которые происходят в последнее время. Вполне возможно, что на состояние барьера изнутри влияет какая-то сильная магия.");
	Doc_PrintLines(nDocID,0,"Надеюсь, вы сможете найти источник этой магии.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Таламон");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_OLD_FIRE_LETTER_02(C_Item)
{
	name = "Открытое письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useoldfireletter2;
	scemeName = "MAP";
	description = "Магическая обстановка в долине";
	text[5] = NAME_Value;
	count[5] = value;
};


func void useoldfireletter2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Мастер Корристо,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Мы очень обеспокоены магическими возмущениями, которые происходят в последнее время. Вполне возможно, что на состояние барьера изнутри влияет какая-то сильная магия.");
	Doc_PrintLines(nDocID,0,"Надеюсь, вы сможете найти источник этой магии.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Таламон");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LIST_FIRE_LETTER(C_Item)
{
	name = "Список";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = uselistfireletter;
	scemeName = "MAP";
	description = "Список вещей для магов";
	text[5] = NAME_Value;
	count[5] = value;
};


func void uselistfireletter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLines(nDocID,0,"...вещи прилагаем к письму. Надеемся, все в полной целостности доберется до вас.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"100 лечебных зелий");
	Doc_PrintLine(nDocID,0,"25 (и ни камнем меньше!) рунных камней");
	Doc_PrintLine(nDocID,0,"5 амулеты магической силы");
	Doc_PrintLine(nDocID,0,"2 эликсиры ловкости");
	Doc_PrintLines(nDocID,0,"1 руна страха (передать магам воды, по просьбе Риордана)");
	Doc_PrintLine(nDocID,0,"10 банок со смолой");
	Doc_PrintLine(nDocID,0,"5 мензурок со спиртом");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Мардук");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_RAVEN_FIRE_LETTER(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useravenfireletter;
	scemeName = "MAP";
	description = "Приказы";
	text[5] = NAME_Value;
	count[5] = value;
};


func void useravenfireletter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Буллит!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Это большая удача, что нам удалось перехватить груз для магов!");
	Doc_PrintLines(nDocID,0,"По приказу Гомеза, все конфискованные вещи подлежат следующим действиям: лечебные зелья должны поступить на склад, в качестве резерва, для стражи. Рунные камни, в обмен на 10000 кусков руды и два ящика болотной травы передать в руки Кор Галома. Амулеты раздать, в качестве поощрения, соратникам баронов. Смолу отправить на склад, на запас. Спирт передать поварам, на хорошую выпивку.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ворон");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

