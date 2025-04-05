
instance DIA_Horatio_EXIT(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 999;
	condition = DIA_Horatio_EXIT_Condition;
	information = DIA_Horatio_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Horatio_EXIT_Condition()
{
	return 1;
};

func void DIA_Horatio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Horatio_Wasser(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 800;
	condition = Info_Horatio_Wasser_Condition;
	information = Info_Horatio_Wasser_Info;
	permanent = 1;
	description = "Меня послал Лефти. Я принес тебе воды.";
};


func int Info_Horatio_Wasser_Condition()
{
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Horatio_Wasser_Info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00");	//Меня послал Лефти. Я принес тебе воды.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01");	//Спасибо, парень! Еще немного, и я бы начал пить из лужи.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00");	//У тебя уже ничего не осталось. Я попрошу у остальных.
	};
};


var int horatio_trouble;

instance DIA_Horatio_Hello(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_Hello_Condition;
	information = DIA_Horatio_Hello_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Horatio_Hello_Condition()
{
	return 1;
};

func void DIA_Horatio_Hello_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_Horatio_Hello_09_00");	//Что ты здесь делаешь? Ищешь неприятностей?
	Info_ClearChoices(DIA_Horatio_Hello);
	Info_AddChoice(DIA_Horatio_Hello,"Проблемы? С кем? С крестьянином?",DIA_Horatio_Hello_PissOff);
	Info_AddChoice(DIA_Horatio_Hello,"Эй, расслабься! Я новенький.",DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output(other,self,"DIA_Horatio_Hello_BeCool_15_00");	//Эй, расслабься! Я новенький.
	AI_Output(self,other,"DIA_Horatio_Hello_BeCool_09_01");	//А-а. Тогда ладно. Трудно угадать заранее. Каждый день здесь проходит толпа народа, и каждый думает, что мир вращется именно вокруг него.
	Info_ClearChoices(DIA_Horatio_Hello);
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output(other,self,"DIA_Horatio_Hello_PissOff_15_00");	//Проблемы? С кем? С крестьянином?
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_01");	//Даже если я работаю в поле, это еще не значит, что я не могу постоять за себя.
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_02");	//Если хочешь неприятностей - давай, подходи!
	horatio_trouble = TRUE;
	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos(self);
};


instance DIA_Horatio_SORRY(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_SORRY_Condition;
	information = DIA_Horatio_SORRY_Info;
	permanent = 1;
	description = "Извини, я не хотел тебя обидеть.";
};


func int DIA_Horatio_SORRY_Condition()
{
	if(horatio_trouble == TRUE)
	{
		return 1;
	};
};

func void DIA_Horatio_SORRY_Info()
{
	AI_Output(other,self,"DIA_Horatio_SORRY_15_00");	//Извини, я не хотел тебя обидеть.
	AI_Output(self,other,"DIA_Horatio_SORRY_09_01");	//Раньше нужно было думать, парень!
};


instance DIA_Horatio_Story(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_Story_Condition;
	information = DIA_Horatio_Story_Info;
	permanent = 0;
	description = "Что ты вообще делаешь среди крестьян?";
};


func int DIA_Horatio_Story_Condition()
{
	if((horatio_trouble == FALSE) && Npc_KnowsInfo(hero,DIA_Horatio_Hello))
	{
		return 1;
	};
};

func void DIA_Horatio_Story_Info()
{
	AI_Output(other,self,"DIA_Horatio_Story_15_00");	//Что ты вообще делаешь среди крестьян?
	AI_Output(self,other,"DIA_Horatio_Story_09_01");	//Об этом меня попросил Ли. Я больше не дерусь. Разве только чтобы защитить себя.
	AI_Output(self,other,"DIA_Horatio_Story_09_02");	//Я убил одного парня, и это был уже перебор. В результате меня вышвырнули в  Богом проклятую колонию - справедливо, в общем.
	AI_Output(other,self,"DIA_Horatio_Story_15_03");	//Как это случилось?
	AI_Output(self,other,"DIA_Horatio_Story_09_04");	//Обычная кабацкая драка. Я не хотел его убивать - наверное, просто ударил слишко сильно.
	AI_Output(self,other,"DIA_Horatio_Story_09_05");	//Тогда я был кузнецом - сам не знал своей силы.
};


instance DIA_Horatio_WhyHere(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_WhyHere_Condition;
	information = DIA_Horatio_WhyHere_Info;
	permanent = 0;
	description = "Почему ты присоединился к ЭТОМУ Лагерю?";
};


func int DIA_Horatio_WhyHere_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

func void DIA_Horatio_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_00");	//Почему ты присоединился к ЭТОМУ Лагерю?
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_01");	//Вот что я скажу тебе: у меня не было тогда другого выбора, но я и не собираюсь позволять этим Гуру промывать мне мозги.
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_02");	//В Старом Лагере я немного не поладил со стражниками, хотя и воры, и наемники проявляли уважение.
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_03");	//Они боялись тебя...
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_04");	//Может быть. В любом случае, теперь я здесь и советую тебе попробовать то же самое.
};


