
// ************************ EXIT **************************

instance  Nov_1300_Talas_Exit (C_INFO)
{
	npc			=  Nov_1300_Talas;
	nr			=  999;
	condition	=  Nov_1300_Talas_Exit_Condition;
	information	=  Nov_1300_Talas_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1300_Talas_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1300_Talas_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_UR (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_UR_Condition;
	information		= Nov_1300_Talas_UR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tu es Talas, celui qui a �t� vol� ?"; 
};

FUNC int  Nov_1300_Talas_UR_Condition()
{
	if	Npc_KnowsInfo(hero, Info_CorKalom_BringBook)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_UR_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Tu es Talas, celui qui a �t� vol� ?
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Laisse-moi seul, je ne veux pas parler de �a !
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je peux t'aider � reprendre l'almanach."; 
};

FUNC int  Nov_1300_Talas_HELP_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_UR)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};
};
FUNC void  Nov_1300_Talas_HELP_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Je peux t'aider � reprendre l'almanach.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Vraiment ? J'ai �t� attaqu� par des gobelins ! Et maintenant je suis cens� aller l� bas et r�cup�rer le livre !
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //J'ai une suggestion � faire : Je te montrerai la mani�re d'utiliser l'almanach, ainsi tu pourras le r�cup�rer.

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"D'accord.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Cela te co�tera 30 minerais.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Donne-moi 50 minerais et je suis de la partie.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //D'accord.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //D'accord, nous pouvons partir d�s que tu seras pr�t.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //Cela te co�tera 30 minerais.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //D'accord, nous pouvons partir d�s que tu seras pr�t.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Donne-moi 50 minerais et je suis de la partie.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Quoi ? C'est un vol ! Bon, d'accord, dis-moi quand tu seras pr�t.
	CreateInvItems		(self,ItMiNugget,50);
	B_GiveInvItems      (self,hero,ItMiNugget,50);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};

// ***************************** INFOS ****************************************//
instance  Nov_1300_Talas_READY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_READY_Condition;
	information		= Nov_1300_Talas_READY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je suis pr�t, nous pouvons partir maintenant."; 
};

FUNC int  Nov_1300_Talas_READY_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_HELP)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_READY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Je suis pr�t, nous pouvons partir maintenant.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //D'accord, suis-moi.
	
	B_LogEntry		(CH2_Book,"J'ai promis � Talas de r�cup�rer l'almanach. Il veut me mener o� le livre se trouve."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BR�CKE ****************************************//
instance  Nov_1300_Talas_BRIDGE (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BRIDGE_Condition;
	information		= Nov_1300_Talas_BRIDGE_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BRIDGE_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_READY ))
	&&	(Npc_GetDistToWP(self, "LOCATION_29_02")<1000)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BRIDGE_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Ces fichues petites b�tes vivent dans une grotte derri�re ce pont ! Fais attention !
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Tu ne viens pas avec moi ?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //J'attends ici et... ahem... je couvre notre retraite.

	B_LogEntry		(CH2_Book,"Maintenant nous sommes debout devant une caverne de gobelins. Ce l�che de novice veut vraiment que j'entre l� tout seul.");
};

// ***************************** ZUR�CK INS LAGER ****************************************//
instance  Nov_1300_Talas_BACK (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACK_Condition;
	information		= Nov_1300_Talas_BACK_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACK_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_BRIDGE ))
	&&	(Npc_HasItems (hero,ItWrFokusbuch))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BACK_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Tu as l'almanach ! Bien jou�. Retournons au camp.

	B_LogEntry		(CH2_Book,"J'ai trouv� l'almanach et je le ram�nerai au Camp Mar�cageux avec Talas.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zur�ck im Lager ****************************************//
instance  Nov_1300_Talas_RETURNED (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_RETURNED_Condition;
	information		= Nov_1300_Talas_RETURNED_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_RETURNED_Condition()
{
	if	(Npc_KnowsInfo (hero, Nov_1300_Talas_BACK ))
	&&	Npc_HasItems (hero,ItWrFokusbuch)
	&&	(Npc_GetDistToWP  (self, "PSI_START")<1000)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_RETURNED_Info()
{
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //Nous sommes de retour. Tu ferais mieux de prendre tout de suite l'almanach � Cor Kalom.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Surveille les alentours et ne t'inqui�te pas.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Ne te fais pas de soucis, je vais bien ! Il n'y a aucune raison de s'inqui�ter pour moi.

	B_LogEntry		(CH2_Book,"Maintenant nous sommes de retour au Camp Mar�cageux. Talas est le l�che le plus grand que je n'ai jamais rencontr�. Je prendrai le livre � Cor Kalom moi-m�me.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"BackInCamp");
	AI_StopProcessInfos	(self);
};


// ***************************** zum OGY ****************************************//
instance  Nov_1300_Talas_OGY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_OGY_Condition;
	information		= Nov_1300_Talas_OGY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cor Angar m'a envoy�."; 
};

FUNC int  Nov_1300_Talas_OGY_Condition()
{
	if ( Npc_KnowsInfo ( hero, GUR_1202_CorAngar_WHERE ))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_OGY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Cor Angar m'a envoy�. Il a dit que tu dois m'emmener au cimeti�re des Orcs pour trouver Baal Lukor et ses templiers.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //Ainsi je suis encore le coursier. Zut ! ! ! Je n'aurais jamais d� perdre cet almanach...
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //Alors viens avec moi.
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"OGY");
};  

// ***************************** am OGY ****************************************//
instance  Nov_1300_Talas_BACKAGAIN (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACKAGAIN_Condition;
	information		= Nov_1300_Talas_BACKAGAIN_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACKAGAIN_Condition()
{
	if ( Npc_GetDistToWP(self,"OW_PATH_011")<1000 )
	{
		return 1;
	};
};

FUNC void  Nov_1300_Talas_BACKAGAIN_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Je ne t'emm�ne pas par ce pont, ce serait un suicide.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Tu  dois �tre fou pour entrer l�, m�me Baal Lukor et ses templiers n'en sont pas encore re-sortis.
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Nous verrons bien ce qu'il va se produire. Retourne au camp, je serais l� plus tard.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
