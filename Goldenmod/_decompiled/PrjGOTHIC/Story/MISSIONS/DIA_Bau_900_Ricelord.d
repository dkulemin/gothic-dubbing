
instance DIA_Ricelord_EXIT(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 999;
	condition = DIA_Ricelord_EXIT_Condition;
	information = DIA_Ricelord_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Ricelord_EXIT_Condition()
{
	return 1;
};

func void DIA_Ricelord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ricelord_Hello(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Hello_Condition;
	information = DIA_Ricelord_Hello_Info;
	permanent = 0;
	description = "Ты занимаешься рисовыми полями, так?";
};


func int DIA_Ricelord_Hello_Condition()
{
	return 1;
};

func void DIA_Ricelord_Hello_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Hello_15_00");	//Ты занимаешься рисовыми полями, так?
	AI_Output(self,other,"DIA_Ricelord_Hello_12_01");	//Ну и что? Ищешь работу?
};


instance DIA_Ricelord_Arbeit(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Arbeit_Condition;
	information = DIA_Ricelord_Arbeit_Info;
	permanent = 0;
	description = "А для меня не найдется работы?";
};


func int DIA_Ricelord_Arbeit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && !Npc_KnowsInfo(hero,DIA_Lefty_First) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//А у тебя есть для меня работа?
	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01");	//Пойди поговори с Лефти. Скорее всего ты найдешь его справа от сарая.
};


instance DIA_Ricelord_TRADE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 800;
	condition = DIA_Ricelord_TRADE_Condition;
	information = DIA_Ricelord_TRADE_Info;
	permanent = 1;
	description = "Мы могли бы заключить сделку...";
	trade = 1;
};


func int DIA_Ricelord_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Ricelord_TRADE_Info()
{
	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00");	//Мы могли бы заключить сделку...
	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01");	//А что ты можешь предложить?
};


instance DIA_Ricelord_LeftySentMe(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_LeftySentMe_Condition;
	information = DIA_Ricelord_LeftySentMe_Info;
	permanent = 1;
	description = "Меня послал Лефти.";
};


func int DIA_Ricelord_LeftySentMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && (Lefty_Mission == LOG_RUNNING) && (Ricelord_AskedForWater == FALSE) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_LeftySentMe_Info()
{
	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00");	//Меня послал Лефти.
	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01");	//Да, и что он сказал?
	Ricelord_AskedForWater = TRUE;
	RICELORDWATER = 0;
};


instance DIA_Ricelord_GetWater(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_GetWater_Condition;
	information = DIA_Ricelord_GetWater_Info;
	permanent = 1;
	description = "Я должен отнести крестьянам воду.";
};


func int DIA_Ricelord_GetWater_Condition()
{
	if(Ricelord_AskedForWater == TRUE)
	{
		return 1;
	};
};

func void DIA_Ricelord_GetWater_Info()
{
	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00");	//Я должен отнести крестьянам воду.
	if(Lefty_WorkDay == Wld_GetDay())
	{
		if(RICELORDWATER > 2)
		{
			AI_Output(self,other,"DIA_Ricelord_NoWater_12_00");	//У меня закончилась вода. Я думаю, уже все крестьяне должны были получить ее.
		}
		else
		{
			AI_Output(self,other,"DIA_Ricelord_GetWater_12_01");	//Хорошо. Вот тебе дюжина бутылок.
			AI_Output(self,other,"DIA_Ricelord_GetWater_12_02");	//Крестьян там почти вдвое больше, так что проследи, чтобы всем досталось поровну.
			CreateInvItems(self,ItFo_Potion_Water_01,12);
			B_GiveInvItems(self,other,ItFo_Potion_Water_01,12);
			RICELORDWATER = RICELORDWATER + 1;
			Ricelord_AskedForWater = FALSE;
			B_LogEntry(CH1_CarryWater,"Лорд дал мне дюжину бутылок.");
			AI_StopProcessInfos(self);
		};
	}
	else if(Lefty_WorkDay == (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00");	//Это было вчера, парень! Лучше сходи к нему, он хочет тебе что-то сказать.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01");	//Это было несколько дней назад, парень! Лучше сходи к нему, он хочет тебе кое-что сказать.
		AI_StopProcessInfos(self);
	};
};


instance DIA_RICELORD_HORATIO(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 800;
	condition = dia_ricelord_horatio_condition;
	information = dia_ricelord_horatio_info;
	permanent = 0;
	description = "Держись со своей шайкой подальше от крестьян.";
};


func int dia_ricelord_horatio_condition()
{
	var C_Npc Lefty;
	var C_Npc schlaegera;
	var C_Npc schlaegerb;
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	schlaegera = Hlp_GetNpc(Org_845_Schlaeger);
	schlaegerb = Hlp_GetNpc(Org_846_Schlaeger);
	if(Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (Lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (schlaegera.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (schlaegerb.aivar[AIV_WASDEFEATEDBYSC] == TRUE))
	{
		return TRUE;
	};
};

func void dia_ricelord_horatio_info()
{
	AI_Output(other,self,"DIA_Ricelord_Horatio_15_00");	//Держись со своей шайкой подальше от крестьян. Если хоть один из них еще раз пожалуется на тебя, я вернусь!
	AI_Output(self,other,"DIA_Ricelord_Horatio_12_01");	//Тебе просто повезло. Я этого так не оставлю.
	B_GiveXP(100);
	B_LogEntry(CH1_HORATIO_OK,"Я разобрался с Лордом и его шайкой.");
};

