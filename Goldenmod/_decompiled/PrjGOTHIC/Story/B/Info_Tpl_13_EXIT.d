
instance Info_Tpl_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_13_EXIT_Condition;
	information = Info_Tpl_13_EXIT_Info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Tpl_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_13_EinerVonEuchWerden_Condition;
	information = Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я хочу стать Стражем, как и ты.";
};


func int Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00");	//Я хочу стать Стражем, как и ты.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01");	//А знаешь ли ты, от чего мне пришлось отказаться, прежде чем я смог встать на страже покоя избранных Спящим?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02");	//Не думай, что сможешь так вот запросто попасть на это место и получить подобающий почет и уважение.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03");	//Прежде чем говорить об этом, ты должен узнать немного об учении Спящего.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04");	//Это займет некоторое время и, возможно, приведет тебя в чувство.
};


instance Info_Tpl_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_13_WichtigePersonen_Condition;
	information = Info_Tpl_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01");	//Наши Гуру и избранные Спящего. Спящий определяет нашу судьбу, и Гуру служат ему пророками.
};


instance Info_Tpl_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_13_DasLager_Condition;
	information = Info_Tpl_13_DasLager_Info;
	permanent = 1;
	description = "Мне хотелось бы заглянуть в храм Спящего...";
};


func int Info_Tpl_13_DasLager_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00");	//Мне хотелось бы заглянуть в храм Спящего...
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01");	//И думать забудь об этом! Неверующий в Храме! Пока ты не посвятишь себя службе Спящему, ты не сможешь переступить порог этого места!
};


instance Info_Tpl_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_13_DieLage_Condition;
	information = Info_Tpl_13_DieLage_Info;
	permanent = 1;
	description = "Как дела?";
};


func int Info_Tpl_13_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01");	//С тех пор как я стал одним из избранных защитников веры, я чувствую себя, как никогда раньше.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02");	//Звучит занятно...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03");	//Ты неверующий. Тебе не понять.
};

func void B_AssignAmbientInfos_Tpl_13(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

