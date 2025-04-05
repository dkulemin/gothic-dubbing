
instance Info_Vlk_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_3_EXIT_Condition;
	information = Info_Vlk_3_EXIT_Info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_3_EinerVonEuchWerden_Condition;
	information = Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Как мне присоединиться к этому Лагерю?";
};


func int Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00");	//Как мне присоединиться к этому Лагерю?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01");	//Я всего лишь рудокоп. Мне нечего тебе сказать. Тебе нужно поговорить с Призраками или со стражей.
};


instance Info_Vlk_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_3_WichtigePersonen_Condition;
	information = Info_Vlk_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int Info_Vlk_3_WichtigePersonen_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01");	//Гомез. Он живет в замке. Но нам, рудокопам, и со стражниками проблем хватает.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02");	//Тебе лучше не вставать у них на пути. Впрочем, это не моя проблема.
};


instance Info_Vlk_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_3_DasLager_Condition;
	information = Info_Vlk_3_DasLager_Info;
	permanent = 1;
	description = "На что здесь стоит обратить внимание? ";
};


func int Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00");	//На что здесь стоит обратить внимание?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01");	//Если тебе нравится азарт, приходи по вечерам к арене. Если хочешь купить что-нибудь, отправляйся на рынок.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02");	//Там продают практически все. Кроме карт. Если нужны карты, тебе стоит увидеть Грехэма. Его дом находится напротив ворот замка.
};


instance Info_Vlk_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_3_DieLage_Condition;
	information = Info_Vlk_3_DieLage_Info;
	permanent = 1;
	description = "Как жизнь?";
};


func int Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01");	//Скоро ты все поймешь. Всегда будь начеку. Особенно по ночам.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02");	//Знаешь, сколько я уже не спал по-человечески? А если ты не спишь в этой колонии, считай, работаешь в две смены.
};

func void B_AssignAmbientInfos_Vlk_3(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

