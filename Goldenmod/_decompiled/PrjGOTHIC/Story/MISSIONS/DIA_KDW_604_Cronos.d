
instance KDW_604_Cronos_Exit(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 999;
	condition = KDW_604_Cronos_Exit_Condition;
	information = KDW_604_Cronos_Exit_Info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE;
};


func int KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

func void KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasItems(self,ItArRuneIceCube))
	{
		CreateInvItem(self,ItArRuneIceCube);
	};
	if(!Npc_HasItems(self,ItArRuneThunderbolt))
	{
		CreateInvItem(self,ItArRuneThunderbolt);
	};
};


instance KDW_604_Cronos_Brief(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 1;
	condition = KDW_604_Cronos_Brief_Condition;
	information = KDW_604_Cronos_Brief_Info;
	permanent = 0;
	description = "У меня есть письмо Верховному Магу Круга Огня.";
};


func int KDW_604_Cronos_Brief_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_604_Cronos_Greet) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_KDF) && (hero.level < 10))
	{
		return 1;
	};
};

func void KDW_604_Cronos_Brief_Info()
{
	AI_Output(other,self,"DIA_Cronos_Brief_15_00");	//У меня письмо к Верховному Магу Круга Огня.
	AI_Output(self,other,"DIA_Cronos_Brief_08_01");	//Все мы здесь - маги Круга Воды. Маги Круга Огня живут в Старом Лагере.
	AI_Output(other,self,"DIA_Cronos_Brief_15_02");	//Но я не могу попасть в замок. Ты можешь помочь мне?
	AI_Output(self,other,"DIA_Cronos_Brief_08_03");	//Ну, время от времени мы посылаем гонцов к нашим братьям в Старом Лагере...
	AI_Output(self,other,"DIA_Cronos_Brief_08_04");	//Но свои послания мы доверяем только людям Лареса. Вот уже много лет он следит за тем, чтобы наши гонцы добирались до пункта назначения.
};


instance KDW_604_Cronos_Barrier(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 2;
	condition = KDW_604_Cronos_Barrier_Condition;
	information = KDW_604_Cronos_Barrier_Info;
	permanent = 0;
	description = "Вы хотите уничтожить Барьер - но как вы собираетесь это сделать?";
};


func int KDW_604_Cronos_Barrier_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

func void KDW_604_Cronos_Barrier_Info()
{
	AI_Output(other,self,"DIA_Cronos_Barrier_15_00");	//Вы хотите уничтожить Барьер - но как именно вы собираетесь это сделать?
	AI_Output(self,other,"DIA_Cronos_Barrier_08_01");	//Нам потребуются большие запасы магической руды.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_02");	//Освободив ее силу во время особой церемонии, мы уничтожим Барьер.
	AI_Output(self,other,"DIA_Cronos_Barrier_08_03");	//Конечно, запасы руды привлекают множество воров и мошенников!
	AI_Output(self,other,"DIA_Cronos_Barrier_08_04");	//Именно поэтому нам нужны люди, готовые защищать наш план.
};


instance KDW_604_Cronos_WannaJoin(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 3;
	condition = KDW_604_Cronos_WannaJoin_Condition;
	information = KDW_604_Cronos_WannaJoin_Info;
	permanent = 0;
	description = "Я хочу присоединиться к вам!";
};


func int KDW_604_Cronos_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

func void KDW_604_Cronos_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cronos_WannaJoin_15_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_Cronos_WannaJoin_08_01");	//Если ты хочешь стать одним из нас, ты должен поговорить с Ли или с Ларесом.
};


instance KDW_604_Cronos_WannaMage(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 3;
	condition = KDW_604_Cronos_WannaMage_Condition;
	information = KDW_604_Cronos_WannaMage_Info;
	permanent = 0;
	description = "Я хочу стать магом!";
};


func int KDW_604_Cronos_WannaMage_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

func void KDW_604_Cronos_WannaMage_Info()
{
	AI_Output(other,self,"DIA_Cronos_WannaMage_15_00");	//Я хочу стать магом!
	AI_Output(self,other,"DIA_Cronos_WannaMage_08_01");	//Мы не можем распространять наши знания среди своих врагов.
	AI_Output(self,other,"DIA_Cronos_WannaMage_08_02");	//О твоем обучении не может быть и речи до тех пор, пока ты не докажешь нам свою преданность.
};


