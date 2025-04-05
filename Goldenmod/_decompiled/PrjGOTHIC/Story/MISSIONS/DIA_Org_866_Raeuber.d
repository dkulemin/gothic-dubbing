
instance INFO_ORG_866_RAEUBER_EXIT(C_Info)
{
	npc = Org_866_Raeuber;
	nr = 999;
	condition = info_org_866_raeuber_exit_condition;
	information = info_org_866_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_866_raeuber_exit_condition()
{
	return 1;
};

func void info_org_866_raeuber_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_866_RAEUBER_BDT(C_Info)
{
	npc = Org_866_Raeuber;
	nr = 998;
	condition = info_org_866_raeuber_bdt_condition;
	information = info_org_866_raeuber_bdt_info;
	permanent = 0;
	description = "Мне кажется, Квентин забирает почти все товары.";
};


func int info_org_866_raeuber_bdt_condition()
{
	if(BDT_QT == TRUE)
	{
		return 1;
	};
};

func void info_org_866_raeuber_bdt_info()
{
	AI_Output(other,self,"Info_Org_860_Renyu_BDT_15_00");	//Мне кажется, Квентин забирает почти все товары.
	AI_Output(self,other,"Info_Org_866_Raeuber_BDT_06_00");	//Ты против Квентина? Сейчас я тебе покажу!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

