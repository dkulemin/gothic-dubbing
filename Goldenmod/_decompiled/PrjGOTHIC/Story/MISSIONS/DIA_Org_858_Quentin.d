
instance INFO_ORG_858_QUENTIN_EXIT(C_Info)
{
	npc = Org_858_Quentin;
	nr = 999;
	condition = info_org_858_quentin_exit_condition;
	information = info_org_858_quentin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_858_quentin_exit_condition()
{
	return 1;
};

func void info_org_858_quentin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_858_QUENTIN_GUARD(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_guard_condition;
	information = org_858_quentin_guard_info;
	permanent = 0;
	important = 1;
};


func int org_858_quentin_guard_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_13") && !Npc_KnowsInfo(other,org_858_quentin_gorn) && (Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_EBR))
	{
		return TRUE;
	};
};

func void org_858_quentin_guard_info()
{
	AI_Output(self,other,"Org_858_Quentin_GUARD_Info_07_00");	//Ты кто такой? Я тебя раньше не видел.
	AI_Output(other,self,"Org_858_Quentin_GUARD_Info_15_01");	//Я просто гулял по лесу...
	AI_Output(self,other,"Org_858_Quentin_GUARD_Info_07_02");	//Ты явно не туда забрел. Это лагерь бандитов.
	GQ = FALSE;
};


instance ORG_858_QUENTIN_GORN(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_gorn_condition;
	information = org_858_quentin_gorn_info;
	permanent = 0;
	important = 0;
	description = "Ты тот самый Квентин?";
};


func int org_858_quentin_gorn_condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void org_858_quentin_gorn_info()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_Info_15_00");	//Ты тот самый Квентин?
	if(QUENTIN_WORK == TRUE)
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_Info_07_00");	//А откуда ты меня знаешь?
		AI_Output(other,self,"Org_858_Quentin_GORN_Info_15_01");	//Горн сказал, ты можешь предложить мне работу.
	}
	else
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_Info_07_01");	//Что тебе нужно?
		AI_Output(other,self,"Org_858_Quentin_GORN_Info_15_02");	//Я ищу работу.
	};
	AI_Output(self,other,"Org_858_Quentin_GORN_Info_07_02");	//Мне нужен человек, который будет докладывать нам о всех действиях Старого лагеря.
	Info_AddChoice(org_858_quentin_gorn,"Нет, это не для меня.",org_858_quentin_gorn_no);
	Info_AddChoice(org_858_quentin_gorn,"Хорошо, я приступлю сегодня же.",org_858_quentin_gorn_yes);
	Info_AddChoice(org_858_quentin_gorn,"Почему ты сам не пойдешь в Cтарый лагерь?",org_858_quentin_gorn_about);
};

func void org_858_quentin_gorn_no()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_NO_15_00");	//Нет, это не для меня.
	if(GQ_A == TRUE)
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_NO_07_01");	//Ты знаешь слишком много. Мне придеться убить тебя.
		Org_868_Raeuber.npcType = Npctype_ROGUE;
		Org_869_Raeuber.npcType = Npctype_ROGUE;
		Org_870_Raeuber.npcType = Npctype_ROGUE;
		Org_871_Raeuber.npcType = Npctype_ROGUE;
		Org_874_Raeuber.npcType = Npctype_ROGUE;
		Org_863_Raeuber.npcType = Npctype_ROGUE;
		Org_864_Raeuber.npcType = Npctype_ROGUE;
		Org_865_Raeuber.npcType = Npctype_ROGUE;
		Org_866_Raeuber.npcType = Npctype_ROGUE;
		Info_ClearChoices(org_858_quentin_gorn);
		AI_StopProcessInfos(self);
		Org_858_Quentin.npcType = Npctype_ROGUE;
		Npc_SetPermAttitude(self,ATT_HOSTILE);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_NO_07_02");	//Ты меня не видел, понятно?
		AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00");	//Понятно.
		Info_ClearChoices(org_858_quentin_gorn);
		AI_StopProcessInfos(self);
	};
	B_ExchangeRoutine(self,"start");
};

