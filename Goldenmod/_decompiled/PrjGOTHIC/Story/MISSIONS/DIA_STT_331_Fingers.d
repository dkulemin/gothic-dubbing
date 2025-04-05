
instance DIA_STT_331_Fingers_Exit(C_Info)
{
	npc = STT_331_Fingers;
	nr = 999;
	condition = DIA_STT_331_Fingers_Exit_Condition;
	information = DIA_STT_331_Fingers_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

func void DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Fingers_CanTeach;

instance DIA_Fingers_BecomeShadow(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_BecomeShadow_Condition;
	information = DIA_Fingers_BecomeShadow_Info;
	permanent = 1;
	description = "Я хочу стать Призраком!";
};


func int DIA_Fingers_BecomeShadow_Condition()
{
	if((Fingers_CanTeach == FALSE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_BecomeShadow_Info()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00");	//Я хочу стать Призраком!
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01");	//И что с того?
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
	Info_AddChoice(DIA_Fingers_BecomeShadow,DIALOG_BACK,DIA_Fingers_BecomeShadow_BACK);
	if(Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice(DIA_Fingers_BecomeShadow,"Мне нужно чему-нибудь научиться. ",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice(DIA_Fingers_BecomeShadow,"Ты можешь мне помочь?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00");	//Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01");	//Если бы я знал, как...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00");	//Мне нужно чему-нибудь научиться.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01");	//Кто прислал тебя ко мне?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02");	//Диего.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03");	//С этого нужно было начинать.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04");	//Если хочешь присоединиться к этому Лагерю, ты должен быть хорошим бойцом - или хорошим вором.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05");	//Призраки буду испытывать тебя. Они дадут задание, на котором ты не должен попасться.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06");	//Поэтому начать тебе стоит с воровской науки.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07");	//Так уж получилось, что я - лучший вор во всем Старом Лагере.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Фингерс может обучить карманным кражам и вскрыванию замков.");
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};


var int Fingers_Wherecavalorn;

instance DIA_Fingers_Lehrer(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Lehrer_Condition;
	information = DIA_Fingers_Lehrer_Info;
	permanent = 1;
	description = "Чему ты можешь меня научить?";
};


func int DIA_Fingers_Lehrer_Condition()
{
	if(Fingers_CanTeach == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_Lehrer_Info()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00");	//Чему ты можешь меня научить?
	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02");	//Это зависит от того, что ты хочешь узнать.
	Info_ClearChoices(DIA_Fingers_Lehrer);
	Info_AddChoice(DIA_Fingers_Lehrer,DIALOG_BACK,DIA_Fingers_Lehrer_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Fingers_Lehrer_Pickpocket2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Fingers_Lehrer_Pickpocket);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),DIA_Fingers_Lehrer_Lockpick2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),DIA_Fingers_Lehrer_Lockpick);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,"Я хочу научиться передвигаться без шума. ",DIA_Fingers_Lehrer_Schleichen);
	};
};

func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00");	//Я хочу научиться передвигаться без шума.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01");	//Скажу без ложной скромности, что я - один из лучших воров, которых забрасывали в эту колонию.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02");	//Но когда речь идет об обучении искусству красться, тебе лучше обратиться к Кавалорну.
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00");	//Как научиться работать с отмычкой?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01");	//Хочешь узнать, а? Это не так уж сложно для новичка.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02");	//Прежде всего нужно следить за тем, чтобы не сломать отмычку.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03");	//В будущем, когда у тебя будет побольше терпения и опыта, поймешь, что куча отмычек тебе просто не нужна.
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00");	//Работа взломщика мне по душе. Я хочу стать экспертом!
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01");	//Когда поднаберешься опыта, начнешь чувствовать момент, когда отмычка готова вот-вот сломаться. У нее тогда звук меняется!
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02");	//Думаю, у тебя получится. Приучай себя вслушиваться в тихое пощелкивание замка, и в будущем ты сбережешь себе кучу отмычек.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03");	//У настоящего профессионала всегда есть шанс открыть сундук, не испортив при этом инструмент.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00");	//Я хочу стать опытным карманником.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01");	//Собираешься избавлять народ от его сбережений? Ладно.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02");	//Я помогу улучшить твои навыки, но шанс, что тебя поймают, все равно велик.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03");	//Рисковать стоит лишь в том случае, когда кроме твоей жертвы никого нет поблизости.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04");	//Только эксперт может шарить по карманам так, что человек ничего не заметит.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05");	//Забудь об этом! Ты никогда не станешь опытным вором, пока не научишься бесшумно передвигаться.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00");	//Работа карманника мне по душе. Я хочу стать экспертом!
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01");	//Думаю, ты уже достаточно опытен, чтобы постичь последние тонкости этого ремесла.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02");	//Но ты должен знать, что время от времени попадаются даже лучшие из лучших.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//Береги себя.
	};
};

