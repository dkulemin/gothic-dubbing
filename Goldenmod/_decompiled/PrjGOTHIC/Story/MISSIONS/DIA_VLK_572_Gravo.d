
instance DIA_Gravo_Exit(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 999;
	condition = DIA_Gravo_Exit_Condition;
	information = DIA_Gravo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gravo_Exit_Condition()
{
	return 1;
};

func void DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gravo_Hallo(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_Hallo_Condition;
	information = DIA_Gravo_Hallo_Info;
	permanent = 0;
	description = "Как идут дела?";
};


func int DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func void DIA_Gravo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_01");	//С тех пор как я перестал гнуть спину на шахте, пожаловаться не на что.
	AI_Output(other,self,"DIA_Gravo_Hallo_15_02");	//На что же ты живешь?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_03");	//Я помогаю людям решать их проблемы.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_04");	//Если ты перейдешь дорогу кому-нибудь из больших шишек здесь, в Лагере, я постараюсь уладить это.
};


instance DIA_Gravo_HelpHow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpHow_Condition;
	information = DIA_Gravo_HelpHow_Info;
	permanent = 0;
	description = "То есть, если возникнут проблемы, ты сможешь помочь? Но как?";
};


func int DIA_Gravo_HelpHow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpHow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00");	//То есть, если возникнут проблемы, ты сможешь помочь? Но как?
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01");	//Ну, допустим, ты поссорился с Торусом. Вообще-то, ссориться с ним совсем не стоит, но не будем зарекаться.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02");	//Торус у нас довольно упрямый: если ты хоть один раз подвел его, он ставит на тебе крест. А это плохо.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03");	//Ты новичок, ты от него зависишь. И вот ты приходишь ко мне и просишь помочь. А я знаю многих людей, к чьему мнению Торус прислушивается.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04");	//Они замолвят за тебя словечко, и вот вы с Торусом снова друзья. Разумеется, делать они это будут не бесплатно, так что тебе придется раскошелиться.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05");	//Ну а я забочусь о том, чтобы твоя руда попала в нужные руки...
	B_LogEntry(GE_TraderOC,"Рудокоп Граво предлагает специальные услуги. Если я попаду в неприятности в Лагере, то я могу заплатить ему за их решение.");
};

func void B_Gravo_HelpAttitude(var C_Npc prob)
{
	if(Npc_GetPermAttitude(prob,other) == ATT_ANGRY)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00");	//Да, ты у него на плохом счету.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01");	//Есть у меня пара человек... В общем, за 100 кусков руды можно решить эту проблему.
		if(Npc_HasItems(other,ItMiNugget) >= 100)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02");	//Посмотрим, что у тебя есть... Ага! Этого должно хватить. Можешь считать, что вопрос решен.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03");	//И никому не говори об этом! Веди себя так, будто ничего не случилось.
			B_GiveInvItems(hero,self,ItMiNugget,100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня столько нет...
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Мне очень жаль, парень, но тогда я ничего не смогу для тебя сделать.
		};
	}
	else if(Npc_GetPermAttitude(prob,other) == ATT_HOSTILE)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00");	//И ты называешь это 'проблемой'?! Слабо сказано, приятель! За это он порубит тебя на куски.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01");	//Убедить людей встать на твою защиту в таком деле - это будет нелегко. И недешево. Готовь как минимум пять сотен.
		if(Npc_HasItems(other,ItMiNugget) >= 500)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02");	//Посмотрим, что у тебя есть... Парень, да ты богат! Я забираю 500 кусков и улаживаю твою проблему.
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03");	//И запомни: никто не должен об этом знать.
			B_GiveInvItems(hero,self,ItMiNugget,500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//У меня столько нет...
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Мне очень жаль, парень, но тогда я ничего не смогу для тебя сделать.
		};
	}
	else
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00");	//Насколько мне известно, у вас и так все в порядке. Не волнуйся попусту, парень.
	};
};


