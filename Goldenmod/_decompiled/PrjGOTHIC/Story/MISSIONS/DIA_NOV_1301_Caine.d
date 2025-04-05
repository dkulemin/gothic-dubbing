
instance DIA_Caine_Exit(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 999;
	condition = DIA_Caine_Exit_Condition;
	information = DIA_Caine_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Caine_Exit_Condition()
{
	return 1;
};

func void DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Caine_Hallo(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Hallo_Condition;
	information = DIA_Caine_Hallo_Info;
	permanent = 0;
	description = "Привет! Я здесь новенький.";
};


func int DIA_Caine_Hallo_Condition()
{
	return 1;
};

func void DIA_Caine_Hallo_Info()
{
	AI_Output(other,self,"DIA_Caine_Hallo_15_00");	//Привет! Я здесь новенький!
	AI_Output(self,other,"DIA_Caine_Hallo_13_01");	//Я... я... я Каин, ученик Кор Галома. Ты ведь слышал о нем, да?
	Info_ClearChoices(DIA_Caine_Hallo);
	Info_AddChoice(DIA_Caine_Hallo,"Нет.",DIA_Caine_Hallo_Nein);
	Info_AddChoice(DIA_Caine_Hallo,"Да.",DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00");	//А-га.
	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01");	//Тогда ты знаешь, что он второй человек в этом Лагере... п-после Ю'Бериона.
	Info_ClearChoices(DIA_Caine_Hallo);
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00");	//Нет.
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01");	//Нет?! Ты здесь недавно, не так ли?
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02");	//Кор Галом в этом Лагере - второй человек после Ю'Бериона. Он решает, кого принимать к нам, а кого нет.
	Info_ClearChoices(DIA_Caine_Hallo);
};


instance DIA_Caine_Job(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_Job_Condition;
	information = DIA_Caine_Job_Info;
	permanent = 0;
	description = "А ты чем занимаешься?";
};


func int DIA_Caine_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return 1;
	};
};

func void DIA_Caine_Job_Info()
{
	AI_Output(other,self,"DIA_Caine_Job_15_00");	//А ты чем занимаешься?
	AI_Output(self,other,"DIA_Caine_Job_13_01");	//Я... я... я помогаю ему готовить снадобья.
	AI_Output(self,other,"DIA_Caine_Job_13_02");	//В основном б-болотник и слюна ползунов. С-слюна нужна больше всего.
};


instance DIA_Caine_WoSekret(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WoSekret_Condition;
	information = DIA_Caine_WoSekret_Info;
	permanent = 0;
	description = "Как добывается слюна ползунов?";
};


func int DIA_Caine_WoSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_WoSekret_Info()
{
	AI_Output(other,self,"DIA_Caine_WoSekret_15_00");	//Как добывается слюна ползунов?
	AI_Output(self,other,"DIA_Caine_WoSekret_13_01");	//Ползунов ты можешь найти в Старой Шахте. Но нужно еще знать, как добывается слюна.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_02");	//Если ты и в самом деле хочешь поохотиться на этих тварей, поговори лучше со Стражами, кто поопытнее. С Гор На Драком, например.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_03");	//Он ходит между Старой Шахтой и... и Лагерем каждый день. А п-по утрам ты можешь застать его в лаборатории.
};


instance DIA_Caine_AddInfoKalom(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_AddInfoKalom_Condition;
	information = DIA_Caine_AddInfoKalom_Info;
	permanent = 0;
	description = "Что еще ты можешь рассказать о своем господине?";
};


func int DIA_Caine_AddInfoKalom_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_AddInfoKalom_Info()
{
	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00");	//Что еще ты можешь рассказать о своем господине?
	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01");	//Он... он не такой, как... как все Гуру. К нему может обратиться любой, но... но НИКОМУ не позволено попусту тратить его драгоценное время.
};


instance Nov_1301_Caine_CHEST(C_Info)
{
	npc = NOV_1301_Caine;
	condition = Nov_1301_Caine_CHEST_Condition;
	information = Nov_1301_Caine_CHEST_Info;
	important = 0;
	permanent = 0;
	description = "Как добыть рецепт эликсира Кор Галома?";
};


func int Nov_1301_Caine_CHEST_Condition()
{
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Nov_1301_Caine_CHEST_Info()
{
	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01");	//Как добыть рецепт эликсира Кор Галома?
	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02");	//Никак. Он хранит его в запертом сундуке и не отдаст никому ни за какие деньги.
};

