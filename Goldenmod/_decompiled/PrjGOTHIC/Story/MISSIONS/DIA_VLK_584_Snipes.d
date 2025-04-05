
instance VLK_584_Snipes_Exit(C_Info)
{
	npc = VLK_584_Snipes;
	nr = 999;
	condition = VLK_584_Snipes_Exit_Condition;
	information = VLK_584_Snipes_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

func void VLK_584_Snipes_Exit_Info()
{
	AI_Output(other,self,"Info_Exit_Info_15_001");	//Увидимся!
	AI_Output(self,other,"Info_Exit_Info_07_02");	//Да, конечно.
	AI_StopProcessInfos(self);
};


instance VLK_584_Snipes_DEAL(C_Info)
{
	npc = VLK_584_Snipes;
	condition = VLK_584_Snipes_DEAL_Condition;
	information = VLK_584_Snipes_DEAL_Info;
	important = 0;
	permanent = 0;
	description = "Как жизнь?";
};


func int VLK_584_Snipes_DEAL_Condition()
{
	return 1;
};

func void VLK_584_Snipes_DEAL_Info()
{
	AI_Output(other,self,"VLK_584_Snipes_DEAL_Info_15_01");	//Как дела?
	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_02");	//У меня есть для тебя работенка.
	AI_Output(self,other,"VLK_584_Snipes_DEAL_Info_07_03");	//Если ты отвлечешь Арона от сундука, я дам тебе 10 кусков руды.
	Snipes_deal = LOG_RUNNING;
	Log_CreateTopic(CH2_SnipesDeal,LOG_MISSION);
	Log_SetTopicStatus(CH2_SnipesDeal,LOG_RUNNING);
	B_LogEntry(CH2_SnipesDeal,"Рудокоп Снайпс предложил мне 10 кусков руды, чтобы я отвадил стража Арона от его сундука.");
};


instance VLK_584_Snipes_DEAL_RUN(C_Info)
{
	npc = VLK_584_Snipes;
	condition = VLK_584_Snipes_DEAL_RUN_Condition;
	information = VLK_584_Snipes_DEAL_RUN_Info;
	important = 0;
	permanent = 0;
	description = "Ты должен мне 10 кусков!";
};


func int VLK_584_Snipes_DEAL_RUN_Condition()
{
	if(Snipes_deal == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void VLK_584_Snipes_DEAL_RUN_Info()
{
	AI_Output(other,self,"VLK_584_Snipes_DEAL_RUN_Info_15_01");	//Ты должен мне 10 кусков!
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_02");	//Вот, ты заслужил их.
	AI_Output(self,other,"VLK_584_Snipes_DEAL_RUN_Info_07_03");	//Да, и вот еще что. У меня есть ключ от его сундука. Для тебя... Всего за 30 кусков!
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	CreateInvItem(self,ItKe_OM_02);
	B_GiveXP(XP_LureAaronAway);
	B_LogEntry(CH2_SnipesDeal,"Еще за 30 кусков Снайпс предложил мне ключ к сундуку Арона.");
};


instance VLK_584_Snipes_DEAL_2(C_Info)
{
	npc = VLK_584_Snipes;
	condition = VLK_584_Snipes_DEAL_2_Condition;
	information = VLK_584_Snipes_DEAL_2_Info;
	important = 0;
	permanent = 1;
	description = "(купить ключ)";
};


func int VLK_584_Snipes_DEAL_2_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_584_Snipes_DEAL_RUN) && Npc_HasItems(self,ItKe_OM_02))
	{
		return 1;
	};
};

func void VLK_584_Snipes_DEAL_2_Info()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 30)
	{
		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_01");	//Я покупаю ключ.
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_02");	//Хорошая сделка.
		AI_Output(other,self,"VLK_584_Snipes_DEAL_2_Info_15_03");	//Одно только меня смущает: что с этого получаешь ты?
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_04");	//Всегда приятно надуть стражников. А если они найдут у меня свое барахло, я покойник.
		B_GiveInvItems(hero,self,ItMiNugget,30);
		B_GiveInvItems(self,hero,ItKe_OM_02,1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
		B_LogEntry(CH2_SnipesDeal,"Я купил у Снайпса ключ к сундуку! Интересно, что будет делать Арон, когда я расскажу ему об этом?");
	}
	else
	{
		AI_Output(self,other,"VLK_584_Snipes_DEAL_2_Info_07_05");	//Я сказал: 30 кусков! Ключ против руды!
	};
};

