// ****************************************
// 					FIRST 
// ****************************************

instance  GUR_1201_CorKalom_FIRST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_FIRST_Condition;
	information		= GUR_1201_CorKalom_FIRST_Info;
	permanent		= 1;
	important		= 1;
};

FUNC int  GUR_1201_CorKalom_FIRST_Condition()
{
	if (Npc_IsInState(self,ZS_TALK))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIRST_Info()
{
	AI_Output (self, other,"GUR_1201_CorKalom_FIRST_10_00"); //Qu'est-ce que tu veux ?
	Kalom_TalkedTo = TRUE;
};  

// ****************************************
// 				Wanna Join
// ****************************************

instance  GUR_1201_CorKalom_WannaJoin (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_WannaJoin_Condition;
	information		= GUR_1201_CorKalom_WannaJoin_Info;
	permanent		= 0;
	description		= "J'aimerai rejoindre la Confr�rie."; 
};

FUNC int  GUR_1201_CorKalom_WannaJoin_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_WannaJoin_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_00"); //J'aimerai rejoindre la Confr�rie.
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_01"); //J'ai entendu dire que tu es le ma�tre des novices et qu'est c'est toi qui d�cide qui peut en faire partie..
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_02"); //Je n'ai pas le temps ! Mes exp�riences sont trop importantes pour que je perde du temps avec des apprentis d�butants.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Je tiendrais compte de l'avis des Sages. Quand ils t'estimeront pr�t � porter la longue robe des novices, reviens me voir.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Cor Kalom me laissera rejoindre la Confr�rie comme disciple si j'arrive � convaincre quatre Sages de parler en ma faveur.");
};  

// ****************************************
// 				Kaloms Recipe
// ****************************************

instance  GUR_1201_CorKalom_Recipe (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 20;
	condition		= GUR_1201_CorKalom_Recipe_Condition;
	information		= GUR_1201_CorKalom_Recipe_Info;
	permanent		= 0;
	description		= "Un des marchands du Vieux Camp aimerait avoir une recette."; 
};

FUNC int  GUR_1201_CorKalom_Recipe_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Recipe_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Recipe_15_00"); //Un des marchands du Vieux camp voudrait conna�tre la recette d'une potion de gu�rison.
	AI_Output (self, other,"GUR_1201_CorKalom_Recipe_10_01"); //Mes  recettes ne sont pas � vendre !

	B_LogEntry	(CH1_KalomsRecipe,"Cor Kalom ne me donnera pas la recette. Mais il y a des coffres dans son laboratoire... et il semble assez occup�...");
};  

// ****************************************
// 				Experimente (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Experimente (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_Experimente_Condition;
	information		= GUR_1201_CorKalom_Experimente_Info;
	permanent		= 1;
	description		= "Quelles sortes d'exp�rience fais-tu ?"; 
};

FUNC int  GUR_1201_CorKalom_Experimente_Condition()
{
	if	(Kapitel <= 2)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Experimente_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Experimente_15_00"); //Quelles sortes d'exp�rience fais-tu ?
	AI_Output (self, other,"GUR_1201_CorKalom_Experimente_10_01"); //Ma recherche est � un niveau incompr�hensible pour toi, mon gar�on. Alors ne me fais pas perdre mon temps !
};  

// ****************************************
// Info BRINGWEED
// ****************************************

instance  GUR_1201_CorKalom_BRINGWEED (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_BRINGWEED_Condition;
	information		= GUR_1201_CorKalom_BRINGWEED_Info;
	permanent		= 1;
	description		= "J'apporte la r�colte d'Herbe journali�re !"; 
};

