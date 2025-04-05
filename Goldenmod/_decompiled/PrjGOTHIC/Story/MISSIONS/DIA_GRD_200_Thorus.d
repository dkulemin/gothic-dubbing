
instance Info_Thorus_EXIT(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 999;
	condition = Info_Thorus_EXIT_Condition;
	information = Info_Thorus_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Thorus_EXIT_Condition()
{
	return 1;
};

func void Info_Thorus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Thorus_EnterCastle(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 3;
	condition = Info_Thorus_EnterCastle_Condition;
	information = Info_Thorus_EnterCastle_Info;
	permanent = 0;
	description = "Похоже, ты не пропустишь в замок никого постороннего...";
};


func int Info_Thorus_EnterCastle_Condition()
{
	if(!C_NpcBelongsToOldCamp(other) && (Diego_GomezAudience == FALSE))
	{
		return 1;
	};
};

func void Info_Thorus_EnterCastle_Info()
{
	AI_Output(other,self,"Info_EnterCastle_15_00");	//Похоже, ты не пропустишь в замок никого постороннего...
	AI_Output(self,other,"Info_EnterCastle_09_01");	//В замок могут заходить только люди Гомеза.
};


instance Info_Thorus_WorkForGomez(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 3;
	condition = Info_Thorus_WorkForGomez_Condition;
	information = Info_Thorus_WorkForGomez_Info;
	permanent = 0;
	description = "Я хочу работать на Гомеза.";
};


func int Info_Thorus_WorkForGomez_Condition()
{
	if((Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo(hero,Info_Thorus_EnterCastle)) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Thorus_WorkForGomez_Info()
{
	AI_Output(other,self,"Info_WorkForGomez_15_00");	//Я хочу работать на Гомеза.
	AI_Output(self,other,"Info_WorkForGomez_09_01");	//В самом деле? А почему ты думаешь, что Гомез заинтересуется тобой?
};


instance Info_Thorus_DiegoSentMe(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_DiegoSentMe_Condition;
	information = Info_Thorus_DiegoSentMe_Info;
	permanent = 0;
	description = "Диего сказал, что решать это будешь ты.";
};


func int Info_Thorus_DiegoSentMe_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp))
	{
		return 1;
	};
};

func void Info_Thorus_DiegoSentMe_Info()
{
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_00");	//Диего сказал, что решать это будешь ты.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_01");	//Х-мм... Если Диего считает, что ты нам подходишь, почему он САМ не занимается тобой?
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_02");	//Позволь объяснить: Диего должен испытать тебя. Если ОН решит, что ты нам подходишь, я позволю тебе войти в замок и встретиться с Гомезом.
	AI_Output(self,other,"Info_Thorus_DiegoSentMe_09_03");	//Ну а все остальное уже зависит от тебя, понял?
	AI_Output(other,self,"Info_Thorus_DiegoSentMe_15_04");	//Я поговорю с Диего.
	B_LogEntry(CH1_JoinOC,"Торус объяснил, что для вступления в Старый Лагерь мне надо поговорить с Диего. Он даст мне пробное задание.");
};


instance Info_Thorus_TryMe(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_TryMe_Condition;
	information = Info_Thorus_TryMe_Info;
	permanent = 0;
	description = "Почему бы тебе самому не испытать меня?";
};


func int Info_Thorus_TryMe_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_WorkForGomez))
	{
		return 1;
	};
};

func void Info_Thorus_TryMe_Info()
{
	AI_Output(other,self,"Info_Thorus_TryMe_15_00");	//Почему бы тебе самому не испытать меня?
	AI_Output(self,other,"Info_Thorus_TryMe_09_01");	//Все не так просто, малыш! Каждому новичку, который хочет чего-то добиться здесь, нужен покровитель.
	AI_Output(self,other,"Info_Thorus_TryMe_09_02");	//Этот покровитель должен быть из людей Гомеза. Он сам испытает тебя.
	AI_Output(self,other,"Info_Thorus_TryMe_09_03");	//Покровитель будет в ответе, если ты провалишь дело. Таков закон.
};


instance Info_Thorus_TryMeAgain(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_TryMeAgain_Condition;
	information = Info_Thorus_TryMeAgain_Info;
	permanent = 0;
	description = "Возможно, я смогу быть чем-то полезен тебе.";
};


func int Info_Thorus_TryMeAgain_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_TryMe))
	{
		return 1;
	};
};

func void Info_Thorus_TryMeAgain_Info()
{
	AI_Output(other,self,"Info_Thorus_TryMeAgain_15_00");	//Возможно, я смогу быть чем-то полезен тебе.
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_01");	//Нет. То, чем занимаемся мы, стражники, тебе немного не по плечу, малыш.
	AI_Output(self,other,"Info_Thorus_TryMeAgain_09_02");	//Ты лучше выполняй задания своего покровителя.
};


instance Info_Thorus_TryMeICanDoIt(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_TryMeICanDoIt_Condition;
	information = Info_Thorus_TryMeICanDoIt_Info;
	permanent = 0;
	description = "Я вполне могу делать и то, что ты мне прикажешь.";
};


func int Info_Thorus_TryMeICanDoIt_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_TryMeAgain))
	{
		return 1;
	};
};

func void Info_Thorus_TryMeICanDoIt_Info()
{
	AI_Output(other,self,"Info_Thorus_TryMeICanDoIt_15_00");	//Я вполне могу делать и то, что ты мне прикажешь.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_01");	//Да ну? Вижу, не терпится стать героем, да? Есть одна задачка - как раз для того, кто не работает на Гомеза.
	AI_Output(self,other,"Info_Thorus_TryMeICanDoIt_09_02");	//Но предупреждаю тебя - если провалишь дело, то заработаешь чертову уйму неприятностей.
};


var int Thorus_MordragKo;

instance Info_Thorus_MordragKo_Offer(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_MordragKo_Offer_Condition;
	information = Info_Thorus_MordragKo_Offer_Info;
	permanent = 0;
	description = "Я готов выполнить твое задание.";
};


func int Info_Thorus_MordragKo_Offer_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_TryMeICanDoIt))
	{
		return 1;
	};
};

func void Info_Thorus_MordragKo_Offer_Info()
{
	var C_Npc Mordrag;
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_00");	//Я готов выполнить твое задание.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_01");	//То, что я тебе сейчас скажу, должно остаться между нами, никто другой не должен знать об этом. Понял?
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_02");	//Конечно.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_03");	//У нас возникла проблема с одним типом из Нового Лагеря. Его зовут Мордраг. Он крадет у Баронов.
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_04");	//Разумеется, то же можно сказать и о большинстве воров из Нового Лагеря, но у этого типа хватает наглости приходить к НАМ и продавать НАШИ же вещи НАШИМ же людям!
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_05");	//Это зашло слишком далеко. Но он знает, что я не могу ничего сделать.
	AI_Output(other,self,"Info_Thorus_MordragKo_Offer_15_06");	//Почему?
	AI_Output(self,other,"Info_Thorus_MordragKo_Offer_09_07");	//Его защищают сами маги.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Я позабочусь об этом.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Ты хочешь, чтобы я прикончил этого типа?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Где я могу найти Мордрага?",Info_Thorus_MordragKo_Where);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Почему маги защищают этого Мордрага?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice(Info_Thorus_MordragKo_Offer,"Похоже на то, что главной проблемой для тебя являются маги...",Info_Thorus_MordragKo_MageProblem);
	Thorus_MordragKo = LOG_RUNNING;
	Log_CreateTopic(CH1_MordragKO,LOG_MISSION);
	B_LogEntry(CH1_MordragKO,"Торус поручил мне избавиться от Мордрага, вора из Лагеря. Способ я должен выбрать сам. Но никто не должен знать, что Торус замешан в этом.");
	Log_SetTopicStatus(CH1_MordragKO,LOG_RUNNING);
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

