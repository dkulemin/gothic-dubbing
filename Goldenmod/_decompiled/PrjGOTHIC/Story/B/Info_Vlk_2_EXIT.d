
instance Info_Vlk_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_2_EXIT_Condition;
	information = Info_Vlk_2_EXIT_Info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_2_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_2_EinerVonEuchWerden_Condition;
	information = Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я хочу присоединиться к вам.";
};


func int Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00");	//Я хочу стать одним из вас.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01");	//Не понимаю, зачем тебе добровольно соваться в шахту. Парни вроде тебя обычно довольно быстро переезжают в замок.
};


instance Info_Vlk_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_2_WichtigePersonen_Condition;
	information = Info_Vlk_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01");	//Здесь, во Внешнем Кольце, деньги за защиту собирают Флетчер, Бладвин и Шакал. У каждого из них есть свой район.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02");	//Если поладишь с ними, считай, все в порядке.
};


instance Info_Vlk_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_2_DasLager_Condition;
	information = Info_Vlk_2_DasLager_Info;
	permanent = 1;
	description = "Расскажи мне о Лагере.";
};


func int Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00");	//Расскажи мне о Лагере.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01");	//Тебе нужно поговорить с Призраками. Они знают обо всем, что тебе нужно. Но будь осторожен - большинству из них нельзя доверять.
};


instance Info_Vlk_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_2_DieLage_Condition;
	information = Info_Vlk_2_DieLage_Info;
	permanent = 1;
	description = "И как здесь живется?";
};


func int Info_Vlk_2_DieLage_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01");	//Если тебя прислали Бароны, скажи им, что я не хочу неприятностей. Я ни с кем не говорю об этом.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02");	//Я доволен тем, что они дают нам.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03");	//Никто меня не посылал. Я здесь недавно.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04");	//Новенький, а? Новички всегда быстро попадают в неприятности. А мне не нужны проблемы, понял?
};

func void B_AssignAmbientInfos_Vlk_2(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

