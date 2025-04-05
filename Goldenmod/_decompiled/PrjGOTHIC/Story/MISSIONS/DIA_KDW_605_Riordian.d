
instance Info_Riordian_EXIT(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 999;
	condition = Info_Riordian_EXIT_Condition;
	information = Info_Riordian_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasItems(self,ItArRuneThunderball))
	{
		CreateInvItem(self,ItArRuneThunderball);
	};
};


instance Info_Riordian_NEWS(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_NEWS_Condition;
	information = Info_Riordian_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "Меня прислал Сатурас. ";
};


func int Info_Riordian_NEWS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_OFFER))
	{
		return TRUE;
	};
};

func void Info_Riordian_NEWS_Info()
{
	AI_Output(other,self,"Info_Riordian_NEWS_15_01");	//Меня прислал Сатурас.
	AI_Output(self,other,"Info_Riordian_NEWS_14_02");	//А-ааа, заходи. Мне уже доложили.
	AI_Output(self,other,"Info_Riordian_NEWS_14_03");	//Вот, возьми эти эликсиры. Здесь все, что тебе может понадобиться.
	AI_Output(self,other,"Info_Riordian_NEWS_14_04");	//Теперь иди - и отыщи эти камни. В них наша последняя надежда.
	CreateInvItems(self,ItFo_Potion_Health_01,20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_01,20);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_01,15);
	CreateInvItems(hero,ItFo_Potion_Mana_01,5);
	CreateInvItems(hero,ItFo_Potion_Health_02,2);
	CreateInvItems(hero,ItFo_Potion_Mana_02,2);
	CreateInvItems(hero,ItFo_Potion_Health_03,1);
	CreateInvItems(hero,ItFo_Potion_Mana_03,1);
	CreateInvItems(hero,ItFo_Potion_Haste_02,2);
	CreateInvItems(hero,ItFo_Potion_Strength_01,1);
	CreateInvItems(hero,ItFo_Potion_Dex_01,1);
};


instance Info_Riordian_REWARD(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_REWARD_Condition;
	information = Info_Riordian_REWARD_Info;
	permanent = 0;
	important = 0;
	description = "Сатурас сказал, что ты приготовил для меня награду?";
};


func int Info_Riordian_REWARD_Condition()
{
	if(Saturas_BringFoci == 5)
	{
		return TRUE;
	};
};

func void Info_Riordian_REWARD_Info()
{
	AI_Output(other,self,"Info_Riordian_REWARD_15_01");	//Сатурас сказал, что ты приготовил для меня награду?
	AI_Output(self,other,"Info_Riordian_REWARD_14_02");	//А-ааа, заходи, заходи.
	AI_Output(self,other,"Info_Riordian_REWARD_14_03");	//Наш духовный лидер рассказал мне о твоих героических подвигах.
	AI_Output(self,other,"Info_Riordian_REWARD_14_04");	//Все обитатели Лагеря - да что там, все жители колонии - в глубоком долгу перед тобой.
	AI_Output(self,other,"Info_Riordian_REWARD_14_05");	//Прими же от нас эту скромную награду.
	CreateInvItems(self,ItFo_Potion_Health_02,20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_02,20);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_02,15);
	CreateInvItems(hero,ItFo_Potion_Mana_02,5);
	CreateInvItems(hero,ItFo_Potion_Health_03,2);
	CreateInvItems(hero,ItFo_Potion_Mana_03,2);
	CreateInvItems(hero,ItFo_Potion_Haste_02,3);
	CreateInvItems(hero,ItFo_Potion_Master_01,1);
	CreateInvItems(hero,ItFo_Potion_Health_Perma_02,1);
	CreateInvItems(hero,ItFo_Potion_Mana_Perma_02,1);
	B_LogEntry(CH3_BringFoci,"Риордан был откровенен, как обычно. Он дал мне много эликсиров. Уверен, они мне пригодятся.");
	if(Npc_KnowsInfo(hero,Info_Cronos_REWARD))
	{
		Log_SetTopicStatus(CH3_BringFoci,LOG_SUCCESS);
	};
};


instance Info_Riordian_MESSAGE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGE_Condition;
	information = Info_Riordian_MESSAGE_Info;
	permanent = 0;
	important = 1;
};


func int Info_Riordian_MESSAGE_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredFreeMine)
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGE_Info()
{
	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01");	//Рад, что ты пришел! Я ждал тебя!
};


instance Info_Riordian_MESSAGEWHY(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGEWHY_Condition;
	information = Info_Riordian_MESSAGEWHY_Info;
	permanent = 0;
	important = 0;
	description = "Ты ждал меня? Зачем?";
};