func void Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_OFFER_BACK_15_00");	//Я позабочусь об этом.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

func void Info_Thorus_MordragKo_KillHim()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_KillHim_15_00");	//Ты хочешь, чтобы я прикончил этого типа?
	AI_Output(self,other,"Info_Thorus_MordragKo_KillHim_09_01");	//Я просто не хочу больше видеть здесь его рожу. Как ты этого добьешься - мне все равно.
};

func void Info_Thorus_MordragKo_Where()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_Where_15_00");	//Где я могу найти Мордрага?
	AI_Output(self,other,"Info_Thorus_MordragKo_Where_09_01");	//Ты найдешь его возле южных ворот на другой стороне замка. Этот ублюдок не смеет заходить дальше в Лагерь.
	if(THORUS_MORDRAGWHERE == FALSE)
	{
		B_LogEntry(CH1_MordragKO,"Мордраг находится у южных ворот, позади замка.");
		THORUS_MORDRAGWHERE = TRUE;
	};
};

func void Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_00");	//Почему маги защищают этого Мордрага?
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_01");	//Они используют его в роли посыльного. Наши маги поддерживают связь с магами из Нового Лагеря и часто отправляют друг другу гонцов.
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_02");	//Скорее всего, им ОЧЕНЬ не понравится, если я вышвырну одного из гонцов за ворота Лагеря или убью его.
	AI_Output(other,self,"Info_Thorus_MordragKo_MagesProtect_15_03");	//А что насчет МЕНЯ? Что маги сделают со МНОЙ?
	AI_Output(self,other,"Info_Thorus_MordragKo_MagesProtect_09_04");	//Ты здесь новенький. Все будет нормально. Но я отвечаю за своих людей. Вот почему очень важно, чтобы ты держал свой рот на замке.
	Thorus_MordragMageMessenger = TRUE;
};

func void Info_Thorus_MordragKo_MageProblem()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MageProblem_15_00");	//Похоже на то, что главной проблемой для тебя являются маги...
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_01");	//Да, и эту проблему не так-то легко решить. Несколько лет назад один из Призраков попытался прирезать Верховного Мага Круга Огня, пока тот спал.
	AI_Output(self,other,"Info_Thorus_MordragKo_MageProblem_09_02");	//Этого бедолагу потом нашли во Внешнем Кольце... Точнее, то, что от него осталось, было разбросано по всему Внешнему Кольцу...
};


instance Info_Thorus_MordragKo_Analyze(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_MordragKo_Analyze_Condition;
	information = Info_Thorus_MordragKo_Analyze_Info;
	permanent = 1;
	description = "По поводу Мордрага...";
};


func int Info_Thorus_MordragKo_Analyze_Condition()
{
	if((Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE))
	{
		return 1;
	};
};

func void Info_Thorus_MordragKo_Analyze_Info()
{
	var C_Npc Mordrag;
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Я позабочусь об этом.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Где я могу найти Мордрага?",Info_Thorus_MordragKo_Where);
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
	if(Npc_IsDead(Mordrag))
	{
		Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Считай, что Мордраг совершил свою последнюю кражу!",Info_Thorus_MordragKo_MordragDead);
	}
	else if((MordragKO_HauAb == TRUE) || (MordragKO_StayAtNC == TRUE))
	{
		Info_AddChoice(Info_Thorus_MordragKo_Analyze,"Больше он не осмелится появиться здесь!",Info_Thorus_MordragKo_MordragGone);
	};
};

func void Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00");	//Я позабочусь об этом.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

func void Info_Thorus_MordragKo_MordragDead()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragDead_15_00");	//Считай, что Мордраг совершил свою последнюю кражу!
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragDead_09_01");	//Хочешь сказать, ты победил его? Неплохо, малыш!
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO,LOG_SUCCESS);
	B_LogEntry(CH1_MordragKO,"На Торуса произвело впечатление то, как я решил проблему с Мордрагом.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

func void Info_Thorus_MordragKo_MordragGone()
{
	AI_Output(other,self,"Info_Thorus_MordragKo_MordragGone_15_00");	//Больше он не осмелится появиться здесь!
	AI_Output(self,other,"Info_Thorus_MordragKo_MordragGone_09_01");	//Было бы лучше, если бы ты убил его.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO,LOG_SUCCESS);
	B_LogEntry(CH1_MordragKO,"Похоже, Торус рад, что Мордраг больше не шатается по Лагерю.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};


instance Info_Thorus_MordragFailed(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_MordragFailed_Condition;
	information = Info_Thorus_MordragFailed_Info;
	permanent = 0;
	important = 1;
};


func int Info_Thorus_MordragFailed_Condition()
{
	if(MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

func void Info_Thorus_MordragFailed_Info()
{
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_00");	//Ты провалил все дело! Я говорил тебе НЕ НАЗЫВАТЬ МОЕГО ИМЕНИ!!!
	AI_Output(self,other,"Info_Thorus_MordragFailed_09_01");	//Ты провалил задание! Забудь обо всем, что я тебе говорил! Больше не смей совать нос в это дело!
	Thorus_MordragKo = LOG_FAILED;
	Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
	B_LogEntry(CH1_MordragKO,"Торус недоволен тем, что я упомянул его имя в разговоре с Мордрагом. Похоже, мне лучше не показываться ему на глаза некоторое время.");
	AI_StopProcessInfos(self);
};


instance Info_Thorus_BribeGuard(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_BribeGuard_Condition;
	information = Info_Thorus_BribeGuard_Info;
	permanent = 0;
	description = "Если я поделюсь рудой, ты позволишь войти в замок?";
};


func int Info_Thorus_BribeGuard_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild(other) != GIL_STT) && (Npc_GetTrueGuild(other) != GIL_GRD))
	{
		return 1;
	};
};

func void Info_Thorus_BribeGuard_Info()
{
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_00");	//Если бы я поделился с тобой своим запасом руды, ты бы позволил мне войти в замок?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_01");	//Своим запасом...
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_02");	//Сколько?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_02");	//Ну... Пересчет этой руды должен занять много времени. Мы с ребятами должны считать достаточно долго, чтобы ты успел проскочить незамеченным.
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_03");	//А поконкретней?
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_03");	//Тысячи кусков должно быть достаточно.
	AI_Output(other,self,"Info_Thorus_BribeGuard_15_04");	//Тысяча кусков?!
	AI_Output(self,other,"Info_Thorus_BribeGuard_09_04");	//Ну, ты можешь стать одним из людей Гомеза и пройти в замок задаром.
};


