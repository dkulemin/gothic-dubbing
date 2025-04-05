
instance INFO_ORG_870_RAEUBER_EXIT(C_Info)
{
	npc = Org_870_Raeuber;
	nr = 999;
	condition = info_org_870_raeuber_exit_condition;
	information = info_org_870_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_870_raeuber_exit_condition()
{
	return 1;
};

func void info_org_870_raeuber_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_870_RAEUBER_BDT(C_Info)
{
	npc = Org_870_Raeuber;
	nr = 998;
	condition = info_org_870_raeuber_bdt_condition;
	information = info_org_870_raeuber_bdt_info;
	permanent = 0;
	description = "По-моему, Квентин берет слишком много товара.";
};


func int info_org_870_raeuber_bdt_condition()
{
	if(BDT_QT == TRUE)
	{
		return 1;
	};
};

func void info_org_870_raeuber_bdt_info()
{
	AI_Output(other,self,"Info_Org_861_Killian_BDT_15_00");	//По-моему, Квентин берет слишком много товара.
	AI_Output(self,other,"Info_Org_870_Raeuber_BDT_07_00");	//Ты же не думаешь, что я осмелюсь сказать ему об этом.
};

