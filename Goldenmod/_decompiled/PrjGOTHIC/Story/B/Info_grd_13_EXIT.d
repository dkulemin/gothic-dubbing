
instance Info_grd_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_grd_13_EXIT_Condition;
	information = Info_grd_13_EXIT_Info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int Info_grd_13_EXIT_Condition()
{
	return 1;
};

func void Info_grd_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_grd_13_EinerVonEuchWerden(C_Info)
{
	nr = 1;
	condition = Info_grd_13_EinerVonEuchWerden_Condition;
	information = Info_grd_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я хочу стать стражником.";
};


func int Info_grd_13_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00");	//Я хочу стать стражником.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01");	//Ну, это будет нелегко, приятель.
};


instance Info_grd_13_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_grd_13_WichtigePersonen_Condition;
	information = Info_grd_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00");	//А кто здесь главный?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01");	//Я. И скажу тебе, парень: лучше следи за своим языком.
};


instance Info_grd_13_DasLager(C_Info)
{
	nr = 1;
	condition = Info_grd_13_DasLager_Condition;
	information = Info_grd_13_DasLager_Info;
	permanent = 1;
	description = "Как мне попасть в замок?";
};


func int Info_grd_13_DasLager_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void Info_grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00");	//Как мне попасть в замок?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01");	//А никак. Только люди Гомеза могут зайти туда.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Понятно.",Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"А что если подкупить стражников?",Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"А как мне встретиться с Гомезом?",Info_grd_13_DasLager_GomezSprechen);
};

func void Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00");	//Понятно.
	Info_ClearChoices(Info_grd_13_DasLager);
};

func void Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00");	//А что если подкупить стражников?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01");	//Наглости тебе не занимать, да? Думаю, они могут отвернуться в сторону на минуту-другую, если ты предложишь им достаточно руды.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02");	//Но если Гомез узнает о том, что они позволили кому-то пробраться в замок, многих бросят в подземелье.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03");	//За этот риск также придется доплатить, и немало.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04");	//Но даже если ты и попадешь в замок, что толку? Внутри все здания охраняются не хуже.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05");	//Я просто так спрашивал, из любопытства.
};

func void Info_grd_13_DasLager_GomezSprechen()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00");	//А как мне встретиться с Гомезом?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01");	//Гомеза не интересуют новички, которые еще никак не проявили себя.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02");	//Впрочем, поговори с Торусом.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_grd_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_grd_13_DieLage_Condition;
	information = Info_grd_13_DieLage_Info;
	permanent = 1;
	description = "Как дела?";
};


func int Info_grd_13_DieLage_Condition()
{
	if(!C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01");	//Все тихо. Есть большая разница в том, с кем ссориться - с Новым Лагерем или с болотными придурками.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02");	//Пока ты новенький, это не имеет значения. Но, выбрав свой Лагерь, ты получаешь не только друзей, но и врагов.
};

func void B_AssignAmbientInfos_grd_13(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_grd_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

