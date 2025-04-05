
instance DIA_Scatty_Exit(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 999;
	condition = DIA_Scatty_Exit_Condition;
	information = DIA_Scatty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Scatty_Exit_Condition()
{
	return 1;
};

func void DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Scatty_WhatDoYouDo(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WhatDoYouDo_Condition;
	information = DIA_Scatty_WhatDoYouDo_Info;
	permanent = 0;
	description = "Чем ты занимаешься?";
};


func int DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

func void DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00");	//В чем заключается твоя работа?
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01");	//Я отвечаю за арену - организую ставки, нанимаю новых бойцов... и все такое.
};


var int Scatty_ChargeKirgo;
var int Scatty_ChargeKharim;
var int Scatty_ChargeGorHanis;

instance DIA_Scatty_JoinOC(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_JoinOC_Condition;
	information = DIA_Scatty_JoinOC_Info;
	permanent = 0;
	description = "Я хочу присоединиться к этому Лагерю. Ты можешь мне помочь?";
};


func int DIA_Scatty_JoinOC_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void DIA_Scatty_JoinOC_Info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00");	//Я хочу присоединиться к этому Лагерю. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01");	//Мог бы, если тебе удастся произвести на меня впечатление.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02");	//Здесь соревнуются лучшие бойцы всех трех Лагерей.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03");	//Вызови на бой одного из них. Поглядим, насколько ты хорош, и, может быть, я подумаю о твоей просьбе.
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	B_LogEntry(CH1_JoinOC,"На Скатти, мастера арены, произведет впечатление, если я вызову на бой одного из воинов.");
};


instance DIA_Scatty_KirgoSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KirgoSuccess_Condition;
	information = DIA_Scatty_KirgoSuccess_Info;
	permanent = 0;
	description = "Я дрался с Кирго!";
};


func int DIA_Scatty_KirgoSuccess_Condition()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	if((Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KirgoSuccess_Info()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00");	//Я дрался с Кирго!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//Да, и проиграл!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02");	//Думаю, ты не надеялся удивить меня этим...
		Scatty_ChargeKirgo = LOG_FAILED;
		B_LogEntry(CH1_JoinOC,"Победа Кирго надо мной вряд ли произвела на Скатти впечатление.");
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03");	//И ты победил его! Совсем неплохо для новичка! Я удивлен!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Мой бой против Кирго произвел на Скатти впечатление.");
		B_GiveXP(XP_kirgovictory);
	};
};


instance DIA_Scatty_KHARIMSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KHARIMSuccess_Condition;
	information = DIA_Scatty_KHARIMSuccess_Info;
	permanent = 0;
	description = "Я сражался с Харимом!";
};


func int DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	if((Scatty_ChargeKharim == LOG_RUNNING) && (Kharim_Charged == TRUE) && ((Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KHARIMSuccess_Info()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00");	//Я сражался с Харимом!
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01");	//Да, и он надрал тебе задницу!
		if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02");	//Ты правильно выбрал противника. Нельзя терпеть этих ублюдков из Нового Лагеря.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03");	//Похоже, ты это понимаешь - как раз такие люди нужны нам!
		};
		Scatty_ChargeKharim = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry(CH1_JoinOC,"Харим побил меня! Моя смелость понравилась Скатти, но вот мой бой - нет.");
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//И ты победил его! Должен признать, это было неплохо. Его всегда считали одним из лучших бойцов.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05");	//Ты удивил меня!
		Scatty_ChargeKharim = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Я надавал Хариму! Скатти остался под впечатлением.");
		B_GiveXP(XP_kharimvictory);
	};
};


instance DIA_SCATTY_GORHANISSUCCESS(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_gorhanissuccess_condition;
	information = dia_scatty_gorhanissuccess_info;
	permanent = 0;
	description = "Я дрался с Гор Ханисом!";
};


