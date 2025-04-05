
instance SLD_9704_BLADE_EXIT(C_Info)
{
	npc = sld_9704_blade;
	nr = 999;
	condition = sld_9704_blade_exit_condition;
	information = sld_9704_blade_exit_info;
	important = 0;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int sld_9704_blade_exit_condition()
{
	return TRUE;
};

func void sld_9704_blade_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_9704_BLADE_INSIDE_ABANDONEDMINE(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_inside_abandonedmine_condition;
	information = sld_9704_blade_inside_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_inside_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_to_mine))
	{
		return 1;
	};
};

func void sld_9704_blade_inside_abandonedmine_info()
{
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_00");	//Вот мы и здесь. Как видишь, это пещерка с тем, на что так позарился Ларес. Пускай идет сюда и забирает.
	AI_Output(other,self,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_15_00");	//Что в этих ящиках?
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_01");	//Одежка, старинные монеты, проржавевшая сталь, гнилые шкуры... это лежит здесь уже много лет...
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_02");	//Единственное, что мы здесь нашли, что представляет хоть какую-то ценность, это пакеты с зельями.
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_03");	//Очевидно, их-то и притащили сюда стражники накануне. Только я вот одного не могу понять – зачем? Проклятье!
	AI_Output(other,self,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_15_01");	//Успокойся. По-моему, мы пришли сюда разобраться с демонами и найти этого вора, если он еще в шахте.
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_04");	//Иди вперед.
	B_GiveXP(300);
	B_LogEntry(CH4_ABANDONEDMINE,"Мы вошли в шахту. Пока я не заметил ничего необычного.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(SLD_704_Blade,"atmine");
	AI_SetWalkMode(self,NPC_RUN);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"seek");
};


instance SLD_9704_BLADE_DMT_ABANDONEDMINE(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_dmt_abandonedmine_condition;
	information = sld_9704_blade_dmt_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_dmt_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_inside_abandonedmine) && (Npc_GetDistToWP(hero,"MINE_BLADE_2") <= 2000) && (ABANDONEDMINEISOK == FALSE))
	{
		return 1;
	};
};

func void sld_9704_blade_dmt_abandonedmine_info()
{
	AI_Output(self,other,"SLD_9704_Blade_DMT_ABANDONEDMINE_11_00");	//Это случилось здесь. Демоны неожиданно появильсь из прохода и напали на нас.
	AI_Output(other,self,"SLD_9704_Blade_DMT_ABANDONEDMINE_15_00");	//Хм, не похоже, чтобы здесь недавно происходил бой. Странно.
	B_LogEntry(CH4_ABANDONEDMINE,"Блейд указал мне место, где на него напали демоны.");
	AI_StopProcessInfos(self);
};


instance SLD_9704_BLADE_BEFORE_DMT_ABANDONEDMINE(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_before_dmt_abandonedmine_condition;
	information = sld_9704_blade_before_dmt_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_before_dmt_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_inside_abandonedmine) && (Npc_GetDistToWP(hero,"MINE_BLADE_3") <= 2000) && (ABANDONEDMINEISOK == FALSE))
	{
		return 1;
	};
};

func void sld_9704_blade_before_dmt_abandonedmine_info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_11_00");	//Похоже, мы почти пришли. Я останусь здесь и прикрою тыл.
	AI_Output(other,self,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_15_00");	//Я должен справиться с ними один?
	AI_Output(self,other,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_11_01");	//Если у тебя будут проблемы, вымани этих тварий сюда.
	AI_Output(self,other,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_11_02");	//Я просто не хочу, чтобы нас атаковали сзади.
	AI_Output(other,self,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_15_01");	//Посмотрим, что мне удасться сделать.
	B_LogEntry(CH4_ABANDONEDMINE,"Дальше мне придется справляться одному.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"mine");
};


instance SLD_9704_BLADE_AFTER_DMT_ABANDONEDMINE(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_after_dmt_abandonedmine_condition;
	information = sld_9704_blade_after_dmt_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_after_dmt_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,dia_abandonedminedemon_ok))
	{
		return 1;
	};
};

func void sld_9704_blade_after_dmt_abandonedmine_info()
{
	AI_Output(self,other,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_11_00");	//Почему так долго?! Ты убил их?!
	AI_Output(other,self,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_15_00");	//Лорда демонов невозможно убить обычным оружием.
	AI_Output(self,other,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_11_01");	//Думаю, здесь могут помочь маги воды. Расскажи об этом Сатурасу.
	B_LogEntry(CH4_ABANDONEDMINE,"Блейд думает, что маги воды могут уничтожить демона. Я должен рассказать о нем Сатурасу.");
	AI_Output(other,self,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_15_01");	//Выжившие люди Лареса теперь стали слугами демонов. Мы должны скорее выбираться отсюда.
	AI_Output(self,other,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_11_02");	//Проклятье! Бежим же!
	B_LogEntry(CH4_ABANDONEDMINE,"Нам лучше покинуть шахту как можно быстрее.");
	B_GiveXP(500);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(SLD_704_Blade,"mine");
	Npc_ExchangeRoutine(self,"run");
	AI_SetWalkMode(self,NPC_RUN);
};


instance SLD_9704_BLADE_INSIDE_ABANDONEDMINE_OK(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_inside_abandonedmine_ok_condition;
	information = sld_9704_blade_inside_abandonedmine_ok_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_inside_abandonedmine_ok_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_after_dmt_abandonedmine) && (Npc_GetDistToWP(hero,"MINE_BLADE_1") <= 2000))
	{
		return 1;
	};
};

func void sld_9704_blade_inside_abandonedmine_ok_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_OK_11_00");	//(облегченной вздыхает) Кажется, мы оторвались.
	AI_Output(other,self,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_OK_15_00");	//Да, идем к выходу.
	AI_SetWalkMode(self,NPC_WALK);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"atmine");
};

