
instance Org_818_Ratford_Exit(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 999;
	condition = Org_818_Ratford_Exit_Condition;
	information = Org_818_Ratford_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_818_Ratford_Exit_Condition()
{
	return 1;
};

func void Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_818_Ratford_WrongWay(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WrongWay_Condition;
	information = Org_818_Ratford_WrongWay_Info;
	permanent = 0;
	important = 1;
};


func int Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

func void Org_818_Ratford_WrongWay_Info()
{
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00");	//Эй, ты!
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01");	//Что тебе?
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//Просто хочу предупредить тебя. Дальше начинаются наши охотничьи угодья.
};


instance Org_818_Ratford_WhatGame(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhatGame_Condition;
	information = Org_818_Ratford_WhatGame_Info;
	permanent = 0;
	description = "А на кого вы охотитесь?";
};


func int Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhatGame_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00");	//А на кого вы охотитесь?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//В основном, на падальщиков. Много мяса - и не так уж сложно с ними справиться. Если, конечно, знаешь - как.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//В самом деле? И как же?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//Спроси у моего приятеля Дракса - он знает об этом больше, чем кто бы то ни было.
};


instance Org_818_Ratford_WhyDangerous(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhyDangerous_Condition;
	information = Org_818_Ratford_WhyDangerous_Info;
	permanent = 0;
	description = "Почему это место настолько опасно?";
};


func int Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00");	//Почему это место настолько опасно?
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//Ты новенький, да? Каждое место в колонии опасно... так или иначе.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//Безопасны лишь дороги между Лагерями - да и здесь можно набрести на волков, которые посчитают тебя легкой добычей.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//И ты действительно ею станешь, если не подберешь себе нормальное оружие и доспехи.
};


instance Org_818_Ratford_WoEquipment(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoEquipment_Condition;
	information = Org_818_Ratford_WoEquipment_Info;
	permanent = 0;
	description = "Где можно найти хорошее оружие?";
};


func int Org_818_Ratford_WoEquipment_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoEquipment_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//Где можно найти хорошее оружие?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//Ближайшее место - Старый Лагерь. Просто иди по тропинке - она приведет тебя туда.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//Но в нашем Новом Лагере можно достать вещи дешевле - если, конечно, знаешь нужных людей.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//Если окажешься в Старом Лагере, разыщи Мордрага. Он один из нас. Немного руды, и он продаст тебе все, что нужно.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Вор Мордраг в Старом Лагере продает различные товары по приемлемым ценам.");
};


instance Org_818_Ratford_MoreLocations(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_MoreLocations_Condition;
	information = Org_818_Ratford_MoreLocations_Info;
	permanent = 0;
	description = "Расскажи мне что-нибудь о колонии.";
};


func int Org_818_Ratford_MoreLocations_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_MoreLocations_Info()
{
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00");	//Расскажи мне что-нибудь о колонии.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//Для того чтобы добраться от одного Лагеря до другого нужна карта - сэкономишь время и не будешь без толку плутать по дорогам.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//Тупик может оказаться опасным ущельем, где обитают твари, которых лучше обходить стороной.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//Не приближайся к старым развалинам. Их здесь много вокруг. Большинство из них - обломки укреплений времен первой войны с орками. Попадаются и брошенные оркские норы.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//Среди развалин можно встретить орков - а иногда кое-кого и похуже. Я стараюсь не ходить туда, особенно ночью.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//И еще один совет: не стоит заходить в лес!
};


instance Org_818_Ratford_WoKarte(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoKarte_Condition;
	information = Org_818_Ratford_WoKarte_Info;
	permanent = 0;
	description = "Где я могу раздобыть карту?";
};


func int Org_818_Ratford_WoKarte_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoKarte_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//Где я могу раздобыть карту?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//Расспроси людей в Старом Лагере. Где-то там должен жить картограф.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//Может, тебе даже удастся стянуть у него одну из карт. Если получится, прихвати одну для меня, ладно?
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Я бы взял столько, сколько смог унести.",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"Зачем? Эти карты - разве он не продает их?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	var C_Npc Lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//Если предоставится возможность взять их, не заплатив, то я наберу столько, сколько смогу унести.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//А ты ничего. Тебе стоит подумать о том, чтобы присоединиться к Новому Лагерю. Если вдруг окажешься там, найди Лареса. Уверен, он подыщет тебе работу.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//Зачем? Эти карты - разве он не продает их?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//Ну, если у тебя есть чем заплатить...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};


instance Org_818_Ratford_Thanks(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 888;
	condition = Org_818_Ratford_Thanks_Condition;
	information = Org_818_Ratford_Thanks_Info;
	permanent = 0;
	description = "Я благодарю тебя за помощь.";
};


func int Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

func void Org_818_Ratford_Thanks_Info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//Благодарю за помощь.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//Не думай, что все будут такими же дружелюбными, парень.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//Карманы у новичков обычно пусты, но кое-кто мог бы убить тебя даже ради простой кирки.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//Я буду иметь это в виду.
};


instance ORG_818_RATFORD_MAP(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = org_818_ratford_map_condition;
	information = org_818_ratford_map_info;
	permanent = 0;
	description = "Я принес тебе карту.";
};


func int org_818_ratford_map_condition()
{
	if(Npc_HasItems(hero,ItWrWorldmap) >= 1)
	{
		return 1;
	};
};

func void org_818_ratford_map_info()
{
	AI_Output(other,self,"Org_818_Ratford_Map_15_00");	//Я принес тебе карту.
	if(Kapitel == 1)
	{
		AI_Output(self,other,"Org_818_Ratford_Map_07_01");	//Что? Вот уж не ожидал от тебя такого. Откуда она у тебя?
		Info_AddChoice(org_818_ratford_map,"Я стянул ее у картографа.",org_818_ratford_map_steal);
		Info_AddChoice(org_818_ratford_map,"Я купил ее у картографа.",org_818_ratford_map_buy);
	}
	else
	{
		AI_Output(self,other,"Org_818_Ratford_Map_07_02");	//Что? У меня уже есть одна.
	};
};

func void org_818_ratford_map_buy()
{
	AI_Output(other,self,"Org_818_Ratford_Map_BUY_15_00");	//Я купил ее у картографа.
	AI_Output(self,other,"Org_818_Ratford_Map_BUY_07_01");	//Видно дела твои идут не так уж и плохо, если ты смог позволить себе такое.
	AI_Output(self,other,"Org_818_Ratford_Map_BUY_07_02");	//Но ты же не думаешь, что я собираюсь заплатить тебе за нее. Вот, возьми пиво.
	B_GiveInvItems(other,self,ItWrWorldmap,1);
	B_GiveInvItems(self,other,ItFoBeer,1);
	B_GiveXP(100);
	Info_ClearChoices(org_818_ratford_map);
};

func void org_818_ratford_map_steal()
{
	AI_Output(other,self,"Org_818_Ratford_Map_STEAL_15_00");	//Я стянул ее у картографа.
	AI_Output(self,other,"Org_818_Ratford_Map_STEAL_07_01");	//Ха-ха! А ты молодец! Вот, возьми. Думаю, что тебе это пригодится.
	B_GiveInvItems(other,self,ItWrWorldmap,1);
	B_GiveInvItems(self,other,ItKeLockpick,5);
	B_GiveXP(100);
	Info_ClearChoices(org_818_ratford_map);
};

