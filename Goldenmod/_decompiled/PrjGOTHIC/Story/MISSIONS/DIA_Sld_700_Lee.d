
instance Sld_700_Lee_Exit(C_Info)
{
	npc = Sld_700_Lee;
	nr = 999;
	condition = Sld_700_Lee_Exit_Condition;
	information = Sld_700_Lee_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

func void Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Sld_700_Lee_Greet(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Greet_Condition;
	information = Sld_700_Lee_Greet_Info;
	permanent = 0;
	description = "Ты командуешь наемниками, верно?";
};


func int Sld_700_Lee_Greet_Condition()
{
	return 1;
};

func void Sld_700_Lee_Greet_Info()
{
	AI_Output(other,self,"DIA_Lee_Greet_15_00");	//Ты командуешь наемниками, верно?
	AI_Output(self,other,"DIA_Lee_Greet_08_01");	//Верно, парень!
};


instance Sld_700_Lee_Define(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Define_Condition;
	information = Sld_700_Lee_Define_Info;
	permanent = 0;
	description = "Чем занимаются наемники на службе у магов?";
};


func int Sld_700_Lee_Define_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

func void Sld_700_Lee_Define_Info()
{
	AI_Output(other,self,"DIA_Lee_Define_15_00");	//Чем занимаются наемники на службе у магов?
	AI_Output(self,other,"DIA_Lee_Define_08_01");	//Все очень просто. Наша задача: охранять руду и защищать магов.
	AI_Output(self,other,"DIA_Lee_Define_08_02");	//Иногда маги дают кому-то из наших особое задание.
};


instance Sld_700_Lee_Mitmachen(C_Info)
{
	npc = Sld_700_Lee;
	nr = 2;
	condition = Sld_700_Lee_Mitmachen_Condition;
	information = Sld_700_Lee_Mitmachen_Info;
	permanent = 0;
	description = "Я хочу присоединиться к вам!";
};


func int Sld_700_Lee_Mitmachen_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_Greet) && (Npc_GetTrueGuild(hero) == GIL_None) && (oldHeroGuild == 0))
	{
		return 1;
	};
};

func void Sld_700_Lee_Mitmachen_Info()
{
	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01");	//Наглости тебе не занимать? Ты что же, думаешь, я принимаю любого, кто об этом попросит?
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02");	//Поживи в Лагере, а там посмотрим. Я буду приглядывать за тобой!
};


var int Lee_SldPossible;

instance Sld_700_Lee_NowReady(C_Info)
{
	npc = Sld_700_Lee;
	nr = 700;
	condition = Sld_700_Lee_NowReady_Condition;
	information = Sld_700_Lee_NowReady_Info;
	permanent = 1;
	description = "Я хочу стать наемником на службе у магов.";
};


func int Sld_700_Lee_NowReady_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Lee_SldPossible == FALSE) && (Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10)))
	{
		return 1;
	};
};

func void Sld_700_Lee_NowReady_Info()
{
	AI_Output(other,self,"DIA_Lee_NowReady_15_00");	//Я хочу стать наемником на службе у магов. Теперь ты готов принять меня?
	if(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01");	//То, что ты сделал для людей в Старой Шахте, говорит само за себя.
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02");	//Я с радостью позволю тебе присоединиться к нам.
		if(hero.level < 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03");	//Ты еще не готов стать наемником. Тебе нужно набраться опыта.
			AI_StopProcessInfos(self);
			B_PrintGuildCondition(10);
		}
		else if(hero.level >= 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//Я дам тебе шанс. Что скажешь?
			Lee_SldPossible = TRUE;
		};
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"DIA_Lee_NowReady_08_01");	//У тебя еще недостаточно опыта. Совершенствуй свои навыки.
		B_PrintGuildCondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//Я дам тебе шанс. Что скажешь?
		Lee_SldPossible = TRUE;
	};
};


instance Sld_700_Lee_BECOMESLDNOW(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_BECOMESLDNOW_Condition;
	information = Sld_700_Lee_BECOMESLDNOW_Info;
	important = 0;
	permanent = 0;
	description = "Я хочу стать наемником.";
};