func void DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Fingers_Lehrer);
};


instance DIA_Fingers_WhereCavalorn(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_WhereCavalorn_Condition;
	information = DIA_Fingers_WhereCavalorn_Info;
	permanent = 0;
	description = "Где мне искать Кавалорна?";
};


func int DIA_Fingers_WhereCavalorn_Condition()
{
	if(Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00");	//Где мне искать Кавалорна?
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01");	//Он промышляет не здесь. Ты найдешь его на пути к Новому Лагерю. К западу от Старого Лагеря, там, где широкое ущелье.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02");	//В этом ущелье есть старая хижина лесорубов. Он живет там.
	B_LogEntry(GE_TeacherOW,"Кавалорн может научить меня подкрадываться. Его хижина находится в каньоне к западу от Старого Лагеря.");
};


var int Fingers_Learnt;

instance DIA_Fingers_Learnt(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Learnt_Condition;
	information = DIA_Fingers_Learnt_Info;
	permanent = 1;
	description = "Ты ведь замолвишь за меня словечко перед Диего?";
};


func int DIA_Fingers_Learnt_Condition()
{
	if((Fingers_Learnt != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_Learnt_Info()
{
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00");	//Ты ведь замолвишь за меня словечко перед Диего?
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) + Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) + Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) > 0)
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01");	//Да. Ты уже многому научился и сможешь принести пользу этому Лагерю.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02");	//Нам нужны опытные воры. Я поддержу тебя.
		Fingers_Learnt = LOG_SUCCESS;
		if(FWV_B == FALSE)
		{
			B_GiveXP(XP_Fingerstrain);
			B_LogEntry(CH1_JoinOC,"Фингерс остался доволен тем, как я справился.");
			FWV_B = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03");	//Ну...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04");	//Если ты докажешь, что чего-то стоишь как вор, мы найдем для тебя дело!
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05");	//Как это сделать?
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06");	//Учись воровскому делу! Когда у тебя будет больше опыта в искусстве передвигаться бесшумно, в работе с отмычкой и в деле карманника, я поддержу тебя.
		Fingers_Learnt = LOG_RUNNING;
		if(FWV_A == FALSE)
		{
			B_LogEntry(CH1_JoinOC,"Фингерс выскажется в мою пользу, как только я овладею одним из воровских умений.");
			FWV_A = TRUE;
		};
	};
};


instance DIA_FINGERS_GILBERT(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_gilbert_condition;
	information = dia_fingers_gilbert_info;
	permanent = 0;
	description = "Ты можешь что-нибудь сказать про этот ключ?";
};


func int dia_fingers_gilbert_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert_key) && (GILBERT_OC == TRUE) && (Npc_HasItems(hero,ItKe_OB_Smith_01) == 1))
	{
		return 1;
	};
};

func void dia_fingers_gilbert_info()
{
	AI_Output(other,self,"DIA_Fingers_Gilbert_15_00");	//Ты можешь что-нибудь сказать про этот ключ?
	AI_Output(self,other,"DIA_Fingers_Gilbert_05_01");	//Хм. Дай-ка мне его.
	B_GiveInvItems(other,self,ItKe_OB_Smith_01,1);
	AI_Output(self,other,"DIA_Fingers_Gilbert_05_02");	//Так посмотрим... Ммм, очень интересно.
	AI_Output(self,other,"DIA_Fingers_Gilbert_05_03");	//Этот ключ длинее и тоньше ключей, которыми открывают сундуки. К тому же вот эта бороздка...
	AI_Output(other,self,"DIA_Fingers_Gilbert_15_01");	//(перебивает) Можно покороче?
	AI_Output(self,other,"DIA_Fingers_Gilbert_05_04");	//Хорошо. Я думаю этот ключ открывает какую-то дверь.
	B_GiveXP(50);
	B_GiveInvItems(self,other,ItKe_OB_Smith_01,1);
	AI_Output(other,self,"DIA_Fingers_Gilbert_15_02");	//Спасибо за помощь.
	B_LogEntry(CH1_GILBERT,"Фингерс сказал, что этот ключ должен открыть какую-то дверь.");
};