func int Info_Riordian_MESSAGEWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01");	//Ты ждал меня? Зачем?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02");	//Горн просил отправить тебя к нему, как только ты появишься.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03");	//Что случилось?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04");	//У него есть план, как освободить захваченную шахту.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05");	//Он по-прежнему охраняет вход в шахту?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06");	//Да. Прошу тебя, отправляйся к нему как можно скорее.
};


instance KDW_605_Riordian_WELCOME(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_WELCOME_Condition;
	information = KDW_605_Riordian_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDW_605_Riordian_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_WELCOME_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01");	//Я рад, что ты теперь с нами.
};


instance KDW_605_Riordian_HEAL(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_HEAL_Condition;
	information = KDW_605_Riordian_HEAL_Info;
	important = 1;
	permanent = 0;
};


func int KDW_605_Riordian_HEAL_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEAL_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01");	//Если ты ранен, я вылечу тебя.
};


instance KDW_605_Riordian_HEALINFO(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 100;
	condition = KDW_605_Riordian_HEALINFO_Condition;
	information = KDW_605_Riordian_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Я ранен. Ты можешь мне помочь?";
};


func int KDW_605_Riordian_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01");	//Я ранен. Ты можешь мне помочь?
	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02");	//Да исцелится дух твой и плоть твоя!
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("MFX_Heal_Cast");
};


instance KDW_605_Riordian_GREET(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_GREET_Condition;
	information = KDW_605_Riordian_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Приветствую тебя, Маг!";
};


func int KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};

func void KDW_605_Riordian_GREET_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01");	//Приветствую тебя, Маг!
	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02");	//Я Риордан, алхимик. Полагаю, тебе нужен эликсир?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Риордан, маг воды, торгует эликсирами. Его можно найти в лаборатории на верхнем уровне.");
};


instance KDW_605_Riordian_TRADE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_TRADE_Condition;
	information = KDW_605_Riordian_TRADE_Info;
	important = 0;
	permanent = 1;
	description = "Покажи мне, что у тебя есть.";
	trade = 1;
};


func int KDW_605_Riordian_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_TRADE_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01");	//Покажи мне, что у тебя есть.
};


instance KDW_605_RIORDIAN_ALCHEMY(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 1;
	condition = kdw_605_riordian_alchemy_condition;
	information = kdw_605_riordian_alchemy_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь обучить меня алхимии?";
};