FUNC int  GUR_1201_CorKalom_BRINGWEED_Condition()
{
	if	(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  GUR_1201_CorKalom_BRINGWEED_Info()
{
	AI_Output				(other, self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //J'apporte la r�colte d'Herbe journali�re !

	if	(Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //Et c'est CA que tu appelles la totalit� ? ? ? J'attends une moisson COMPL�TE, �a signifie au moins 100 tas ! ! !
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Grrr, donne-moi �a. Et file,  je ne veux plus te voir � pr�sent !

		B_GiveInvItems	(hero, self, ItMi_Plants_Swampherb_01, 100);
        Npc_RemoveInvItems (self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry			(CH1_DeliverWeed,"Cor Kalom fut de son humeur habituelle quand je lui ai donn� la r�colte journali�re.");
		Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_SUCCESS);
		B_GiveXP			(XP_DeliveredWeedHarvest);
		
		BaalOrun_FetchWeed = LOG_SUCCESS;		
		AI_StopProcessInfos	(self);
	};
};  

// ****************************************
// 				Crawlerzangen (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Crawlerzangen (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 800;
	condition		= GUR_1201_CorKalom_Crawlerzangen_Condition;
	information		= GUR_1201_CorKalom_Crawlerzangen_Info;
	permanent		= 1;
	description		= "J'ai des mandibules de Chenilles pour toi..."; 
};

FUNC int  GUR_1201_CorKalom_Crawlerzangen_Condition()
{
	if (Npc_HasItems(other, ItAt_Crawler_01)>0)
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_Crawlerzangen_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //J'ai des mandibules de Chenilles pour toi...
	
	if (Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //Tr�s bien. Pour te r�compenser, prends quelques unes de mes meilleures potions.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Bien. Pour te r�compenser, prends quelques unes de mes meilleures potions.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_02, 2);
	}
	else
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hmm. C'est tout? Approche, prends une potion de mana et disparais.
		CreateInvItems(self, ItFo_Potion_Mana_01, 1);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_01, 1);
		AI_StopProcessInfos(self);
	};
	
	B_GiveInvItems(other, self, ItAt_Crawler_01, Npc_HasItems(other,ItAt_Crawler_01));
}; 




// ****************************************
// 				Join PSI
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI_Condition;
	information		= GUR_1201_CorKalom_JoinPSI_Info;
	permanent		= 1;
	description		= "Je pense avoir convaincu les Sages !"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	Npc_KnowsInfo(hero, GUR_1201_CorKalom_WannaJoin) 
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI_Info()
{
	var int counter;
	counter = 0;	//Counter l�schen, da er noch den Stand der letzten Analyse hat!
	
	AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_00"); //Je pense avoir convaincu les Sages !
	
	if (Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun d�clare que je suis digne de devenir un serviteur du Dormeur.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalCadar_SleepSpell))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_02"); //Continue...
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar me consid�re comme un �tudiant attentif
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalNamib_FirstTalk))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib est persuad� que je suis un vrai croyant.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTyon_Vision))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_05"); //Gr�ce � moi, Baal Tyon a eu une vision.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTondral_SendToKalom))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_06"); //Et?
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral a d�clar� que je devrais recevoir la longue robe. Je lui ai amen� un nouvel �tudiant.
		counter = counter + 1;
	};
	//-------------------------------------	
	if	(hero.level >= 5)
	{	
		if (counter >= 4)
		{
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Bien. Si tu as le soutien des Sages, �a me suffit.
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Approche, mets �a sur toi. Et maintenant rends-toi utile.
	
			// Ernennung zum Novizen
			CreateInvItem		(self, NOV_ARMOR_M);
			B_GiveInvItems      (self,hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor	(other);
			Npc_SetTrueGuild	(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			B_LogEntry			(CH1_JoinPsi,"Aujourd'hui Cor Kalom m'a nomm� novice. Il a �t� d'une humeur ex�crable comme d'habitude, mais maintenant j'appartiens vraiment � la Confr�rie du Dormeur dans le Camp Mar�cageux.");
			B_LogEntry			(GE_TraderPSI,"J'ai obtenu une meilleure ARMURE DE DISCIPLE de Baal Namib.");
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_SUCCESS);
			B_GiveXP			(XP_BecomeNovice);
	
			// Canceln der anderen Aufnahmen
			Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinOC,"Depuis que j'ai finalement d�cid� de rejoindre la Confr�rie du Dormeur dans le Camp Mar�cageux, je ne peux plus �tre une Ombre de Gomez.");
			
			Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinNC,"Je ne peux plus rejoindre les brigands du Nouveau Camp, car je suis d�sormais avec la Confr�rie du Dormeur.");
			
			//Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
		}
		else
		{
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //Et?
			AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //C'est tout.
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Tu me fais perdre un temps pr�cieux ! Reviens d�s que les quatre Sages te jugerons digne !
		};
	}
	else
	{	
		B_PrintGuildCondition(5);
	};
};

