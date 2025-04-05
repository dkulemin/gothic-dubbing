
instance ORG_861_Killian_Exit(C_Info)
{
	npc = Org_861_Killian;
	nr = 999;
	condition = ORG_861_Killian_Exit_Condition;
	information = ORG_861_Killian_Exit_Info;
	important = 0;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int ORG_861_Killian_Exit_Condition()
{
	return TRUE;
};

func void ORG_861_Killian_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_861_Killian_GetLost(C_Info)
{
	npc = Org_861_Killian;
	nr = 1;
	condition = ORG_861_Killian_GetLost_Condition;
	information = ORG_861_Killian_GetLost_Info;
	permanent = 1;
	important = 1;
};


func int ORG_861_Killian_GetLost_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return TRUE;
	};
};

func void ORG_861_Killian_GetLost_Info()
{
	AI_Output(self,other,"Org_861_Killian_GetLost_Info_13_00");	//Проваливай!
	AI_StopProcessInfos(self);
};


instance INFO_ORG_861_KILLIAN_BDT(C_Info)
{
	npc = Org_861_Killian;
	nr = 998;
	condition = info_org_861_killian_bdt_condition;
	information = info_org_861_killian_bdt_info;
	permanent = 0;
	description = "По-моему, Квентин берет слишком много товара.";
};


func int info_org_861_killian_bdt_condition()
{
	if((BDT_QT == TRUE) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return 1;
	};
};

func void info_org_861_killian_bdt_info()
{
	AI_Output(other,self,"Info_Org_861_Killian_BDT_15_00");	//По-моему, Квентин берет слишком много товара.
	AI_Output(self,other,"Info_Org_861_Killian_BDT_13_00");	//Нам тоже остается достаточно.
};