func int Sld_700_Lee_BECOMESLDNOW_Condition()
{
	if((Lee_SldPossible == TRUE) && (hero.level >= 10))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01");	//Я хочу стать наемником.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02");	//Правильный выбр. Ты об этом не пожалеешь.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03");	//Ответь мне вот на какой вопрос. Почему ты решил присоединиться к нам, а не к Старому Лагерю или к Лагерю Братства?
	Log_CreateTopic(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry(GE_BecomeMercenary,"Ли позволил мне присоединиться к наемникам.");
	Info_ClearChoices(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Другие Лагеря того не стоят.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Я с самого начала жаждал свободы.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Просто так получилось.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};

func void Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01");	//Другие Лагеря ничего не стоят.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02");	//Единственное, что хоть чего-то здесь стоит - это надежда на свободу. Добро пожаловать в наши ряды, НАЕМНИК!
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMds(hero,"Humans_Relaxed.mds");
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01");	//Я с самого начала жаждал свободы.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02");	//Мы отвоюем ее. Добро пожаловать в наши ряды, НАЕМНИК!
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMds(hero,"Humans_Relaxed.mds");
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01");	//Просто так сложилось.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02");	//Надеюсь, что мы не застрянем здесь навечно. Добро пожаловать в наши ряды, НАЕМНИК!
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMds(hero,"Humans_Relaxed.mds");
	AI_StopProcessInfos(self);
};


instance Sld_700_Lee_DAMNPAST(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_DAMNPAST_Condition;
	information = Sld_700_Lee_DAMNPAST_Info;
	important = 1;
	permanent = 0;
};


func int Sld_700_Lee_DAMNPAST_Condition()
{
	if((Saturas_BringFoci == 5) && (Npc_GetDistToNpc(hero,self) < 1000) && (Npc_GetDistToWP(self,"NC_DAM") < 1000))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_DAMNPAST_Info()
{
	var C_Npc Homer;
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01");	//Были времена, когда жизнь моя была совсем другой.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02");	//Я был одним из лучших генералов в стране.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03");	//Всю свою жизнь я сражался за свою страну.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04");	//Король прислушивался к моим советам, и за это знать не любила меня. Они понимали, что я представляю угрозу для их грязных делишек.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05");	//Я недооценил их вероломства. Для того, чтобы уничтожить меня, они посмели поднять руку на жену короля.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06");	//Я был обвинен в убийстве, и у Робара просто не оставалось выбора.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07");	//То, что я сделал на благо страны, спасло меня от виселицы. Но они украли у меня свободу.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08");	//Настанет день, когда я скину оковы. Тогда я вернусь и отомщу своим врагам.
	AI_AlignToWP(self);
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09");	//Я отомщу.
	Npc_ExchangeRoutine(self,"START");
	Homer = Hlp_GetNpc(BAU_935_Homer);
	Npc_ExchangeRoutine(Homer,"START");
	AI_ContinueRoutine(Homer);
};


instance Sld_700_Lee_FMTaken(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_FMTaken_Condition;
	information = Sld_700_Lee_FMTaken_Info;
	permanent = 1;
	description = "Что ты думаешь по поводу шахты?";
};