instance Info_Thorus_Give1000Ore(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_Give1000Ore_Condition;
	information = Info_Thorus_Give1000Ore_Info;
	permanent = 1;
	description = "У меня есть тысяча кусков руды. Пропусти меня!";
};


func int Info_Thorus_Give1000Ore_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

func void Info_Thorus_Give1000Ore_Info()
{
	var C_Npc wache212;
	var C_Npc wache213;
	AI_Output(other,self,"Info_Thorus_Give1000Ore_15_00");	//У меня есть тысяча кусков руды. Пропусти меня!
	if(Npc_HasItems(other,ItMiNugget) >= 1000)
	{
		B_GiveInvItems(other,self,ItMiNugget,1000);
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_01");	//Хорошо, проходи. Пока ты в замке, постарайся не делать никаких глупостей, ладно?
		wache212 = Hlp_GetNpc(Grd_212_Torwache);
		wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_Give1000Ore_09_02");	//Не пытайся надуть меня, малыш! У тебя нет тысячи кусков!
	};
};


instance Info_Thorus_LetterForMages(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_LetterForMages_Condition;
	information = Info_Thorus_LetterForMages_Info;
	permanent = 1;
	description = "Мне нужно попасть в замок. У меня есть письмо.";
};


func int Info_Thorus_LetterForMages_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_HasItems(hero,ItWr_Fire_Letter_01) || Npc_HasItems(hero,ItWr_Fire_Letter_02)))
	{
		return 1;
	};
};

func void Info_Thorus_LetterForMages_Info()
{
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_00");	//Мне нужно попасть в замок. У меня есть письмо для Верховного Мага Круга Огня.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_01");	//И ты надеешься, что я просто пропущу тебя в замок, чтобы ты мог получить свою награду?
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_02");	//Да.
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_03");	//Ладно, покажи мне письмо.
	AI_Output(other,self,"Info_Thorus_LetterForMages_15_04");	//Забудь об этом - я не позволю ТЕБЕ прикарманить его!
	AI_Output(self,other,"Info_Thorus_LetterForMages_09_05");	//Ладно, уже забыл.
};


instance Info_Thorus_ReadyForGomez(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_ReadyForGomez_Condition;
	information = Info_Thorus_ReadyForGomez_Info;
	permanent = 1;
	description = "Диего сказал, что я могу увидеть Гомеза!";
};


