
instance SLD_704_BLADE_EXIT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 999;
	condition = sld_704_blade_exit_condition;
	information = sld_704_blade_exit_info;
	important = 0;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int sld_704_blade_exit_condition()
{
	return TRUE;
};

func void sld_704_blade_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_704_BLADE_ABANDONEDMINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_abandonedmine_condition;
	information = sld_704_blade_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_704_blade_abandonedmine_condition()
{
	if(Kapitel >= 4)
	{
		return 1;
	};
};

func void sld_704_blade_abandonedmine_info()
{
	var C_Npc dmt_abandobedmine;
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_00");	//(в шоке) Мы бежали из шахты! На нас напали демоны! Я не помню, как я попал сюда!
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_15_00");	//Успокойся. Что произошло?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_01");	//Стражники устроили склад в Заброшенной шахте и люди Лареса узнали об этом.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_02");	//Ларес заплатил мне и нескольким другим наемникам. Мы должны были просто узнать, сколько товаров хранится в шахте.
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_15_01");	//А что случилось в шахте?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_03");	//Вначале все было нормально, склад стражников находится недалеко от входа.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_04");	//Но одному из воров этого было мало, и он пошел вглубь шахты.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_05");	//Нам пора было сматываться из шахты, а этот парень долго не возвращался и мы отправились на его поиски.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_06");	//Когда мы проходили по верхней площадке, из дальнего прохода на нас напали демоны.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_07");	//(в отчаяньи) Все бросились бежать к выходу и... Я уже не помню что происходило потом.
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_15_02");	//А где эти люди, с которыми ты ходил в шахту?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_08");	//Я не помню. Должно быть они уже добрались до лагеря.
	Log_CreateTopic(CH4_ABANDONEDMINE,LOG_MISSION);
	Log_SetTopicStatus(CH4_ABANDONEDMINE,LOG_RUNNING);
	B_LogEntry(CH4_ABANDONEDMINE,"Неподалеку от Нового лагеря я встретил Блейда, наемника. Он сказал, что ходил в Заброшенню шахту, где на него напали демоны.");
	dmt_abandobedmine = Hlp_GetNpc(Grd_201_Jackal);
	dmt_abandobedmine.guild = GIL_None;
	Npc_SetTrueGuild(dmt_abandobedmine,GIL_None);
};


instance SLD_704_BLADE_MINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_mine_condition;
	information = sld_704_blade_mine_info;
	permanent = 0;
	description = "Могу я чем-нибудь помочь?";
};


func int sld_704_blade_mine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_abandonedmine))
	{
		return 1;
	};
};

func void sld_704_blade_mine_info()
{
	AI_Output(other,self,"SLD_704_Blade_MINE_15_00");	//Могу я чем-нибудь помочь?
	AI_Output(self,other,"SLD_704_Blade_MINE_11_00");	//Ты хочешь пойти со мной в шахту?
	AI_Output(other,self,"SLD_704_Blade_MINE_15_01");	//Да, я хочу выяснить что там произошло.
	AI_Output(self,other,"SLD_704_Blade_MINE_11_01");	//Хорошо, но с этим кинжалом я очень быстро превращусь в мертвеца. Мне нужен мой топор!
	AI_Output(other,self,"SLD_704_Blade_MINE_15_02");	//И где же твой топор?
	AI_Output(self,other,"SLD_704_Blade_MINE_11_02");	//Я потерял его где-то на горе, когда бежал из шахты.
	AI_Output(other,self,"SLD_704_Blade_MINE_15_03");	//Я найду твой топор.
	B_LogEntry(CH4_ABANDONEDMINE,"Я ришил помочь Блейду разобраться с демонами. Но сначала мне нужно найти топор Блейда, который он потерял на горе около шахты.");
};


instance SLD_704_BLADE_AXT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_axt_condition;
	information = sld_704_blade_axt_info;
	permanent = 0;
	description = "Я нашел твой топор.";
};


func int sld_704_blade_axt_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_mine) && (Npc_HasItems(hero,blade_axt) >= 1))
	{
		return 1;
	};
};

