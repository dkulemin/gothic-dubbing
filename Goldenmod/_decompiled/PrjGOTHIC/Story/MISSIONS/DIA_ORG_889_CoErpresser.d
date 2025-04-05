
instance INFO_COERPRESSER_EXIT(C_Info)
{
	npc = ORG_889_CoErpresser;
	nr = 999;
	condition = info_coerpresser_exit_condition;
	information = info_coerpresser_exit_info;
	important = 1;
	permanent = 1;
};


func int info_coerpresser_exit_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void info_coerpresser_exit_info()
{
	AI_Output(other,self,"Info_CoErpresser_Exit_Info_15_00");	//Постой!
	AI_Output(self,other,"Info_CoErpresser_Exit_Info_05_00");	//Если ты заплатил, то можешь пройти.
	AI_StopProcessInfos(self);
};

