
instance DIA_BaalNamib_EXIT(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 999;
	condition = DIA_BaalNamib_EXIT_Condition;
	information = DIA_BaalNamib_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalNamib_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalNamib_NoTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_NoTalk_Condition;
	information = DIA_BaalNamib_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalNamib_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalNamib_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalNamib_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalNamib_NoTalk);
	Info_AddChoice(DIA_BaalNamib_NoTalk,DIALOG_ENDE,DIA_BaalNamib_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Все в порядке, приятель?",DIA_BaalNamib_NoTalk_Imp);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Да пребудет с тобой Спящий!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Привет! Я здесь новенький.",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Привет! Я здесь новенький!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//(вздох)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//(вздох)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Все в порядке, приятель?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//(вздох)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalNamib_FirstTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_FirstTalk_Condition;
	information = DIA_BaalNamib_FirstTalk_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalNamib_FirstTalk_Condition()
{
	if(BaalNamib_Ansprechbar == TRUE)
	{
		return 1;
	};
};

func void DIA_BaalNamib_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00");	//(вздох)
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01");	//Спящий избрал тебя. Ты и в самом деле хочешь присоединиться к нам?
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"НИЧЕГО НЕ ГОВОРИ.",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Да, я хочу стать последователем Спящего.",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Mute_15_00");	//(вздох)
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01");	//Ну?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00");	//Да, я хочу стать последователем Спящего.
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01");	//Иди к Кор Галому. Скажи ему, что я считаю тебя истинно верующим!
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	B_LogEntry(CH1_JoinPsi,"Задумка Лестера сработала. Идол Намиб поговорил со мной: он уверен, что я истинный последователь. Теперь надо увидеться с Гуру Кор Галомом в его лаборатории.");
	B_GiveXP(XP_ImpressBaalNamib);
};


instance GUR_1204_BaalNamib_ARMOR(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = GUR_1204_BaalNamib_ARMOR_Condition;
	information = GUR_1204_BaalNamib_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Мне нужны доспехи получше.";
};


func int GUR_1204_BaalNamib_ARMOR_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) && !Npc_HasItems(hero,nov_armor_h))
	{
		return TRUE;
	};
};

func void GUR_1204_BaalNamib_ARMOR_Info()
{
	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");	//Мне нужны доспехи получше.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");	//Тебе еще рано носить тяжелые доспехи послушника.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_NOV_ARMOR_H)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Возвращайся, когда соберешь достаточно руды.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Эти доспехи защитят тело твое, так же как Спящий защищает твою душу!
		CreateInvItem(self,nov_armor_h);
		B_GiveInvItems(self,hero,nov_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NOV_ARMOR_H);
	};
};


instance Info_BaalNamib_BROTHERHOOD(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = Info_BaalNamib_BROTHERHOOD_Condition;
	information = Info_BaalNamib_BROTHERHOOD_Info;
	important = 0;
	permanent = 0;
	description = "Могу ли я что-нибудь сделать для Братства?";
};


func int Info_BaalNamib_BROTHERHOOD_Condition()
{
	if((other.guild == GIL_NOV) && !Npc_KnowsInfo(other,DIA_YBerion_Kennen) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void Info_BaalNamib_BROTHERHOOD_Info()
{
	var C_Npc Kalom;
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_15_01");	//Могу ли я что-нибудь сделать для Братства?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_02_02");	//Нашему Мастеру, мудрейшему Ю'Бериону, нужен послушник. Иди к нему и предложи свои услуги.
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Хорошо, я отправлюсь к нему прямо сейчас.",Info_BaalNamib_BROTHERHOOD_OK);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Где я могу найти Ю'Бериона?",Info_BaalNamib_BROTHERHOOD_YBWO);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Не знаешь ли ты, какое поручение даст мне  Ю'Берион?",Info_BaalNamib_BROTHERHOOD_YBWAS);
	Kalom = Hlp_GetNpc(GUR_1201_CorKalom);
	Npc_ExchangeRoutine(Kalom,"kapitel2");
	AI_ContinueRoutine(Kalom);
};

func void Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01");	//Где я могу найти Ю'Бериона?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02");	//Холм. Как и всегда, впрочем.
};

func void Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01");	//Не знаешь ли ты, какое поручение даст мне  Ю'Берион?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02");	//Все мы ждем Великой Церемонии. Но прежде чем она начнется, нам потребуется магический артефакт.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03");	//Ю'Берион ищет храбреца, который найдет его.
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04");	//Ну, это просто.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05");	//Если бы это было так просто, артефакт был бы уже у нас. Прежде поговори с Ю'Берионом. Он тебе все объяснит.
};

func void Info_BaalNamib_BROTHERHOOD_OK()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_OK_15_01");	//Я обращусь к нему немедленно.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_OK_02_02");	//Да хранит тебя Спящий!
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
};


instance INFO_BAALNAMIB_NOV_AWAY(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_nov_away_condition;
	information = info_baalnamib_nov_away_info;
	important = 0;
	permanent = 0;
	description = "(спросить про украденные артефакты)";
};


func int info_baalnamib_nov_away_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_nov_away) && !Npc_KnowsInfo(hero,nov_9000_escaped_amulette) && Hlp_StrCmp(Npc_GetNearestWP(self),"PSI_PATH_1"))
	{
		return 1;
	};
};

func void info_baalnamib_nov_away_info()
{
	AI_Output(other,self,"SLD_9200_Soeldner_ABANDONEDMINE_15_00");	//Здесь не происходило ничего необычного?
	AI_Output(self,other,"Info_BaalNamib_NOV_AWAY_02_02");	//Прошедшей ночью я заметил двоих послушников, пробирающихся через болото в сторону Старого лагеря.
	B_GiveXP(150);
	B_LogEntry(CH4_YBERION_AMULETTE,"Послушники бежали через болото по направлению к Старому лагерю.");
};