func void org_858_quentin_gorn_yes()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_YES_15_00");	//Хорошо, я приступлю сегодня же.
	if(!Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_01");	//Походи по Старому лагерю и узнай ответы на следующие вопросы...
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_02");	//... сколько стражников будут сопровождать караван...
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_03");	//... что они будут везти...
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_04");	//... когда они отправятся к Старой шахте.
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_05");	//И если ты соврешь мне, то я сдеру с тебя кожу, а потом...
		AI_Output(other,self,"DIA_Gorn_DuHehler_15_06");	//(перебивает) Понятно.
		GQ_OK = TRUE;
		Log_CreateTopic(CH1_GQW,LOG_MISSION);
		Log_SetTopicStatus(CH1_GQW,LOG_RUNNING);
		B_LogEntry(CH1_GQW,"Квентин нанял меня для слежки за Старым лагерем. Я должен узнать, сколько стражников будут сопровождать караван с товарами для Старой шахты, что они будут везти и когда они отправятся к Старой шахте.");
	};
	Info_ClearChoices(org_858_quentin_gorn);
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(self,"start");
};

func void org_858_quentin_gorn_about()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_ABOUT_15_00");	//Почему ты сам не пойдешь в Cтарый лагерь?
	AI_Output(self,other,"Org_858_Quentin_GORN_ABOUT_07_01");	//Однажды, когда мы напали на караван идущий из шахты, один из стражников увидел мое лицо.
	AI_Output(self,other,"Org_858_Quentin_GORN_ABOUT_07_02");	//Я выстрелил в него из лука, но рана не оказалась смертельной, он дошел до Старого лагеря и все рассказал.
	AI_Output(self,other,"Org_858_Quentin_GORN_ABOUT_07_03");	//Теперь у каждого рудокопа есть листок с моим изображением.
	GQ_A = TRUE;
};


instance ORG_858_QUENTIN_GORN_OK(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_gorn_ok_condition;
	information = org_858_quentin_gorn_ok_info;
	permanent = 0;
	important = 0;
	description = "Я выполнил задание.";
};


func int org_858_quentin_gorn_ok_condition()
{
	if((GQ_OK == TRUE) && Npc_KnowsInfo(hero,info_kirgo_quentin) && Npc_KnowsInfo(hero,stt_311_fisk_quentin) && Npc_KnowsInfo(hero,dia_grim_quentin))
	{
		return TRUE;
	};
};

func void org_858_quentin_gorn_ok_info()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_OK_Info_15_00");	//Я выполнил задание.
	if((Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_EBR))
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_00");	//Я не имею никаких дел с людьми из Старого лагеря.
		Log_SetTopicStatus(CH1_GQW,LOG_FAILED);
		B_LogEntry(CH1_GQW,"Квентину явно не нравится то, что теперь я принадлежу к Старому лагерю. Похоже, я остался без работы.");
		B_GiveXP(100);
		AI_StopProcessInfos(self);
	}
	else if(Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_01");	//Мы уже закончили и без твоей помощи.
		Log_SetTopicStatus(CH1_GQW,LOG_FAILED);
		B_LogEntry(CH1_GQW,"Квентин уже успел захватить товары.");
	}
	else
	{
		if(Npc_KnowsInfo(hero,grd_233_bloodwyn_quentin) || Npc_KnowsInfo(hero,dia_dexter_quentin) || Npc_KnowsInfo(hero,dia_vlk_520_quentin))
		{
			AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_02");	//Но у некоторых возникли опеределеные подозрения.
			AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_03");	//Впрочем, это не так уж важно.
		};
		AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_04");	//И что ты узнал?
		AI_Output(other,self,"Org_858_Quentin_GORN_OK_Info_15_02");	//Караван отправится через день после того, как Ян пришлет список товаров Торусу.
		AI_Output(other,self,"Org_858_Quentin_GORN_OK_Info_15_03");	//Его как обычно будут сопровождать 5, или 7 стражников.
		if(!Npc_KnowsInfo(hero,stt_301_ian_getlist))
		{
			AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_05");	//Ян еще не доставил список? Было бы не плохо, если бы ты смог его добыть и отнести Ларесу в Новый лагерь.
		};
		AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_06");	//Думаю, ты заработал 300 кусков руды.
		Log_SetTopicStatus(CH1_GQW,LOG_SUCCESS);
		if(Npc_KnowsInfo(hero,stt_301_ian_getlist))
		{
			B_LogEntry(CH1_GQW,"Квентин остался доволен полученной информацией.");
			B_GiveXP(500);
		}
		else
		{
			B_LogEntry(CH1_GQW,"Квентин остался доволен полученной информацией. Он предложил мне забрать список у Яна и отнести его в Ларесу в Новый лагерь.");
			B_GiveXP(300);
		};
		B_GiveInvItems(self,hero,ItMiNugget,300);
	};
};


