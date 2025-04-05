
instance DIA_Vlk_520_Exit(C_Info)
{
	npc = VLK_520_Buddler;
	nr = 999;
	condition = DIA_Vlk_520_Exit_Condition;
	information = DIA_Vlk_520_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Vlk_520_Exit_Condition()
{
	return 1;
};

func void DIA_Vlk_520_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Vlk_520_LeaveMe(C_Info)
{
	npc = VLK_520_Buddler;
	nr = 2;
	condition = DIA_Vlk_520_LeaveMe_Condition;
	information = DIA_Vlk_520_LeaveMe_Info;
	permanent = 1;
	description = "„ем ты занимаешьс€?";
};


func int DIA_Vlk_520_LeaveMe_Condition()
{
	return 1;
};

func void DIA_Vlk_520_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Vlk_520_LeaveMe_15_00");	//„ем ты занимаешьс€?
	AI_Output(self,other,"DIA_Vlk_520_LeaveMe_01_01");	//я просто хочу, чтобы мен€ оставили в покое, так что проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_VLK_520_QUENTIN(C_Info)
{
	npc = VLK_520_Buddler;
	nr = 2;
	condition = dia_vlk_520_quentin_condition;
	information = dia_vlk_520_quentin_info;
	permanent = 0;
	description = "„то ты знаешь о поставках товаров из внешнего мира?";
};


func int dia_vlk_520_quentin_condition()
{
	if((GQ_OK == TRUE) && !Npc_KnowsInfo(hero,org_858_quentin_gorn_ok))
	{
		return 1;
	};
};

func void dia_vlk_520_quentin_info()
{
	AI_Output(other,self,"DIA_Vlk_520_Quentin_15_00");	//„то ты знаешь о поставках товаров из внешнего мира?
	AI_Output(self,other,"DIA_Vlk_520_Quentin_01_01");	//“еб€ послали парни из Ќового лагер€?
	AI_StopProcessInfos(self);
};

