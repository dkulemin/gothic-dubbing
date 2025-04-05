
instance INFO_ORG_864_RAEUBER_EXIT(C_Info)
{
	npc = Org_864_Raeuber;
	nr = 999;
	condition = info_org_864_raeuber_exit_condition;
	information = info_org_864_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_864_raeuber_exit_condition()
{
	return 1;
};

func void info_org_864_raeuber_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_864_RAEUBER_BDT(C_Info)
{
	npc = Org_864_Raeuber;
	nr = 998;
	condition = info_org_864_raeuber_bdt_condition;
	information = info_org_864_raeuber_bdt_info;
	permanent = 0;
	description = "Мне кажется, Квентин забирает почти все товары.";
};


func int info_org_864_raeuber_bdt_condition()
{
	if(BDT_QT == TRUE)
	{
		return 1;
	};
};

func void info_org_864_raeuber_bdt_info()
{
	AI_Output(other,self,"Info_Org_860_Renyu_BDT_15_00");	//Мне кажется, Квентин забирает почти все товары.
	AI_Output(self,other,"Info_Org_864_Raeuber_BDT_13_00");	//Мы все возмущены этим. Но еще никто не говорил с ним на эту тему.
	QUENTIN_COUNT = QUENTIN_COUNT + 1;
	B_LogEntry(CH1_BDT,"Я убедил еще одного бандита встать на нашу сторону.");
	if(QUENTIN_COUNT >= 4)
	{
		B_LogEntry(CH1_BDT,"Думаю, теперь нас поддерживает достаточно людей.");
	};
};


instance ORG_864_RAEUBER_BDT_OK(C_Info)
{
	npc = Org_864_Raeuber;
	nr = 2;
	condition = org_864_raeuber_bdt_ok_condition;
	information = org_864_raeuber_bdt_ok_info;
	permanent = 0;
	description = "Теперь Квентин будет давать вам больше товаров.";
};


func int org_864_raeuber_bdt_ok_condition()
{
	if(Npc_KnowsInfo(hero,org_858_quentin_qt_ok))
	{
		return TRUE;
	};
};

func void org_864_raeuber_bdt_ok_info()
{
	AI_Output(other,self,"Org_864_Raeuber_BDT_OK_15_00");	//Теперь Квентин будет давать вам больше товаров.
	AI_Output(self,other,"Org_864_Raeuber_BDT_OK_13_00");	//Хорошо, возьми бутылку шнапса.
	B_GiveXP(50);
	B_GiveInvItems(self,hero,ItFoBooze,1);
};