instance ORG_858_QUENTIN_QT_OK(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_qt_ok_condition;
	information = org_858_quentin_qt_ok_info;
	permanent = 0;
	important = 0;
	description = "Некоторые бандиты возмущены, ты берешь слишком много.";
};


func int org_858_quentin_qt_ok_condition()
{
	if((BDT_QT == TRUE) && (QUENTIN_COUNT >= 4))
	{
		return TRUE;
	};
};

func void org_858_quentin_qt_ok_info()
{
	AI_Output(other,self,"Org_858_Quentin_QT_OK_15_00");	//Некоторые бандиты возмущены тем, что ты берешь себе слишком много.
	AI_Output(self,other,"Org_858_Quentin_QT_OK_07_00");	//И кто-же это так возмущен?
	AI_Output(other,self,"Org_858_Quentin_QT_OK_15_01");	//Половина твоего лагеря.
	AI_Output(self,other,"Org_858_Quentin_QT_OK_07_01");	//Ты явно преувеличиваешь... Хм... Ну хорошо, я буду брать треть награбленного.
	AI_Output(other,self,"Org_858_Quentin_QT_OK_15_02");	//(ухмыляясь) Хорошо.
	AI_Output(self,other,"Org_858_Quentin_QT_OK_07_02");	//Лучше не злить моих парней, это может повредить делу.
	B_LogEntry(CH1_BDT,"Квентин согласился брать только треть украденного товара.");
	BDT_QT = FALSE;
	QUENTIN_COUNT = 0;
};


instance ORG_858_QUENTIN_BULLIT(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_bullit_condition;
	information = org_858_quentin_bullit_info;
	permanent = 0;
	important = 1;
};


func int org_858_quentin_bullit_condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void org_858_quentin_bullit_info()
{
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_00");	//Эй, у меня есть для тебя отличная работа!
	AI_Output(other,self,"Org_858_Quentin_BULLIT_15_00");	//И что ты можешь мне предложить?
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_01");	//Убей Буллита. И я тебя лично угощу превосходнейшим вином.
	AI_Output(other,self,"Org_858_Quentin_BULLIT_15_01");	//Эту мразь? С удовольствием. У меня с ним давние счеты.
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_02");	//У него есть ключь от сундука, в котором лежат бумаги баронов.
	AI_Output(other,self,"Org_858_Quentin_BULLIT_15_02");	//Понятно. А что я получу за это?
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_03");	//Ты получишь 5000 кусков руды и полное обмундирование королевского стражника.
	AI_Output(other,self,"Org_858_Quentin_BULLIT_15_03");	//Вижу, дело намечается серьезное.
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_04");	//Не трать время попусту, иди.
	Log_CreateTopic(CH3_BULLIT,LOG_MISSION);
	Log_SetTopicStatus(CH3_BULLIT,LOG_RUNNING);
	B_LogEntry(CH3_BULLIT,"Квентин дал мне задание убить Буллита и забрать его бумаги.");
};


instance ORG_858_QUENTIN_BULLIT_KILLED(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_bullit_killed_condition;
	information = org_858_quentin_bullit_killed_info;
	permanent = 0;
	important = 0;
	description = "Я убил его.";
};


func int org_858_quentin_bullit_killed_condition()
{
	var C_Npc Bullit;
	Bullit = Hlp_GetNpc(GRD_203_Bullit);
	if((Kapitel >= 3) && Npc_IsDead(Bullit))
	{
		return TRUE;
	};
};