func int Info_Thorus_ReadyForGomez_Condition()
{
	if((Diego_GomezAudience == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Thorus_ReadyForGomez_Info()
{
	var C_Npc wache212;
	var C_Npc wache213;
	var C_Npc wache218;
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_00");	//Диего сказал, что я могу увидеть Гомеза!
	AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_01");	//Это буду решать я!
	AI_Output(other,self,"Info_Thorus_ReadyForGomez_15_02");	//И что ты решил?
	if(THORUS_GILBERT_OC != TRUE)
	{
		AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_03");	//Х-ммм...
		AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_04");	//Должен признать, что до сих пор ты справлялся неплохо.
		AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_05");	//Хорошо! Я позволю тебе встретиться с Гомезом. Сможешь ты стать одним из нас или нет - решать ему.
		AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_06");	//С этой минуты, парень, все зависит только от тебя.
		wache212 = Hlp_GetNpc(Grd_212_Torwache);
		wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
		Info_Thorus_ReadyForGomez.permanent = 0;
		READYFORGOMEZ = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_ReadyForGomez_09_07");	//Нет.
	};
};


instance Info_Thorus_Krautbote(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 4;
	condition = Info_Thorus_Krautbote_Condition;
	information = Info_Thorus_Krautbote_Info;
	permanent = 0;
	description = "Я должен доставить груз болотника Гомезу от Кор Галома.";
};


func int Info_Thorus_Krautbote_Condition()
{
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Thorus_Krautbote_Info()
{
	var C_Npc wache212;
	var C_Npc wache213;
	var C_Npc wache218;
	AI_Output(other,self,"Info_Thorus_Krautbote_15_00");	//Я должен доставить груз болотника Гомезу от Кор Галома.
	AI_Output(self,other,"Info_Thorus_Krautbote_09_01");	//Покажи!
	if(Npc_HasItems(other,ItMiJoint_3) >= 30)
	{
		AI_Output(self,other,"Info_Thorus_Krautbote_09_02");	//Х-ммммммм...
		AI_Output(self,other,"Info_Thorus_Krautbote_09_03");	//Хорошо! Ты можешь пройти. Отправляйся к дому Баронов - там тебя встретит Бартоло.
		wache212 = Hlp_GetNpc(Grd_212_Torwache);
		wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_Krautbote_09_04");	//Для посыльного у тебя слишком мало болотника! Надеюсь, что ты не продал его на сторону. Возвращайся с нормальным запасом!
	};
};


var int thorus_Amulettgezeigt;

instance Info_Thorus_KdWSiegel(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 4;
	condition = Info_Thorus_KdWSiegel_Condition;
	information = Info_Thorus_KdWSiegel_Info;
	permanent = 1;
	description = "Я по поручению магов Воды. Мне нужно попасть в замок!";
};


func int Info_Thorus_KdWSiegel_Condition()
{
	if((Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) || (Npc_HasItems(other,KdW_Amulett) >= 1)) && (thorus_Amulettgezeigt == FALSE))
	{
		return 1;
	};
};

func void Info_Thorus_KdWSiegel_Info()
{
	var C_Npc wache212;
	var C_Npc wache213;
	AI_Output(other,self,"Info_Thorus_KdWSiegel_15_00");	//Я по поручению магов Воды. Мне нужно попасть в замок!
	if(Npc_HasItems(other,KdW_Amulett) >= 1)
	{
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_01");	//У тебя есть амулет гонца. С ним ты можешь пройти мимо стражи.
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_02");	//Я не хочу иметь дела с магами, так что перестань доставать меня, понял?
		wache212 = Hlp_GetNpc(Grd_212_Torwache);
		wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_KdWSiegel_09_03");	//Поручение, как же! А амулет свой ты где-то забыл, так?
	};
};


instance Info_Thorus_SttGeschafft(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_SttGeschafft_Condition;
	information = Info_Thorus_SttGeschafft_Info;
	permanent = 0;
	description = "Я сделал это! Теперь я принадлежу к этому Лагерю!";
};


func int Info_Thorus_SttGeschafft_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

func void Info_Thorus_SttGeschafft_Info()
{
	AI_Output(other,self,"Info_Thorus_SttGeschafft_15_00");	//Я сделал это! Теперь я принадлежу к этому Лагерю!
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_01");	//Поздравляю, парень! С этого момента старайся держаться поближе к Диего.
	AI_Output(self,other,"Info_Thorus_SttGeschafft_09_02");	//Гомеза и Равена можно беспокоить только по ОЧЕНЬ важному поводу.
};


instance Info_Thorus_PERM2(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = Info_Thorus_PERM2_Condition;
	information = Info_Thorus_PERM2_Info;
	permanent = 0;
	description = "Как идут дела?";
};


func int Info_Thorus_PERM2_Condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_Thorus_PERM2_Info()
{
	AI_Output(other,self,"Info_Thorus_PERM2_15_00");	//Как идут дела?
	AI_Output(self,other,"Info_Thorus_PERM2_09_01");	//У нас не так много проблем с Новым Лагерем. Куда больше меня беспокоят эти болотные придурки.
};


instance GRD_200_Thorus_GARDIST(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_GARDIST_Condition;
	information = GRD_200_Thorus_GARDIST_Info;
	important = 0;
	permanent = 0;
	description = "Ты хотел мне что-то сказать?";
};


func int GRD_200_Thorus_GARDIST_Condition()
{
	if(((CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,Grd_214_Torwache_SEETHORUS) || Npc_KnowsInfo(hero,GRD_216_Torwache_SEETHORUS)) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache;
	KDFWache = Hlp_GetNpc(GRD_245_Gardist);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output(other,self,"GRD_200_Thorus_GARDIST_Info_15_01");	//Ты хотел мне что-то сказать?
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_02");	//Да. То, что ты сделал в шахте, доказывает не только твою смелость. Ты силен и умеешь хорошо драться.
	AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_03");	//Я готов принять тебя в ряды стражников.
	if(hero.level < 10)
	{
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_04");	//Но ты пока еще не совсем готов стать им. Прежде тебе нужно набраться опыта.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GRD_200_Thorus_GARDIST_Info_09_05");	//Я даю тебе шанс. Что скажешь?
	};
};


instance GRD_200_Thorus_AUFNAHME(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_AUFNAHME_Condition;
	information = GRD_200_Thorus_AUFNAHME_Info;
	permanent = 0;
	description = "Я хочу стать стражником.";
};


func int GRD_200_Thorus_AUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST) && (hero.level >= 10) && (Npc_GetTrueGuild(hero) == GIL_STT) && (Corristo_KDFAufnahme != 4))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_AUFNAHME_Info()
{
	var C_Npc KDFWache;
	AI_Output(other,self,"GRD_200_Thorus_AUFNAHME_Info_15_01");	//Я хочу стать стражником.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_02");	//Рад слышать это. Но прежде я должен сказать тебе то, что всегда говорю новичкам. Слушай внимательно, повторять я не буду.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_03");	//Было время, когда ты был сам по себе. Теперь это в прошлом. Мои люди держатся друг друга. Мы, стражники, охраняем покой Баронов, руду, шахту и Лагерь.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_04");	//Рудокопы добывают руду, но это мы следим за тем, чтобы их не сожрали ползуны. Переговоры с королем ведут Бароны, но это мы защищаем их.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_05");	//Днем и ночью мы находимся в шахте. Днем и ночью мы стоим на страже у ворот Лагеря и следим за тем, чтобы его обитатели могли спать спокойно.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_06");	//Мы начинали как дикая шайка, но сейчас мы - сила, с которой нельзя не считаться. И мы много работаем, для того чтобы сделать нашу жизнь такой, какая она есть.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_07");	//От своих людей я жду только одного: чтобы они всегда держались вместе. Только вместе мы сможем справиться с любыми проблемами.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_08");	//И выжить.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_09");	//Ты научишься всему по ходу дела. Будь готов оказать помощь тому, кому она нужна, и делать то, что от тебя потребуется.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_10");	//Иди и попроси Стоуна дать тебе доспехи и меч.
	AI_Output(self,other,"GRD_200_Thorus_AUFNAHME_Info_09_11");	//Ты найдешь его в оружейной лавке во Внутреннем Кольце.
	KDFWache = Hlp_GetNpc(GRD_245_Gardist);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;
	Npc_SetTrueGuild(hero,GIL_GRD);
	hero.guild = GIL_GRD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMds(hero,"Humans_Relaxed.mds");
};


instance GRD_200_Thorus_NOCHWAS(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_NOCHWAS_Condition;
	information = GRD_200_Thorus_NOCHWAS_Info;
	important = 1;
	permanent = 0;
};


func int GRD_200_Thorus_NOCHWAS_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_200_Thorus_AUFNAHME) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_01");	//Да, и вот еще что...
	AI_Output(self,other,"GRD_200_Thorus_NOCHWAS_Info_09_02");	//Добро пожаловать в Стражу!
	AI_StopProcessInfos(self);
	Log_CreateTopic(GE_BecomeGuard,LOG_NOTE);
	B_LogEntry(GE_BecomeGuard,"Сегодня Торус принял меня в стражники. Я могу пойти и забрать свои доспехи у кузнеца Стоуна, в замке.");
};


instance GRD_200_Thorus_WANNABEMAGE(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_WANNABEMAGE_Condition;
	information = GRD_200_Thorus_WANNABEMAGE_Info;
	permanent = 0;
	description = "Меня больше увлекает путь магии.";
};


func int GRD_200_Thorus_WANNABEMAGE_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST) && !Npc_KnowsInfo(hero,GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_WANNABEMAGE_Info()
{
	var C_Npc Corristo;
	AI_Output(other,self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01");	//Меня больше увлекает путь магии.
	AI_Output(self,other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02");	//Тогда, наверное, тебе стоит поговорить с Корристо. Он учил Мильтена. Уверен, тебя ничто не остановит.
	Corristo = Hlp_GetNpc(Kdf_402_Corristo);
	Npc_ExchangeRoutine(Corristo,"WAITFORSC");
	AI_ContinueRoutine(Corristo);
};


instance GRD_200_Thorus_Teach(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 10;
	condition = GRD_200_Thorus_Teach_Condition;
	information = GRD_200_Thorus_Teach_Info;
	permanent = 1;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int GRD_200_Thorus_Teach_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00");	//Ты будешь учить меня?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01");	//Я могу показать тебе, как улучшить свои навыки и стать сильнее.
	if(log_thorustrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Торус поможет мне в тренировке силы и ловкости.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	Info_ClearChoices(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GRD_200_Thorus_Teach);
	Info_AddChoice(GRD_200_Thorus_Teach,DIALOG_BACK,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GRD_200_Thorus_Teach_DEX_1);
};


instance GRD_200_Thorus_ZWEIHAND1(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_ZWEIHAND1_Condition;
	information = GRD_200_Thorus_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};


func int GRD_200_Thorus_ZWEIHAND1_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_ZWEIHAND1_Info()
{
	if(log_thorusfight == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Торус может научить меня сражаться двуручным оружием, как только я освою одноручное.");
		log_thorusfight = TRUE;
	};
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01");	//Я хочу научиться владеть двуручным мечом.
	if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02");	//Ладно, начнем с самого простого.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03");	//Держи меч горизонтально. Тебе понадобится большой замах, чтобы атаковать противника тяжелым оружием.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04");	//Подними руку и бей вертикально вниз. Обычного этого достаточно, чтобы избавиться от любого врага.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05");	//Используй инерцию движения чтобы вернуться в исходную позицию.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06");	//Двуручный меч просто идеален для боковых ударов, чтобы держать противника на расстоянии.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07");	//Пожалуй, начнем с этого. Тренируйся.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};


instance GRD_200_Thorus_ZWEIHAND2(C_Info)
{
	npc = GRD_200_Thorus;
	condition = GRD_200_Thorus_ZWEIHAND2_Condition;
	information = GRD_200_Thorus_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0);
};


func int GRD_200_Thorus_ZWEIHAND2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		return TRUE;
	};
};