instance KDW_604_Cronos_Bandit(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 4;
	condition = KDW_604_Cronos_Bandit_Condition;
	information = KDW_604_Cronos_Bandit_Info;
	permanent = 0;
	description = "Теперь я один из людей Лареса. Где послание для магов Огня?";
};


func int KDW_604_Cronos_Bandit_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void KDW_604_Cronos_Bandit_Info()
{
	AI_Output(other,self,"DIA_Cronos_Bandit_15_00");	//Теперь я один из людей Лареса. У тебя есть послание, которое ты хотел бы отправить со мной магам Огня?
	AI_Output(self,other,"DIA_Cronos_Bandit_08_01");	//Несомненно, есть. Но у тебя должен быть знак гонца, иначе люди Гомеза не пропустят тебя в замок.
	AI_Output(self,other,"DIA_Cronos_Bandit_08_02");	//Вот, возьми письмо и этот знак. И поспеши!
	CreateInvItem(other,KdW_Amulett);
	CreateInvItem(other,Cronos_Brief);
	Cronos_Messenger = LOG_RUNNING;
};


instance KDW_604_Cronos_BriefBack(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 3;
	condition = KDW_604_Cronos_BriefBack_Condition;
	information = KDW_604_Cronos_BriefBack_Info;
	permanent = 0;
	description = "Я передал ваше послание!";
};


func int KDW_604_Cronos_BriefBack_Condition()
{
	if(Cronos_Messenger == LOG_SUCCESS)
	{
		return 1;
	};
};

func void KDW_604_Cronos_BriefBack_Info()
{
	AI_Output(other,self,"DIA_Cronos_BriefBack_15_00");	//Я передал ваше послание!
	AI_Output(self,other,"DIA_Cronos_BriefBack_08_01");	//А, хорошо! Вот тебе небольшая награда за труды...
	CreateInvItems(self,ItMiNugget,200);
	B_GiveInvItems(self,other,ItMiNugget,200);
	B_GiveXP(XP_CronosLetter);
};


instance Info_Cronos_NEWS(C_Info)
{
	npc = KDW_604_Cronos;
	condition = Info_Cronos_NEWS_Condition;
	information = Info_Cronos_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "У меня важное послание для Сатураса!";
};


func int Info_Cronos_NEWS_Condition()
{
	if((CorAngar_SendToNC == TRUE) && !Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	};
};

func void Info_Cronos_NEWS_Info()
{
	AI_Output(other,self,"Info_Cronos_NEWS_15_01");	//У меня важное послание для Сатураса!
	AI_Output(self,other,"Info_Cronos_NEWS_08_02");	//Что такого важного в этом послании, чтобы наш духовный лидер отрывался ради него от своих исследований?
};


instance Info_Cronos_KALOM(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 10;
	condition = Info_Cronos_KALOM_Condition;
	information = Info_Cronos_KALOM_Info;
	permanent = 0;
	important = 0;
	description = "Кор Галом покинул Братство!";
};


func int Info_Cronos_KALOM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Cronos_NEWS) && !Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	};
};

func void Info_Cronos_KALOM_Info()
{
	AI_Output(other,self,"Info_Cronos_KALOM_15_01");	//Кор Галом покинул Братство вместе с несколькими фанатиками-Стражами!
	AI_Output(other,self,"Info_Cronos_KALOM_15_02");	//Он хочет сам найти Спящего и пробудить его во что бы то ни стало.
	AI_Output(self,other,"Info_Cronos_KALOM_08_03");	//Я никогда не доверял ему. Второй Гуру или нет, он всегда был коварным, тщеславным и способным на все.
	AI_Output(self,other,"Info_Cronos_KALOM_08_04");	//Братство прекрасно обойдется и без него!
	AI_Output(self,other,"Info_Cronos_KALOM_08_05");	//Как только появится возможность, я расскажу об этом Сатурасу. Теперь иди!
	AI_StopProcessInfos(self);
};


instance Info_Cronos_YBERION(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 20;
	condition = Info_Cronos_YBERION_Condition;
	information = Info_Cronos_YBERION_Info;
	permanent = 0;
	important = 0;
	description = "Ю'Берион, глава Лагеря Сектантов, находится без сознания!";
};


