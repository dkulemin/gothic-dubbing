// ************************ EXIT **************************

instance  Tpl_1433_GorNaVid_Exit (C_INFO)
{
	npc			= Tpl_1433_GorNaVid;
	nr			= 999;
	condition	= Tpl_1433_GorNaVid_Exit_Condition;
	information	= Tpl_1433_GorNaVid_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1433_GorNaVid_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1433_GorNaVid_Exit_Info()
{
	AI_Output (self, other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //Puisse le Dormeur se r�veiller.
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_HEALTH (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai besoin de ton aide."; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1433_GorNaVid_HEALTH_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //J'ai besoin de ton aide.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //Je cherche la s�cr�tion pour Kalom et je sais o� se trouve le nid des Chenilles.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Seras-tu l� quand le passage seras ouvert ?
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //Combattre des Chenilles fait perdre souvent beaucoup de sang. Si tu m'apportes une potion de gu�rison, tu peux compter sur moi.

};  
// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_IAN (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_IAN_Condition;
	information		= Tpl_1433_GorNaVid_IAN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je cherche le nid des Chenilles des mines."; 
};

FUNC int  Tpl_1433_GorNaVid_IAN_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING
	&&	!Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	{
		return 1;
	};
};

FUNC void  Tpl_1433_GorNaVid_IAN_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //Je cherche le nid des Chenilles des mines.
	AI_Output (self, other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //Il y a beaucoup de cavernes � c�t� de la galerie principale de la mine, mais nous n'avons trouv� aucun nid.
};  

// ***************** Infos *****************************
instance  Tpl_1433_GorNaVid_HEALTH_SUC (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_SUC_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_SUC_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Donnez la potion m�dicinale)"; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_SUC_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1433_GorNaVid_HEALTH )) &&
		(Npc_HasItems (hero, Itfo_Potion_Health_01)  || 
		 Npc_HasItems (hero, Itfo_Potion_Health_02)  ||
		 Npc_HasItems (hero, Itfo_Potion_Health_03))	
	{
		return 1;
	};

};
FUNC void  Tpl_1433_GorNaVid_HEALTH_SUC_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Voil�, peut-�tre que cela aidera.
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //Merci. tu peux compter sur moi. Nous nous r�unirons en bas avec Ashgan.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03"); //Je serai l�.
	
	if Npc_HasItems (hero,Itfo_Potion_Health_01)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_01, 1);
	}
	else if Npc_HasItems (hero,Itfo_Potion_Health_02)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_02, 1);
	}	 
	else if Npc_HasItems (hero,Itfo_Potion_Health_03)
	{
	 	B_GiveInvItems (hero, self,Itfo_Potion_Health_03, 1);
	}
	else 
	{
		PrintDebugNpc (PD_MISSION, "KEINE POTION= UNM�GLICH");
	};

	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude	(self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaVid);
	B_LogEntry		(CH2_MCEggs,"J'ai d� donner une potion m�dicinale � Gor Na Vid avant qu'il n'ait consenti � rejoindre les renforts � la porte d'Asghan.");	

	AI_StopProcessInfos	(self);
};

//---------EIER GEFUNDEN------------------------------------------------------
instance  Tpl_1433_GorNavid_VICTORY (C_INFO)
{
	npc				= Tpl_1433_GorNavid;
	condition		= Tpl_1433_GorNavid_VICTORY_Condition;
	information		= Tpl_1433_GorNavid_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai trouv� le nid de la reine !"; 
};

FUNC int  Tpl_1433_GorNavid_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1433_GorNavid_VICTORY_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //J'ai trouv� le nid de la reine !
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //Je te remercie au nom de la Confr�rie enti�re !
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //Puisse le Dormeur �tendre sa main protectrice sur toi !
};     
 