func int kdw_605_riordian_alchemy_condition()
{
	if((HERO_KNOWS_ALCHEMY == FALSE) && (Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_alchemy_info()
{
	AI_Output(other,self,"KDW_605_Riordian_ALCHEMY_15_00");	//Ты можешь обучить меня алхимии?
	AI_Output(self,other,"KDW_605_Riordian_ALCHEMY_14_00");	//Да, если ты этого хочешь.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Маг воды Риордан может обучить меня искусству приготовления эликсиров.");
};


instance KDW_605_RIORDIAN_LEARN_ALCHEMY(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 1;
	condition = kdw_605_riordian_learn_alchemy_condition;
	information = kdw_605_riordian_learn_alchemy_info;
	important = 0;
	permanent = 1;
	description = "Я хочу изучить алхимию. (10 очков обучения)";
};


func int kdw_605_riordian_learn_alchemy_condition()
{
	if((HERO_KNOWS_ALCHEMY == FALSE) && (Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,kdw_605_riordian_alchemy))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_learn_alchemy_info()
{
	AI_Output(other,self,"KDW_605_Riordian_Learn_ALCHEMY_15_00");	//Я хочу изучить алхимию.
	if(hero.lp >= 10)
	{
		hero.lp = hero.lp - 10;
		AI_Output(self,other,"KDW_605_Riordian_Learn_ALCHEMY_14_00");	//Для приготовления каждого эликсира тебе понадобятся растеня, обладающие особыми свойствами.
		AI_Output(self,other,"KDW_605_Riordian_Learn_ALCHEMY_14_01");	//Задача алхимика - усилить и сохранить эти свойства.
		AI_Output(self,other,"KDW_605_Riordian_Learn_ALCHEMY_14_02");	//Для этого ты должен использовать лабораторные флаконы.
		AI_Output(self,other,"KDW_605_Riordian_Learn_ALCHEMY_14_03");	//Я могу обучить тебя рецептам приготовления некоторых эликсиров.
		HERO_KNOWS_ALCHEMY = TRUE;
		Log_CreateTopic(GE_POTIONALCHEMY,LOG_NOTE);
		B_LogEntry(GE_POTIONALCHEMY,"Маг воды Риордан обучил меня алхимии. Теперь я могу готовить эликсиры.");
		kdw_605_riordian_learn_alchemy.permanent = 0;
	}
	else
	{
		AI_Output(self,other,"SVM_14_NoLearnNoPoints");	//Я не могу учить тебя. Тебе нехватает опыта.
	};
};


instance KDW_605_RIORDIAN_LEARN_POTIONS(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 1;
	condition = kdw_605_riordian_learn_potions_condition;
	information = kdw_605_riordian_learn_potions_info;
	important = 0;
	permanent = 1;
	description = "(алхимия)";
};


func int kdw_605_riordian_learn_potions_condition()
{
	if((HERO_KNOWS_ALCHEMY == TRUE) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_learn_potions_info()
{
	AI_Output(other,self,"KDW_605_Riordian_Learn_POTIONS_15_00");	//Научи меня готовить...
	Info_AddChoice(kdw_605_riordian_learn_potions,"НАЗАД",kdw_605_riordian_learn_potions_back);
	if(HERO_KNOWS_HASTE_3 == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_learn_potions,"Эликсир скорости. (3 очка обучения)",kdw_605_riordian_learn_potions_haste);
	};
	if(HERO_KNOWS_MANA_3 == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_learn_potions,"Эликсир магической энергии. (3 очка обучения)",kdw_605_riordian_learn_potions_mana);
	};
	if(HERO_KNOWS_HEALTH_3 == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_learn_potions,"Целебный эликсир. (3 очка обучения)",kdw_605_riordian_learn_potions_health);
	};
};

func void kdw_605_riordian_learn_potions_health()
{
	AI_Output(other,self,"KDW_605_Riordian_Learn_POTIONS_HEALTH_15_00");	//... целебный эликсир.
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"KDW_605_Riordian_Learn_POTIONS_HEALTH_14_00");	//Тебе нужно смешать 3 лечебных корня.
		AI_Output(self,other,"KDW_605_Riordian_Learn_POTIONS_HEALTH_14_01");	//Но будь осторожен при кипячении этого эликсира: обычно жидкость разбрызгивается из факона.
		B_LogEntry(GE_POTIONALCHEMY,"Для приготовления целебного эликсира мне понадобятся 3 лечебных корня.");
		HERO_KNOWS_HEALTH_3 = TRUE;
	}
	else
	{
		AI_Output(self,other,"SVM_14_NoLearnNoPoints");	//Я не могу учить тебя. Тебе нехватает опыта.
	};
	Info_ClearChoices(kdw_605_riordian_learn_potions);
};

func void kdw_605_riordian_learn_potions_mana()
{
	AI_Output(other,self,"KDW_605_Riordian_Learn_POTIONS_MANA_15_00");	//... эликсир магической энергии.
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"KDW_605_Riordian_Learn_POTIONS_MANA_14_00");	//Тебе просто нужно смешать 3 драконьих корня.
		AI_Output(self,other,"KDW_605_Riordian_Learn_POTIONS_MANA_14_01");	//Эти растения не так легко найти.
		B_LogEntry(GE_POTIONALCHEMY,"Для приготовления эликсира магической энергии мне понадобятся 3 драконьих корня.");
		HERO_KNOWS_MANA_3 = TRUE;
	}
	else
	{
		AI_Output(self,other,"SVM_14_NoLearnNoPoints");	//Я не могу учить тебя. Тебе нехватает опыта.
	};
	Info_ClearChoices(kdw_605_riordian_learn_potions);
};

func void kdw_605_riordian_learn_potions_haste()
{
	AI_Output(other,self,"KDW_605_Riordian_Learn_POTIONS_HASTE_15_00");	//... эликсир скорости.
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"KDW_605_Riordian_Learn_POTIONS_HASTE_14_00");	//Для этого тебе необходимо смешать серафис с горным мхом.
		B_LogEntry(GE_POTIONALCHEMY,"Для приготовления эликсира скорости мне понадобятся серафис и горный мох.");
		HERO_KNOWS_HASTE_3 = TRUE;
	}
	else
	{
		AI_Output(self,other,"SVM_14_NoLearnNoPoints");	//Я не могу учить тебя. Тебе нехватает опыта.
	};
	Info_ClearChoices(kdw_605_riordian_learn_potions);
};

func void kdw_605_riordian_learn_potions_back()
{
	AI_Output(other,self,"KDW_605_Riordian_Learn_POTIONS_BACK_15_00");	//Я зайду в другой раз.
	Info_ClearChoices(kdw_605_riordian_learn_potions);
};