func void GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01");	//Я хочу больше узнать о двуручном мече.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02");	//Прежде всего, смени исходную стойку. Держи меч вертикально, возьмись за рукоять обеими руками и отведи его в сторону.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03");	//Теперь быстро веди его вниз, замах от плеча. А теперь - рубящий удар вправо!
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04");	//У противника не будет ни единого шанса к тебе подобраться.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05");	//Из этого же положения можно нанести резкий колющий удар вперед, чтобы отогнать врага.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06");	//Развернись, чтобы придать мечу должный разгон, - и еще один рубящий удар!
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07");	//Если этого окажется недостаточно, меч по инерции легко вернется в исходное положение.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08");	//Закончив серию, защищайся и жди момента, чтобы атаковать снова.
		AI_Output(self,other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09");	//Секрет успеха кроется в чередовании ударов и боевых стоек.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0;
	};
};


instance THORUS_FREEMINE(C_Info)
{
	npc = GRD_200_Thorus;
	condition = thorus_freemine_condition;
	information = thorus_freemine_info;
	permanent = 0;
	important = 1;
};


func int thorus_freemine_condition()
{
	if(HERO_IS_GRD == TRUE)
	{
		return TRUE;
	};
};

func void thorus_freemine_info()
{
	AI_Output(self,other,"Thorus_FREEMINE_Info_09_00");	//А вот и ты. Долго тебя небыло. Ты уже слышал новость?
	AI_Output(self,other,"Thorus_FREEMINE_Info_09_01");	//Старую шахту затопило и она рухнула.
	AI_Output(self,other,"Thorus_FREEMINE_Info_09_02");	//И сейчас мы нападем на Свободную шахту.
	if(!Npc_KnowsInfo(other,Info_Milten_OCWARN) && !Npc_KnowsInfo(other,Info_Diego_OCWARN))
	{
		AI_Output(other,self,"Thorus_FREEMINE_Info_15_00");	//Что? Как это могло случиться? Мне нужно немедленно поговорить с Магами Огня.
		AI_Output(self,other,"Thorus_FREEMINE_Info_09_03");	//Это невозможно, парень! Маги вздумали перечить Гомезу, и это стоило им жизни.
	}
	else
	{
		AI_Output(other,self,"Thorus_FREEMINE_Info_15_01");	//Значит теперь мы остпались без руды?
	};
	AI_Output(self,other,"Thorus_FREEMINE_Info_09_04");	//А нет руды - нет товаров из внешнего мира. Ты же не собираешься подыхать здесь от голода!
	AI_Output(self,other,"Thorus_FREEMINE_Info_09_05");	//Пойдем с нами. Это приказ Гомеза!
	B_LogEntry(CH4_Firemages,"Стражники Старого лагеря убили магов огня. Теперь они планируют нападение на Свободную шахту.");
	Info_AddChoice(thorus_freemine,"Я больше не служу Гомезу.",thorus_freemine_no);
	Info_AddChoice(thorus_freemine,"В атаку!",thorus_freemine_yes);
	Info_AddChoice(thorus_freemine,"Вы убили магов огня.",thorus_freemine_kdf);
};

