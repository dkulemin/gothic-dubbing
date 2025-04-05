
instance NOV_9000_ESCAPED_EXIT(C_Info)
{
	npc = nov_9000_escaped;
	nr = 1;
	condition = nov_9000_escaped_exit_condition;
	information = nov_9000_escaped_exit_info;
	important = 1;
	permanent = 1;
};


func int nov_9000_escaped_exit_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_KnowsInfo(hero,nov_9000_escaped_amulette) || !Npc_KnowsInfo(hero,info_yberion_nov_away)))
	{
		return 1;
	};
};

func void nov_9000_escaped_exit_info()
{
	AI_Output(other,self,"Nov_9000_Escaped_Exit_Info_15_00");	//Постой!
	AI_Output(self,other,"Nov_9000_Escaped_Exit_Info_03_00");	//Я останусь здесь! Я больше не хочу слушать росказни этих гуру.
	AI_StopProcessInfos(self);
};


instance DIA_NOV_9000_ESCAPED_EXIT(C_Info)
{
	npc = nov_9000_escaped;
	nr = 999;
	condition = dia_nov_9000_escaped_exit_condition;
	information = dia_nov_9000_escaped_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_nov_9000_escaped_exit_condition()
{
	if(!Npc_KnowsInfo(hero,nov_9000_escaped_amulette))
	{
		return 1;
	};
};

func void dia_nov_9000_escaped_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NOV_9000_ESCAPED_AMULETTE(C_Info)
{
	npc = nov_9000_escaped;
	nr = 1;
	condition = nov_9000_escaped_amulette_condition;
	information = nov_9000_escaped_amulette_info;
	permanent = 0;
	description = "Вы сбежали из лагеря!";
};


func int nov_9000_escaped_amulette_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(hero,info_yberion_nov_away))
	{
		return 1;
	};
};

func void nov_9000_escaped_amulette_info()
{
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_Info_15_00");	//Вы сбежали из лагеря!
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_Info_03_00");	//Мы больше не служим Спящему. Мы ушли из братства.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_Info_03_01");	//Тебе нечего здесь делать!
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_Info_15_01");	//Я только хочу вернуть амулет, который вы украли у господина Ю'Бериона.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_Info_03_02");	//Ты его не получишь!
	Info_AddChoice(nov_9000_escaped_amulette,"Тогда я заберу амулет силой!",nov_9000_escaped_amulette_c);
	Info_AddChoice(nov_9000_escaped_amulette,"Мне придется сказать гуру, где вы находитесь.",nov_9000_escaped_amulette_b);
	Info_AddChoice(nov_9000_escaped_amulette,"Я куплю амулет.",nov_9000_escaped_amulette_a);
};

func void nov_9000_escaped_amulette_a()
{
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_A_15_00");	//Я куплю амулет.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_A_03_00");	//Он стоит 600 кусков руды.
	if(Npc_HasItems(hero,ItMiNugget) >= 600)
	{
		AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//Беру.
		AI_Output(self,other,"Nov_9000_Escaped_Amulette_A_03_01");	//Только не говори Ю'Бериону, где мы находимся.
		B_GiveXP(200);
		B_LogEntry(CH4_YBERION_AMULETTE,"Я нашел сбежавших послушников. За амулет пришлось выложить кучу руды.");
		B_GiveInvItems(hero,self,ItMiNugget,600);
		B_GiveInvItems(self,hero,yberion_magic_amulette,1);
		self.flags = 0;
		Info_ClearChoices(nov_9000_escaped_amulette);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"Nov_9000_Escaped_Amulette_A_15_02");	//У меня не хватает руды, ты не можешь снизить цену?
		AI_Output(self,other,"Nov_9000_Escaped_Amulette_A_03_02");	//Нет, амулет останется у меня.
	};
};

func void nov_9000_escaped_amulette_b()
{
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_B_15_00");	//Мне придется сказать гуру, где вы находитесь.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_B_03_00");	//(испуганно) Нет, не надо! Только не говори гуру.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_B_03_01");	//Вот амулет и еще 2 кольца, которые мы взяли из сундука.
	B_GiveXP(300);
	B_LogEntry(CH4_YBERION_AMULETTE,"Я нашел сбежавших послушников. Они сами отдали мне амулет, но просили не говорить гуру, где они скрываются.");
	B_GiveInvItems(self,hero,yberion_magic_amulette,1);
	B_GiveInvItems(self,hero,Ring_der_Magie,1);
	B_GiveInvItems(self,hero,Machtring,1);
	self.flags = 0;
	Info_ClearChoices(nov_9000_escaped_amulette);
	AI_StopProcessInfos(self);
};

func void nov_9000_escaped_amulette_c()
{
	var C_Npc escapednov;
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_C_15_00");	//Тогда я заберу амулет силой!
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_C_03_00");	//(разозлившись) Попробуй!
	B_GiveXP(100);
	B_LogEntry(CH4_YBERION_AMULETTE,"Я нашел сбежавших послушников, но амулет без боя забрать похоже не удасться.");
	self.flags = 0;
	Info_ClearChoices(nov_9000_escaped_amulette);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	escapednov = Hlp_GetNpc(nov_9001_escaped);
	Npc_SetTarget(escapednov,other);
	AI_StartState(escapednov,ZS_Attack,1,"");
	AI_StartState(self,ZS_Attack,1,"");
};

