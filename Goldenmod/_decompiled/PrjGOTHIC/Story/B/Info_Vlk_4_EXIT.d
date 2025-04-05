
instance Info_Vlk_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_4_EXIT_Condition;
	information = Info_Vlk_4_EXIT_Info;
	permanent = 1;
	description = "ЗАКОНЧИТЬ";
};


func int Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_4_EXIT_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00");	//Спасибо. Удачи!
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01");	//Выше нос, приятель.
	AI_StopProcessInfos(self);
};


instance Info_Vlk_4_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_4_EinerVonEuchWerden_Condition;
	information = Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Что нужно сделать, для того чтобы присоединиться к этому Лагерю?";
};


func int Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_4_EinerVonEuchWerden_Info()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01");	//Что нужно сделать, чтобы присоединиться к этому Лагерю?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04");	//Ты хочешь стать стражником или Призраком? Это будет нелегко, приятель. Тебе придется пройти несколько испытаний прежде чем старый Торус позволит тебе встретиться с Гомезом.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02");	//Тебе нужно знать, с кем из местных стоит заводить знакомство, а с кем - враждовать. Но пока ты не присоединишься к одному из Лагерей, никто не будет воспринимать тебя всерьез.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03");	//Если бы я был на твоем месте, я бы поговорил с кем-нибудь из Призраков. Может быть среди них найдется тот, кто захочет помочь тебе. Не даром,  разумеется.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Vlk_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_4_WichtigePersonen_Condition;
	information = Info_Vlk_4_WichtigePersonen_Info;
	permanent = 1;
	description = "На кого еще из местных мне стоит обратить внимание?";
};


func int Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00");	//На кого еще из местных мне стоит обратить внимание?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01");	//Для новичка очень важно не испортить отношения с Граво. Может быть, он всего лишь рудокоп, но зато он знает, как вести дела с Баронами.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02");	//Если у тебя возникнут проблемы с компанией Гомеза, он поможет тебе и из этого выпутаться.
};


instance Info_Vlk_4_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_4_DasLager_Condition;
	information = Info_Vlk_4_DasLager_Info;
	permanent = 1;
	description = "На что здесь стоит обратить внимание? ";
};


func int Info_Vlk_4_DasLager_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00");	//На что здесь стоит обратить внимание?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01");	//Если тебе не улыбается идея копаться в шахте, попробуй побродить между северными воротами и воротами замка.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02");	//Если тебе повезет, Торус или Диего могут дать тебе какое-нибудь поручение - а это хороший шанс завоевать их расположение. Никому не помешает дружба с людьми Гомеза.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03");	//Или ты можешь встретить мага. Иногда они тоже дают поручения и хорошо платят за это.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04");	//Маги выходят из замка? Когда?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05");	//Если бы я знал. Спроси у тех, кто там живет.
};


instance Info_Vlk_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_4_DieLage_Condition;
	information = Info_Vlk_4_DieLage_Info;
	permanent = 1;
	description = "Все в порядке?";
};


func int Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00");	//Все в порядке?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01");	//В полном, как и двадцать лет назад. С тех пор все не слишком-то изменилось.
};

func void B_AssignAmbientInfos_Vlk_4(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc = Hlp_GetInstanceID(slf);
};