// ****************************************
// 				Join PSI2
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI2 (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI2_Condition;
	information		= GUR_1201_CorKalom_JoinPSI2_Info;
	permanent		= 0;
	description		= "C'�tait �a ? Pas de bienvenue, rien ?"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI2_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI2_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_10"); //"Qu'est que c'�tait ? Aucun ""bienvenu"",  non ? rien ?"
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_11"); //Bienvenu
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_12"); //C'est mieux.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Ne tra�ne pas ici ! Fais quelque chose. Prends ces mauvaises Herbes et donnes-les � Gomez au Vieux camp.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Si ses partisans ne te laissent pas passer, dis-leur le que c'est Cor Kalom qui t'envoie.
	
	CreateInvItems		(self, itmijoint_3, 30);
	B_GiveInvItems      (self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic		(CH1_KrautBote,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_KrautBote,	LOG_RUNNING);
	B_LogEntry			(CH1_KrautBote,"Cor Kalom m'a envoy� chez Gomez dans le Vieux Camp pour livrer sa cargaison."); 
	
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_15"); //Quoi, tu es toujours ici ?
	AI_StopProcessInfos	(self);
};  

// **************************************************************************
// 							MISSION: 	Drug Monopol
// **************************************************************************



// --------------------------------------------------------------------------

INSTANCE Info_Kalom_DrugMonopol (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_DrugMonopol_Condition;
	information	= Info_Kalom_DrugMonopol_Info;
	permanent 	= 0; 
	description = "As-TU d'autres taches pour moi ?";
};


FUNC INT Info_Kalom_DrugMonopol_Condition()
{
	if (Npc_GetTrueGuild(other)==GIL_NOV)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_DrugMonopol_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //As-TU d'autres taches pour moi ?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //Dans le Nouveau camp il y a un quelques hommes qui ont commenc� leur propre production d'Herbe.
	//AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //Assures-toi qu'ils arr�tent leur production.
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //Comment ?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //Ne m'ennuie pas avec des d�tails !
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //L'Herbe des broyeurs du camp doit �tre quelque part � l'ext�rieur du Nouveau camp. Tu sais ce que tu dois faire.

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic		(CH1_DrugMonopol,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_RUNNING);
	B_LogEntry			(CH1_DrugMonopol,"Cor Kalom veux que je fasse cesser la production concurrente d'Herbe dans le Nouveau Camp. Je ne sais pas exactement par o� commencer, mais je devrais jeter un coup d'oeil DEVANT le Nouveau Camp.");

	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};

// **************************************************************************
// 							SUCCESS
// **************************************************************************

INSTANCE Info_Kalom_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_Success_Condition;
	information	= Info_Kalom_Success_Info;
	permanent	= 1;
	description = "A propos de la production d'Herbe dans le Nouveau Camp...";
};


FUNC INT Info_Kalom_Success_Condition()
{
	if	(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_Success_Info()
{
	var C_NPC Killian; 	Killian = Hlp_GetNpc(ORG_861_Killian);
	var C_NPC Renyu; 	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	var C_NPC Jacko; 	Jacko = Hlp_GetNpc(ORG_862_Jacko);
		
	AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_00"); //A propos de la production d'Herbe dans le Nouveau Camp...
	AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_01"); //Oui?
	
	if (Stooges_Fled != TRUE)
	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_02"); //Je n'arrive pas � trouver ces hommes.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_03"); //Je n'en attendais pas moins de vous.
	}
	else if (Stooges_Fled == TRUE)
	||		(Npc_IsDead(Jacko)&&Npc_IsDead(Renyu)&&Npc_IsDead(Killian))
 	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_04"); //Ils sont partis.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_05"); //Je suis surpris. J'avais sous-estim� tes capacit�s. Apr�s tout, peut-�tre que tu pourrais te rendre utile.
		//AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.
		
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_DrugMonopol,"J'ai inform� Cor Kalom la production rivale d'Herbe dans le Nouveau Camp a �t� arr�t�. Sa r�action a �t� aussi 'amicale' que d'habitude.");
		Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_SUCCESS);
		B_GiveXP			(XP_DrugMonopol);
	};
};

// ****************************************************************
// 							KRAUTBOTE ZUR�CK
// ****************************************************************

INSTANCE Info_Kalom_KrautboteBACK(C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr 			= 1;
	condition	= Info_Kalom_KrautboteBACK_Condition;
	information	= Info_Kalom_KrautboteBACK_Info;
	permanent 	= 1;
	description = "J'ai livr� l'Herbe.";
};

