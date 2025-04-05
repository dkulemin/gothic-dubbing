
instance KDF_401_Damarok_WELCOME(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_WELCOME_Condition;
	information = KDF_401_Damarok_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDF_401_Damarok_WELCOME_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE) && Npc_KnowsInfo(hero,KDF_403_Drago_RUNE) && Npc_KnowsInfo(hero,KDF_405_Torrez_BOOK) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_WELCOME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01");	//Да хранит тебя вечный Огонь!
	Corristo_KDFAufnahme = 6;
	B_Story_Feueraufnahme();
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_Exit(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 999;
	condition = KDF_401_Damarok_Exit_Condition;
	information = KDF_401_Damarok_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int KDF_401_Damarok_Exit_Condition()
{
	return TRUE;
};

func void KDF_401_Damarok_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_HEAL(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_HEAL_Condition;
	information = KDF_401_Damarok_HEAL_Info;
	important = 1;
	permanent = 0;
};


func int KDF_401_Damarok_HEAL_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEAL_Info()
{
	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01");	//Если ты ранен, я залечу твои раны.
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_HEALINFO(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 100;
	condition = KDF_401_Damarok_HEALINFO_Condition;
	information = KDF_401_Damarok_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Я ранен. Ты можешь мне помочь?";
};


func int KDF_401_Damarok_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEALINFO_Info()
{
	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01");	//Я ранен. Ты можешь помочь мне?
	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02");	//Когда излечивается тело, очищается и дух человека.
	Snd_Play("MFX_Heal_Cast");
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
};


instance KDF_401_DAMAROK_ALCHEMY(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 1;
	condition = kdf_401_damarok_alchemy_condition;
	information = kdf_401_damarok_alchemy_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь обучить меня приготовлению эликсиров?";
};


func int kdf_401_damarok_alchemy_condition()
{
	if((HERO_KNOWS_ALCHEMY == FALSE) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_alchemy_info()
{
	AI_Output(other,self,"KDF_401_Damarok_ALCHEMY_15_00");	//Ты можешь обучить меня приготовлению эликсиров?
	AI_Output(self,other,"KDF_401_Damarok_ALCHEMY_14_00");	//Конечно.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Маг огня Дамарок может научить меня варить зелья.");
};


instance KDF_401_DAMAROK_LEARN_ALCHEMY(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 1;
	condition = kdf_401_damarok_learn_alchemy_condition;
	information = kdf_401_damarok_learn_alchemy_info;
	important = 0;
	permanent = 1;
	description = "Я хочу изучить алхимию. (10 очков обучения)";
};


func int kdf_401_damarok_learn_alchemy_condition()
{
	if((HERO_KNOWS_ALCHEMY == FALSE) && (Npc_GetTrueGuild(hero) == GIL_KDF) && Npc_KnowsInfo(hero,kdf_401_damarok_alchemy))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_learn_alchemy_info()
{
	AI_Output(other,self,"KDF_401_Damarok_Learn_ALCHEMY_15_00");	//Я хочу изучить алхимию.
	if(hero.lp >= 10)
	{
		hero.lp = hero.lp - 10;
		AI_Output(self,other,"KDF_401_Damarok_Learn_ALCHEMY_14_00");	//Иннос дал человеку магию и человек научился совмещать магию с растениями.
		AI_Output(self,other,"KDF_401_Damarok_Learn_ALCHEMY_14_01");	//Алхимия - это приготовление эликсиров при помощи магии.
		AI_Output(self,other,"KDF_401_Damarok_Learn_ALCHEMY_14_02");	//Тебе нужно смешать ингредиенты в лабораторном флаконе и произнести заклинание.
		AI_Output(self,other,"KDF_401_Damarok_Learn_ALCHEMY_14_03");	//Я могу обучить тебя таким заклинаниям и показать несколько рецептов эликсиров.
		HERO_KNOWS_ALCHEMY = TRUE;
		Log_CreateTopic(GE_POTIONALCHEMY,LOG_NOTE);
		B_LogEntry(GE_POTIONALCHEMY,"Маг огня Дамарок обучил меня искусству алхимии. Теперь я могу варить эликсиры.");
		kdf_401_damarok_learn_alchemy.permanent = 0;
	}
	else
	{
		AI_Output(self,other,"SVM_14_NoLearnNoPoints");	//Я не могу учить тебя. Тебе нехватает опыта.
	};
};


instance KDF_401_DAMAROK_LEARN_POTIONS(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 1;
	condition = kdf_401_damarok_learn_potions_condition;
	information = kdf_401_damarok_learn_potions_info;
	important = 0;
	permanent = 1;
	description = "(алхимия)";
};


func int kdf_401_damarok_learn_potions_condition()
{
	if((HERO_KNOWS_ALCHEMY == TRUE) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_learn_potions_info()
{
	Info_AddChoice(kdf_401_damarok_learn_potions,"НАЗАД",kdf_401_damarok_learn_potions_back);
	if(HERO_KNOWS_HASTE_2 == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_learn_potions,"Эликсир быстроты. (2 очка обучения)",kdf_401_damarok_learn_potions_haste);
	};
	if(HERO_KNOWS_MANA_2 == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_learn_potions,"Вытяжка магической энергии. (2 очка обучения)",kdf_401_damarok_learn_potions_mana);
	};
	if(HERO_KNOWS_HEALTH_2 == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_learn_potions,"Вытяжка исцеления. (2 очка обучения)",kdf_401_damarok_learn_potions_health);
	};
};

func void kdf_401_damarok_learn_potions_health()
{
	AI_Output(other,self,"KDF_401_Damarok_Learn_POTIONS_HEALTH_15_00");	//... вытяжка исцеления.
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"KDF_401_Damarok_Learn_POTIONS_HEALTH_14_00");	//Тебе нужно смешать 3 целебных растения.
		B_LogEntry(GE_POTIONALCHEMY,"Для приготовления вытяжки исцеления мне понадобятся 3 целебных растения.");
		HERO_KNOWS_HEALTH_2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"SVM_14_NoLearnNoPoints");	//Я не могу учить тебя. Тебе нехватает опыта.
	};
	Info_ClearChoices(kdf_401_damarok_learn_potions);
};

func void kdf_401_damarok_learn_potions_mana()
{
	AI_Output(other,self,"KDF_401_Damarok_Learn_POTIONS_MANA_15_00");	//... вытяжка магической энергии.
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"KDF_401_Damarok_Learn_POTIONS_MANA_14_00");	//Нужно просто смешать 3 каменных корня.
		AI_Output(self,other,"KDF_401_Damarok_Learn_POTIONS_MANA_14_01");	//Обычно они растут в горах.
		B_LogEntry(GE_POTIONALCHEMY,"Для приготовления вытяжки маны мне понадобятся 3 каменных кореня.");
		HERO_KNOWS_MANA_2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"SVM_14_NoLearnNoPoints");	//Я не могу учить тебя. Тебе нехватает опыта.
	};
	Info_ClearChoices(kdf_401_damarok_learn_potions);
};

func void kdf_401_damarok_learn_potions_haste()
{
	AI_Output(other,self,"KDF_401_Damarok_Learn_POTIONS_HASTE_15_00");	//... эликсир быстроты.
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"KDF_401_Damarok_Learn_POTIONS_HASTE_14_00");	//Ты должен смешать серафис с лунником.
		B_LogEntry(GE_POTIONALCHEMY,"Для приготовления эликсира быстроты мне понадобятся серафис и лунник.");
		HERO_KNOWS_HASTE_2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"SVM_14_NoLearnNoPoints");	//Я не могу учить тебя. Тебе нехватает опыта.
	};
	Info_ClearChoices(kdf_401_damarok_learn_potions);
};

func void kdf_401_damarok_learn_potions_back()
{
	AI_Output(other,self,"KDF_401_Damarok_Learn_POTIONS_BACK_15_00");	//Я зайду в другой раз.
	Info_ClearChoices(kdf_401_damarok_learn_potions);
};