var int horatio_StrFree;

instance DIA_Horatio_PleaseTeachSTR(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_PleaseTeachSTR_Condition;
	information = DIA_Horatio_PleaseTeachSTR_Info;
	permanent = 0;
	description = "Как мне стать таким же сильным, как ты? Ты можешь научить меня? ";
};


func int DIA_Horatio_PleaseTeachSTR_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

func void DIA_Horatio_PleaseTeachSTR_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_15_00");	//Как мне стать таким же сильным, как ты? Ты можешь научить меня?
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_09_01");	//Даже если и могу - ДЛЯ ЧЕГО тебе нужна сила?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if(Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio))
	{
		Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Чтобы избавиться от Лорда и его головорезов!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	};
	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Для того чтобы защищать себя!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Для того чтобы научить этих ублюдков хорошим манерам!",DIA_Horatio_PleaseTeachSTR_Attack);
	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"Хороший вопрос. Я подумаю об этом...",DIA_Horatio_PleaseTeachSTR_BACK);
	Log_CreateTopic(CH1_HoratiosTeachings,LOG_MISSION);
	Log_SetTopicStatus(CH1_HoratiosTeachings,LOG_RUNNING);
	B_LogEntry(CH1_HoratiosTeachings,"Горацио, фермер на рисовых полях Нового Лагеря, может научить меня, как наносить более сильные удары. Но пока мне не удается ответить на его вопрос - зачем?");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00");	//Для того чтобы научить этих ублюдков хорошим манерам!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01");	//Прежде чем это случится, ты сам станешь одним из этих ублюдков... Нет, я не буду учить тебя ради этого.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00");	//Для того чтобы защищать себя!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01");	//Для этого нужна не сила - скорость. Неужели ты думаешь, что сворачивать челюсти лучше, чем жить в мире?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00");	//Хороший вопрос. Я подумаю об этом...
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00");	//Чтобы избавиться от Лорда и его головорезов!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01");	//Х-мм... Ты будешь далеко не первым из тех, кто пытался сделать это.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};


instance DIA_Horatio_ThoughtSTR(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_ThoughtSTR_Condition;
	information = DIA_Horatio_ThoughtSTR_Info;
	permanent = 1;
	description = "Я подумал об этом...";
};


func int DIA_Horatio_ThoughtSTR_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE))
	{
		return 1;
	};
};