func INT Info_Kalom_KrautboteBACK_Condition()
{
	if	Kalom_DeliveredWeed
	{
		return TRUE;
	};
};

FUNC VOID Info_Kalom_KrautboteBACK_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //J'ai livr� l'Herbe.
	
	if (Npc_HasItems (hero,itminugget)>=500)
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //Bon. Trouve quelqu'un d'autre qui pourrait t'occuper.

		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_KrautBote,"Cor Kalom a re�u de l'argent pour la livraison d'Herbe aux Barons du Minerai.");
		Log_SetTopicStatus	(CH1_KrautBote,	LOG_SUCCESS);
		B_GiveInvItems		(hero, self, ItMiNugget, 500);
		B_GiveXP			(XP_WeedShipmentReported);

		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //O� sont les 500 minerais, mon gar�on ? Essaye de me les avoir rapidement !
	}; 
};














// **************************************************************************
//
// 									KAPITEL 2
//
// **************************************************************************
instance Info_CorKalom_BringFocus (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringFocus_Condition;
	information	= Info_CorKalom_BringFocus_Info;
	permanent	= 0;
	important 	= 0;
	description = "Y'B�rion m'envoie. J'ai la pierre focale.";
};

FUNC INT Info_CorKalom_BringFocus_Condition()
{	
	if  (YBerion_BringFocus == LOG_SUCCESS) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BringFocus_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Y'B�rion m'envoie. J'ai la pierre focale.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Ahhhh - la pierre focale... enfin. A pr�sent je peux �tudier la magie de ces artefacts !
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Si j'avais seulement assez de s�cr�tion... Grrrr... !
	
	B_LogEntry		(CH2_Focus,"J'ai donn� la pr�cieuse pierre � Cor Kalom !");		
	Log_SetTopicStatus	(CH2_Focus,	LOG_SUCCESS);
	
	B_GiveInvItems	    (hero, self, Focus_1, 1);
	Npc_RemoveInvItem   (self, Focus_1);
	B_GiveXP			(XP_BringFocusToCorKalom);
};

// ------------------------------ 2. Belohnung f�r Fokus ergaunern ----------------------------------
instance Info_CorKalom_BLUFF (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 10;
	condition	= Info_CorKalom_BLUFF_Condition;
	information	= Info_CorKalom_BLUFF_Info;
	permanent	= 0;
	description = "Y'B�rion m'a dit que tu me paierais pour avoir amen� la pierre focale !";
};

FUNC INT Info_CorKalom_BLUFF_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringFocus)) 
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BLUFF_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y'B�rion m'a dit que tu me paierais pour avoir amen� la pierre focale !
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Vraiment ? Il a dit �a ? Alors d'accord. Je pense que 50 minerais devraient suffire !
	
	CreateInvItems (self,Itminugget,50);
	B_GiveInvItems (self, other, Itminugget,50);
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_SACHE (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_SACHE_Condition;
	information		= GUR_1201_CorKalom_SACHE_Info;
	important		= 0;
	permanent		= 0;
	description		= "S�cr�tions ?"; 
};

FUNC int  GUR_1201_CorKalom_SACHE_Condition()
{	
	if (Npc_KnowsInfo ( hero,Info_CorKalom_BringFocus))
	{
		return 1;
	};

};
FUNC VOID  GUR_1201_CorKalom_SACHE_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //S�cr�tions ?
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Oui. Comme tu dois le savoir, j'�labore des potions pour l'invocation du Dormeur. Pour cela j'ai besoin de s�cr�tion provenant de la mandibule inf�rieure d'une Chenille de mine.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //Tu connais les Chenilles de mine, n'est-ce pas ?

	Info_Clearchoices	(GUR_1201_CorKalom_SACHE);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Non",GUR_1201_CorKalom_SACHE_NEIN);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Oui",GUR_1201_CorKalom_SACHE_JA);
};  
//------------------------------------------------------
FUNC VOID GUR_1201_CorKalom_SACHE_NEIN ()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Non.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //Ce sont des b�tes dangereuses qui rampent dans les mines sombres et qui d�vorent n'importe quelle chair humaine sur leur chemin.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //On trouve dans leurs mandibules inf�rieures une s�cr�tion particuli�re.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //J'en utilise pour �laborer une potion qui permet de se diriger vers le Dormeur sur le chemin spirituel.
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Oui.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //Excellent!
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_VISION (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_VISION_Condition;
	information		= GUR_1201_CorKalom_VISION_Info;
	important		= 0;
	permanent		= 0;
	description		= "Parle !"; 
};

