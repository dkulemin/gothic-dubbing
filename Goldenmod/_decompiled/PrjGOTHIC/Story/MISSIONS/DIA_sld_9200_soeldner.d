
instance SLD_9200_SOELDNER_EXIT(C_Info)
{
	npc = sld_9200_soeldner;
	nr = 999;
	condition = sld_9200_soeldner_exit_condition;
	information = sld_9200_soeldner_exit_info;
	important = 0;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int sld_9200_soeldner_exit_condition()
{
	return TRUE;
};

func void sld_9200_soeldner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_9200_SOELDNER_ABANDONEDMINE(C_Info)
{
	npc = sld_9200_soeldner;
	nr = 1;
	condition = sld_9200_soeldner_abandonedmine_condition;
	information = sld_9200_soeldner_abandonedmine_info;
	permanent = 1;
	important = 0;
	description = "Здесь не происходило ничего необычного?";
};


func int sld_9200_soeldner_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_abandonedmine))
	{
		return TRUE;
	};
};

func void sld_9200_soeldner_abandonedmine_info()
{
	AI_Output(other,self,"SLD_9200_Soeldner_ABANDONEDMINE_15_00");	//Здесь не происходило ничего необычного?
	AI_Output(self,other,"SLD_9200_Soeldner_ABANDONEDMINE_10_00");	//Еще нет.
};


instance SLD_9200_SOELDNER_PRE_ABANDONEDMINE(C_Info)
{
	npc = sld_9200_soeldner;
	nr = 1;
	condition = sld_9200_soeldner_pre_abandonedmine_condition;
	information = sld_9200_soeldner_pre_abandonedmine_info;
	permanent = 1;
	important = 0;
	description = "Что ты здесь делаешь?";
};


func int sld_9200_soeldner_pre_abandonedmine_condition()
{
	if(!Npc_KnowsInfo(hero,info_saturas_abandonedmine))
	{
		return TRUE;
	};
};

func void sld_9200_soeldner_pre_abandonedmine_info()
{
	AI_Output(other,self,"DIA_ARTO_What_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"SLD_9200_Soeldner_Pre_ABANDONEDMINE_10_00");	//Я убиваю падальщиков и других тварей, если они нападают на скребков.
};