func void org_858_quentin_bullit_killed_info()
{
	AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_00");	//Я убил его.
	if(Kapitel == 3)
	{
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_00");	//Ты нашел бумаги?
		if(((Npc_HasItems(hero,itwr_old_fire_letter_01) == 1) || (Npc_HasItems(hero,itwr_old_fire_letter_02) == 1)) && (Npc_HasItems(hero,itwr_list_fire_letter) == 1) && (Npc_HasItems(hero,itwr_raven_fire_letter) == 1))
		{
			AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//Да.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_01");	//А-а-а! ДА! Я богат! Сказочно богат. Да я куплю эту колонию, бог ты мой!
			AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_02");	//Где то, что ты обещал?!
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_02");	//Не суетись, почто мне сейчас это барахло!
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_03");	//Вот, держи.
			if(Npc_HasItems(hero,itwr_old_fire_letter_01) == 1)
			{
				B_GiveInvItems(other,self,itwr_old_fire_letter_01,1);
			}
			else
			{
				B_GiveInvItems(other,self,itwr_old_fire_letter_02,1);
			};
			B_GiveInvItems(other,self,itwr_list_fire_letter,1);
			B_GiveInvItems(other,self,itwr_raven_fire_letter,1);
			B_GiveInvItems(self,other,ItMiNugget,5000);
			B_GiveInvItems(self,other,grd_armor_i,1);
			B_GiveInvItems(self,other,ItMw_2H_Sword_Light_01,1);
			B_GiveInvItems(self,other,ItRw_Crossbow_02,1);
			B_GiveXP(3500);
			Log_SetTopicStatus(CH3_BULLIT,LOG_SUCCESS);
			B_LogEntry(CH3_BULLIT,"Я выполнил задание. Квентин был очень доволен.");
			AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_03");	//Другое дело.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_04");	//Ах да, выпей со мной!
			CreateInvItems(self,ItFoWine,2);
			B_GiveInvItems(self,other,ItFoWine,1);
			AI_UseItem(self,ItFoWine);
			AI_UseItem(other,ItFoWine);
			AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_04");	//Хорошее вино.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_05");	//Ладно. Прощай. На этом поставим точку.
			AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01");	//Удачи.
			QUENTIN_OK = TRUE;
		}
		else
		{
			AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//Нет.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_06");	//Тогда ищи их.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_07");	//Если стражники обнаружат тело Булита, они наверняка заберут все бумаги.
			BULLIT_LATER = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_08");	//Бумаги Старого лагеря теперь не представляют никакой ценности.
		Log_SetTopicStatus(CH3_BULLIT,LOG_FAILED);
		B_LogEntry(CH3_BULLIT,"Квентину больше не нужны эти бумаги.");
	};
};


instance ORG_858_QUENTIN_BULLIT_LATER(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_bullit_later_condition;
	information = org_858_quentin_bullit_later_info;
	permanent = 0;
	important = 0;
	description = "Я принес бумаги.";
};


func int org_858_quentin_bullit_later_condition()
{
	var C_Npc Bullit;
	Bullit = Hlp_GetNpc(GRD_203_Bullit);
	if((BULLIT_LATER == TRUE) && ((Npc_HasItems(hero,itwr_old_fire_letter_01) == 1) || (Npc_HasItems(hero,itwr_old_fire_letter_02) == 1)) && (Npc_HasItems(hero,itwr_list_fire_letter) == 1) && (Npc_HasItems(hero,itwr_raven_fire_letter) == 1))
	{
		return TRUE;
	};
};

func void org_858_quentin_bullit_later_info()
{
	AI_Output(other,self,"Org_858_Quentin_BULLIT_LATER_15_00");	//Я принес бумаги.
	if(Kapitel == 3)
	{
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_01");	//А-а-а! ДА! Я богат! Сказочно богат. Да я куплю эту колонию, бог ты мой!
		AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_02");	//Где то, что ты обещал?!
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_02");	//Не суетись, почто мне сейчас это барахло!
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_03");	//Вот, держи.
		if(Npc_HasItems(hero,itwr_old_fire_letter_01) == 1)
		{
			B_GiveInvItems(other,self,itwr_old_fire_letter_01,1);
		}
		else
		{
			B_GiveInvItems(other,self,itwr_old_fire_letter_02,1);
		};
		B_GiveInvItems(other,self,itwr_list_fire_letter,1);
		B_GiveInvItems(other,self,itwr_raven_fire_letter,1);
		B_GiveInvItems(self,other,ItMiNugget,5000);
		B_GiveInvItems(self,other,grd_armor_i,1);
		B_GiveInvItems(self,other,ItMw_2H_Sword_Light_01,1);
		B_GiveInvItems(self,other,ItRw_Crossbow_02,1);
		B_GiveXP(3500);
		Log_SetTopicStatus(CH3_BULLIT,LOG_SUCCESS);
		B_LogEntry(CH3_BULLIT,"Я выполнил задание. Квентин был очень доволен.");
		BULLIT_LATER = FALSE;
		QUENTIN_OK = TRUE;
	}
	else
	{
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_08");	//Бумаги Старого лагеря теперь не представляют никакой ценности.
		Log_SetTopicStatus(CH3_BULLIT,LOG_FAILED);
		B_LogEntry(CH3_BULLIT,"Квентину больше не нужны эти бумаги.");
	};
};

