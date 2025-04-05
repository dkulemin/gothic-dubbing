
instance DIA_Silas_EXIT(C_Info)
{
	npc = ORG_841_Silas;
	nr = 999;
	condition = DIA_Silas_EXIT_Condition;
	information = DIA_Silas_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Silas_EXIT_Condition()
{
	return 1;
};

func void DIA_Silas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Silas_Hehler(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Hehler_Condition;
	information = DIA_Silas_Hehler_Info;
	permanent = 0;
	description = "Как дела?";
};


func int DIA_Silas_Hehler_Condition()
{
	return 1;
};

func void DIA_Silas_Hehler_Info()
{
	AI_Output(other,self,"DIA_Silas_Hehler_15_00");	//Как жизнь?
	AI_Output(self,other,"DIA_Silas_Hehler_06_01");	//Здорово! Мы сменяли наш рисовый шнапс на руду.
	AI_Output(self,other,"DIA_Silas_Hehler_06_02");	//Ну, и руды получили достаточно. А где нашим парням тратить ее, как не здесь?
};


instance DIA_Silas_Trade(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Trade_Condition;
	information = DIA_Silas_Trade_Info;
	permanent = 1;
	description = "Я хочу пить.";
	trade = 1;
};


func int DIA_Silas_Trade_Condition()
{
	return 1;
};

func void DIA_Silas_Trade_Info()
{
	AI_Output(other,self,"DIA_Silas_Trade_15_00");	//Я хочу пить.
	AI_Output(self,other,"DIA_Silas_Trade_06_01");	//Нет проблем, если у тебя есть деньги.
	if(Npc_KnowsInfo(hero,dia_senyan_spirit_ok) || Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		if(Npc_HasItems(self,ItFoWine) <= 5)
		{
			CreateInvItems(self,ItFoWine,5);
		};
		if(Npc_HasItems(hero,ItFoBooze) <= 10)
		{
			CreateInvItems(self,ItFoBooze,10);
		};
	}
	else if(Npc_HasItems(hero,ItFoBooze) <= 5)
	{
		CreateInvItems(self,ItFoBooze,5);
	};
};


instance DIA_SILAS_SPIRIT(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_spirit_condition;
	information = dia_silas_spirit_info;
	permanent = 0;
	description = "Мне нужен спирт.";
};


func int dia_silas_spirit_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work) && !Npc_KnowsInfo(hero,dia_jeremiah_spirit))
	{
		return 1;
	};
};

func void dia_silas_spirit_info()
{
	AI_Output(other,self,"DIA_Silas_SPIRIT_15_00");	//Мне нужен спирт.
	AI_Output(self,other,"DIA_Silas_SPIRIT_06_00");	//Поговори об этом с Иеремией.
	B_LogEntry(CH4_YBERION_INNOS,"Я могу получить спирт у Иеремии.");
};


instance DIA_SILAS_SPIRIT_JEREMIAH(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_spirit_jeremiah_condition;
	information = dia_silas_spirit_jeremiah_info;
	permanent = 0;
	description = "Кто-нибудь должен заменить Иеремию.";
};


func int dia_silas_spirit_jeremiah_condition()
{
	if(Npc_KnowsInfo(hero,dia_jeremiah_spirit) && !Npc_KnowsInfo(hero,dia_senyan_spirit_ok))
	{
		return 1;
	};
};

func void dia_silas_spirit_jeremiah_info()
{
	AI_Output(other,self,"DIA_Silas_SPIRIT_Jeremiah_15_00");	//Кто-нибудь должен заменить Иеремию.
	AI_Output(self,other,"DIA_Silas_SPIRIT_Jeremiah_06_00");	//Давай так: ты платишь мне 1000 кусков руды и я отпускаю Иеремию.
	B_LogEntry(CH4_YBERION_INNOS,"Силас отпустит Иеремию, если я заплачу 1000 кусков руды.");
};


instance DIA_SILAS_SPIRIT_OK(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_spirit_ok_condition;
	information = dia_silas_spirit_ok_info;
	permanent = 0;
	description = "(отдать 1000 кусков руды)";
};


func int dia_silas_spirit_ok_condition()
{
	if(Npc_KnowsInfo(hero,dia_silas_spirit_jeremiah) && !Npc_KnowsInfo(hero,dia_senyan_spirit_ok) && (Npc_HasItems(hero,ItMiNugget) >= 1000))
	{
		return 1;
	};
};

func void dia_silas_spirit_ok_info()
{
	var C_Npc jeremiah;
	var C_Npc senyan;
	AI_Output(other,self,"DIA_Silas_SPIRIT_OK_15_00");	//Вот руда.
	AI_Output(self,other,"DIA_Silas_SPIRIT_OK_06_00");	//Хорошо. Иеремию заменит Шеньян.
	B_GiveXP(150);
	B_GiveInvItems(hero,self,ItMiNugget,1000);
	jeremiah = Hlp_GetNpc(BAU_912_Jeremiah);
	senyan = Hlp_GetNpc(SFB_1000_Senyan);
	AI_Output(self,senyan,"DIA_Silas_SPIRIT_OK_06_01");	//Эй, ты! Бездельник! Иди и принимайся работу!
	B_LogEntry(CH4_YBERION_INNOS,"Силас отпустил Иеремию. Его место займет Шеньян.");
	B_ExchangeRoutine(jeremiah,"afterstart");
	B_ExchangeRoutine(senyan,"afterstart");
	AI_StopProcessInfos(self);
};