FUNC int  GUR_1201_CorKalom_VISION_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_SACHE))
	{
		return 1;
	};

};
FUNC void  GUR_1201_CorKalom_VISION_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_01"); //Parle !
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Bien, je viens d'avoir une vision provenant du Dormeur lui-m�me. Il m'a donn� un signe.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_03"); //Il m'a fait comprendre qu'il y a d'autres moyens que la s�cr�tion de mandibule.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_04"); //Et il m'a choisi pour te donner cette mission. Ce n'est pas moi qui te la confie, mais le Dormeur !
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_05"); //Impossible!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Silence, imb�cile !
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_07"); //Il m'a expliqu� que le chemin dans lequel je me suis embarqu� est le bon, mais que les moyens employ�s ne sont pas assez puissants.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Les moyens n�cessaires peuvent se trouver dans les Chenilles de mine, mais leurs mandibules inf�rieures ne seront pas suffisantes.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_09"); //Il doit y avoir autre chose.
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_NEST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_NEST_Condition;
	information		= GUR_1201_CorKalom_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "N'as-tu jamais examin� les Chenilles des Mines ?"; 
};

FUNC int  GUR_1201_CorKalom_NEST_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_VISION))
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_NEST_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_01"); //N'as-tu jamais examin� une Chenille de mine ? Ce � quoi je pense, c'est qu'elles poss�dent peut-�tre une autre partie de leur corps qui donnerait plus de s�cr�tion.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Naturellement nous avons diss�qu� quelques Chenilles de mine, mais il semble que l'on ai trouv� de la s�cr�tion seulement dans leurs mandibules inf�rieures.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_03"); //Il doit y avoir autre chose. Trouve leur nid et tu auras la r�ponse !

	CorKalom_BringMCQBalls = LOG_RUNNING;

};  


// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic		(CH2_MCEggs,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_RUNNING);
	B_LogEntry		(CH2_MCEggs,"Le Sage Cor Kalom m'a demand� de rechercher une source de s�cr�tion de Chenilles des Mines dans la vieille Mine. Les mandibules de ces monstres ont �t� utilis�es � fond, mais je dois trouv� autre chose pour produire une s�cr�tion plus forte.");

	if (PresseTourJanuar2001)
	{
		CreateInvItems	(hero,	ItAt_Crawlerqueen,	3);
	};
};


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_WEG (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_WEG_Condition;
	information		= GUR_1201_CorKalom_WEG_Info;
	nr				= 21;
	important		= 0;
	permanent		= 0;
	description		= "Cela semble �tre une esp�ce de recherche assez sombre et sinistre !"; 
};

