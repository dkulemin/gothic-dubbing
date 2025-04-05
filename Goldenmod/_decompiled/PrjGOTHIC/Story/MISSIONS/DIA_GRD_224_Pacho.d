
instance Info_Pacho_EXIT(C_Info)
{
	npc = GRD_224_Pacho;
	nr = 999;
	condition = Info_Pacho_EXIT_Condition;
	information = Info_Pacho_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Pacho_EXIT_Condition()
{
	return TRUE;
};

func void Info_Pacho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Pacho_STOP(C_Info)
{
	npc = GRD_224_Pacho;
	condition = Info_Pacho_STOP_Condition;
	information = Info_Pacho_STOP_Info;
	important = 1;
	permanent = 0;
};


func int Info_Pacho_STOP_Condition()
{
	if(HERO_IS_GRD != TRUE)
	{
		return 1;
	};
};

func void Info_Pacho_STOP_Info()
{
	AI_Output(self,hero,"Info_Pacho_STOP_13_01");	//Эй, ты!
	AI_Output(hero,self,"Info_Pacho_STOP_15_02");	//Кто? Я?
	AI_Output(self,hero,"Info_Pacho_STOP_13_03");	//Нет, твоя бабушка... К кому еще я могу обращаться?!
	AI_Output(self,hero,"Info_Pacho_STOP_13_04");	//На твоем месте я бы не ходил туда!
	AI_Output(hero,self,"Info_Pacho_STOP_15_05");	//Почему нет?
	AI_Output(self,hero,"Info_Pacho_STOP_13_06");	//Сразу видно, что ты новичок.
	AI_Output(self,hero,"Info_Pacho_STOP_13_07");	//Парень, эта дорога ведет к землям орков...
	AI_Output(self,hero,"Info_Pacho_STOP_13_08");	//Они с радостью приготовят из тебя закуску к шнапсу!
	AI_Output(hero,self,"Info_Pacho_STOP_15_09");	//Ох...
	AI_Output(self,hero,"Info_Pacho_STOP_13_10");	//Не за что!
	AI_StopProcessInfos(self);
};


instance INFO_PACHO_GRD_FM(C_Info)
{
	npc = GRD_224_Pacho;
	condition = info_pacho_grd_fm_condition;
	information = info_pacho_grd_fm_info;
	important = 1;
	permanent = 0;
};


func int info_pacho_grd_fm_condition()
{
	if(Npc_KnowsInfo(hero,thorus_freemine) && (HERO_IS_GRD == TRUE))
	{
		return 1;
	};
};

func void info_pacho_grd_fm_info()
{
	AI_Output(self,hero,"Info_Pacho_GRD_FM_13_01");	//Ну, сколько можно тебя ждать?
	AI_Output(hero,self,"Info_Pacho_GRD_FM_15_02");	//Я пришел, как только мне сообщил Торус.
	AI_Output(self,hero,"Info_Pacho_GRD_FM_13_03");	//Ладно, все равно он сам сильно задерживается.
	Info_AddChoice(info_pacho_grd_fm,"(ждать стражников)",info_pacho_grd_fm_ok);
};

func void info_pacho_grd_fm_ok()
{
	var C_Npc Thorus;
	var C_Npc jackal;
	var C_Npc gardist_1;
	var C_Npc gardist_2;
	var C_Npc gardist_3;
	var C_Npc gardist_4;
	var C_Npc gardist_5;
	if(Wld_IsTime(6,0,10,0))
	{
		Wld_SetTime(11,0);
	}
	else if(Wld_IsTime(10,1,14,0))
	{
		Wld_SetTime(15,0);
	}
	else if(Wld_IsTime(14,1,16,0))
	{
		Wld_SetTime(17,0);
	}
	else if(Wld_IsTime(16,1,19,0))
	{
		Wld_SetTime(20,0);
	}
	else if(Wld_IsTime(19,1,23,0))
	{
		Wld_SetTime(0,20);
	}
	else if(Wld_IsTime(23,1,2,0))
	{
		Wld_SetTime(3,0);
	}
	else
	{
		Wld_SetTime(4,50);
	};
	IntroduceChapter("Ожидание стражников.","Прошло несколько часов. Торус со стражниками подошли к шахте.","freemine.tga","levelup.wav",6000);
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	jackal = Hlp_GetNpc(Grd_201_Jackal);
	gardist_1 = Hlp_GetNpc(GRD_252_Gardist);
	gardist_2 = Hlp_GetNpc(GRD_253_Gardist);
	gardist_3 = Hlp_GetNpc(GRD_244_Gardist);
	gardist_4 = Hlp_GetNpc(GRD_232_Gardist);
	gardist_5 = Hlp_GetNpc(GRD_229_Gardist);
	B_ExchangeRoutine(Thorus,"ToFMTaken");
	B_ExchangeRoutine(jackal,"ToFMTaken");
	B_ExchangeRoutine(gardist_1,"ToFMTaken");
	B_ExchangeRoutine(gardist_2,"ToFMTaken");
	B_ExchangeRoutine(gardist_3,"ToFMTaken");
	B_ExchangeRoutine(gardist_4,"ToFMTaken");
	B_ExchangeRoutine(gardist_5,"ToFMTaken");
	Info_ClearChoices(info_pacho_grd_fm);
	AI_StopProcessInfos(self);
};


instance INFO_PACHO_GRD_FM_END(C_Info)
{
	npc = GRD_224_Pacho;
	nr = 1;
	condition = info_pacho_grd_fm_end_condition;
	information = info_pacho_grd_fm_end_info;
	important = 1;
	permanent = 0;
};


func int info_pacho_grd_fm_end_condition()
{
	if(Npc_KnowsInfo(hero,thorus_freemine_war_end) && (Npc_GetTrueGuild(other) == GIL_GRD) && (FMTaken == TRUE))
	{
		return 1;
	};
};

func void info_pacho_grd_fm_end_info()
{
	var C_Npc Thorus;
	var C_Npc jackal;
	var C_Npc gardist_1;
	var C_Npc gardist_2;
	var C_Npc gardist_3;
	var C_Npc gardist_4;
	var C_Npc gardist_5;
	var C_Npc pacho;
	AI_Output(self,hero,"Info_Pacho_GRD_FM_END_13_01");	//А куда это ты собрался?
	AI_Output(hero,self,"Info_Pacho_GRD_FM_END_15_02");	//Ну, я...
	AI_Output(self,hero,"Info_Pacho_GRD_FM_END_13_03");	//Эй, парни, идите сюда! У нас предатель!
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	jackal = Hlp_GetNpc(Grd_201_Jackal);
	gardist_1 = Hlp_GetNpc(GRD_252_Gardist);
	gardist_2 = Hlp_GetNpc(GRD_253_Gardist);
	gardist_3 = Hlp_GetNpc(GRD_244_Gardist);
	gardist_4 = Hlp_GetNpc(GRD_232_Gardist);
	gardist_5 = Hlp_GetNpc(GRD_229_Gardist);
	pacho = Hlp_GetNpc(GRD_224_Pacho);
	Thorus.flags = 0;
	jackal.flags = 0;
	gardist_1.flags = 0;
	gardist_2.flags = 0;
	gardist_3.flags = 0;
	gardist_4.flags = 0;
	gardist_5.flags = 0;
	pacho.flags = 0;
	B_SetPermAttitude(Thorus,ATT_HOSTILE);
	B_SetPermAttitude(jackal,ATT_HOSTILE);
	B_SetPermAttitude(gardist_1,ATT_HOSTILE);
	B_SetPermAttitude(gardist_2,ATT_HOSTILE);
	B_SetPermAttitude(gardist_3,ATT_HOSTILE);
	B_SetPermAttitude(gardist_4,ATT_HOSTILE);
	B_SetPermAttitude(gardist_5,ATT_HOSTILE);
	B_SetPermAttitude(self,ATT_HOSTILE);
	Thorus.npcType = Npctype_ROGUE;
	jackal.npcType = Npctype_ROGUE;
	gardist_1.npcType = Npctype_ROGUE;
	gardist_2.npcType = Npctype_ROGUE;
	gardist_3.npcType = Npctype_ROGUE;
	gardist_4.npcType = Npctype_ROGUE;
	gardist_5.npcType = Npctype_ROGUE;
	self.npcType = Npctype_ROGUE;
	Npc_SetTrueGuild(hero,GIL_None);
	hero.guild = GIL_None;
	Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
	B_LogEntry(CH4_BannedFromOC,"Один из стражников заметил меня, когда я пытался выбраться из Свободной шахты.");
	NA_GIL = FALSE;
	AI_StopProcessInfos(self);
};

