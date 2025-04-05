
instance SLD_9900_SOELDNER_EXIT(C_Info)
{
	npc = sld_9900_soeldner;
	nr = 999;
	condition = sld_9900_soeldner_exit_condition;
	information = sld_9900_soeldner_exit_info;
	important = 0;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int sld_9900_soeldner_exit_condition()
{
	return TRUE;
};

func void sld_9900_soeldner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_9900_SOELDNER_ABANDONEDMINE(C_Info)
{
	npc = sld_9900_soeldner;
	nr = 1;
	condition = sld_9900_soeldner_abandonedmine_condition;
	information = sld_9900_soeldner_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9900_soeldner_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_inside_abandonedmine))
	{
		return 1;
	};
};

func void sld_9900_soeldner_abandonedmine_info()
{
	AI_Output(self,other,"SLD_9900_Soeldner_ABANDONEDMINE_08_00");	//Ты кто такой?
	AI_Output(other,self,"SLD_9900_Soeldner_ABANDONEDMINE_15_00");	//Я пришел сюда с Блейдом.
	AI_Output(self,other,"SLD_9900_Soeldner_ABANDONEDMINE_08_01");	//Блейд... проклятый трус. Когда мы сражались, он просто сбежал.
	AI_Output(other,self,"SLD_9900_Soeldner_ABANDONEDMINE_15_01");	//Кто-нибудь выжил?
	AI_Output(self,other,"SLD_9900_Soeldner_ABANDONEDMINE_08_02");	//Нет. Я один.
	AI_Output(other,self,"SLD_9900_Soeldner_ABANDONEDMINE_15_02");	//Тогда уходим отсюда!
	AI_Output(self,other,"SLD_9900_Soeldner_ABANDONEDMINE_08_03");	//Ты что, не понял? Тебе никогда не выбраться отсюда, как и мне.
	AI_Output(other,self,"SLD_9900_Soeldner_ABANDONEDMINE_15_03");	//Но почему?
	AI_Output(self,other,"SLD_9900_Soeldner_ABANDONEDMINE_08_04");	//Извини, но мне придется убить тебя. Я проклят, как и все кто ступал сюда. Я не могу иначе.
	B_LogEntry(CH4_ABANDONEDMINE,"Я встретил одержимого наемника в шахте. Он болтал что-то о проклятьи и попытался убить меня.");
	AI_StopProcessInfos(self);
	self.npcType = Npctype_ROGUE;
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