func void DIA_Horatio_ThoughtSTR_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_15_00");	//Я думал об этом...
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_09_01");	//И что же? Придумал что-нибудь получше?
	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
	Info_AddChoice(DIA_Horatio_ThoughtSTR,"Нет.",DIA_Horatio_ThoughtSTR_NoIdea);
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if(Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio))
	{
		Info_AddChoice(DIA_Horatio_ThoughtSTR,"Да. Я хочу избавиться от Лорда и его головорезов!",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00");	//Нет.
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01");	//Я так и знал.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00");	//Да. Я хочу избавиться от Лорда и его головорезов!
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01");	//Х-мм... Ты будешь далеко не первым из тех, кто пытался сделать это.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
};

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	if(other.attribute[ATR_STRENGTH] <= (100 - 5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
		PrintScreen("Сила +5",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(other.attribute[ATR_STRENGTH] < 100)
	{
		other.attribute[ATR_STRENGTH] = 100;
		PrintScreen("Сила: 100",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("Я уже слишком силен",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00");	//Если ты хочешь иметь сильный удар, ты должен знать, как это делается. Это первое, чему учат кузнеца.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01");	//Учись вкладывать в удар всю руку, от плеча до запястья.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02");	//Чем лучше у тебя это получается, тем сильнее удар. Я думаю, ты освоишь это довольно быстро.
	NA_GIL_SLD = TRUE;
};


instance DIA_Horatio_HelpSTR(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_HelpSTR_Condition;
	information = DIA_Horatio_HelpSTR_Info;
	permanent = 0;
	description = "Я ИЗБАВЛЮСЬ от Лорда и его головорезов.";
};


func int DIA_Horatio_HelpSTR_Condition()
{
	if(horatio_StrFree == TRUE)
	{
		return 1;
	};
};

func void DIA_Horatio_HelpSTR_Info()
{
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_00");	//Я ИЗБАВЛЮСЬ от Лорда и его головорезов - конечно, если ты поможешь мне.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_09_01");	//Хорошо! Я поклялся, что никогда больше не нападу на человека, но я никому не обещал не учить других, как правильно делать это.
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_02");	//Я весь внимание!
	HORATIO_LORD = TRUE;
	DIA_Horatio_HelpSTR_LEARN_NOW();
	Log_SetTopicStatus(CH1_HoratiosTeachings,LOG_SUCCESS);
	B_LogEntry(CH1_HoratiosTeachings,"Горацио показал мне, как использовать свою силу в бою и как сильнее бить. Чистейшей души человек.");
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		Log_CreateTopic(CH1_HORATIO_OK,LOG_MISSION);
		Log_SetTopicStatus(CH1_HORATIO_OK,LOG_RUNNING);
		B_LogEntry(CH1_HORATIO_OK,"Я обещал Горацио разобраться с лордом и его головорезами. Надо сделать это быстро, пока они от меня этого не ожидают.");
	};
};


instance DIA_Horatio_Thanks(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_Thanks_Condition;
	information = DIA_Horatio_Thanks_Info;
	permanent = 1;
	description = "Спасибо тебе за помощь!";
};


func int DIA_Horatio_Thanks_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};
};

func void DIA_Horatio_Thanks_Info()
{
	AI_Output(other,self,"DIA_Horatio_Thanks_15_00");	//Спасибо за помощь!
	AI_Output(self,other,"DIA_Horatio_Thanks_09_01");	//Используй это знание только по необходимости и НИКАК БОЛЬШЕ.
};


instance DIA_HORATIO_LORD(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 3;
	condition = dia_horatio_lord_condition;
	information = dia_horatio_lord_info;
	permanent = 0;
	description = "Я сдержал обещание.";
};


func int dia_horatio_lord_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR) && Npc_KnowsInfo(hero,dia_ricelord_horatio) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void dia_horatio_lord_info()
{
	var C_Npc lord;
	var C_Npc Lefty;
	var C_Npc schlaegera;
	var C_Npc schlaegerb;
	AI_Output(other,self,"DIA_Horatio_Lord_15_00");	//Я сдержал обещание. Лорд и его дружки больше не будут обижать крестьян.
	lord = Hlp_GetNpc(Bau_900_Ricelord);
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	schlaegera = Hlp_GetNpc(Org_845_Schlaeger);
	schlaegerb = Hlp_GetNpc(Org_846_Schlaeger);
	if((Npc_IsDead(lord) == TRUE) || (Npc_IsDead(Lefty) == TRUE) || (Npc_IsDead(schlaegera) == TRUE) || (Npc_IsDead(schlaegerb) == TRUE))
	{
		AI_Output(self,other,"DIA_Horatio_Lord_09_01");	//Но я не просил тебя никого убивать.
		Log_SetTopicStatus(CH1_HORATIO_OK,LOG_SUCCESS);
		B_LogEntry(CH1_HORATIO_OK,"Горацио не понравилось, что я убил головорезов лорда. Но можно считать, что я выполнил задание.");
		B_GiveXP(50);
	}
	else
	{
		AI_Output(self,other,"DIA_Horatio_Lord_09_02");	//Я вижу ты верен своему слову. Я научу тебя, как сделать удар еще сильнее.
		Log_SetTopicStatus(CH1_HORATIO_OK,LOG_SUCCESS);
		B_LogEntry(CH1_HORATIO_OK,"Горацио знает, что я всегда держу слово. В благодарность он сделал меня сильнее.");
		if(other.attribute[ATR_STRENGTH] <= (100 - 2))
		{
			other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 2;
			PrintScreen("Сила +2",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		}
		else if(other.attribute[ATR_STRENGTH] < 100)
		{
			other.attribute[ATR_STRENGTH] = 100;
			PrintScreen("Сила: 100",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		}
		else
		{
			PrintScreen("Я уже слишком силен",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
		B_GiveXP(250);
	};
	HORATIO_LORD = FALSE;
	NA_GIL_SLD = FALSE;
};

