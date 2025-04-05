
instance Info_Bau_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Bau_2_EXIT_Condition;
	information = Info_Bau_2_EXIT_Info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int Info_Bau_2_EXIT_Condition()
{
	return 1;
};

func void Info_Bau_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Bau_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Bau_2_WichtigePersonen_Condition;
	information = Info_Bau_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Ты по доброй воле работаешь на рисовых полях?";
};


func int Info_Bau_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Bau_2_WichtigePersonen_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00");	//Ты по доброй воле работаешь на рисовых полях?
	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01");	//Да, верно. Лучше работать здесь по доброй воле, чем под присмотром головорезов Лорда.
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02");	//Понятно...
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Bau_2_DasLager_Condition;
	information = Info_Bau_2_DasLager_Info;
	permanent = 1;
	description = "Расскажи мне о Лагере.";
};


func int Info_Bau_2_DasLager_Condition()
{
	return 1;
};

func void Info_Bau_2_DasLager_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Bau_2_DasLager_15_00");	//Расскажи мне о Лагере.
	AI_Output(self,other,"Info_Bau_2_DasLager_02_01");	//Там довольно опасно. Наемники Ли и маги еще ничего, но берегись воров!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Bau_2_DieLage_Condition;
	information = Info_Bau_2_DieLage_Info;
	permanent = 1;
	description = "Все в порядке?";
};


func int Info_Bau_2_DieLage_Condition()
{
	return 1;
};

func void Info_Bau_2_DieLage_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"Info_Bau_2_DieLage_15_00");	//Все в порядке?
	AI_Output(self,other,"Info_Bau_2_DieLage_02_01");	//Что тебе нужно? Тебя послал Лорд? Я и так уже работаю изо всех сил!
	AI_Output(other,self,"Info_Bau_2_DieLage_15_02");	//Никто не посылал меня, я просто хочу поговорить.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Bau_2_Wasser(C_Info)
{
	nr = 800;
	condition = Info_Bau_2_Wasser_Condition;
	information = Info_Bau_2_Wasser_Info;
	permanent = 1;
	description = "Меня послал Лефти. Я принес тебе воды.";
};


func int Info_Bau_2_Wasser_Condition()
{
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Bau_2_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_2_Wasser_15_00");	//Лефти послал меня. Я принес тебе воды.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		AI_Output(self,other,"Info_Bau_2_Wasser_02_01");	//Спасибо, парень! В моей глотке сейчас сухо, как в пустыне!
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00");	//Вода! Эй, парень! Здесь совсем ничего не осталось! Только не говори мне, что воду опять получили все, кроме меня!
	};
};

func void B_AssignAmbientInfos_Bau_2(var C_Npc slf)
{
	Info_Bau_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Bau_2_Wasser.npc = Hlp_GetInstanceID(slf);
};

