
instance DIA_Grd_217_Exit(C_Info)
{
	npc = GRD_217_Torwache;
	nr = 999;
	condition = DIA_Grd_217_Exit_Condition;
	information = DIA_Grd_217_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grd_217_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_217_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grd_217_First(C_Info)
{
	npc = GRD_217_Torwache;
	nr = 1;
	condition = DIA_Grd_217_First_Condition;
	information = DIA_Grd_217_First_Info;
	permanent = 1;
	description = "Привет!";
};


func int DIA_Grd_217_First_Condition()
{
	return 1;
};

func void DIA_Grd_217_First_Info()
{
	AI_Output(other,self,"DIA_Grd_217_First_15_00");	//Привет!
	AI_Output(self,other,"DIA_Grd_217_First_06_01");	//Шевели задницей! Заходи или проваливай - мне все равно. Просто убирайся с моих глаз.
	AI_StopProcessInfos(self);
};