instance DIA_Gravo_HelpAngryNow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpAngryNow_Condition;
	information = DIA_Gravo_HelpAngryNow_Info;
	permanent = 1;
	description = "Кажется, у меня возникла проблема. Ты можешь мне помочь?";
};


func int DIA_Gravo_HelpAngryNow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//Кажется, у меня возникла проблема. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//Думаю, что да. Но моя помощь стоит недешево - от 100 до 500 кусков руды.
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,DIALOG_BACK,DIA_Gravo_HelpAngryNow_BACK);
	if(THORUS_GILBERT_OC == TRUE)
	{
		Info_AddChoice(DIA_Gravo_HelpAngryNow,"Торус сильно разозлился на меня.",dia_gravo_helpangrynow_gilbert);
	};
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Я поссорился с Диего.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Я поссорился с Торусом.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Я поссорился с Гомезом.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void dia_gravo_helpangrynow_gilbert()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gilbert_15_00");	//Торус сильно разозлился на меня.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gilbert_04_01");	//Я могу решить эту проблему за 300 кусков руды.
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Это слишком дорого для меня.",dia_gravo_helpangrynow_gilbert_no);
	if(Npc_HasItems(hero,ItMiNugget) >= 300)
	{
		Info_AddChoice(DIA_Gravo_HelpAngryNow,"Хорошо, вот руда.",dia_gravo_helpangrynow_gilbert_yes);
	};
};

func void dia_gravo_helpangrynow_gilbert_yes()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gilbertt_YES_15_00");	//Хорошо, вот руда.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Gilbertt_YES_04_01");	//Я поговорю с Торусом.
	B_GiveInvItems(other,self,ItMiNugget,300);
	THORUS_GILBERT_OC = FALSE;
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void dia_gravo_helpangrynow_gilbert_no()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gilbert_NO_15_00");	//Это слишком дорого для меня.
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	var C_Npc diego;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00");	//Я поссорился с Диего.
	diego = Hlp_GetNpc(PC_Thief);
	B_Gravo_HelpAttitude(diego);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	var C_Npc Thorus;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00");	//Я поссорился с Торусом.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	B_Gravo_HelpAttitude(Thorus);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	var C_Npc Gomez;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00");	//Я поссорился с Гомезом.
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	B_Gravo_HelpAttitude(Gomez);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};


instance DIA_Gravo_Influence(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 2;
	condition = DIA_Gravo_Influence_Condition;
	information = DIA_Gravo_Influence_Info;
	permanent = 1;
	description = "Ты можешь сказать мне, кто из Призраков здесь самый главный?";
};


func int DIA_Gravo_Influence_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_Influence_Info()
{
	AI_Output(other,self,"DIA_Gravo_Influence_15_00");	//Ты можешь сказать мне, кто из Призраков здесь самый главный?
	AI_Output(self,other,"DIA_Gravo_Influence_04_01");	//Хочешь произвести впечатление на нужных людей, а?
	AI_Output(self,other,"DIA_Gravo_Influence_04_02");	//Главный среди Призраков - Диего. Он доверяет Фингерсу, Уистлеру и Слаю.
	AI_Output(self,other,"DIA_Gravo_Influence_04_03");	//Декстер и Фиск продают свой товар на рыночной площади. Среди их покупателей попадаются даже стражники, так что их тоже можно назвать влиятельными людьми.
	AI_Output(self,other,"DIA_Gravo_Influence_04_04");	//Еще есть Скатти. Он присматривает за ареной и назначает бои. Здесь многие должны ему, так что он тоже важная персона.
	if(STT_MAIN == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Декстер и Фиск торгуют различными товарами на рыночной площади.");
		STT_MAIN = TRUE;
	};
};


instance DIA_GRAVO_GILBERT(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 3;
	condition = dia_gravo_gilbert_condition;
	information = dia_gravo_gilbert_info;
	permanent = 0;
	description = "Тебе говорит о чем-нибудь имя Жильбер?";
};


