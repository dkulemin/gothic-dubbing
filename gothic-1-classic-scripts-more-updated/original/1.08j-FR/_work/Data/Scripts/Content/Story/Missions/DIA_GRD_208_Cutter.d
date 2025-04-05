//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Ce ch�teau est tr�s spacieux.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Ce ch�teau est tr�s spacieux.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Je ne pense pas t'avoir d�j� vu ici. Qui es-tu ?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Je suis un nouveau venu.J'ai juste jet� un coup d'�il.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 10;
	description = "Que peux-tu me dire sur ce ch�teau ?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Que peux-tu me dire sur ce ch�teau ?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Gomez et sa troupe l'ont repris apr�s le grand soul�vement.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //J'ai su tout de suite qu'il valait mieux de se joindre � lui.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //M�me lorsque nous �tions encore enferm�s au cachot, et avons d� servir  d'esclaves dans les mines, le reste de nos prisonniers a toujours tenu sa promesse.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Il y a des cachots sous le ch�teau alors ?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Ouais, ils sont vides maintenant. Personne n'est jamais descendu l� apr�s le grand soul�vement.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "Quel est la vie d'un garde ?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Quel est la vie d'un garde ?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Silence. Nous sommes le camp le plus grand et le plus puissant de toute la colonie. Personne ne perds son temps avec nous
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Je vois.
	AI_StopProcessInfos	(self);
};

	














/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Tu as fait le bon choix. Tu seras content d'�tre un garde !
	AI_StopProcessInfos	(self);
};