func void sld_704_blade_axt_info()
{
	AI_Output(other,self,"SLD_704_Blade_AXT_15_00");	//Я нашел твой топор.
	AI_Output(self,other,"SLD_704_Blade_AXT_11_00");	//Мы можем отправляться.
	AI_Output(self,other,"SLD_704_Blade_AXT_11_01");	//Но ты должен взять побольше эликсиров перед походом в шахту.
	B_GiveXP(350);
	B_GiveInvItems(hero,self,blade_axt,1);
	EquipItem(self,blade_axt);
	B_LogEntry(CH4_ABANDONEDMINE,"Я нашел топор Блейда.");
	B_LogEntry(CH4_ABANDONEDMINE,"Он посоветовал мне взять побольше эликсиров перед тем, как отправиться в шахту.");
};


instance SLD_704_BLADE_GO(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_go_condition;
	information = sld_704_blade_go_info;
	permanent = 0;
	description = "Идем в шахту.";
};


func int sld_704_blade_go_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_axt))
	{
		return 1;
	};
};

func void sld_704_blade_go_info()
{
	AI_Output(other,self,"SLD_704_Blade_GO_15_00");	//Идем в шахту.
	AI_Output(self,other,"SLD_704_Blade_GO_11_00");	//Хорошо, увидимся у входа в шахту.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"nearmine");
};


instance SLD_704_BLADE_NEAR_MINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_near_mine_condition;
	information = sld_704_blade_near_mine_info;
	permanent = 0;
	important = 1;
};


func int sld_704_blade_near_mine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_go) && (Npc_GetDistToWP(hero,"WP_BLADE_1") < 1000))
	{
		return 1;
	};
};

func void sld_704_blade_near_mine_info()
{
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_11_00");	//Уф! Дай-ка перевести дух. У тебя есть что-нибудь выпить?
	B_LogEntry(CH4_ABANDONEDMINE,"Мы дошли до Заброшенной шахты.");
	Info_AddChoice(sld_704_blade_near_mine,"Извини, я не прихватил с собой.",sld_704_blade_near_mine_nothing);
	if(Npc_HasItems(hero,ItFoWine) >= 1)
	{
		Info_AddChoice(sld_704_blade_near_mine,"Вино.",sld_704_blade_near_mine_wine);
	};
	if(Npc_HasItems(hero,ItFoBooze) >= 1)
	{
		Info_AddChoice(sld_704_blade_near_mine,"Шнапс.",sld_704_blade_near_mine_booze);
	};
	if(Npc_HasItems(hero,ItFoBeer) >= 1)
	{
		Info_AddChoice(sld_704_blade_near_mine,"Пиво.",sld_704_blade_near_mine_beer);
	};
};

func void sld_704_blade_near_mine_beer()
{
	AI_Output(other,self,"SLD_704_Blade_NEAR_MINE_BEER_15_00");	//Пиво.
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_11_01");	//Давай сюда.
	B_GiveXP(50);
	B_GiveInvItems(hero,self,ItFoBeer,1);
	AI_UseItem(self,ItFoBeer);
	Info_ClearChoices(sld_704_blade_near_mine);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"nearmine");
};

func void sld_704_blade_near_mine_booze()
{
	AI_Output(other,self,"SLD_704_Blade_NEAR_MINE_BOOZE_15_00");	//Шнапс.
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_11_01");	//Давай сюда.
	B_GiveXP(50);
	B_GiveInvItems(hero,self,ItFoBooze,1);
	AI_UseItem(self,ItFoBooze);
	Info_ClearChoices(sld_704_blade_near_mine);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"nearmine");
};

func void sld_704_blade_near_mine_wine()
{
	AI_Output(other,self,"SLD_704_Blade_NEAR_MINE_WINE_15_00");	//Вино.
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_11_01");	//Давай сюда.
	B_GiveXP(50);
	B_GiveInvItems(hero,self,ItFoWine,1);
	AI_UseItem(self,ItFoWine);
	Info_ClearChoices(sld_704_blade_near_mine);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"nearmine");
};

