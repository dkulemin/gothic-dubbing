// **************************************************
//						EXIT 
// **************************************************

instance  DIA_KalomsGuard_Exit (C_INFO)
{
	npc			= Tpl_1406_Templer;
	nr			= 999;
	condition	= DIA_KalomsGuard_Exit_Condition;
	information	= DIA_KalomsGuard_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_KalomsGuard_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_KalomsGuard_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						PERM
// **************************************************

instance  DIA_KalomsGuard_PERM (C_INFO)
{
	npc			= Tpl_1406_Templer;
	nr			= 1;
	condition	= DIA_KalomsGuard_PERM_Condition;
	information	= DIA_KalomsGuard_PERM_Info;
	permanent	= 1;
	description	= "Je suis s�r que tu ne t'attendais pas � mon arriv�e ici... ?";
};                       

FUNC int  DIA_KalomsGuard_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_KalomsGuard_PERM_Info()
{
	AI_Output (other, self,"DIA_KalomsGuard_PERM_15_00"); //Je suis s�r que tu ne t'occuperais pas de moi ici... ?
	AI_Output (self, other,"DIA_KalomsGuard_PERM_13_01"); //Si tu manques de respect � mon ma�tre, je te tuerai.
	AI_StopProcessInfos	( self );
};