func int Info_Cronos_YBERION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Cronos_NEWS) && !Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	};
};

func void Info_Cronos_YBERION_Info()
{
	AI_Output(other,self,"Info_Cronos_YBERION1_15_01");	//Ю'Берион, глава Лагеря Сектантов, находится без сознания!
	AI_Output(self,other,"Info_Cronos_YBERION_08_02");	//ЧТО??? Как это могло случиться?
	AI_Output(other,self,"Info_Cronos_YBERION_15_03");	//Братство проводило магический ритуал, призывая своего бога.
	AI_Output(other,self,"Info_Cronos_YBERION_15_04");	//Похоже, умственное напряжение оказалось слишком сильным для Ю'Бериона.
	AI_Output(self,other,"Info_Cronos_YBERION1_08_05");	//Как жаль.
	AI_Output(self,other,"Info_Cronos_YBERION_08_06");	//Но я не вижу причины прерывать занятия Сатураса.
	AI_StopProcessInfos(self);
};


instance Info_Cronos_SLEEPER(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 30;
	condition = Info_Cronos_SLEEPER_Condition;
	information = Info_Cronos_SLEEPER_Info;
	permanent = 0;
	important = 0;
	description = "Гуру выяснили, что все это время они молились злому демону!";
};


func int Info_Cronos_SLEEPER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Cronos_NEWS))
	{
		return TRUE;
	};
};

func void Info_Cronos_SLEEPER_Info()
{
	AI_Output(other,self,"Info_Cronos_SLEEPER_15_01");	//Гуру выяснили, что все это время они молились злому демону!
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_02");	//Значит, теперь они считают своего Спящего демоном?
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_03");	//Похоже на очередную безумную идею Братства, но...
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_04");	//... если они действительно правы... вся колония может быть в огромной опасности.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_05");	//Ты должен немедленно доложить об этом Сатурасу. Он решит, что делать.
	AI_Output(other,self,"Info_Cronos_SLEEPER_15_06");	//Где мне найти Сатураса?
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_07");	//Поднимись на верхний уровень. Скажи стражникам, что я позволил тебе пройти.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_08");	//Пароль - ТЕТРИАНДОХ.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_09");	//Ты найдешь Сатураса у пентаграммы.
	AI_Output(self,other,"Info_Cronos_SLEEPER_08_10");	//Там он проводит все дни, пытаясь понять, как можно взорвать нашу железную гору.
	B_LogEntry(CH3_EscapePlanNC,"Кронос дал мне разрешение на визит к Сатурасу на верхнем уровне. Обычно его можно найти у пентаграммы. Пароль для охранников... Проклятье, как же звучит пароль?");
	B_GiveXP(XP_GetCronosPermission);
	AI_StopProcessInfos(self);
};


instance Info_Cronos_PAROLE(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 30;
	condition = Info_Cronos_PAROLE_Condition;
	information = Info_Cronos_PAROLE_Info;
	permanent = 0;
	important = 0;
	description = "Назови мне еще раз пароль.";
};


func int Info_Cronos_PAROLE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero,Info_Saturas_NEWS))
	{
		return TRUE;
	};
};

func void Info_Cronos_PAROLE_Info()
{
	AI_Output(other,self,"Info_Cronos_PAROLE_15_01");	//Назови мне еще раз пароль.
	AI_Output(self,other,"Info_Cronos_PAROLE_08_02");	//Память у тебя, как у моей бабушки. Пароль - ТЕТРИАНДОХ.
};


instance Info_Cronos_REWARD(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 30;
	condition = Info_Cronos_REWARD_Condition;
	information = Info_Cronos_REWARD_Info;
	permanent = 0;
	important = 0;
	description = "Сатурас сказал, что ты приготовил для меня награду.";
};


func int Info_Cronos_REWARD_Condition()
{
	if(Saturas_BringFoci == 5)
	{
		return TRUE;
	};
};