FUNC int  GUR_1201_CorKalom_WEG_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_RAT)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_WEG_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_WEG_Info_15_01"); //Cela semble �tre une esp�ce de recherche assez sombre et sinistre !
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_02"); //Prends ces parchemins de lumi�re, tu en auras bien besoin dans les galeries sombres.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_03"); //Les templiers des mines t'aideront.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_04"); //Que la force du Dormeur soit avec toi, que sa lumi�re douce �claire ton chemin et ton esprit, et qu'il te donne encore plus de courage.

	CreateInvItems		(self, ItArScrollLight, 5);
	B_GiveInvItems      (self, other, ItArScrollLight, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RAT (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RAT_Condition;
	information		= GUR_1201_CorKalom_RAT_Info;
	nr				= 20;
	important		= 0;
	permanent		= 0;
	description		= "Il semble que cela peut devenir une aventure assez sanglante !"; 
};

FUNC int  GUR_1201_CorKalom_RAT_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_WEG)) 
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_RAT_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RAT_Info_15_01"); //Il semble que cela peut devenir une aventure assez sanglante !
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_02"); //Prends ces potions.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_03"); //Je ne te les donne pas pour que tu restes en vie, mais pour la r�ussite de cette mission.

	CreateInvItems		(self, ItFo_Potion_Health_02, 5);
	B_GiveInvItems      (self, other, ItFo_Potion_Health_02, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RUN (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RUN_Condition;
	information		= GUR_1201_CorKalom_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "O� trouverai-je les Chenilles des Mines ?"; 
};

FUNC int  GUR_1201_CorKalom_RUN_Condition()
{	
	if ((CorKalom_BringMCQBalls == LOG_RUNNING) 
	&&	(Npc_HasItems(hero, ItAt_Crawlerqueen)< 1)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_RUN_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RUN_Info_15_01"); //O� trouverai-je les Chenilles des Mines ?
	AI_Output			(self, other,"GUR_1201_CorKalom_RUN_Info_10_02"); //Dans la Vieille Mine.

	if	!EnteredOldMine
	{
		AI_Output		(other, self,"GUR_1201_CorKalom_RUN_Info_15_03"); //Ou se trouve la Vieille Mine ?
		AI_Output		(self, other,"GUR_1201_CorKalom_RUN_Info_10_04"); //Prends cette carte. Tous les endroits importants de la Barri�re sont marqu�s dessus.
		CreateInvItem	(self,ItWrWorldmap);   
		B_GiveInvItems  (self, other, ItWrWorldmap, 1);
	};
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_CRAWLER (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_CRAWLER_Condition;
	information		= GUR_1201_CorKalom_CRAWLER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Quel est le meilleur moyen de combattre les Chenilles des Mines ?"; 
};

FUNC int  GUR_1201_CorKalom_CRAWLER_Condition()
{
	if Npc_KnowsInfo (hero, GUR_1201_CorKalom_RUN)
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
	return 1;
	};
};


FUNC void  GUR_1201_CorKalom_CRAWLER_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Quel est le meilleur moyen de combattre les Chenilles des Mines ?
	AI_Output			(self,other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //Il y a des templiers dans la mine. Ils chassent les Chenilles pour leurs mandibules inf�rieures. Contacte Na Vid de Gor. Il t'apportera son aide.
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_FIND (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_FIND_Condition;
	information		= GUR_1201_CorKalom_FIND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Comment puis-je trouver le nid dans la mine ?"; 
};

FUNC int  GUR_1201_CorKalom_FIND_Condition()
{
	if ( Npc_KnowsInfo (hero, GUR_1201_CorKalom_CRAWLER))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIND_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_01"); //Comment puis-je trouver le nid dans la mine ?
	AI_Output			(self,other, "GUR_1201_CorKalom_FIND_Info_10_02"); //C'est la partie la plus dure de la mission. Je ne peux pas te dire o� chercher, ni quoi chercher. Mais le Dormeur t'accompagnera.
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_03"); //Avec �a, je suis rassur�.
};
// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringMCQBalls_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringMCQBalls_Success_Condition;
	information	= Info_CorKalom_BringMCQBalls_Success_Info;
	permanent	= 0;
	description	= "J'ai trouv� des oeufs appartenant � la Reine des Chenilles.";
};                       

FUNC INT Info_CorKalom_BringMCQBalls_Success_Condition()
{
	if (  Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3 )
	{
		return 1;
	};
};
FUNC VOID Info_CorKalom_BringMCQBalls_Success_Info()
{	
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //J'ai trouv� des oeufs appartenant � la Reine des Chenilles.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Je le savais. Ma vision �tait un signe. Les �ufs de reine doivent contenir une forte s�cr�tion !
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //Excellent, avec �a je peux cr�er une potion pour contacter le Dormeur !
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //Qu'en est-il de ma r�compense ?
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //Oh, c'est vrai... Merci.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Je veux une VRAI r�compense.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //D'accord, d'accord� Qu'est-ce que tu d�sires ?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems	(hero, self, ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen,3);
	B_GiveXP			(XP_BringMCEggs);
	B_LogEntry		(CH2_MCEggs,"J'ai donn� � Cor Kalom trois des oeufs des Chenilles des Mines. Il fut assez antipathique et j'ai d� lui faire part de ma maigre compensation !");
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_SUCCESS);
	
	B_LogEntry	(CH1_GotoPsiCamp,"Je crois que j'en sais assez maintenant sur les affaires de la secte, je peux donc le rapporter � Mordrag.");
	B_LogEntry	(CH1_GotoPsi,"Je crois que j'en sais assez maintenant sur les affaires de la secte. Je devrais le raconter � Raven d�s que je passe par le Vieux Camp.");
	
	Info_ClearChoices (Info_CorKalom_BringMCQBalls_Success);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Une rune.",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Une arme.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Une potion de soin.",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Minerai.",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Mana.",Info_CorKalom_BringMCQBalls_Success_MANA);
};
func void Info_CorKalom_BringMCQBalls_Success_RUNE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Une rune.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //Que cette rune �claire ton chemin !!
	CreateInvItem		(self,ItArRuneLight);
	B_GiveInvItems      (self, hero, ItArRuneLight, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);

};	
func void Info_CorKalom_BringMCQBalls_Success_WAFFE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //Une arme.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //Que cette arme d�truise tes ennemis !
	CreateInvItem		(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems      (self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Une potion de soin.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //Que cette potion prolonge ta vie !
	CreateInvItem		(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_ORE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Minerai.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Accepte ce minerai en signe de gratitude de toute la Confr�rie !
	CreateInvItems		(self,ItMinugget,100);
	B_GiveInvItems      (self, hero, ItMinugget, 100);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Mana.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //Que cette potion renforce tes pouvoirs magiques !
	CreateInvItem		(self,ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	

// **************************************************************************
// 				MISSION: Bring Book
// **************************************************************************
INSTANCE Info_CorKalom_BringBook (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Condition;
	information	= Info_CorKalom_BringBook_Info;
	permanent	= 0;
	description = "Pouvons nous commencer l'invocation du Dormeur maintenant ?";
};

func INT Info_CorKalom_BringBook_Condition()
{
	if ( CorKalom_BringMCQBalls == LOG_SUCCESS )
	{
		return 1;
	};	
};
func VOID Info_CorKalom_BringBook_Info()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_01"); //Pouvons nous commencer l'invocation du Dormeur maintenant ?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_02"); //Non ! Je n'ai pas encore trouv� de m�thode pour la pierre focale.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_03"); //Nous avons perdu le savoir ancestral sur ces artefacts.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_04"); //Essayes-tu de me dire que j'ai ramass� les oeufs pour rien ?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_05"); //Mais non, �coute-moi. Il existe un almanach qui contient tout ce que nous devons savoir.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_06"); //Nous avons achet� le livre au Mage du Feu Corristo qui vit dans le Vieux camp.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_07"); //H�las, il a �t� vol� quand ils ont essay� de le rapporter ici.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_08"); //J'avais charg� Talas, un novice, de recueillir ce livre pour moi, mais il lui a �t� d�rob�.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_09"); //Il m'avait laiss� tomber, mais je lui ai donn� une autre chance. Il doit r�cup�rer l'almanach vol�.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_10"); //Parle-lui. Il aura besoin de toute l'aide qu'il pourra trouver.
	
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic		(CH2_Book,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Book,	LOG_RUNNING);
	B_LogEntry		(CH2_Book,"Cor Kalom a besoin d'un dernier objet pour la grande invocation du Dormeur. C'est un livre sur l'utilisation des pierres focales. Le novice Talas a tellement �t� maladroit que les gobelins ont r�ussi � vol� l'almanach. Et maintenant il recherche quelqu'un � la cour du temple pour l'aider � ramener le livre.");

	Info_ClearChoices (Info_CorKalom_BringBook);
	
	Info_Addchoice(Info_CorKalom_BringBook,DIALOG_BACK						,Info_CorKalom_BringBook_BACK);
	Info_Addchoice(Info_CorKalom_BringBook,"Qu'est-ce que j'obtiendrai pour �a ?",Info_CorKalom_BringBook_EARN);
	Info_Addchoice(Info_CorKalom_BringBook,"Qui a vol� l'almanach ?",Info_CorKalom_BringBook_WHO);
	Info_Addchoice(Info_CorKalom_BringBook,"O� puis-je trouver Talas ?",Info_CorKalom_BringBook_WHERE);
};
func void Info_CorKalom_BringBook_BACK ()
{
	Info_ClearChoices (Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Where_15_01"); //O� puis-je trouver Talas ?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Where_10_02"); //Il est devant la colline du temple, � chercher quelqu'un pour l'aider.
};
func void Info_CorKalom_BringBook_WHO ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Who_15_01"); //Qui a vol� l'almanach ?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Who_10_02"); //Talas m'a dit qu'il avait subit une attaque de gobelins noirs. Cela me parait curieux, mais possible.
};
func void Info_CorKalom_BringBook_EARN ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Earn_15_01"); //Qu'est-ce que j'obtiendrai pour �a ?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Earn_10_02"); //Est-ce que je ne t'ai pas d�j� prouv� ma g�n�rosit� ? Tu recevras une r�compense �quitable.
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringBook_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Success_Condition;
	information	= Info_CorKalom_BringBook_Success_Info;
	permanent	= 0;
	description	= "J'ai retrouv� le livre.";
};                       

