
instance DIA_Rodriguez_Exit(C_Info)
{
	npc = KDF_400_Rodriguez;
	nr = 999;
	condition = DIA_Rodriguez_Exit_Condition;
	information = DIA_Rodriguez_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Rodriguez_Exit_Condition()
{
	return 1;
};

func void DIA_Rodriguez_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rodriguez_Hello(C_Info)
{
	npc = KDF_400_Rodriguez;
	nr = 1;
	condition = DIA_Rodriguez_Hello_Condition;
	information = DIA_Rodriguez_Hello_Info;
	permanent = 1;
	description = "Я ищу Верховного Мага Круга Огня!";
};


func int DIA_Rodriguez_Hello_Condition()
{
	if(Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Rodriguez_Hello_Info()
{
	AI_Output(other,self,"DIA_Rodriguez_Hello_15_00");	//Я ищу Верховного Мага Круга Огня!
	AI_Output(self,other,"DIA_Rodriguez_Hello_12_01");	//Отправляйся к Мильтену. Он у нас занимается посыльными.
	AI_StopProcessInfos(self);
};

