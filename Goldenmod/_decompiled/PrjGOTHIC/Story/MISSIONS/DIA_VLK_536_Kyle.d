
instance DIA_Kyle_Exit(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 999;
	condition = DIA_Kyle_Exit_Condition;
	information = DIA_Kyle_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Kyle_Exit_Condition()
{
	return 1;
};

func void DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);
	AI_StopProcessInfos(self);
};


instance DIA_Kyle_HutRage(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = DIA_Kyle_HutRage_Condition;
	information = DIA_Kyle_HutRage_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Kyle_HutRage_Condition()
{
	if((KYLE_NO_PROBLEM != TRUE) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Kyle_HutRage_Info()
{
	AI_Output(self,other,"DIA_Kyle_HutRage_10_00");	//Сколько раз я говорил вам, ублюдкам, не проходить через мой дом?!
};


instance DIA_Kyle_Problem(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_Problem_Condition;
	information = DIA_Kyle_Problem_Info;
	permanent = 0;
	description = "Эй, в чем проблема?";
};


func int DIA_Kyle_Problem_Condition()
{
	return 1;
};

func void DIA_Kyle_Problem_Info()
{
	AI_Output(other,self,"DIA_Kyle_Problem_15_00");	//Эй, в чем проблема?
	AI_Output(self,other,"DIA_Kyle_Problem_10_01");	//Оставь меня в покое, парень! Для МЕНЯ вы все - проблема.
	AI_Output(self,other,"DIA_Kyle_Problem_10_02");	//Как они все пялились, когда я строил свой дом!
	AI_Output(self,other,"DIA_Kyle_Problem_10_03");	//'Не строй дом так близко к котловану', - говорили они.
	AI_Output(self,other,"DIA_Kyle_Problem_10_04");	//Но ни один из этих ублюдков не сказал мне, что будет, если я все-таки построю его здесь.
	AI_Output(self,other,"DIA_Kyle_Problem_10_05");	//Когда я вернулся из шахты несколько дней назад, у меня появилась вторая дверь.
	AI_Output(self,other,"DIA_Kyle_Problem_10_06");	//Эти свиньи! Я их ненавижу! Ты даже представить себе не можешь, как я их ненавижу!
	AI_Output(self,other,"DIA_Kyle_Problem_10_07");	//Теперь все проходят через мой дом. Каждый идиот.
	Log_CreateTopic(CH1_KYLE_PROBLEM,LOG_MISSION);
	Log_SetTopicStatus(CH1_KYLE_PROBLEM,LOG_RUNNING);
	B_LogEntry(CH1_KYLE_PROBLEM,"Кто-то из рудокопов разломал стену в доме Кайли. Думаю, ему лучше переселиться в новый дом.");
};


instance DIA_KYLE_ABOUT_PROBLEM(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 3;
	condition = dia_kyle_about_problem_condition;
	information = dia_kyle_about_problem_info;
	permanent = 1;
	description = "Ты не пробовал построить другой дом?";
};


func int dia_kyle_about_problem_condition()
{
	if((KYLE_NO_PROBLEM != TRUE) && Npc_KnowsInfo(hero,DIA_Kyle_Problem))
	{
		return 1;
	};
};

func void dia_kyle_about_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_About_Problem_15_00");	//А ты не пробовал построить другой дом?
	AI_Output(self,other,"DIA_Kyle_About_Problem_10_01");	//Ты что, шутишь? В лагере осталось не так много места.
	AI_Output(self,other,"DIA_Kyle_About_Problem_10_02");	//И мне придется заплатить Гомезу, если я построю себе второй дом.
	AI_Output(self,other,"DIA_Kyle_About_Problem_10_03");	//Тогда я лучше останусь здесь.
};


instance DIA_KYLE_HELP_WITH_PROBLEM(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 4;
	condition = dia_kyle_help_with_problem_condition;
	information = dia_kyle_help_with_problem_info;
	permanent = 1;
	description = "А ты не думал переселиться в другое место?";
};


func int dia_kyle_help_with_problem_condition()
{
	if((KYLE_NO_PROBLEM != TRUE) && Npc_KnowsInfo(hero,DIA_Kyle_Problem))
	{
		return 1;
	};
};

func void dia_kyle_help_with_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_15_00");	//А ты не думал переселиться в другое место?
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_10_01");	//Да. Но я сомневаюсь, что кто-то решит поменяться со мной жильем...
	Info_AddChoice(dia_kyle_help_with_problem,"Хм... думаю ни чем не могу тебе помочь.",dia_kyle_help_with_problem_5);
	if(KYLE_TO_MUD != TRUE)
	{
		Info_AddChoice(dia_kyle_help_with_problem,"Мне кажется, можно найти дурачка, который поменяется с тобой жильем...",dia_kyle_help_with_problem_4);
	};
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_DustySuccess))
	{
		Info_AddChoice(dia_kyle_help_with_problem,"Дасти переехал в лагерь сектантов...",dia_kyle_help_with_problem_3);
	};
	Info_AddChoice(dia_kyle_help_with_problem,"Около восточных ворот есть разрушенная башня...",dia_kyle_help_with_problem_2);
	if(Npc_KnowsInfo(hero,DIA_Guy_MyOwnHut))
	{
		Info_AddChoice(dia_kyle_help_with_problem,"Около арены есть свободный дом...",dia_kyle_help_with_problem_1);
	};
};