func int dia_scatty_gorhanissuccess_condition()
{
	var C_Npc GorHanis;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((GORHANIS_OK == TRUE) && ((GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (GorHanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_gorhanissuccess_info()
{
	var C_Npc GorHanis;
	var C_Npc fletcher;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Scatty_GorHanisSuccess_15_00");	//Я дрался с Гор Ханисом!
	fletcher = Hlp_GetNpc(GRD_255_Fletcher);
	Npc_SetTrueGuild(self,GIL_GRD);
	self.guild = GIL_GRD;
	Npc_SetTrueGuild(fletcher,GIL_GRD);
	fletcher.guild = GIL_GRD;
	if(GorHanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_GorHanisSuccess_01_01");	//И ты проиграл!
		Log_SetTopicStatus(CH1_FLETCHER,LOG_FAILED);
		Scatty_ChargeGorHanis = LOG_FAILED;
		B_LogEntry(CH1_FLETCHER,"Я проиграл бой с Гор Ханису. Теперь Флетчер остался совсем без руды.");
	}
	else if(GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_GorHanisSuccess_01_02");	//Да, и ты победил!
		B_GiveXP(500);
		B_LogEntry(CH1_FLETCHER,"Я победил Гор Ханиса.");
		GORHANIS_SUCCESS = TRUE;
		SCATTY_OK = FALSE;
		GORHANIS_OK = FALSE;
		Scatty_ChargeGorHanis = LOG_SUCCESS;
		CreateInvItems(GRD_255_Fletcher,ItMiNugget,350);
		if(SCATTYNUGGESTOK == TRUE)
		{
			AI_Output(self,other,"DIA_Scatty_GorHanisSuccess_01_03");	//Ты сделал ставку. Вот твоя руда.
			if(SCATTYNUGGEST_A == TRUE)
			{
				B_GiveInvItems(self,hero,ItMiNugget,1500);
			}
			else if(SCATTYNUGGEST_B == TRUE)
			{
				B_GiveInvItems(self,hero,ItMiNugget,1000);
			}
			else
			{
				B_GiveInvItems(self,hero,ItMiNugget,500);
			};
			SCATTYNUGGESTOK = FALSE;
		};
	};
};


instance DIA_Scatty_OtherCamps(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_OtherCamps_Condition;
	information = DIA_Scatty_OtherCamps_Info;
	permanent = 0;
	description = "Почему ты позволяешь бойцам из других Лагерей драться здесь?";
};


func int DIA_Scatty_OtherCamps_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_OtherCamps_Info()
{
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00");	//Мне казалось, что Новый Лагерь и Старый Лагерь не очень-то ладят между собой - так почему же ты позволяешь этим людям сражаться здесь?
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01");	//Все очень просто: они дерутся здесь один раз в неделю, и рудокопам очень нравится смотреть, как раскатывают по земле воров из Нового Лагеря.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02");	//Когда дерется один из них, люди делают больше ставок - и это, как ты понимаешь, совсем не плохо.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03");	//Лично я терпеть не могу этих наглецов из Нового Лагеря - но бизнес есть бизнес...
};


instance DIA_Scatty_WannaBet(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaBet_Condition;
	information = DIA_Scatty_WannaBet_Info;
	permanent = 1;
	description = "Я хочу сделать ставку.";
};


func int DIA_Scatty_WannaBet_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaBet_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00");	//Я хочу сделать ставку.
	if(SCATTY_OK == TRUE)
	{
		AI_Output(other,self,"DIA_Scatty_WannaBet_15_01");	//Я собираюсь драться с Гор Ханисом.
	};
	if(SCATTY_OK == FALSE)
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_01");	//Но сейчас же никто не дерется.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_02");	//Следующий бой состоится через несколько дней. Будет дополнительное сообщение.
	}
	else if(SCATTYNUGGESTOK == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_03");	//Ты не можешь 2 раза поставить на один и тотже бой.
	}
	else if(SCATTYNUGGESTNO == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_04");	//Ставки на этот бой больше не принимаются.
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_05");	//Поскольку ты будешь драться на арене, ты можешь поставить только на себя.
		AI_Output(other,self,"DIA_Scatty_WannaBet_15_02");	//Хорошо, я поставлю...
		Info_AddChoice(DIA_Scatty_WannaBet,"... я передумал.",dia_scatty_wannabet_no);
		if(Npc_HasItems(hero,ItMiNugget) >= 50)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"... 50 кусков руды.",dia_scatty_wannabet_c);
		};
		if(Npc_HasItems(hero,ItMiNugget) >= 100)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"... 100 кусков руды.",dia_scatty_wannabet_b);
		};
		if(Npc_HasItems(hero,ItMiNugget) >= 150)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"... 150 кусков руды.",dia_scatty_wannabet_a);
		};
	};
};

func void dia_scatty_wannabet_no()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_NO_15_00");	//... я передумал.
	Info_ClearChoices(DIA_Scatty_WannaBet);
};

func void dia_scatty_wannabet_c()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_C_15_00");	//... 50 кусков руды.
	AI_Output(self,other,"DIA_Scatty_WannaBet_С_01_00");	//А у тебя не так много руды.
	SCATTYNUGGESTOK = TRUE;
	SCATTYNUGGEST_C = TRUE;
	B_GiveInvItems(hero,self,ItMiNugget,50);
	Info_ClearChoices(DIA_Scatty_WannaBet);
};

func void dia_scatty_wannabet_b()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_B_15_00");	//... 100 кусков руды.
	AI_Output(self,other,"DIA_Scatty_WannaBet_B_01_00");	//Хорошо.
	SCATTYNUGGESTOK = TRUE;
	SCATTYNUGGEST_B = TRUE;
	B_GiveInvItems(hero,self,ItMiNugget,100);
	Info_ClearChoices(DIA_Scatty_WannaBet);
};

