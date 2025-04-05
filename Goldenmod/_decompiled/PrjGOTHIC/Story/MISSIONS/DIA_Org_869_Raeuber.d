
instance INFO_ORG_869_RAEUBER_EXIT(C_Info)
{
	npc = Org_869_Raeuber;
	nr = 999;
	condition = info_org_869_raeuber_exit_condition;
	information = info_org_869_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_869_raeuber_exit_condition()
{
	return 1;
};

func void info_org_869_raeuber_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_869_RAEUBER_BDT(C_Info)
{
	npc = Org_869_Raeuber;
	nr = 998;
	condition = info_org_869_raeuber_bdt_condition;
	information = info_org_869_raeuber_bdt_info;
	permanent = 0;
	description = "По-моему, Квентин берет слишком много товара.";
};


func int info_org_869_raeuber_bdt_condition()
{
	if(BDT_QT == TRUE)
	{
		return 1;
	};
};

func void info_org_869_raeuber_bdt_info()
{
	AI_Output(other,self,"Info_Org_861_Killian_BDT_15_00");	//По-моему, Квентин берет слишком много товара.
	AI_Output(self,other,"Info_Org_869_Raeuber_BDT_13_00");	//А ты что думал? Он же глава банды.
};


instance INFO_ORG_865_RAEUBER_TRADE(C_Info)
{
	npc = Org_869_Raeuber;
	nr = 998;
	condition = info_org_869_raeuber_trade_condition;
	information = info_org_869_raeuber_trade_info;
	permanent = 1;
	trade = 1;
	description = "Ты что-нибудь продаешь?";
};


func int info_org_869_raeuber_trade_condition()
{
	return 1;
};

func void info_org_869_raeuber_trade_info()
{
	AI_Output(other,self,"Info_Org_869_Raeuber_TRADE_15_00");	//Ты что-нибудь продаешь?
	AI_Output(self,other,"Info_Org_869_Raeuber_TRADE_13_00");	//Да, у меня есть куча товара с нашего склада.
	if(MIGUEL_TRADED == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Франко занимается торговлей в лагере бандитов.");
		MIGUEL_TRADED = TRUE;
	};
};