func int dia_gravo_gilbert_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_gravo_gilbert_info()
{
	AI_Output(other,self,"DIA_Gravo_Gilbert_15_00");	//Тебе говорит о чем-нибудь имя Жильбер?
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_00");	//Нет. Хотя...
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_01");	//Продолжай!
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_01");	//Возможно это тот парень, что рассорился со всеми стражниками и сбежал из лагеря.
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_02");	//Но это было очень давно. Наверняка его кости уже обгладали волки.
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_03");	//(подозрительно) И почему это тебя интересует?
	AI_Output(other,self,"DIA_Gravo_Gilbert_15_02");	//Я нашел его. Он прячется в пещере недалеко от Старого лагеря.
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_04");	//Этого не может быть! Так он жив?
	AI_Output(other,self,"DIA_Gravo_Gilbert_15_03");	//Ну, по крайней мере был, когда я его нашел.
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_05");	//Я думаю, тебе стоит рассказать об этом Торусу.
	B_LogEntry(CH1_GILBERT,"Граво посоветовал мне поговорить с Торусом.");
};


instance DIA_GRAVO_GILBERT_ABOUT(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 3;
	condition = dia_gravo_gilbert_about_condition;
	information = dia_gravo_gilbert_about_info;
	permanent = 0;
	description = "Почему Жильбер сбежал из лагеря?";
};


func int dia_gravo_gilbert_about_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_gilbert) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_gravo_gilbert_about_info()
{
	AI_Output(other,self,"DIA_Gravo_Gilbert_ABOUT_15_00");	//Почему Жильбер сбежал из лагеря?
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_00");	//Я же сказал. Он постоянно ссорился со всеми людьми Гомеза.
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_01");	//Поэтому мы довольно часто с ним виделись, если ты понимаешь о чем я говорю. Временный мир стоил ему целой кучи руды.
	AI_Output(other,self,"DIA_Gravo_Gilbert_ABOUT_15_01");	//А где он взял столько руды?
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_02");	//Он был не только рудокопом. Также он помогал в кузнице внутри замка.
	B_LogEntry(CH1_GILBERT,"Гильберт работал в кузнице, в замке Старого лагеря.");
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_03");	//И однажды он сделал так, что даже я был бессилен ему помочь.
	AI_Output(other,self,"DIA_Gravo_Gilbert_ABOUT_15_02");	//И? Что это было?
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_04");	//Эээ... Я не должен тебя этого говорить. Иди к Торусу. Он скажет тебе, если сочтет нужным.
	B_LogEntry(CH1_GILBERT,"Граво не сказал мне, что именно сделал Гильберт. Но после этого у него были серьезные проблемы со стражниками.");
};


instance DIA_GRAVO_GILBERT_THORUS(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 3;
	condition = dia_gravo_gilbert_thorus_condition;
	information = dia_gravo_gilbert_thorus_info;
	permanent = 0;
	description = "Я поговорил с Торусом.";
};


func int dia_gravo_gilbert_thorus_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_gravo_gilbert_thorus_info()
{
	AI_Output(other,self,"Info_Diego_ThorusSays_15_00");	//Я поговорил с Торусом.
	AI_Output(other,self,"DIA_Gravo_Gilbert_Thorus_15_01");	//Он поручил мне вернуть вещь, которую украл у него Жильбер. Только он не сказал что это.
	AI_Output(self,other,"DIA_Gravo_Gilbert_Thorus_04_00");	//Да, парень, не повезло тебе.
	AI_Output(other,self,"DIA_Gravo_Gilbert_Thorus_15_02");	//А ты не знаешь, что это за вещь?
	AI_Output(self,other,"DIA_Gravo_Gilbert_Thorus_04_01");	//Нет. Попробуй поговорить со стражниками на внешнем кольце. Возможно, они смогут тебе помочь.
	B_LogEntry(CH1_GILBERT,"Возможно стражники во внешнем кольце лагеря смогут рассказать, ЧТО ИМЕННО украл Жильбер у Торуса.");
};

