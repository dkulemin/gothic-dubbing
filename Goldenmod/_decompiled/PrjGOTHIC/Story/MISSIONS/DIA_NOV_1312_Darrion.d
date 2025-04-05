
instance DIA_Darrion_Exit(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 999;
	condition = DIA_Darrion_Exit_Condition;
	information = DIA_Darrion_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Darrion_Exit_Condition()
{
	return 1;
};

func void DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Darrion_Hello(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = DIA_Darrion_Hello_Condition;
	information = DIA_Darrion_Hello_Info;
	permanent = 0;
	description = "Привет! Я здесь новенький - расскажи мне о Лагере.";
};


func int DIA_Darrion_Hello_Condition()
{
	return 1;
};

func void DIA_Darrion_Hello_Info()
{
	AI_Output(other,self,"DIA_Darrion_Hello_15_00");	//Привет! Я здесь новенький, и мне нужно, чтобы кто-нибудь рассказал мне о Лагере.
	AI_Output(self,other,"DIA_Darrion_Hello_11_01");	//Ты выбрал не самое удачное время. Стражи готовятся к бою, и мы работаем день и ночь.
	AI_Output(self,other,"DIA_Darrion_Hello_11_02");	//У меня нет времени на болтовню. Так что не отвлекай меня - если, конечно, ты не хочешь что-нибудь купить.
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Новичок Даррион занимается оружием. Практически все время он сидит в кузнице.");
};


instance DIA_Darrion_Trade(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 800;
	condition = DIA_Darrion_Trade_Condition;
	information = DIA_Darrion_Trade_Info;
	permanent = 1;
	description = "Покажи, что у тебя есть.";
	trade = 1;
};


func int DIA_Darrion_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Darrion_Hello))
	{
		return TRUE;
	};
};

func void DIA_Darrion_Trade_Info()
{
	AI_Output(other,self,"DIA_Darrion_Trade_15_00");	//Покажи, что у тебя есть.
	AI_Output(self,other,"DIA_Darrion_Trade_11_01");	//Другое дело. Вот, здесь все, что есть у меня сегодня.
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) < 5)
	{
		CreateInvItems(self,ItMiSwordrawhot,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) < 5)
	{
		CreateInvItems(self,ItMiSwordbladehot,5);
	};
	if(Npc_HasItems(self,ItMiSwordblade) < 5)
	{
		CreateInvItems(self,ItMiSwordblade,5);
	};
};


instance DIA_DARRION_TRADE_SWORD(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 600;
	condition = dia_darrion_trade_sword_condition;
	information = dia_darrion_trade_sword_info;
	permanent = 1;
	description = "(продать оружие)";
};


func int dia_darrion_trade_sword_condition()
{
	if(Npc_KnowsInfo(other,DIA_Darrion_Hello))
	{
		return 1;
	};
};

func void dia_darrion_trade_sword_info()
{
	AI_Output(other,self,"DIA_Darrion_TRADE_SWORD_15_00");	//Я хочу продать выкованные мной мечи.
	if(DARRION_ST == FALSE)
	{
		AI_Output(self,other,"DIA_Darrion_TRADE_SWORD_11_00");	//Хорошо! Так я смогу быстрее подготовить оружие для наших стражей.
		AI_Output(self,other,"DIA_Darrion_TRADE_SWORD_11_01");	//Я дам тебе 80 кусков руды за каждый меч.
		Log_CreateTopic(GE_TRADERSWORD,LOG_NOTE);
		B_LogEntry(GE_TRADERSWORD,"Послушник Даррион из Болотного лагеря покупает мечи за 80 кусков руды.");
		DARRION_ST = TRUE;
	};
	if(Npc_HasItems(other,ItMw_1H_Sword_01) >= 1)
	{
		Info_AddChoice(dia_darrion_trade_sword,"(продать 1 меч)",dia_darrion_trade_sword_b);
	};
	Info_AddChoice(dia_darrion_trade_sword,"Я зайду позже.",dia_darrion_trade_sword_no);
};

func void dia_darrion_trade_sword_no()
{
	AI_Output(other,self,"DIA_Darrion_TRADE_SWORD_NO");	//Я зайду позже.
	Info_ClearChoices(dia_darrion_trade_sword);
};

func void dia_darrion_trade_sword_b()
{
	B_GiveInvItems(other,self,ItMw_1H_Sword_01,1);
	B_GiveInvItems(self,other,ItMiNugget,80);
	Info_ClearChoices(dia_darrion_trade_sword);
	if(Npc_HasItems(other,ItMw_1H_Sword_01) >= 1)
	{
		Info_AddChoice(dia_darrion_trade_sword,"(продать 1 меч)",dia_darrion_trade_sword_b);
	};
	Info_AddChoice(dia_darrion_trade_sword,"Я зайду позже.",dia_darrion_trade_sword_no);
};