func void dia_kyle_help_with_problem_1()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_1_15_01");	//Около арены есть свободный дом.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_1_05_02");	//Я знаю это место. Но однажды я поссорился со Скатти и не думаю, что там мне будут рады...
};

func void dia_kyle_help_with_problem_2()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_2_15_01");	//Около восточных ворот есть разрушенная башня, ты можешь жить там.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_2_05_02");	//Прекрасный вариант. Полуразрушенное жилище около мусорной свалки. Уж лучше мне остаться тут.
};

func void dia_kyle_help_with_problem_3()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_3_15_01");	//Дасти переехал в лагерь сектантов. Теперь его дом пустует.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_3_05_02");	//Это хорошая идея. Думаю, я смогу переселиться туда.
	Log_SetTopicStatus(CH1_KYLE_PROBLEM,LOG_SUCCESS);
	B_LogEntry(CH1_KYLE_PROBLEM,"Кайли переехал в пустующий дом рудокопа Дасти. Его проблема, наконец, решена.");
	KYLE_NO_PROBLEM = TRUE;
	B_GiveXP(250);
	Npc_ExchangeRoutine(self,"DUSTYAFTERSTART");
	Info_ClearChoices(dia_kyle_help_with_problem);
};

func void dia_kyle_help_with_problem_4()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_4_15_01");	//Мне кажется, что можно найти дурачка, который поменяется с тобой жильем.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_4_05_02");	//Отличная идея! Дураков тут достаточно.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_4_05_03");	//Я даже могу предложить тебе одну кандидатуру. Это Мад.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_4_05_04");	//Думаю, уговорить его просто.
	B_LogEntry(CH1_KYLE_PROBLEM,"Можно попробовать уговорить Мада обменяться домами с Кайли.");
	KYLE_TO_MUD = TRUE;
	Info_ClearChoices(dia_kyle_help_with_problem);
};

func void dia_kyle_help_with_problem_5()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_5_15_01");	//Хм... думаю ни чем не могу тебе помочь.
	Info_ClearChoices(dia_kyle_help_with_problem);
};


instance DIA_KYLE_NO_PROBLEM(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = dia_kyle_no_problem_condition;
	information = dia_kyle_no_problem_info;
	permanent = 0;
	description = "Мад согласился обменяться домами.";
};


func int dia_kyle_no_problem_condition()
{
	if((KYLE_TO_MUD == TRUE) && (KYLE_NO_PROBLEM != TRUE) && Npc_KnowsInfo(hero,DIA_Kyle_Problem) && Npc_KnowsInfo(hero,dia_mud_house))
	{
		return 1;
	};
};

func void dia_kyle_no_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_No_Problem_15_00");	//(смеется) Мад согласился обменяться домами.
	AI_Output(self,other,"DIA_Kyle_No_Problem_10_01");	//Парень, ты нашел мне жилье?
	AI_Output(other,self,"DIA_Kyle_No_Problem_15_01");	//Да, иди в дом Мада. А он поселится в твоем доме.
	AI_Output(self,other,"DIA_Kyle_No_Problem_10_02");	//Не могу поверить! Спасибо тебе!
	AI_Output(self,other,"DIA_Kyle_No_Problem_10_03");	//Вот возьми еще этот лук, я нашел на нижнем ярусе Старой шахты. Вероятно его бывшего хозяина съели ползуны.
	Log_SetTopicStatus(CH1_KYLE_PROBLEM,LOG_SUCCESS);
	B_LogEntry(CH1_KYLE_PROBLEM,"Кайли обменялся домами с Мадом. И бывают же такие люди!");
	KYLE_NO_PROBLEM = TRUE;
	B_GiveXP(300);
	CreateInvItem(self,ItRw_Bow_Small_05);
	B_GiveInvItems(self,hero,ItRw_Bow_Small_05,1);
	Npc_ExchangeRoutine(self,"AFTERSTART");
};


instance DIA_KYLE_AFTER_NO_PROBLEM(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = dia_kyle_after_no_problem_condition;
	information = dia_kyle_after_no_problem_info;
	permanent = 0;
	description = "Как тебе новый дом?";
};


func int dia_kyle_after_no_problem_condition()
{
	if((KYLE_NO_PROBLEM == TRUE) && ((Npc_GetDistToWP(self,"OCR_OUTSIDE_HUT_13") <= 1000) || (Npc_GetDistToWP(self,"OCR_OUTSIDE_HUT_58") <= 1000)))
	{
		return 1;
	};
};

func void dia_kyle_after_no_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_After_No_Problem_15_00");	//Как тебе новый дом?
	if(Npc_KnowsInfo(hero,dia_mud_house))
	{
		AI_Output(self,other,"DIA_Kyle_After_No_Problem_10_00");	//Этот дом просто прекрасен... Однако я скучаю по своей старой развалине.
	}
	else
	{
		AI_Output(self,other,"DIA_Kyle_After_No_Problem_10_01");	//Отличный дом! Нужно только навести здесь порядок.
	};
};

