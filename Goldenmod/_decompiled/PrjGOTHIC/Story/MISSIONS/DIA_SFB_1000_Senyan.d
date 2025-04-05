
instance DIA_Senyan_EXIT(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 999;
	condition = DIA_Senyan_EXIT_Condition;
	information = DIA_Senyan_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Senyan_EXIT_Condition()
{
	return 1;
};

func void DIA_Senyan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Senyan_Hello(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = DIA_Senyan_Hello_Condition;
	information = DIA_Senyan_Hello_Info;
	permanent = 0;
	description = "Ты со Свободной Шахты, верно?";
};


func int DIA_Senyan_Hello_Condition()
{
	if(!Npc_KnowsInfo(hero,dia_senyan_spirit_ok) && !Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void DIA_Senyan_Hello_Info()
{
	AI_Output(other,self,"DIA_Senyan_Hello_15_00");	//Ты со Свободной Шахты, верно?
	AI_Output(self,other,"DIA_Senyan_Hello_01_01");	//Верно. Как ты узнал?
	AI_StopProcessInfos(self);
};


instance DIA_Senyan_JustTalk(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = DIA_Senyan_JustTalk_Condition;
	information = DIA_Senyan_JustTalk_Info;
	permanent = 1;
	description = "Я хотел бы поговорить с тобой.";
};


func int DIA_Senyan_JustTalk_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Senyan_Hello) && !Npc_KnowsInfo(hero,dia_senyan_spirit_ok) && !Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void DIA_Senyan_JustTalk_Info()
{
	AI_Output(other,self,"DIA_Senyan_JustTalk_15_00");	//Я хотел бы поговорить с тобой.
	AI_Output(self,other,"DIA_Senyan_JustTalk_01_01");	//Я здесь не для того, чтобы разговаривать.
	AI_StopProcessInfos(self);
};


instance DIA_SENYAN_SPIRIT(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = dia_senyan_spirit_condition;
	information = dia_senyan_spirit_info;
	permanent = 0;
	description = "Слушай, ты любишь выпить?";
};


func int dia_senyan_spirit_condition()
{
	if(Npc_KnowsInfo(hero,dia_jeremiah_spirit) && !Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void dia_senyan_spirit_info()
{
	AI_Output(other,self,"DIA_Senyan_SPIRIT_15_00");	//Слушай, ты любишь выпить?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_01_01");	//Да. Я люблю вино. Я люблю выпить. А тебе то что?
	AI_Output(other,self,"DIA_Senyan_SPIRIT_15_01");	//Ты умеешь делать рисовый шнапс?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_01_02");	//Ха-ха-ха-ха! Ты еще спрашиваешь! Да я такую выпивку умею готовить, не то что этот кисель...
	AI_Output(other,self,"DIA_Senyan_SPIRIT_15_02");	//Ты можешь заменить Иеремию?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_01_03");	//Что?! Попасть в кабалу к этому маньяку Силасу? Да он меня со свету сживет. Ни за какие блага.
	AI_Output(other,self,"DIA_Senyan_SPIRIT_15_03");	//500 кусков руды и ты в деле, идет?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_01_04");	//(ошеломленно) Тьфу... давай сюда руду!
	B_LogEntry(CH4_YBERION_INNOS,"Шеньян согласился сменить Иеремию за 500 кусков руды.");
};


instance DIA_SENYAN_SPIRIT_OK(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = dia_senyan_spirit_ok_condition;
	information = dia_senyan_spirit_ok_info;
	permanent = 0;
	description = "(отдать 500 кусков руды)";
};


func int dia_senyan_spirit_ok_condition()
{
	if(Npc_KnowsInfo(hero,dia_senyan_spirit) && !Npc_KnowsInfo(hero,dia_silas_spirit_ok) && (Npc_HasItems(hero,ItMiNugget) >= 500))
	{
		return 1;
	};
};

func void dia_senyan_spirit_ok_info()
{
	var C_Npc jeremiah;
	AI_Output(other,self,"DIA_Senyan_SPIRIT_OK_15_00");	//Держи.
	AI_Output(self,other,"DIA_Senyan_SPIRIT_OK_01_01");	//Отлично. Я уже иду. И пусть Силас только попробует запретить мне делать хорошее вино.
	B_GiveXP(200);
	B_GiveInvItems(hero,self,ItMiNugget,500);
	jeremiah = Hlp_GetNpc(BAU_912_Jeremiah);
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(jeremiah,"afterstart");
	B_ExchangeRoutine(self,"afterstart");
	B_LogEntry(CH4_YBERION_INNOS,"Шеньян заменил Иеремию. теперь я смогу получить свой спирт.");
};


instance DIA_SENYAN_SPIRIT_AFTER(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = dia_senyan_spirit_after_condition;
	information = dia_senyan_spirit_after_info;
	permanent = 1;
	description = "Как тебе работа?";
};


func int dia_senyan_spirit_after_condition()
{
	if(Npc_KnowsInfo(hero,dia_senyan_spirit_ok) || Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void dia_senyan_spirit_after_info()
{
	AI_Output(other,self,"DIA_Senyan_SPIRIT_AFTER_15_00");	//Как тебе работа?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_AFTER_01_01");	//(довольно) Это уж определенно лучше, чем махать киркой.
	if(SENYAN_SPIRIT != TRUE)
	{
		AI_Output(self,other,"DIA_Senyan_SPIRIT_AFTER_01_02");	//Хочешь выпить?
		SENYAN_SPIRIT = TRUE;
		Info_AddChoice(dia_senyan_spirit_after,"Нет.",dia_senyan_spirit_after_no);
		Info_AddChoice(dia_senyan_spirit_after,"Да.",dia_senyan_spirit_after_yes);
	};
};

func void dia_senyan_spirit_after_yes()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//Да.
	AI_Output(self,other,"DIA_Senyan_SPIRIT_AFTER_YES_01_01");	//Вот, возьми бутылку.
	B_GiveInvItems(self,hero,ItFoWine,1);
	Info_ClearChoices(dia_senyan_spirit_after);
};

func void dia_senyan_spirit_after_no()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//Нет.
	Info_ClearChoices(dia_senyan_spirit_after);
};