func void dia_scatty_wannabet_a()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_A_15_00");	//... 150 кусков руды.
	AI_Output(self,other,"DIA_Scatty_WannaBet_A_01_00");	//(удивленно) Немаленькая ставка.
	SCATTYNUGGESTOK = TRUE;
	SCATTYNUGGEST_A = TRUE;
	B_GiveInvItems(hero,self,ItMiNugget,150);
	Info_ClearChoices(DIA_Scatty_WannaBet);
};


instance DIA_Scatty_WannaFight(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaFight_Condition;
	information = DIA_Scatty_WannaFight_Info;
	permanent = 1;
	description = "Я хочу сражаться на арене!";
};


func int DIA_Scatty_WannaFight_Condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_noproblem_start) && (GORHINIS_FIGHT_OK == FALSE) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Scatty_WannaFight_Info()
{
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00");	//Я хочу сражаться на арене!
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"DIA_Scatty_WannaFight_01_01");	//Я не могу позволить тебе этого, пока ты не присоединишься к одному из Лагерей!
		AI_Output(self,other,"DIA_Scatty_WannaFight_01_02");	//Никому не нужны независимые бойцы-одиночки!
	}
	else
	{
		AI_Output(other,self,"DIA_Scatty_WannaFight_15_01");	//Флетчер поставит на меня 150 кусков руды.
		AI_Output(self,other,"DIA_Scatty_WannaFight_01_03");	//И с кем ты будешь драться?
		AI_Output(other,self,"DIA_Scatty_WannaFight_15_02");	//С Гор Ханисом.
		AI_Output(self,other,"DIA_Scatty_WannaFight_01_04");	//Хорошо, ты можешь провести этот бой.
		SCATTY_OK = TRUE;
		Npc_RemoveInvItems(GRD_255_Fletcher,ItMiNugget,150);
		Scatty_ChargeGorHanis = LOG_RUNNING;
		GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
		GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
		DIA_Scatty_WannaFight.permanent = 0;
	};
};


instance DIA_Scatty_TRAIN(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 10;
	condition = DIA_Scatty_TRAIN_Condition;
	information = DIA_Scatty_TRAIN_Info;
	permanent = 1;
	description = "А вы вообще тренируете бойцов?";
};


func int DIA_Scatty_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_TRAIN_Info()
{
	if(log_scattytrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Скатти, мастер арены, может научить меня сражаться одноручным оружием.");
		log_scattytrain = TRUE;
	};
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00");	//А вы вообще тренируете бойцов?
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01");	//Да, но не ради развлечения. Если ты хочешь, чтобы я учил тебя, тебе придется заплатить.
	Info_ClearChoices(DIA_Scatty_TRAIN);
	Info_AddChoice(DIA_Scatty_TRAIN,DIALOG_BACK,DIA_Scatty_TRAIN_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,150),DIA_Scatty_TRAIN_2h);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,50),DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Scatty_TRAIN);
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00");	//Я хотел бы потренироваться с одноручным оружием.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01");	//Хорошая мысль! Но прежде чем заниматься техникой, тебе нужно научиться правильно держать оружие.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02");	//Новички часто держатся за рукоять двумя руками. Это неправильно, к этому лучше не привыкать.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03");	//Возьмись за рукоять одной рукой. Лезвие вверх, и не держи его неподвижно.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04");	//Оружие должно стать продолжением твоей руки, вписываться в твои движения. Это поможет ускорить атаку.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05");	//Если запомнишь все, о чем я тебе говорил, твои удары станут более изящными и быстрыми.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06");	//Да, и вот еще что: некоторые удары куда эффективнее остальных. У новичка не так много шансов выполнить их.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07");	//Но чем больше ты будешь тренироваться, тем лучше они у тебя будут получаться.
			B_GiveInvItems(other,self,ItMiNugget,50);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00");	//У тебя недостаточно руды!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01");	//Расскажи мне еще что-нибудь про одноручное оружие.
	if(Npc_HasItems(other,ItMiNugget) >= 150)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02");	//Ладно, ты уже знаешь главное. Если держать клинок немного ниже, первый удар получится более сильным.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03");	//Рубящий удар, помнишь? Ладно, теперь о том, как нужно двигаться. Нанеси два удара и разворачивайся - враг наверняка растеряется, а ты окажешься в выгодном положении.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04");	//Еще один взмах клинком справа налево...
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05");	//...и возвращаешься в исходную стойку. Главное, не забывай тренироваться. Иди, отрабатывай технику.
			B_GiveInvItems(other,self,ItMiNugget,150);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00");	//Возвращайся, когда наберешь достаточно руды!
	};
};

