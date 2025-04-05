
instance Info_Jacko_EXIT(C_Info)
{
	npc = Org_862_Jacko;
	nr = 999;
	condition = Info_Jacko_EXIT_Condition;
	information = Info_Jacko_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Jacko_EXIT_Condition()
{
	return 1;
};

func void Info_Jacko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_862_Jacko_GoAway(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GoAway_Condition;
	information = ORG_862_Jacko_GoAway_Info;
	permanent = 1;
	important = 1;
};


func int ORG_862_Jacko_GoAway_Condition()
{
	if((Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN") < 500) && (Kalom_DrugMonopol != LOG_RUNNING) && (Kalom_DrugMonopol != LOG_SUCCESS) && ((Npc_GetTrueGuild(hero) != GIL_ORG) && (Npc_GetTrueGuild(hero) != GIL_SLD) && (Npc_GetTrueGuild(hero) != GIL_KDW)))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GoAway_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00");	//Какого черта тебе здесь нужно?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance ORG_862_Jacko_GUARD(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GUARD_Condition;
	information = ORG_862_Jacko_GUARD_Info;
	permanent = 0;
	important = 1;
};


func int ORG_862_Jacko_GUARD_Condition()
{
	if(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GUARD_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00");	//Мы сбились с пути, так?
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01");	//Кор Галому известно о вашей маленькой затее.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02");	//Что? Почему ты здесь?
	B_LogEntry(CH1_DrugMonopol,"Я раскрыл секрет производства болотника. Джако и двое других воров делают его здесь.");
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Я здесь, для того чтобы предупредить вас.",ORG_862_Jacko_GUARD_Templer);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Оказалась ли эта информация полезной для тебя?",ORG_862_Jacko_GUARD_InfoWert);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Я здесь для того, чтобы положить конец этому делу.",ORG_862_Jacko_GUARD_Angriff);
};

func void ORG_862_Jacko_GUARD_Templer()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00");	//Я здесь для того, чтобы предупредить вас. Кор Галом послал пятерых Стражей по вашему следу.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01");	//Что?! Этого не может быть!
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02");	//Они будут здесь с минуты на минуту.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03");	//Проклятье! Мы должны уходить!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	B_LogEntry(CH1_DrugMonopol,"Небольшой трюк с несуществующими стражами заставил бездельников убраться. Проблема решена. На какое-то время.");
	B_GiveXP(XP_JackoRetired);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00");	//Мне хотелось бы знать, оказалась ли эта информация полезной для тебя.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01");	//Ах, вот оно что... Хорошо. Услуга за услугу. Вот вся руда, что я захватил с собой.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02");	//Нам пора уходить. И тебе тоже не стоит здесь задерживаться.
	B_GiveInvItems(self,other,ItMiNugget,95);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	B_LogEntry(CH1_DrugMonopol,"Благодаря моему таланту дипломата проблема была решена. Дельце становилось слишком горячим для Джако, и он смылся.");
	B_GiveXP(XP_JackoRetired);
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00");	//Я здесь для того, чтобы положить конец этому делу.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01");	//Эй, парни! Подойдите сюда на минуту!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,0,"");
	Npc_SetPermAttitude(Killian,ATT_HOSTILE);
	Npc_SetTempAttitude(Killian,ATT_HOSTILE);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Npc_SetTarget(Renyu,hero);
	AI_StartState(Renyu,ZS_Attack,0,"");
	Npc_SetPermAttitude(Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(Renyu,ATT_HOSTILE);
};


instance ORG_862_Jacko_Banditencamp(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_Banditencamp_Condition;
	information = ORG_862_Jacko_Banditencamp_Info;
	permanent = 1;
	description = "Вот, значит, куда вы забрались.";
};


func int ORG_862_Jacko_Banditencamp_Condition()
{
	if((Kalom_DrugMonopol == LOG_SUCCESS) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_Banditencamp_Info()
{
	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00");	//Вот, значит, куда вы забрались.
	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01");	//Мы едва ушли. Стражи-сектанты убили бы нас.
	AI_StopProcessInfos(self);
};


instance INFO_ORG_862_JACKO_BDT(C_Info)
{
	npc = Org_862_Jacko;
	nr = 998;
	condition = info_org_862_jacko_bdt_condition;
	information = info_org_862_jacko_bdt_info;
	permanent = 0;
	description = "Мне кажется, Квентин забирает почти все товары.";
};


func int info_org_862_jacko_bdt_condition()
{
	if((BDT_QT == TRUE) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return 1;
	};
};

func void info_org_862_jacko_bdt_info()
{
	AI_Output(other,self,"Info_Org_860_Renyu_BDT_15_00");	//Мне кажется, Квентин забирает почти все товары.
	AI_Output(self,other,"Info_ORG_862_Jacko_BDT_06_00");	//Не знаю. По-моему все нормально.
};

