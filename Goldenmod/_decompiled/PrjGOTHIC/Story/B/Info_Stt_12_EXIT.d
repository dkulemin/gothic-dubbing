
instance Info_Stt_12_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Stt_12_EXIT_Condition;
	information = Info_Stt_12_EXIT_Info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int Info_Stt_12_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Stt_12_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Stt_12_EinerVonEuchWerden_Condition;
	information = Info_Stt_12_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я хочу стать одним из Призраков.";
};


func int Info_Stt_12_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Stt_12_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00");	//Я хочу стать одним из Призраков.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01");	//Ох. Тогда тебе стоит знать, что Гомез не выносит отказов. Если хочешь стать одним из нас, ты должен быть готов пройти ради него огонь и воду.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02");	//В лучшем случае принимают не более половины желающих.
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03");	//А что случается с остальными?
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04");	//Уходят в Новый Лагерь жевать рис. Хе-хе-хе.
};


instance Info_Stt_12_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Stt_12_WichtigePersonen_Condition;
	information = Info_Stt_12_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_12_WichtigePersonen_Info()
{
	var C_Npc diego;
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01");	//Пожалуй, Диего можно назвать главой Призраков. Но кто сможет поговорить с Гомезом, решает Торус.
	diego = Hlp_GetNpc(PC_Thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Stt_12_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Stt_12_DasLager_Condition;
	information = Info_Stt_12_DasLager_Info;
	permanent = 1;
	description = "Хотелось бы знать, что такого хорошего в этом Лагере?";
};


func int Info_Stt_12_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_12_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_12_DasLager_15_00");	//Хотелось бы знать, что такого хорошего в этом Лагере?
	AI_Output(self,other,"Info_Stt_12_DasLager_12_01");	//Тебе лучше поговорить об этом с рудокопами - им все равно нечем заняться.
};


instance Info_Stt_12_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Stt_12_DieLage_Condition;
	information = Info_Stt_12_DieLage_Info;
	permanent = 1;
	description = "Как дела?";
};


func int Info_Stt_12_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_12_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_12_DieLage_15_00");	//Ну и как идут дела?
	AI_Output(self,other,"Info_Stt_12_DieLage_12_01");	//Что тебе нужно?
};

func void B_AssignAmbientInfos_Stt_12(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Stt_12_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DieLage.npc = Hlp_GetInstanceID(slf);
};