func void sld_704_blade_near_mine_nothing()
{
	AI_Output(other,self,"SLD_704_Blade_NEAR_MINE_NOTHING_15_00");	//Извини, я не прихватил с собой.
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_NOTHING_11_00");	//Ну нет, так нет.
	Info_ClearChoices(sld_704_blade_near_mine);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"nearmine");
};


instance SLD_704_BLADE_TO_MINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_to_mine_condition;
	information = sld_704_blade_to_mine_info;
	permanent = 0;
	description = "Так мы идем, или нет?";
};


func int sld_704_blade_to_mine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_near_mine))
	{
		return 1;
	};
};

func void sld_704_blade_to_mine_info()
{
	AI_Output(other,self,"SLD_704_Blade_TO_MINE_15_00");	//Так мы идем, или нет?
	AI_Output(self,other,"SLD_704_Blade_TO_MINE_11_00");	//(безнадежно) Боюсь, это наши последние минуты жизни...
	AI_Output(other,self,"SLD_704_Blade_TO_MINE_15_01");	//Хватит ныть! Ты кто – наемник или трус?
	AI_Output(self,other,"SLD_704_Blade_TO_MINE_11_01");	//Ты прав! Я ОТОМЩУ ЗА СВОИХ!
	AI_Output(self,other,"SLD_704_Blade_TO_MINE_11_02");	//Идем дальше!
	ABANDONEDMINE_WHEEL = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"mine");
};


instance SLD_704_BLADE_AFTER_ABANDONEDMINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_after_abandonedmine_condition;
	information = sld_704_blade_after_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_704_blade_after_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_after_dmt_abandonedmine))
	{
		return 1;
	};
};

func void sld_704_blade_after_abandonedmine_info()
{
	AI_Output(self,other,"SLD_704_Blade_AFTER_ABANDONEDMINE_11_00");	//Что за чертовщина. Я просто готов убить тебя!
	AI_Output(other,self,"SLD_704_Blade_AFTER_ABANDONEDMINE_15_00");	//Что?!
	AI_Output(self,other,"SLD_704_Blade_AFTER_ABANDONEDMINE_11_01");	//Я не понимаю. Моя голова! Мне лучше присесть.
	B_LogEntry(CH4_ABANDONEDMINE,"После того, как мы вышли из шахты, с Блейдом происходит что-то странное.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"aftermine");
};


instance SLD_704_BLADE_ABANDONEDMINE_WHAT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_abandonedmine_what_condition;
	information = sld_704_blade_abandonedmine_what_info;
	permanent = 0;
	description = "Ты в порядке?";
};


func int sld_704_blade_abandonedmine_what_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_after_abandonedmine))
	{
		return 1;
	};
};

func void sld_704_blade_abandonedmine_what_info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00");	//Ты в порядке?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_00");	//Я сам не свой. Похоже, эта тварь заколдовала меня.
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_WHAT_15_01");	//А как же я? Я говорил с ним!
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_01");	//Но ты... Ты в норме?
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_WHAT_15_02");	//Вроде бы да.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_02");	//Ах, вероятно эффект проявляется лишь со временем.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_03");	//Беги к магам. Разъясни им, что здесь произошло!
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_04");	//А я присмотрю за шахтой.
	B_GiveXP(500);
	B_LogEntry(CH4_ABANDONEDMINE,"Блейд останется и будет наблюдать за шахтой. А я должен рассказать обо всем магам воды.");
	B_ClearImmortal(self);
};


instance SLD_704_BLADE_ABANDONEDMINE_ABOUT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_abandonedmine_about_condition;
	information = sld_704_blade_abandonedmine_about_info;
	permanent = 1;
	description = "Здесь все спокойно?";
};


func int sld_704_blade_abandonedmine_about_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_abandonedmine_what))
	{
		return 1;
	};
};

func void sld_704_blade_abandonedmine_about_info()
{
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_ABOUT_15_00");	//Здесь все спокойно?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_ABOUT_11_00");	//Да, из шахты никто не выходил.
};