func void thorus_freemine_no()
{
	var C_Npc Thorus;
	var C_Npc jackal;
	var C_Npc gardist_1;
	var C_Npc gardist_2;
	var C_Npc gardist_3;
	var C_Npc gardist_4;
	var C_Npc gardist_5;
	AI_Output(other,self,"Thorus_FREEMINE_NO_15_00");	//Я больше не служу Гомезу.
	AI_Output(self,other,"Thorus_FREEMINE_NO_09_01");	//Это было неверное решение!
	B_Kapitelwechsel(4);
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	jackal = Hlp_GetNpc(Grd_201_Jackal);
	gardist_1 = Hlp_GetNpc(GRD_252_Gardist);
	gardist_2 = Hlp_GetNpc(GRD_253_Gardist);
	gardist_3 = Hlp_GetNpc(GRD_244_Gardist);
	gardist_4 = Hlp_GetNpc(GRD_232_Gardist);
	gardist_5 = Hlp_GetNpc(GRD_229_Gardist);
	Thorus.flags = 0;
	jackal.flags = 0;
	gardist_1.flags = 0;
	gardist_2.flags = 0;
	gardist_3.flags = 0;
	gardist_4.flags = 0;
	gardist_5.flags = 0;
	Npc_SetTrueGuild(hero,GIL_None);
	hero.guild = GIL_None;
	Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
	B_LogEntry(CH4_BannedFromOC,"Я больше не служу Гомезу. Возможно, мне стоит присоединиться к Новому лагерю.");
	Info_ClearChoices(thorus_freemine);
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void thorus_freemine_yes()
{
	var C_Npc Thorus;
	var C_Npc jackal;
	var C_Npc gardist_1;
	var C_Npc gardist_2;
	var C_Npc gardist_3;
	var C_Npc gardist_4;
	var C_Npc gardist_5;
	var C_Npc pacho;
	AI_Output(other,self,"Thorus_FREEMINE_YES_15_00");	//В атаку!
	AI_Output(self,other,"IThorus_FREEMINE_YES_09_01");	//Подожди, я соберу остальных парней.	
	AI_Output(self,other,"Thorus_FREEMINE_YES_09_02");	//Возьми эту карту и направляйся к шахте. Там тебя будет ждать Пачо, он мой разведчик.
	B_GiveInvItems(self,hero,itwrfmmap,1);
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	jackal = Hlp_GetNpc(Grd_201_Jackal);
	gardist_1 = Hlp_GetNpc(GRD_252_Gardist);
	gardist_2 = Hlp_GetNpc(GRD_253_Gardist);
	gardist_3 = Hlp_GetNpc(GRD_244_Gardist);
	gardist_4 = Hlp_GetNpc(GRD_232_Gardist);
	gardist_5 = Hlp_GetNpc(GRD_229_Gardist);
	pacho = Hlp_GetNpc(GRD_224_Pacho);
	Thorus.flags = NPC_FLAG_IMMORTAL;
	jackal.flags = NPC_FLAG_IMMORTAL;
	gardist_1.flags = NPC_FLAG_IMMORTAL;
	gardist_2.flags = NPC_FLAG_IMMORTAL;
	gardist_3.flags = NPC_FLAG_IMMORTAL;
	gardist_4.flags = NPC_FLAG_IMMORTAL;
	gardist_5.flags = NPC_FLAG_IMMORTAL;
	pacho.flags = NPC_FLAG_IMMORTAL;
	B_ExchangeRoutine(pacho,"ToFMTaken");
	Info_ClearChoices(thorus_freemine);
	AI_StopProcessInfos(self);
};

func void thorus_freemine_kdf()
{
	AI_Output(other,self,"Thorus_FREEMINE_KDF_15_00");	//Вы убили магов огня.
	AI_Output(self,other,"Thorus_FREEMINE_KDF_09_01");	//И что теперь?
};


instance THORUS_FREEMINE_WAR(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = thorus_freemine_war_condition;
	information = thorus_freemine_war_info;
	important = 1;
	permanent = 0;
};


func int thorus_freemine_war_condition()
{
	if(Npc_KnowsInfo(hero,info_pacho_grd_fm) && (HERO_IS_GRD == TRUE) && (Npc_GetTrueGuild(other) == GIL_GRD))
	{
		return TRUE;
	};
};

func void thorus_freemine_war_info()
{
	var C_Npc jackal;
	var C_Npc gardist_1;
	var C_Npc gardist_2;
	var C_Npc gardist_3;
	var C_Npc gardist_4;
	var C_Npc gardist_5;
	var C_Npc pacho;
	var C_Npc fm1;
	var C_Npc fm2;
	var C_Npc fm3;
	var C_Npc fm4;
	var C_Npc fm5;
	var C_Npc fm6;
	var C_Npc fm7;
	var C_Npc fm8;
	var C_Npc fm9;
	var C_Npc fm10;
	var C_Npc fm11;
	var C_Npc fm12;
	var C_Npc fm13;
	var C_Npc fm14;
	var C_Npc fm15;
	var C_Npc fm16;
	var C_Npc fm17;
	var C_Npc fm18;
	var C_Npc fm19;
	var C_Npc fm20;
	var C_Npc fm21;
	var C_Npc fm22;
	var C_Npc fm23;
	var C_Npc fm24;
	var C_Npc fm25;
	var C_Npc fm26;
	var C_Npc fm27;
	var C_Npc fm28;
	var C_Npc fm29;
	var C_Npc fm30;
	var C_Npc fm31;
	var C_Npc fm32;
	var C_Npc fm33;
	AI_Output(self,NULL,"Thorus_FREEMINE_WAR_Info_09_02");	//За поворотом находится лагерь скребков у Свободной шахты.
	AI_Output(self,NULL,"Thorus_FREEMINE_WAR_Info_09_03");	//Вперед, парни, атакуем!
	AI_Output(self,other,"Thorus_FREEMINE_WAR_Info_09_04");	//Ты пойдешь вперед.
	B_LogEntry(CH4_Firemages,"Мы дошли до Свободной шахты. Торус приказал начать атаку лагеря скребков.");
	B_Kapitelwechsel(4);
	NA_GIL = TRUE;
	jackal = Hlp_GetNpc(Grd_201_Jackal);
	gardist_1 = Hlp_GetNpc(GRD_252_Gardist);
	gardist_2 = Hlp_GetNpc(GRD_253_Gardist);
	gardist_3 = Hlp_GetNpc(GRD_244_Gardist);
	gardist_4 = Hlp_GetNpc(GRD_232_Gardist);
	gardist_5 = Hlp_GetNpc(GRD_229_Gardist);
	pacho = Hlp_GetNpc(GRD_224_Pacho);
	fm1 = Hlp_GetNpc(SLD_750_Soeldner);
	fm2 = Hlp_GetNpc(SLD_751_Soeldner);
	fm3 = Hlp_GetNpc(SLD_752_Okyl);
	fm4 = Hlp_GetNpc(SLD_753_Baloro);
	fm5 = Hlp_GetNpc(SLD_755_Soeldner);
	fm6 = Hlp_GetNpc(SLD_756_Soeldner);
	fm7 = Hlp_GetNpc(SLD_757_Soeldner);
	fm8 = Hlp_GetNpc(SLD_758_Soeldner);
	fm9 = Hlp_GetNpc(SLD_759_Soeldner);
	fm10 = Hlp_GetNpc(SLD_760_Soeldner);
	fm11 = Hlp_GetNpc(SLD_762_Soeldner);
	fm12 = Hlp_GetNpc(SLD_763_Soeldner);
	fm13 = Hlp_GetNpc(SLD_764_Soeldner);
	fm14 = Hlp_GetNpc(SLD_765_Soeldner);
	fm15 = Hlp_GetNpc(SFB_1030_Schuerfer);
	fm16 = Hlp_GetNpc(SFB_1031_Schuerfer);
	fm17 = Hlp_GetNpc(SFB_1032_Schuerfer);
	fm18 = Hlp_GetNpc(SFB_1033_Schuerfer);
	fm19 = Hlp_GetNpc(SFB_1034_Schuerfer);
	fm20 = Hlp_GetNpc(SFB_1035_Schuerfer);
	fm21 = Hlp_GetNpc(SFB_1036_Schuerfer);
	fm22 = Hlp_GetNpc(SFB_1037_Swiney);
	fm23 = Hlp_GetNpc(SFB_1038_Schuerfer);
	fm24 = Hlp_GetNpc(SFB_1039_Schuerfer);
	fm25 = Hlp_GetNpc(SFB_1040_Schuerfer);
	fm26 = Hlp_GetNpc(SFB_1041_Schuerfer);
	fm27 = Hlp_GetNpc(SFB_1042_Schuerfer);
	fm28 = Hlp_GetNpc(SFB_1043_Schuerfer);
	fm29 = Hlp_GetNpc(SFB_1044_Schuerfer);
	fm30 = Hlp_GetNpc(ORG_890_Organisator);
	fm31 = Hlp_GetNpc(ORG_891_Organisator);
	fm32 = Hlp_GetNpc(ORG_892_Organisator);
	fm33 = Hlp_GetNpc(SLD_761_Soeldner);
	AI_SetWalkMode(self,NPC_RUN);
	AI_SetWalkMode(jackal,NPC_RUN);
	AI_SetWalkMode(gardist_1,NPC_RUN);
	AI_SetWalkMode(gardist_2,NPC_RUN);
	AI_SetWalkMode(gardist_3,NPC_RUN);
	AI_SetWalkMode(gardist_4,NPC_RUN);
	AI_SetWalkMode(gardist_5,NPC_RUN);
	AI_SetWalkMode(pacho,NPC_RUN);
	fm1.flags = 0;
	fm2.flags = 0;
	fm3.flags = 0;
	fm4.flags = 0;
	fm5.flags = 0;
	fm6.flags = 0;
	fm7.flags = 0;
	fm8.flags = 0;
	fm9.flags = 0;
	fm10.flags = 0;
	fm11.flags = 0;
	fm12.flags = 0;
	fm13.flags = 0;
	fm14.flags = 0;
	fm15.flags = 0;
	fm16.flags = 0;
	fm17.flags = 0;
	fm18.flags = 0;
	fm19.flags = 0;
	fm20.flags = 0;
	fm21.flags = 0;
	fm22.flags = 0;
	fm23.flags = 0;
	fm24.flags = 0;
	fm25.flags = 0;
	fm26.flags = 0;
	fm27.flags = 0;
	fm28.flags = 0;
	fm29.flags = 0;
	fm30.flags = 0;
	fm31.flags = 0;
	fm32.flags = 0;
	fm33.flags = 0;
	B_SetPermAttitude(self,ATT_FRIENDLY);
	B_SetPermAttitude(jackal,ATT_FRIENDLY);
	B_SetPermAttitude(gardist_1,ATT_FRIENDLY);
	B_SetPermAttitude(gardist_2,ATT_FRIENDLY);
	B_SetPermAttitude(gardist_3,ATT_FRIENDLY);
	B_SetPermAttitude(gardist_4,ATT_FRIENDLY);
	B_SetPermAttitude(gardist_5,ATT_FRIENDLY);
	B_SetPermAttitude(pacho,ATT_FRIENDLY);
	self.npcType = npctype_friend;
	jackal.npcType = npctype_friend;
	gardist_1.npcType = npctype_friend;
	gardist_2.npcType = npctype_friend;
	gardist_3.npcType = npctype_friend;
	gardist_4.npcType = npctype_friend;
	gardist_5.npcType = npctype_friend;
	pacho.npcType = npctype_friend;
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(jackal,"FMTaking");
	B_ExchangeRoutine(gardist_1,"FMTaking");
	B_ExchangeRoutine(gardist_2,"FMTaking");
	B_ExchangeRoutine(gardist_3,"FMTaking");
	B_ExchangeRoutine(gardist_4,"FMTaking");
	B_ExchangeRoutine(gardist_5,"FMTaking");
	B_ExchangeRoutine(pacho,"FMTaking");
	B_ExchangeRoutine(self,"FMTaking");
};


instance THORUS_FREEMINE_WAR_END(C_Info)
{
	npc = GRD_200_Thorus;
	condition = thorus_freemine_war_end_condition;
	information = thorus_freemine_war_end_info;
	important = 1;
	permanent = 0;
};


func int thorus_freemine_war_end_condition()
{
	var C_Npc fm1;
	var C_Npc fm2;
	var C_Npc fm3;
	var C_Npc fm4;
	var C_Npc fm5;
	var C_Npc fm6;
	var C_Npc fm7;
	var C_Npc fm8;
	var C_Npc fm9;
	var C_Npc fm10;
	var C_Npc fm11;
	var C_Npc fm12;
	var C_Npc fm13;
	var C_Npc fm14;
	var C_Npc fm33;
	fm1 = Hlp_GetNpc(SLD_750_Soeldner);
	fm2 = Hlp_GetNpc(SLD_751_Soeldner);
	fm3 = Hlp_GetNpc(SLD_752_Okyl);
	fm4 = Hlp_GetNpc(SLD_753_Baloro);
	fm5 = Hlp_GetNpc(SLD_755_Soeldner);
	fm6 = Hlp_GetNpc(SLD_756_Soeldner);
	fm7 = Hlp_GetNpc(SLD_757_Soeldner);
	fm8 = Hlp_GetNpc(SLD_758_Soeldner);
	fm9 = Hlp_GetNpc(SLD_759_Soeldner);
	fm10 = Hlp_GetNpc(SLD_760_Soeldner);
	fm11 = Hlp_GetNpc(SLD_762_Soeldner);
	fm12 = Hlp_GetNpc(SLD_763_Soeldner);
	fm13 = Hlp_GetNpc(SLD_764_Soeldner);
	fm14 = Hlp_GetNpc(SLD_765_Soeldner);
	fm33 = Hlp_GetNpc(SLD_761_Soeldner);
	if((HERO_IS_GRD == TRUE) && (Npc_GetTrueGuild(other) == GIL_GRD) && Npc_IsDead(fm1) && Npc_IsDead(fm2) && Npc_IsDead(fm3) && Npc_IsDead(fm4) && Npc_IsDead(fm5) && Npc_IsDead(fm6) && Npc_IsDead(fm7) && Npc_IsDead(fm8) && Npc_IsDead(fm9) && Npc_IsDead(fm10) && Npc_IsDead(fm11) && Npc_IsDead(fm12) && Npc_IsDead(fm13) && Npc_IsDead(fm14) && Npc_IsDead(fm33))
	{
		return TRUE;
	};
};

func void thorus_freemine_war_end_info()
{
	var C_Npc Thorus;
	var C_Npc jackal;
	var C_Npc gardist_1;
	var C_Npc gardist_2;
	var C_Npc gardist_3;
	var C_Npc gardist_4;
	var C_Npc gardist_5;
	var C_Npc pacho;
	AI_Output(self,NULL,"Thorus_FREEMINE_WAR_END_Info_09_02");	//Дело сделано! Мы выбили этих грязных наемников из шахты!
	AI_Output(self,NULL,"Thorus_FREEMINE_WAR_END_Info_09_04");	//Скоро прибудет подкерпление из Старого лагеря и мы начнем добычу руды.
	AI_Output(self,NULL,"Thorus_FREEMINE_WAR_END_Info_09_05");	//А пока мы должны оставаться здесь и следить за тем, чтобы люди из Нового лагеря не попыталить вернуть себе шахту.
	AI_Output(self,NULL,"SVM_9_ALGreetings");	//За Гомеза!
	B_LogEntry(CH4_Firemages,"Мы захватили Свободную шахту. Я думаю, мне пора сматываться. Если маги воды и наемники узнают, что я участвовал в нападении, у меня будут большие проблемы.");
	FMTaken = TRUE;
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	jackal = Hlp_GetNpc(Grd_201_Jackal);
	gardist_1 = Hlp_GetNpc(GRD_252_Gardist);
	gardist_2 = Hlp_GetNpc(GRD_253_Gardist);
	gardist_3 = Hlp_GetNpc(GRD_244_Gardist);
	gardist_4 = Hlp_GetNpc(GRD_232_Gardist);
	gardist_5 = Hlp_GetNpc(GRD_229_Gardist);
	pacho = Hlp_GetNpc(GRD_224_Pacho);
	AI_SetWalkMode(self,NPC_WALK);
	AI_SetWalkMode(jackal,NPC_WALK);
	AI_SetWalkMode(gardist_1,NPC_WALK);
	AI_SetWalkMode(gardist_2,NPC_WALK);
	AI_SetWalkMode(gardist_3,NPC_WALK);
	AI_SetWalkMode(gardist_4,NPC_WALK);
	AI_SetWalkMode(gardist_5,NPC_WALK);
	AI_SetWalkMode(pacho,NPC_WALK);
	Thorus.flags = 0;
	jackal.flags = 0;
	gardist_1.flags = 0;
	gardist_2.flags = 0;
	gardist_3.flags = 0;
	gardist_4.flags = 0;
	gardist_5.flags = 0;
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(jackal,"EndFMTaken");
	B_ExchangeRoutine(gardist_1,"EndFMTaken");
	B_ExchangeRoutine(gardist_2,"EndFMTaken");
	B_ExchangeRoutine(gardist_3,"EndFMTaken");
	B_ExchangeRoutine(gardist_4,"EndFMTaken");
	B_ExchangeRoutine(gardist_5,"EndFMTaken");
	B_ExchangeRoutine(pacho,"EndFMTaken");
	B_ExchangeRoutine(self,"EndFMTaken");
};


instance INFO_THORUS_GILBERT(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = info_thorus_gilbert_condition;
	information = info_thorus_gilbert_info;
	permanent = 0;
	description = "Я слышал тебя интересует Жильбер?";
};


func int info_thorus_gilbert_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_gilbert) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void info_thorus_gilbert_info()
{
	AI_Output(other,self,"Info_Thorus_Gilbert_15_00");	//Я слышал тебя интересует Жильбер?
	AI_Output(self,other,"Info_Thorus_Gilbert_09_00");	//Что? Ничего не хочу знать об этом гаденыше!
	AI_Output(other,self,"Info_Thorus_Gilbert_15_01");	//Даже то, что я нашел его убежище?
	AI_Output(self,other,"Info_Thorus_Gilbert_09_01");	//Этого не может быть! Он давно должен был сдохнуть!
	AI_Output(other,self,"Info_Thorus_Gilbert_15_02");	//Поверь мне.
	AI_Output(self,other,"Info_Thorus_Gilbert_09_02");	//(задумчиво) Так значит он жив... Послушай у меня будет для тебя задание.
	AI_Output(self,other,"Info_Thorus_Gilbert_09_03");	//Перед тем, как сбежать из лагеря, он взял кое-что принадлежащее мне. Я хочу чтобы ты вернул мне эту вещь.
	Info_AddChoice(info_thorus_gilbert,"А что мне будет, если я соглашусь?",info_thorus_gilbert_about);
	Info_AddChoice(info_thorus_gilbert,"Нет.",info_thorus_gilbert_no);
	Info_AddChoice(info_thorus_gilbert,"Хорошо. Я согласен.",info_thorus_gilbert_yes);
};