FUNC INT Info_CorKalom_BringBook_Success_Condition()
{	
	if (	Npc_HasItems (Hero,ItWrFokusbuch)
	&&		(CorKalom_BringBook==LOG_RUNNING)	)
	{
		return 1 ; 
	};
};
FUNC VOID Info_CorKalom_BringBook_Success_Info()
{	
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_01"); //J'ai retrouv� le livre.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_02"); //Bon travail. Tu as tout ce dont nous avons besoin.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_03"); //Je vais tout de suite m'occuper des pr�paratifs.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_04"); //O� l'invocation aura-t-elle lieu ?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_05"); //Attends qu'il fasse nuit, puis viens dans la cour du temple. C'est l� que nous nous r�unirons pour invoquer le Dormeur tout-puissant.

	B_GiveInvItems	    (hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem   (self,ItWrFokusbuch);
	B_GiveXP			(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;

	B_LogEntry		(CH2_Book,"Maintenant que Cor Kalom a l'almanach, il pr�pare la Confr�rie pour la grande invocation du Dormeur. Elle aura lieu � la place du temple durant la nuit.");
	Log_SetTopicStatus	(CH2_Book,	LOG_SUCCESS);

	//-------- Gurus und Novizen auf dem Tempelvorplatz versammeln --------
	AI_StopProcessInfos	(self);

	B_Story_PrepareRitual();
};


// ----------------------------BELOHNUNG ---------------------------------------
instance Info_CorKalom_Belohnung (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 1;
	condition	= Info_CorKalom_Belohnung_Condition;
	information	= Info_CorKalom_Belohnung_Info;
	permanent	= 0;
	description = "Et mon paiement ?";
};                       

FUNC INT Info_CorKalom_Belohnung_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringBook_Success) )
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_Belohnung_Info()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_15_00");//Et mon paiement ?
	AI_Output			(self, other,"Info_CorKalom_Belohnung_10_01");//Qu'est-ce que tu veux ?
	
	Info_ClearChoices (Info_CorKalom_Belohnung);
	Info_Addchoice(Info_CorKalom_Belohnung,"Un parchemin de sortil�ge",Info_CorKalom_Belohnung_SCROLL);
	Info_Addchoice(Info_CorKalom_Belohnung,"Minerai",Info_CorKalom_Belohnung_ORE);
	Info_Addchoice(Info_CorKalom_Belohnung,"Potion de Mana",Info_CorKalom_Belohnung_MANA);

};
func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Donne-moi ces parchemins.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_SCROLL_10_01");//Utilise ces derniers sorts avec sagesse.
	CreateInvItems (self,ItArScrollSleep,3);
	B_GiveInvItems  (self,hero,ItArScrollSleep,3);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_ORE ()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_ORE_15_00");//Donne moi du minerai.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_ORE_10_01");//Ceci devrait satisfaire ton app�tit pour le minerai.
	CreateInvItems  (self,ItMinugget,300);
	B_GiveInvItems  (self,hero,ItMinugget,300);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output						(other, self,"Info_CorKalom_Belohnung_MANA_15_00");//Potions de mana.
	AI_Output						(self, other,"Info_CorKalom_Belohnung_MANA_10_01");//Puisse ces potions te donner de la force!
	CreateInvItems 		(self,ItFo_Potion_Mana_02,5);
	B_GiveInvItems      (self,hero,ItFo_Potion_Mana_02,5);
	Info_ClearChoices	(Info_CorKalom_Belohnung);
};

// ************************ EXIT **************************************************************************

instance  GUR_1201_CorKalom_Exit (C_INFO)
{
	npc			=  GUR_1201_CorKalom;
	nr			=  999;
	condition	=  GUR_1201_CorKalom_Exit_Condition;
	information	=  GUR_1201_CorKalom_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  GUR_1201_CorKalom_Exit_Condition()
{
	return 1;
};

FUNC VOID  GUR_1201_CorKalom_Exit_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_Exit_15_01"); //Je te verrais.
	AI_Output			(self, other,"GUR_1201_CorKalom_Exit_10_02"); //Puisse le Dormeur t'�clairer.
	
	AI_StopProcessInfos	( self );
};
// *******************************************************************************************************



