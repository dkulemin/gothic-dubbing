
const string Grd_212_CHECKPOINT = "OCC_GATE_INSIDE";

instance Info_Grd_212_FirstWarn(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_FirstWarn_Condition;
	information = Info_Grd_212_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_212_FirstWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Grd_212_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_01");	//СТОЙ!
	AI_Output(hero,self,"Info_Grd_212_FirstWarn_Info_15_02");	//Что такое?
	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_03");	//Ты не можешь зайти в замок без разрешения! Убирайся отсюда!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_LastWarn(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_LastWarn_Condition;
	information = Info_Grd_212_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_212_LastWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Grd_212_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_Grd_212_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Grd_212_LastWarn_13_01");	//Ты что, оглох? Еще один шаг, и ты станешь кормом для червей!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
	return TRUE;
};


instance Info_Grd_212_Attack(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Attack_Condition;
	information = Info_Grd_212_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_212_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Grd_212_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_Grd_212_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	return TRUE;
};


instance Info_Grd_212_EXIT(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 999;
	condition = Info_Grd_212_EXIT_Condition;
	information = Info_Grd_212_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Grd_212_EXIT_Condition()
{
	return 1;
};

func void Info_Grd_212_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_Abblitzen(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Abblitzen_Condition;
	information = Info_Grd_212_Abblitzen_Info;
	permanent = 1;
	description = "Мне нужно попасть в замок!";
};


func int Info_Grd_212_Abblitzen_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void Info_Grd_212_Abblitzen_Info()
{
	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_00");	//Мне нужно попасть в замок!
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_01");	//Как интересно! А я хочу убраться из этой проклятой колонии!
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_02");	//И уж во всяком случае у меня есть дела поважнее, чем следить, чтоб такие бездельники, как ты, не совали свой нос куда не следует.
	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_03");	//Ты можешь просто впустить меня...
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_04");	//Нет, не могу! Только Торус может.
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_FirstIn(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_FirstIn_Condition;
	information = Info_Grd_212_FirstIn_Info;
	permanent = 0;
	important = 1;
};


func int Info_Grd_212_FirstIn_Condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void Info_Grd_212_FirstIn_Info()
{
	AI_Output(self,other,"Info_Grd_212_FirstIn_13_00");	//СТОЙ!
	AI_Output(other,self,"Info_Grd_212_FirstIn_15_01");	//Расслабься! Я поговорил с Торусом. Он мне разрешил.
	AI_Output(self,other,"Info_Grd_212_FirstIn_13_02");	//Я запомнил твое лицо, парень! У тебя будут неприятности, и так легко от них ты не отделаешься.
	AI_StopProcessInfos(self);
};


instance Info_Grd_212_Passgate(C_Info)
{
	npc = Grd_212_Torwache;
	nr = 1;
	condition = Info_Grd_212_Passgate_Condition;
	information = Info_Grd_212_Passgate_Info;
	permanent = 1;
	description = "Я все-таки могу войти?";
};


func int Info_Grd_212_Passgate_Condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void Info_Grd_212_Passgate_Info()
{
	AI_Output(other,self,"Info_Grd_212_Passgate_15_00");	//Я все-таки могу войти?
	AI_Output(self,other,"Info_Grd_212_Passgate_13_01");	//Да, если перестанешь задавать глупые вопросы.
	AI_StopProcessInfos(self);
};

