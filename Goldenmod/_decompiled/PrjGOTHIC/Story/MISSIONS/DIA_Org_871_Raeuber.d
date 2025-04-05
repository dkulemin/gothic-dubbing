
instance INFO_ORG_871_RAEUBER_EXIT(C_Info)
{
	npc = Org_871_Raeuber;
	nr = 999;
	condition = info_org_871_raeuber_exit_condition;
	information = info_org_871_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_871_raeuber_exit_condition()
{
	return 1;
};

func void info_org_871_raeuber_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_871_RAEUBER_BDT(C_Info)
{
	npc = Org_871_Raeuber;
	nr = 998;
	condition = info_org_871_raeuber_bdt_condition;
	information = info_org_871_raeuber_bdt_info;
	permanent = 0;
	description = "Мне кажется, Квентин забирает почти все товары.";
};


func int info_org_871_raeuber_bdt_condition()
{
	if(BDT_QT == TRUE)
	{
		return 1;
	};
};

func void info_org_871_raeuber_bdt_info()
{
	AI_Output(other,self,"Info_Org_860_Renyu_BDT_15_00");	//Мне кажется, Квентин забирает почти все товары.
	AI_Output(self,other,"Info_Org_871_Raeuber_BDT_07_00");	//Ты еще пожалеешь об этом.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