func void Info_Cronos_REWARD_Info()
{
	AI_Output(other,self,"Info_Cronos_REWARD_15_01");	//Сатурас сказал, что ты приготовил для меня награду.
	AI_Output(self,other,"Info_Cronos_REWARD_08_02");	//Как хранитель руды я хочу поделиться с тобой ее малой толикой в знак признательности за те великие дела, которые ты совершил для нашего Лагеря.
	AI_Output(self,other,"Info_Cronos_REWARD_08_03");	//Надеюсь, тебе она послужит не хуже, чем нам!
	B_LogEntry(CH3_BringFoci,"Кронос дал мне много руды, но это не очень истощит их гигантскую кучу.");
	if(Npc_KnowsInfo(hero,Info_Riordian_REWARD))
	{
		Log_SetTopicStatus(CH3_BringFoci,LOG_SUCCESS);
	};
	CreateInvItems(self,ItMiNugget,1000);
	B_GiveInvItems(self,hero,ItMiNugget,1000);
};


instance KDW_604_Cronos_WELCOME(C_Info)
{
	npc = KDW_604_Cronos;
	condition = KDW_604_Cronos_WELCOME_Condition;
	information = KDW_604_Cronos_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDW_604_Cronos_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_604_Cronos_WELCOME_Info()
{
	AI_Output(self,other,"KDW_604_Cronos_WELCOME_Info_08_01");	//Ты принял правильное решение - присоединиться к магам Воды. Добро пожаловать, брат!
	AI_StopProcessInfos(self);
};


instance KDW_604_Cronos_MANA(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 800;
	condition = KDW_604_Cronos_MANA_Condition;
	information = KDW_604_Cronos_MANA_Info;
	important = 0;
	permanent = 1;
	description = "Я хочу увеличить силу своей магии.";
};


func int KDW_604_Cronos_MANA_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_604_Cronos_Greet) && ((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero,Info_Cronos_SLEEPER)))
	{
		return TRUE;
	};
};

func void KDW_604_Cronos_MANA_Info()
{
	AI_Output(other,self,"KDW_604_Cronos_MANA_Info_15_01");	//Я хочу увеличить силу своей магии.
	AI_Output(self,other,"KDW_604_Cronos_MANA_Info_08_02");	//Я могу помочь тебе увеличить силу. Используй ее с умом.
	Info_ClearChoices(KDW_604_Cronos_MANA);
	Info_AddChoice(KDW_604_Cronos_MANA,DIALOG_BACK,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_1);
};

func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(KDW_604_Cronos_MANA);
	Info_AddChoice(KDW_604_Cronos_MANA,DIALOG_BACK,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_1);
};

func void KDW_604_Cronos_MANA_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(KDW_604_Cronos_MANA);
	Info_AddChoice(KDW_604_Cronos_MANA,DIALOG_BACK,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),KDW_604_Cronos_MANA_MAN_1);
};


instance KDW_604_Cronos_SELLSTUFF(C_Info)
{
	npc = KDW_604_Cronos;
	nr = 900;
	condition = KDW_604_Cronos_SELLSTUFF_Condition;
	information = KDW_604_Cronos_SELLSTUFF_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int KDW_604_Cronos_SELLSTUFF_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_604_Cronos_Greet) && ((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero,Info_Cronos_SLEEPER)))
	{
		return TRUE;
	};
};

func void KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output(other,self,"KDW_604_Cronos_SELLSTUFF_Info_15_01");	//Я хочу овладеть магическими письменами.
};


instance KDW_604_Cronos_Greet(C_Info)
{
	npc = KDW_604_Cronos;
	condition = KDW_604_Cronos_GREET_Condition;
	information = KDW_604_Cronos_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Приветствую тебя, Маг!";
};


func int KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};

func void KDW_604_Cronos_GREET_Info()
{
	AI_Output(other,self,"KDW_604_Cronos_GREET_Info_15_01");	//Приветствую тебя, Маг!
	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_02");	//Да пребудет с тобой благословение Аданоса! Я могу увеличить силу твоей магии или дать тебе нечто полезное.
	AI_Output(self,other,"KDW_604_Cronos_GREET_Info_08_03");	//Что я могу для тебя сделать?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Кронос продает руны, свитки и кольца. Его можно найти у решетки над горой руды в любое время дня и ночи.");
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Кронос может помочь мне в тренировке маны. Его можно найти у решетки над горой руды в любое время дня и ночи.");
};

