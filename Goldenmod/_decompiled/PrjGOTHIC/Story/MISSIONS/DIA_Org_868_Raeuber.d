
instance INFO_ORG_868_RAEUBER_EXIT(C_Info)
{
	npc = Org_868_Raeuber;
	nr = 999;
	condition = info_org_868_raeuber_exit_condition;
	information = info_org_868_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_868_raeuber_exit_condition()
{
	return 1;
};

func void info_org_868_raeuber_exit_info()
{
	if((BDT_SQ == TRUE) && !(((QUENTIN_OK == TRUE) || (FRANCO_OK == TRUE)) && (Kapitel >= 4)))
	{
		AI_Output(self,other,"Info_Org_868_Raeuber_EXIT_06_00");	//Однако, если ты подговоришь на это дело еще нескольких бандитов, я соглашусь тебе помочь.
		AI_Output(other,self,"Info_Org_868_Raeuber_EXIT_15_00");	//Что именно я должен сделать?
		AI_Output(self,other,"Info_Org_868_Raeuber_EXIT_06_01");	//Просто поговори с бандитами.
		AI_Output(self,other,"Info_Org_868_Raeuber_EXIT_06_02");	//А когда все будет готово, иди к Квентину. Он должен согласиться брать меншую часть награбленного.
		Log_CreateTopic(CH1_BDT,LOG_MISSION);
		Log_SetTopicStatus(CH1_BDT,LOG_RUNNING);
		B_LogEntry(CH1_BDT,"Если я смогу убедить Квентина отдавать бандитам большую часть награбленного, то стражник позволит мне покопаться в их пещере.");
		B_LogEntry(CH1_BDT,"Я должен поговорить с несколькими бандитами насчет этого.");
		BDT_SQ = FALSE;
		BDT_QT = TRUE;
		QUENTIN_COUNT = 2;
	};
	AI_StopProcessInfos(self);
};


instance ORG_868_RAEUBER_GOAWAY(C_Info)
{
	npc = Org_868_Raeuber;
	nr = 1;
	condition = org_868_raeuber_goaway_condition;
	information = org_868_raeuber_goaway_info;
	permanent = 0;
	important = 1;
};


func int org_868_raeuber_goaway_condition()
{
	return TRUE;
};

func void org_868_raeuber_goaway_info()
{
	AI_Output(self,other,"Org_868_Raeuber_GoAway_06_00");	//Стой! Ты не можешь войти в пещеру.
	AI_Output(other,self,"Org_868_Raeuber_GoAway_15_00");	//Не могу? А что находится в этой пещере?
	AI_Output(self,other,"Org_868_Raeuber_GoAway_06_01");	//Здесь - половина награбленных вещей.
	AI_Output(other,self,"Org_868_Raeuber_GoAway_15_01");	//Тогда где остальная половина?
	AI_Output(self,other,"Org_868_Raeuber_GoAway_06_02");	//Квентин забирает ее себе.
};


instance ORG_868_RAEUBER_GUARD(C_Info)
{
	npc = Org_868_Raeuber;
	nr = 1;
	condition = org_868_raeuber_guard_condition;
	information = org_868_raeuber_guard_info;
	permanent = 1;
	description = "Тебе не кажется, что это несправедливо?";
};


func int org_868_raeuber_guard_condition()
{
	if(Npc_KnowsInfo(hero,org_868_raeuber_goaway) && !Npc_KnowsInfo(hero,org_858_quentin_qt_ok))
	{
		return TRUE;
	};
};

func void org_868_raeuber_guard_info()
{
	AI_Output(other,self,"Org_868_Raeuber_GUARD_15_00");	//Тебе не кажется, что это несправедливо?
	AI_Output(self,other,"Org_868_Raeuber_GUARD_06_00");	//Квентин никогда не делает грязную работу. По-моему, он берет себе слишком много.
};


instance ORG_868_RAEUBER_BDT(C_Info)
{
	npc = Org_868_Raeuber;
	nr = 2;
	condition = org_868_raeuber_bdt_condition;
	information = org_868_raeuber_bdt_info;
	permanent = 0;
	description = "А ты не думал обчистить эту пещеру?";
};


func int org_868_raeuber_bdt_condition()
{
	if(Npc_KnowsInfo(hero,org_868_raeuber_goaway))
	{
		return TRUE;
	};
};

func void org_868_raeuber_bdt_info()
{
	AI_Output(other,self,"Org_868_Raeuber_BDT_15_00");	//А ты не думал обчистить эту пещеру и забрать все себе?
	AI_Output(self,other,"Org_868_Raeuber_BDT_06_00");	//С тобой все в порядке? Этоже прямая дорога на виселицу!
	AI_Output(self,other,"Org_868_Raeuber_BDT_06_01");	//Был один такой. Он хотел украсть сокровища, но когда Квентин узнал об этом, он...
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00");	//Понятно.
	BDT_SQ = TRUE;
};


instance ORG_868_RAEUBER_BDT_OK(C_Info)
{
	npc = Org_868_Raeuber;
	nr = 2;
	condition = org_868_raeuber_bdt_ok_condition;
	information = org_868_raeuber_bdt_ok_info;
	permanent = 0;
	description = "Квентин согласился отдавать вам больше вещей.";
};


func int org_868_raeuber_bdt_ok_condition()
{
	if(Npc_KnowsInfo(hero,org_858_quentin_qt_ok))
	{
		return TRUE;
	};
};

func void org_868_raeuber_bdt_ok_info()
{
	AI_Output(other,self,"Org_868_Raeuber_BDT_OK_15_00");	//Квентин согласился отдавать вам больше вещей.
	AI_Output(other,self,"Org_868_Raeuber_BDT_OK_15_01");	//Теперь он будет забирать только треть товара.
	AI_Output(self,other,"Org_868_Raeuber_BDT_OK_06_00");	//Хорошо! Ты можешь взять что-нибудь в нашей пещере... Но только в разумных количествах.
	AI_Output(self,other,"Org_868_Raeuber_BDT_OK_06_01");	//Да, и можешь забрать этот рог мракориса.
	B_GiveXP(200);
	Log_SetTopicStatus(CH1_BDT,LOG_SUCCESS);
	B_LogEntry(CH1_BDT,"Дело сделано. Теперь я могу обыскать пещеру бандитов.");
	B_GiveInvItems(self,hero,ItAt_Shadow_02,1);
};


instance ORG_868_RAEUBER_OK(C_Info)
{
	npc = Org_868_Raeuber;
	nr = 1;
	condition = org_868_raeuber_ok_condition;
	information = org_868_raeuber_ok_info;
	permanent = 1;
	description = "Как дела?";
};


func int org_868_raeuber_ok_condition()
{
	if(Npc_KnowsInfo(hero,org_868_raeuber_bdt_ok))
	{
		return TRUE;
	};
};

func void org_868_raeuber_ok_info()
{
	AI_Output(other,self,"DIA_Whistler_StandardKap1_15_00");	//Как дела?
	AI_Output(self,other,"Org_868_Raeuber_OK_06_00");	//Неплохо. Теперь мы можем забирать больше вещей со склада.
};

