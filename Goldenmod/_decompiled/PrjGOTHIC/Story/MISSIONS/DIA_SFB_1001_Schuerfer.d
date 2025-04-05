
instance DIA_Sfb_1001_EXIT(C_Info)
{
	npc = SFB_1001_Schuerfer;
	nr = 999;
	condition = DIA_Sfb_1001_EXIT_Condition;
	information = DIA_Sfb_1001_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Sfb_1001_EXIT_Condition()
{
	return 1;
};

func void DIA_Sfb_1001_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sfb_1001_Hello(C_Info)
{
	npc = SFB_1001_Schuerfer;
	nr = 1;
	condition = DIA_Sfb_1001_Hello_Condition;
	information = DIA_Sfb_1001_Hello_Info;
	permanent = 1;
	description = "Как дела на шахте?";
};


func int DIA_Sfb_1001_Hello_Condition()
{
	return 1;
};

func void DIA_Sfb_1001_Hello_Info()
{
	AI_Output(other,self,"DIA_Sfb_1001_Hello_15_00");	//Как дела на шахте?
	AI_Output(self,other,"DIA_Sfb_1001_Hello_02_01");	//Самое сложное позади. Еще пара недель, и у нас будет достаточно руды.
	AI_StopProcessInfos(self);
};