func void info_thorus_gilbert_yes()
{
	AI_Output(other,self,"Info_Thorus_Gilbert_YES_15_00");	//Хорошо. Я согласен.
	AI_Output(self,other,"Info_Thorus_Gilbert_YES_09_00");	//Вот и отлично. Иди к этому подонку!
	B_LogEntry(CH1_GILBERT,"Торус дал задание вернуть ему вещь, которую украл Жильбер.");
	Info_ClearChoices(info_thorus_gilbert);
};

func void info_thorus_gilbert_no()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//Нет.
	Log_SetTopicStatus(CH1_GILBERT,LOG_FAILED);
	B_LogEntry(CH1_GILBERT,"Я отказался помогать Торусу. пусть сам разбирается с этим Гильбертом.");
	GILBERT_OC = FALSE;
	if((Npc_GetTrueGuild(other) == GIL_None) || (Npc_GetTrueGuild(other) == GIL_STT))
	{
		AI_Output(self,other,"Info_Thorus_Gilbert_NO_09_00");	//Ты еще пожалеешь об этом.
		THORUS_GILBERT_OC = TRUE;
		Info_ClearChoices(info_thorus_gilbert);
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF))
	{
		AI_Output(self,other,"Info_Thorus_Gilbert_NO_09_01");	//Скажи спасибо богам, что ты принадлежишь Старому лагерю. А то бы я тебе показал!
	}
	else if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD) || (Npc_GetTrueGuild(other) == GIL_KDW))
	{
		AI_Output(self,other,"Info_Thorus_Gilbert_NO_09_02");	//Тебе повезло, что ты находишься под покровительством магов. А то бы я тебе показал!
	}
	else
	{
		AI_Output(self,other,"Info_Thorus_Gilbert_NO_09_03");	//Тебе повезло, что Гомезу нужен болотник. А то бы я тебе показал!
	};
	Info_ClearChoices(info_thorus_gilbert);
	AI_StopProcessInfos(self);
};