func int Sld_700_Lee_FMTaken_Condition()
{
	if(FMTaken)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_FMTaken_Info()
{
	AI_Output(other,self,"DIA_Lee_FMTaken_15_00");	//Что ты думаешь по поводу шахты?
	if(Lee_freeminereport == 0)
	{
		AI_Output(self,other,"DIA_Lee_FMTaken_08_01");	//Они зашли слишком далеко и еще пожалеют об этом.
	}
	else
	{
		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01");	//Больше они не будут угрозой!
		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//Ты многое сделал для нашего Лагеря. Мне нужны такие люди, как ты.
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Спасибо. Я пойду.
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//Минуту!
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//Прими эту магическую руну в знак благодарности за твои добрые дела.
		AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//Благодарю тебя!
		AI_Output(hero,self,"Info_Exit_Info_15_01");	//Увидимся.
		B_LogEntry(CH4_BannedFromOC,"Я проинформировал Ли о операции по зачистке Свободной Шахты, которую мы провернули с Горном. Ли остался очень доволен.");
		B_GiveInvItems(self,other,ItArRuneFirestorm,1);
		B_GiveXP(500);
		Lee_freeminereport = 0;
	};
};


instance Sld_700_Lee_CHANGESIDE(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_CHANGESIDE_Condition;
	information = Sld_700_Lee_CHANGESIDE_Info;
	important = 0;
	permanent = 0;
	description = "Меня выгнали из Старого Лагеря и я хочу присоединиться к вам!";
};


func int Sld_700_Lee_CHANGESIDE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01");	//Меня выгнали из Старого Лагеря и я хочу присоединиться к вам!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//Ты многое сделал для нашего Лагеря. Мне нужны такие люди, как ты.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03");	//Буду краток. Добро пожаловать в Новый Лагерь, НАЕМНИК!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04");	//Возьми эти доспехи. Я рад, что ты теперь с нами.
	CreateInvItem(self,sld_armor_m);
	B_GiveInvItems(self,hero,sld_armor_m,1);
	Npc_GetInvItemBySlot(hero,INV_ARMOR,2);
	if(Hlp_GetInstanceID(item) == sld_armor_m)
	{
		AI_EquipArmor(hero,item);
	};
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	B_LogEntry(CH4_BannedFromOC,"Я решил перейти на другую сторону. После того как Старый Лагерь меня изгнал, я присоединился к наемникам. Ну, а теперь время поговорить с Сатурасом.");
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Ли может научить меня сражаться двуручным оружием. Кроме того, он может помочь мне с тренировками силы и ловкости.");
};


instance Sld_700_Lee_ARMOR(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ARMOR_Condition;
	information = Sld_700_Lee_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Мне нужны хорошие доспехи.";
};


func int Sld_700_Lee_ARMOR_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ARMOR_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01");	//Мне нужны хорошие доспехи.
	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02");	//Ты прежде должен их заслужить. Не говоря уже о том, что хорошие доспехи стоят недешево.
	Info_ClearChoices(Sld_700_Lee_ARMOR);
	Info_AddChoice(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeMercs,VALUE_SLD_ARMOR_M),Sld_700_Lee_ARMOR_M);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeHeavyMercs,VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};

func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices(Sld_700_Lee_ARMOR);
};

func void Sld_700_Lee_ARMOR_M()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_M_Info_08_01");	//Мне нужны средние доспехи.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02");	//Для этого у тебя еще недостаточно опыта. Приходи позже.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_SLD_ARMOR_M)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03");	//Без руды ты его все равно не получишь.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04");	//Это добрые доспехи. Они надежно защитят тебя.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_SLD_ARMOR_M);
		CreateInvItem(hero,sld_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void Sld_700_Lee_ARMOR_H()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_H_Info_08_01");	//Мне нужны тяжелые доспехи.
	if(Kapitel < 4)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02");	//Для этого у тебя еще недостаточно опыта. Приходи позже.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_SLD_ARMOR_H)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03");	//Без руды ты его все равно не получишь.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04");	//Эти доспехи - лучшие из тех, что можно отыскать внутри Барьера. И поверь мне, они стоит каждого потраченного самородка.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_SLD_ARMOR_H);
		CreateInvItem(hero,sld_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};


instance Sld_700_Lee_Teach(C_Info)
{
	npc = Sld_700_Lee;
	nr = 10;
	condition = Sld_700_Lee_Teach_Condition;
	information = Sld_700_Lee_Teach_Info;
	permanent = 1;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int Sld_700_Lee_Teach_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00");	//Ты можешь чему-нибудь научить меня?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01");	//Я могу помочь тебе стать более сильным и ловким.
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	Info_ClearChoices(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};


instance Sld_700_Lee_ZWEIHAND1(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND1_Condition;
	information = Sld_700_Lee_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};


