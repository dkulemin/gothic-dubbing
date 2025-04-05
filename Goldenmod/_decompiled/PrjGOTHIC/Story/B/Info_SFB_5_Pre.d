
instance Info_SFB_5_Pre(C_Info)
{
	nr = 1;
	condition = Info_SFB_5_Pre_Condition;
	information = Info_SFB_5_Pre_Info;
	permanent = 0;
	important = 1;
};


func int Info_SFB_5_Pre_Condition()
{
	return 1;
};

func void Info_SFB_5_Pre_Info()
{
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_05_00");	//Привет!
};


instance Info_SFB_5_EXIT(C_Info)
{
	nr = 999;
	condition = Info_SFB_5_EXIT_Condition;
	information = Info_SFB_5_EXIT_Info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int Info_SFB_5_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_SFB_5_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_SFB_5_EinerVonEuchWerden_Condition;
	information = Info_SFB_5_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Что если я хочу присоединиться к вам?";
};


func int Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00");	//Что если я хочу присоединиться к вам?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_05_01");	//Присоединиться к нам? И кем ты хочешь быть - водоносом?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02");	//Нет, рудокопом.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_05_03");	//Послушай, что я скажу тебе: никто ДОБРОВОЛЬНО не становится рудокопом.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_05_04");	//Конечно, если ты настаиваешь... Иди и поговори со Суини - уверен, у него найдется для тебя старая кирка.
};


instance Info_SFB_5_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_SFB_5_WichtigePersonen_Condition;
	information = Info_SFB_5_WichtigePersonen_Info;
	permanent = 1;
	description = "Кого здесь можно считать важным человеком?";
};


func int Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00");	//Кого здесь можно считать важным человеком?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_05_01");	//Важным? Меня, конечно.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_05_02");	//Я думаю, ты хотел спросить, кто здесь главный.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_05_03");	//Я думаю, тебе стоит поговорить с наемниками или с ворами. Магов Воды ты даже не увидишь.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_05_04");	//Суини - большая задница, но считает себя большой шишкой. На самом деле он просто раскладывает кирки и делает то, что ему прикажет Окил.
};


instance Info_SFB_5_DasLager(C_Info)
{
	nr = 2;
	condition = Info_SFB_5_DasLager_Condition;
	information = Info_SFB_5_DasLager_Info;
	permanent = 1;
	description = "Что хорошего в этом Лагере?";
};


func int Info_SFB_5_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00");	//Что хорошего в этом Лагере?
	AI_Output(self,other,"Info_SFB_5_DasLager_05_01");	//Это зависит от человека. Одним не достанется ничего, кроме работы, другие получат чертову уйму удовольствия.
};


instance Info_SFB_5_DieLage(C_Info)
{
	nr = 1;
	condition = Info_SFB_5_DieLage_Condition;
	information = Info_SFB_5_DieLage_Info;
	permanent = 1;
	description = "И как здесь живется?";
};


func int Info_SFB_5_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_SFB_5_DieLage_05_01");	//Отлично!
	AI_Output(self,other,"Info_SFB_5_DieLage_05_02");	//Именно потому, что нам так нравится здесь, мы изо всех сил пытаемся отсюда выбраться.
	AI_Output(self,other,"Info_SFB_5_DieLage_05_03");	//Как, ты думаешь, называется это место? Это тюрьма, а в тюрьме жить никому не нравится.
};

func void B_AssignAmbientInfos_SFB_5(var C_Npc slf)
{
	Info_SFB_5_Pre.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc = Hlp_GetInstanceID(slf);
};

