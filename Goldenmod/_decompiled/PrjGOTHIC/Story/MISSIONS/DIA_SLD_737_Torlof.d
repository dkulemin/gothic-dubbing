
instance DIA_Torlof_EXIT(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_Hallo(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 1;
	condition = DIA_Torlof_Hallo_Condition;
	information = DIA_Torlof_Hallo_Info;
	permanent = 0;
	description = "Как тебя зовут?";
};


func int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

func void DIA_Torlof_Hallo_Info()
{
	AI_Output(other,self,"DIA_Torlof_Hallo_15_00");	//Как тебя зовут?
	AI_Output(self,other,"DIA_Torlof_Hallo_04_01");	//Меня зовут Торлоф.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_02");	//Я служил старшим помощником на военном корабле и принял участие в мятеже.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_03");	//Ничего из этой затеи не вышло. Большая часть команды оказалась на стороне капитана.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_04");	//Так я попал сюда.
};


instance DIA_Torlof_Mitmachen(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 2;
	condition = DIA_Torlof_Mitmachen_Condition;
	information = DIA_Torlof_Mitmachen_Info;
	permanent = 1;
	description = "Я хочу присоединиться к вам!";
};


func int DIA_Torlof_Mitmachen_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) || (Npc_GetTrueGuild(hero) == GIL_ORG))
	{
		return 1;
	};
};

func void DIA_Torlof_Mitmachen_Info()
{
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01");	//Ли не примет тебя в отряд, пока не узнает, чего ты стоишь.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02");	//А до тех пор тебе лучше поддерживать хорошие отношения с Ларесом и его шайкой.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03");	//Если нужен совет, я скажу тебе вот что: добудь что-нибудь важное из Старого Лагеря или Старой Шахты.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04");	//Как только эти парни поймут, что ты тоже против Гомеза, проблем у тебя станет значительно меньше.
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05");	//И как это провернуть?
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06");	//Сначала тебе придется завоевать их ДОВЕРИЕ - и только потом ограбить.
};