func void info_thorus_gilbert_about()
{
	AI_Output(other,self,"Info_Thorus_Gilbert_ABOUT_15_00");	//А что мне будет, если я соглашусь?
	AI_Output(self,other,"Info_Thorus_Gilbert_ABOUT_09_00");	//Лучше спроси, чего у тебя не будет. У тебя не будет проблем со мной!
};


instance INFO_THORUS_GILBERT_KEY(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = info_thorus_gilbert_key_condition;
	information = info_thorus_gilbert_key_info;
	permanent = 0;
	description = "Я забрал у Жильбера этот ключ.";
};


func int info_thorus_gilbert_key_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert) && (GILBERT_OC == TRUE) && (Npc_HasItems(hero,ItKe_OB_Smith_01) == 1))
	{
		return 1;
	};
};

func void info_thorus_gilbert_key_info()
{
	AI_Output(other,self,"Info_Thorus_Gilbert_Key_15_00");	//Я забрал у Жильбера этот ключ.
	AI_Output(self,other,"Info_Thorus_Gilbert_Key_09_00");	//Я просил тебя принести украденную вещь, а не какой-то ключ.
	AI_Output(other,self,"Info_Thorus_Gilbert_Key_15_01");	//Но у него больше ничего не было.
	AI_Output(self,other,"Info_Thorus_Gilbert_Key_09_01");	//Тогда найди то, что открывает этот ключ.
	B_LogEntry(CH1_GILBERT,"Мне необходимо найти замок, который открывается ключом Жильбера.");
};


instance INFO_THORUS_GILBERT_OK(C_Info)
{
	npc = GRD_200_Thorus;
	nr = 1;
	condition = info_thorus_gilbert_ok_condition;
	information = info_thorus_gilbert_ok_info;
	permanent = 0;
	description = "Кажется я нашел твою вещь. Это кольцо.";
};


func int info_thorus_gilbert_ok_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert) && (GILBERT_OC == TRUE) && (Npc_HasItems(hero,thorusring) == 1))
	{
		return 1;
	};
};

func void info_thorus_gilbert_ok_info()
{
	AI_Output(other,self,"Info_Thorus_Gilbert_OK_15_00");	//Кажется я нашел твою вещь. Это кольцо.
	AI_Output(self,other,"Info_Thorus_Gilbert_OK_09_00");	//Да, то оно. Давай его сюда!
	AI_Output(other,self,"Info_Thorus_Gilbert_OK_15_01");	//Хм. Как на счет награды?
	AI_Output(self,other,"Info_Thorus_Gilbert_OK_09_01");	//О! За него мне ничего не жалко. Я дам тебе 100, нет, 50 кусков руды.
	B_GiveXP(500);
	GILBERT_OC = FALSE;
	B_GiveInvItems(self,hero,ItMiNugget,50);
	B_GiveInvItems(hero,self,thorusring,1);
	Log_SetTopicStatus(CH1_GILBERT,LOG_SUCCESS);
	B_LogEntry(CH1_GILBERT,"Я нашел кольцо Торуса. Жаль, я не смогу испрользовать его сам.");
};

