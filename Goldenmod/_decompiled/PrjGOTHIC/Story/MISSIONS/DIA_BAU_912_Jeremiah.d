
instance DIA_Jeremiah_EXIT(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 999;
	condition = DIA_Jeremiah_EXIT_Condition;
	information = DIA_Jeremiah_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

func void DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jeremiah_Hallo(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_Hallo_Condition;
	information = DIA_Jeremiah_Hallo_Info;
	permanent = 0;
	description = "Чем ты занимаешься?";
};


func int DIA_Jeremiah_Hallo_Condition()
{
	if(!Npc_KnowsInfo(hero,dia_jeremiah_spirit_ok))
	{
		return 1;
	};
};

func void DIA_Jeremiah_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00");	//Что ты делаешь?
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//Готовлю рисовый шнапс, парень.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//Вот, возьми бутыку. Только не говори Силасу.
	CreateInvItems(self,ItFoBooze,1);
	B_GiveInvItems(self,other,ItFoBooze,1);
};


var int Jeremiah_Bauer;

instance DIA_Jeremiah_PERM(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_PERM_Condition;
	information = DIA_Jeremiah_PERM_Info;
	permanent = 1;
	description = "Как идут дела?";
};


func int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

func void DIA_Jeremiah_PERM_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00");	//Как идут дела?
	if(!Npc_KnowsInfo(hero,dia_jeremiah_spirit_ok))
	{
		AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//Я едва поспеваю с этими типами. Боже, сколько же они пьют!
		AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//Но это к лучшему. Пока я занят делом, шакалы нашего Лорда стараются мне не мешать.
		Jeremiah_Bauer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jeremiah_PERM_04_03");	//Теперь я могу немного отдохнуть.
		AI_Output(self,other,"DIA_Jeremiah_PERM_04_04");	//Но когда лорд узнает, что я ничем не занят, он погонит меня работать в поле.
	};
};


instance DIA_Jeremiah_Horatio(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = DIA_Jeremiah_Horatio_Condition;
	information = DIA_Jeremiah_Horatio_Info;
	permanent = 0;
	description = "Расскажи мне о Лорде.";
};


func int DIA_Jeremiah_Horatio_Condition()
{
	if(Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

func void DIA_Jeremiah_Horatio_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//Расскажи мне о Лорде.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//Проклятая свинья! Его головорезы выбирают тех, кто послабее, и заставляют их работать на полях.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//Единственный, кто мог бы противостоять ему, - это Горацио.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//Я слышал однажды, как он говорил, что с удовольствием вбил бы тупую голову нашего Лорда в плечи по самые уши... Но он никогда этого не сделает.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//Это против его убеждений.
};


instance DIA_JEREMIAH_SPIRIT(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = dia_jeremiah_spirit_condition;
	information = dia_jeremiah_spirit_info;
	permanent = 0;
	description = "Ты можешь дать мне спирт?";
};


func int dia_jeremiah_spirit_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work))
	{
		return 1;
	};
};

func void dia_jeremiah_spirit_info()
{
	AI_Output(other,self,"DIA_Jeremiah_SPIRIT_15_00");	//Ты можешь дать мне спирт?
	AI_Output(self,other,"DIA_Jeremiah_SPIRIT_04_01");	//Сколько тебе нужно?
	AI_Output(other,self,"DIA_Jeremiah_SPIRIT_15_01");	//Думаю, хватит 10 мензурок.
	AI_Output(self,other,"DIA_Jeremiah_SPIRIT_04_02");	//Хорошо. найди мне замену, тогда я дам тебе спирт.
	B_LogEntry(CH4_YBERION_INNOS,"Иеремия даст мне спирт, если я найду ему замену.");
};


instance DIA_JEREMIAH_SPIRIT_OK(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = dia_jeremiah_spirit_ok_condition;
	information = dia_jeremiah_spirit_ok_info;
	permanent = 0;
	description = "Шеньян согласился заменить тебя.";
};


func int dia_jeremiah_spirit_ok_condition()
{
	if(Npc_KnowsInfo(hero,dia_senyan_spirit_ok) || Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void dia_jeremiah_spirit_ok_info()
{
	AI_Output(other,self,"DIA_Jeremiah_SPIRIT_OK_15_00");	//Шеньян согласился заменить тебя.
	AI_Output(self,other,"DIA_Jeremiah_SPIRIT_OK_04_01");	//Теперь я смогу немного отдохнуть.
	AI_Output(self,other,"DIA_Jeremiah_SPIRIT_OK_04_02");	//Вот 10 мензурок спирта, как ты и просил.
	B_GiveXP(150);
	B_GiveInvItems(self,hero,ItMi_Alchemy_Alcohol_01,10);
	B_LogEntry(CH4_YBERION_INNOS,"Я получил спирт у Иеремии.");
};

