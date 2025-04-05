
instance OrkParchmentOne(C_Item)
{
	name = "Половина пергамента";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 3;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Часть древнего пергамента.";
	text[1] = "Похоже, что нижняя часть была оторвана.";
	text[2] = "Письмена напоминают руны на стенах";
	text[3] = "пещеры.";
};

instance OrkParchmentTwo(C_Item)
{
	name = "Половина пергамента";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 3;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Часть древнего пергамента.";
	text[1] = "Похоже, что верхняя часть была оторвана.";
	text[2] = "Письмена напоминают руны на стенах";
	text[3] = "пещеры.";
};

instance ITKE_PSI_KALOM_01(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = "Ключ к лаборатории";
	text[0] = "Открывает сундук в алхимической лаборатории";
	text[1] = "в Болотном Лагере.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrFocimap(C_Item)
{
	name = "Карта Сатураса к юнитору";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseFocimap;
	description = name;
	text[0] = "Вершины пентаграммы указывают расположение";
	text[1] = "всех пяти камней-юниторов, которые";
	text[2] = "использовались при создании барьера. Карта";
	text[3] = "старая, и не исключено, что камни могли";
	text[4] = "быть перенесены с тех пор";
	text[5] = "на другие места.";
};


func void UseFocimap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_Foki.tga",1);
	Doc_Show(nDocID);
};


instance ItWr_Troll_01(C_Item)
{
	name = "Страница дневника";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTroll;
	description = name;
	text[1] = "Страница настолько истерта, что буквы";
	text[2] = "едва различимы.";
	text[3] = "Судя по всему, автор был ";
	text[4] = "охотником на троллей.";
};


func void UseTroll()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"День 169");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я перепробовал все средства. Самая лучшая сталь не оставляет на тролле ни царапины, а стрелы попросту отскакивают, будто шкура у него из камня. Но сегодня я сделаю это. Я уверен. Боги благоволят ко мне. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я использую магический свиток, который купил в Хоринисе. Он обошелся мне в 50 монет, но как только я проверну это дельце, расходы с лихвой окупятся.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Сегодня я убью тролля.");
	Doc_Show(nDocID);
};


instance Focus_2(C_Item)
{
	name = "Юнитор из каньона тролля";
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

instance ItKe_BERG_01(C_Item)
{
	name = "Ключ к сундуку";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Старый форт.";
	text[1] = "Старый и ржавый ключ";
	text[2] = "к сундуку.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Urkunde_01(C_Item)
{
	name = "Сертификат";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseUrkunde;
	description = "Право собственности";
	text[0] = "Предъявитель этого документа";
	text[1] = "может заявить о своих правах";
	text[2] = "на форт и прилегающие области.";
	text[5] = "Стоимость                               400 золотых монет";
};


func void UseUrkunde()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"Сертификат");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я, Бергмар, граф Западных Полей, властью, врученной мне лордом Тиморизина, что вокруг Хориниса, заявляю ... что я ... отдать и продать ... предъявителю сего документа ... и дому Инноса горный форт (вкупе с положенной мне десятиной и доходами от тамошних шахт) за 400 единиц золота.");
	Doc_Show(nDocID);
};


instance Fakescroll(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Focus_3(C_Item)
{
	name = "Юнитор из горного форта";
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

instance ItKe_Focus4(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Это ключ из пещеры, расположенной";
	text[2] = "неподалеку от руин монастыря.";
};

instance Focus_4(C_Item)
{
	name = "Юнитор из разрушенного монастыря";
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

instance ItMi_OrcTalisman(C_Item)
{
	name = "Орочий талисман";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Amulet_UluMulu_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_OrcTalisman;
	on_unequip = UnEquip_OrcTalisman;
	description = name;
	text[2] = NAME_Prot_Fire;
	count[2] = 20;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_OrcTalisman()
{
	self.protection[PROT_FIRE] += 20;
};

func void UnEquip_OrcTalisman()
{
	self.protection[PROT_FIRE] -= 20;
};


instance ItKe_Focus5(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Это ключ из склепа";
	text[2] = "под кольцом камней.";
};

instance Focus_5(C_Item)
{
	name = "Юнитор из-под кольца камней";
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

