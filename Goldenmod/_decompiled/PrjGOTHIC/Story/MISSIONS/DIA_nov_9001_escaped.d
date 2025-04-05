
instance NOV_9001_ESCAPED_EXIT(C_Info)
{
	npc = nov_9001_escaped;
	nr = 999;
	condition = nov_9001_escaped_exit_condition;
	information = nov_9001_escaped_exit_info;
	important = 1;
	permanent = 1;
};


func int nov_9001_escaped_exit_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void nov_9001_escaped_exit_info()
{
	AI_Output(other,self,"Nov_9001_Escaped_Exit_Info_15_00");	//Эй!
	AI_Output(self,other,"Nov_9001_Escaped_Exit_Info_01_00");	//Даже не пытайся вернуть меня в лагерь.
	AI_StopProcessInfos(self);
};