func int Sld_700_Lee_ZWEIHAND1_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && (Kapitel >= 4))))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01");	//Я хочу научиться владеть двуручным мечом.
	if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02");	//Хорошо, начнем с самого простого.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03");	//Держи меч горизонтально. Тебе понадобится большой замах, чтобы атаковать противника тяжелым оружием.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04");	//Подними руку и бей вертикально вниз. Обычно этого достаточно, чтобы избавиться от любого врага.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05");	//Используй инерцию движения, чтобы вернуться в исходную позицию.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06");	//Двуручный меч просто идеален для боковых ударов, чтобы держать противника на расстоянии.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07");	//Пожалуй, начнем с этого. Попробуй.
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
};


instance Sld_700_Lee_ZWEIHAND2(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND2_Condition;
	information = Sld_700_Lee_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0);
};


func int Sld_700_Lee_ZWEIHAND2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && (Kapitel >= 4))))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01");	//Я хочу больше узнать о двуручном мече.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02");	//Прежде всего, смени исходную стойку. Держи меч вертикально, возьмись за рукоять обеими руками и отведи его в сторону.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03");	//Теперь быстро отводи его вниз и делай замах от плеча. А теперь - рубящий удар вправо!
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04");	//У противника не будет ни единого шанса.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05");	//Из этого же положения можно нанести резкий колющий удар вперед, чтобы отогнать врага.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06");	//Развернись, чтобы придать мечу должный разгон, - и еще один рубящий удар!
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07");	//Если этого окажется недостаточно, меч по инерции легко вернется в исходное положение.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08");	//Закончив серию, переходи в блок и жди момента, чтобы атаковать снова.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09");	//Секрет успеха кроется в чередовании ударов и боевых стоек.
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
};


instance SLD_700_LEE_GORN_HELP(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = sld_700_lee_gorn_help_condition;
	information = sld_700_lee_gorn_help_info;
	permanent = 0;
	description = "Горну нужно подкрепление.";
};


func int sld_700_lee_gorn_help_condition()
{
	if(GORNHELP == TRUE)
	{
		return 1;
	};
};

func void sld_700_lee_gorn_help_info()
{
	var C_Npc soeldner_1;
	var C_Npc soeldner_2;
	AI_Output(other,self,"DIA_Lee_Gorn_Help_15_00");	//Мы выбили стражников из шахты. Теперь Горну нужно подкрепление.
	AI_Output(self,other,"DIA_Lee_Gorn_Help_08_01");	//Хорошо, я отправлю к шахте двух наемников.
	AI_Output(self,other,"DIA_Lee_Gorn_Help_08_02");	//Он может начинать поиск прохода.
	B_GiveXP(300);
	B_LogEntry(CH4_GORNHELP,"Ли пошлет к Горну двух наемников.");
	soeldner_1 = Hlp_GetNpc(SLD_705_Soeldner);
	soeldner_2 = Hlp_GetNpc(SLD_706_Soeldner);
	B_ExchangeRoutine(soeldner_1,"GornHelp");
	B_ExchangeRoutine(soeldner_2,"GornHelp");
};


instance SLD_700_LEE_GORN_PROHOD(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = sld_700_lee_gorn_prohod_condition;
	information = sld_700_lee_gorn_prohod_info;
	permanent = 0;
	description = "Мы нашли проход в горах.";
};


func int sld_700_lee_gorn_prohod_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_prohod_found))
	{
		return 1;
	};
};

func void sld_700_lee_gorn_prohod_info()
{
	var C_Npc gorn;
	AI_Output(other,self,"DIA_Lee_Gorn_Prohod_15_00");	//Мы с Горном нашли проход в горах у Свободной шахты. Он находится слева от выхода из небольшой пещеры.
	AI_Output(other,self,"DIA_Lee_Gorn_Prohod_15_01");	//Горн уверен, что стражники пришли оттуда.
	AI_Output(self,other,"DIA_Lee_Gorn_Prohod_08_01");	//Хорошо. Теперь мы знаем, откуда ожидать нападения.
	B_GiveXP(800);
	Log_SetTopicStatus(CH4_GORNPROHOD,LOG_SUCCESS);
	B_LogEntry(CH4_GORNPROHOD,"Ли остался доволен тем, что мы с Горном обнаружили проход.");
	gorn = Hlp_GetNpc(PC_Fighter);
	B_ExchangeRoutine(gorn,"WaitFM");
};

