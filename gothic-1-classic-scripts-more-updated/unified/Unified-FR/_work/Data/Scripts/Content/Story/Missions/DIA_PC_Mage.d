//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //Allons-y.
	}
	else
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //Je te verrais plus tard.
	};
	AI_StopProcessInfos	(self);
};

//*********************************************
//					First
//*********************************************

instance DIA_Milten_First (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_First_Condition;
	information	= DIA_Milten_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Milten_First_Condition()
{
	if ( (CorKalom_BringMCQBalls != LOG_SUCCESS) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) )
	&& (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

func VOID DIA_Milten_First_Info()
{
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Tu ne peux pas franchir ce seuil � moins que ma�tre Corristo te le permette.
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello_Condition;
	information	= DIA_Milten_Hello_Info;
	permanent	= 0;
	description = "Je cherche le Grand Magicien du Cercle de Feu.";
};                       

FUNC INT DIA_Milten_Hello_Condition()
{
	if (Saturas_BringFoci == FALSE) && (!Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Je cherche le Grand Magicien du Cercle de Feu.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //C'est Corristo. Que veux-tu de lui ?
};

//*********************************************
//					GotoCorristo
//*********************************************
	
instance DIA_Milten_GotoCorristo (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_GotoCorristo_Condition;
	information	= DIA_Milten_GotoCorristo_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_GotoCorristo_Condition()
{
	if  ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	{
		return 1;
	};
};

func VOID DIA_Milten_GotoCorristo_Info()
{
	if ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) )
	{
		//***kopierte AI_outputs, falls SC Brief noch hat***
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Je cherche le Grand Magicien du Cercle de Feu.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //C'est Corristo. Que veux-tu de lui ?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //J'ai une lettre pour le Grand Magicien du Cercle du Feu.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Au�enwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Montre-moi la lettre.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Voici.
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Et si nous parlions d'une esp�ce de r�compense ?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //Il n'y pas besoin de cela maintenant.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Nous avons entendu ce que tu as fait dans la vieille mine. Sans Chenilles de mine, l'exploitation de minerai est devenue beaucoup plus s�re.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Corristo conna�t tes actes. Il souhaite te rencontrer. Va lui parler.
};

//*********************************************
//				 Got Brief
//*********************************************
	var int milten_HasLetter;
//*********************************************

instance DIA_Milten_Letter (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Letter_Condition;
	information	= DIA_Milten_Letter_Info;
	permanent	= 0;
	description = "J'ai une lettre pour le Grand Magicien du Cercle du Feu.";
};                       

FUNC INT DIA_Milten_Letter_Condition()
{
	if	( (Npc_KnowsInfo(hero, DIA_Milten_Hello)) && ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) ) )
	&&	(Kapitel < 4) && (Saturas_BringFoci == FALSE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Letter_Info()
{
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //J'ai une lettre pour le Grand Magicien du Cercle du Feu.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Es-tu un messager du monde ext�rieur ?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Oui. Un magicien m'a donn� la lettre peu avant de me jeter dans la colonie.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Montre-moi la lettre.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Je veux ma r�compense d'abord.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Voici.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Voici.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Cette lettre est adress�e � Xardas !
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //Qu'est-ce qui est si excitant ?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas n'a pas �t� un serviteur d'Innos tr�s longtemps. Il nous a quitt� il y a quelques ann�es et s'est tourn� vers la magie noire.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Il vit dans une tour au milieu de la terre d'Orc et se concentre sur ses �tudes.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Il a dit qu'il ferait comme il l'entend pour d�couvrir qu'est-ce qui s'est mal pass� avec � la Barri�re.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Attend ici. Je serai de retour dans un moment.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");

	if		Npc_HasItems(other,ItWr_Fire_Letter_01)
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
	}
	else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
	};
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Je veux ma r�compense d'abord.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo demandera Torrez de te le donner d�s qu'il aura la lettre.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Je suis un serviteur d'Innos - je ne ment jamais. Donne-moi la lettre � pr�sent.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Je pr�f�rerais donner la lettre � Torrez lui-m�me.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Voici.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Je pr�f�rerais donner la lettre � Torrez lui-m�me.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Je ne peux pas te parler en dehors de �a, d'accord ?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Non. Je veux voir ma r�compense d'abord.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Alors d'accord. Si c'est ce que tu veux. Attend ici.

	Info_ClearChoices	(DIA_Milten_Letter);
	AI_StopProcessInfos	(self);

	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};

//*********************************************
//				 Got Brief
//*********************************************

instance DIA_Milten_ComesBack (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_ComesBack_Condition;
	information	= DIA_Milten_ComesBack_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_ComesBack_Condition()
{
	if ( (Npc_KnowsInfo(hero, DIA_Milten_Letter)) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_ComesBack_Info()
{
	if (milten_HasLetter==FALSE)
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo n'�tait pas tr�s heureux de voir que tu as si peu de foi dans les serviteurs d'Innos.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Mais il dit que tu peux aller voir Torrez et prendre la r�compense habituelle.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo est content d'avoir eu cette lettre. Il a dit que tu peux aller voir Torrez et choisir ta r�compense.
	};
};

//*********************************************
//			Wo finde ich Torrez?
//*********************************************
	
instance DIA_Milten_WoTorrez (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_WoTorrez_Condition;
	information	= DIA_Milten_WoTorrez_Info;
	permanent	= 0;
	description	= "O� puis-je trouver Torrez ?";
};                       

FUNC INT DIA_Milten_WoTorrez_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WoTorrez_Info()
{
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //O� puis-je trouver Torrez ?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //Il est devant le temple toute la journ�e.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //La nuit il est � l'int�rieur comme tous les autres - mais seuls les magiciens peuvent entrer dans la maison du temple, tu peux seulement lui parler pendant la journ�e.
};

//*********************************************
//				Noch ein Brief
//*********************************************
	
instance DIA_Milten_NochEinBrief (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_NochEinBrief_Condition;
	information	= DIA_Milten_NochEinBrief_Info;
	permanent	= 0;
	description = "J'ai une lettre des Magiciens de l'Eau.";
};                       

FUNC INT DIA_Milten_NochEinBrief_Condition()
{
	if ( (Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_NochEinBrief_Info()
{
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //J'ai une lettre des Magiciens de l'Eau.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ah ! Tr�s bien ! Je le donnerai � Corristo.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Quand tu seras de retour dans le Nouveau camp, les Magiciens de l'Eau te r�compenseront s�rement pour tes efforts.
	
	Cronos_Messenger = LOG_SUCCESS;
	B_GiveInvItems (other,self,Cronos_Brief,1);
};

//*********************************************
//					PERM
//*********************************************
	
instance DIA_Milten_PERM (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_PERM_Condition;
	information	= DIA_Milten_PERM_Info;
	permanent	= 0;
	description = "Dit-moi quelque chose � propos des Magiciens de Feu.";
};                       

FUNC INT DIA_Milten_PERM_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_PERM_Info()
{
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Dit-moi quelque chose � propos des Magiciens de Feu.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Le cercle de Feu tient ses pouvoirs de la gr�ce d'Innos. Le dieu de lumi�re, de v�rit� et de justice nous regarde d'en haut.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Les magiciens se consid�rent comme �tant choisis - et c'est comme �a qu'ils traitent les autres.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //J'�tais chanceux d'�tre admis. Corristo m'a fait son apprenti. Il a probablement juste voulu se divertir
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Depuis lors, j'avais essay� d'am�liorer mes comp�tences magiques chaque jour afin de pour �tre admis dans le prochain cercle.
};

//*********************************************
//					WannaMage
//*********************************************
	
instance DIA_Milten_WannaMage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_WannaMage_Condition;
	information	= DIA_Milten_WannaMage_Info;
	permanent	= 1;
	description = "Je veux aussi devenir l'apprenti d'un magicien. Comme toi.";
};                       

FUNC INT DIA_Milten_WannaMage_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Je veux aussi devenir l'apprenti d'un magicien. Comme toi.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo m'a choisi parce que j'ai fait quelque chose de sp�cial pour les Barons du minerai.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //� moins que tu fasses quelque chose de vraiment exceptionnel, il ne te choisira jamais comme apprenti.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //En outre, tu dois appartenir au Vieux camp. Je doute que Corristo prenne un membre de n'importe quel autre camp pour en faire son apprenti.
};





		
	







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info SHWAIT
//***************************************************************************
instance Info_Milten_SHWAIT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHWAIT_Condition;
	information	= Info_Milten_SHWAIT_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHWAIT_Condition()
{
	if ( Npc_GetDistToWP ( hero, "OW_PATH_274")<1000)
	{
		return 1;
	};	
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc		(self,hero);
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Salutations ! Mon ami Lester du camp Mar�cageux m'a tout dit au sujet de vos grandes actions !
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Je suis impressionn�. Tu es devenu tr�s fort.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Je fais de mon mieux.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Ah, oui. Toujours modeste, n'est-ce pas ?
};

//***************************************************************************
//	Info SHGORN
//***************************************************************************
instance Info_Milten_SHGORN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHGORN_Condition;
	information	= Info_Milten_SHGORN_Info;
	important	= 0;
	permanent	= 0;
	description	= "J'ai rencontr� Gorn.";
};

FUNC int Info_Milten_SHGORN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //J'ai rencontr� Gorn.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //Ah bon ? O� ?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //Le vieux monast�re ruin�e battu par la mer. Nous avons tous les deux recherch� des tr�sors l� bas.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Je suis s�r qu'il me dira tout � son sujet quand nous nous reverrons.
};

//***************************************************************************
//	Info SHLESTER
//***************************************************************************
instance Info_Milten_SHLESTER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLESTER_Condition;
	information	= Info_Milten_SHLESTER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Lester et moi avons prit d'assaut le fort de la montagne.";
};

FUNC int Info_Milten_SHLESTER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, PC_Psionic_FINISH))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester et moi avons prit d'assaut le fort de la montagne.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Il m'en 'a parl�. Apparemment tu peux avoir confiance.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //O� est-ce que les quatre d'entre vous s'�taient r�unis jusqu'ici ?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Bah, ici et l�. Nous nous r�unissons dans beaucoup d'endroits diff�rents.
};

//***************************************************************************
//	Info SHYOU
//***************************************************************************
instance Info_Milten_SHYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHYOU_Condition;
	information	= Info_Milten_SHYOU_Info;
	important	= 0;
	permanent	= 0;
	description	= "Que fais-tu ici ?";
};

FUNC int Info_Milten_SHYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT))
	{
		return 1;
	};	
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //Que fais-tu ici ?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Il y a un ancien anneau de pierre pas loin d'ici. A son centre se trouve l'entr�e qui m�ne � une chambre forte souterraine.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Une sorte de tombeau ?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Oui, quelque chose comme �a.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //Il y a quelque chose dans ce tombeau que je voudrais bien poss�der.
};

//***************************************************************************
//	Info SHME
//***************************************************************************
instance Info_Milten_SHME (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHME_Condition;
	information	= Info_Milten_SHME_Info;
	important	= 0;
	permanent	= 0;
	description	= "Je cherche une pierre focale.";
};

FUNC int Info_Milten_SHME_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_SHWAIT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	{
		return 1;
	};	
};

func void Info_Milten_SHME_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Je recherche une pierre focale. Elle doit �tre quelque part ici.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //C'est comme si nous cherchions tous les deux quelque chose dans le m�me endroit.
};

//***************************************************************************
//	Info SHPROBLEM
//***************************************************************************
instance Info_Milten_SHPROBLEM (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHPROBLEM_Condition;
	information	= Info_Milten_SHPROBLEM_Info;
	important	= 0;
	permanent	= 0;
	description	= "Pourquoi tu ne descends pas dans le tombeau pour obtenir ce que tu cherches ?";
};

FUNC int Info_Milten_SHPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHYOU))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Pourquoi tu ne descends pas dans le tombeau pour obtenir ce que tu cherches ?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Ah, c'est une longue histoire. Ce serait long � expliquer.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Vas-y, je ne suis pas press�.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Bien ! Apr�s la cr�ation de la Barri�re magique qui nous emprisonne tous...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //... un des magiciens a scell� un artefact magique l� bas.
};

//***************************************************************************
//	Info SHFOCUS
//***************************************************************************
instance Info_Milten_SHFOCUS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHFOCUS_Condition;
	information	= Info_Milten_SHFOCUS_Info;
	important	= 0;
	permanent	= 0;
	description	= "C'est une des cinq pierres focales ?";
};

FUNC int Info_Milten_SHFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //C'est une des cinq pierres focales ?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Exactement ! Ainsi tu sais d�j� l'histoire des cinq pierres focales ?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Ne me dis pas que tu cherche aussi la pierre focale !
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //Non. Je ne suis pas int�ress� par la pierre focale. Je recherche un talisman Orcish.
};

//***************************************************************************
//	Info SHSEAL
//***************************************************************************
instance Info_Milten_SHSEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSEAL_Condition;
	information	= Info_Milten_SHSEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "L'artefact a �t� d�fait ?";
};

FUNC int Info_Milten_SHSEAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //L'artefact a �t� d�fait ?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Oui. Un charme puissant le prot�ge. Le premier pilleur de tombe essayant de d�rober la pierre...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //... sera maudit, et condamn� � une existence de vampire �ternel, qui devra prot�ger le tombeau contre d'autres pilleurs de tombes.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Comment peux-tu passer outre cette mal�diction ?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //Il n'y pas besoin de cela maintenant.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Il y a quelques ann�es, un Baron du minerai fatigu� de chasser des Orcs a �t� suffisamment n�gligent pour entrer dans le tombeau.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Maintenant c'est LUI le le gardien des tr�sors l� bas.
};

//***************************************************************************
//	Info SHTALISMAN
//***************************************************************************
instance Info_Milten_SHTALISMAN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHTALISMAN_Condition;
	information	= Info_Milten_SHTALISMAN_Info;
	important	= 0;
	permanent	= 0;
	description	= "En quoi ceci concerne ce talisman ?";
};

FUNC int Info_Milten_SHTALISMAN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHFOCUS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //En quoi ceci concerne ce talisman ?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Je crois que son ancien propri�taire l'utilisait pour se d�fendre contre les Orcs en col�re.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Si j'ai raison, le talisman peut �tre d'un grand secours.
};

//***************************************************************************
//	Info SHOFFER
//***************************************************************************
instance Info_Milten_SHOFFER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER_Condition;
	information	= Info_Milten_SHOFFER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Nous devons rechercher le tombeau ensemble !";
};

FUNC int Info_Milten_SHOFFER_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSEAL)
	&&		Npc_KnowsInfo(hero, Info_Milten_SHTALISMAN)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //Nous devrions fouiller le tombeau ensemble ! Tu auras le talisman, et j'aurai la pierre focale.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //Bien, mais il y a un peu de probl�me...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Un probl�me ?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Oui. Le gardien dans le tombeau...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //Ne peut-il pas �tre d�coup� en petits morceaux ?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //Ce ne serait pas trop facile. Il semble �tre extr�mement r�sistant contre les dommages des armes normales.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Laisse-moi deviner, tu as d�j� un plan, pas vrai ?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Uhm... bon... J'ai un plan mais je ne peux pas le mener � bien tout seul.
};

//***************************************************************************
//	Info SHOFFER2
//***************************************************************************
instance Info_Milten_SHOFFER2 (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER2_Condition;
	information	= Info_Milten_SHOFFER2_Info;
	important	= 0;
	permanent	= 0;
	description	= "Dit-le moi !";
};

FUNC int Info_Milten_SHOFFER2_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Dit-le moi !
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //J'ai un parchemin avec un sort tr�s puissant ici.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //Le sort d�truira tous les vampires.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Alors ce devrait �tre un jeu d'enfant pour sortir du tombeau.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Mhmm... Et bien... Pas tout � fait ! Le gardien n'est pas tout seul.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Probablement des pilleurs de tombe plus anciens qui n'ont pas plus r�ussi que lui.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Je suis descendu l� une fois, et je suis presque mort. Un homme tout seul ne peut pas faire grand chose.
};

//***************************************************************************
//	Info SHACCEPT
//***************************************************************************
instance Info_Milten_SHACCEPT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHACCEPT_Condition;
	information	= Info_Milten_SHACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description	= "Donne-moi le parchemin de sortil�ge et nous le ferons ensemble !";
};

FUNC int Info_Milten_SHACCEPT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER2)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Donne-moi le parchemin de sortil�ge et nous le ferons ensemble !
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Bon, tr�s bon. J'avais l'espoir que tu dises cela !
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Cependant, nous avons seulement un parchemin. A utiliser pour le gardien !
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Les autres vampires peuvent �tre aussi vaincus dans des combats normaux.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Je vois. Bien, quel est le chemin qui m�ne � l'anneau de la pierre ?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Suis moi

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"J'ai rencontr� Milten, le Magicien du Feu, pr�s de l'anneau de pierre. Il m'a dit qu'une des pierres focales que je cherche �tait dans une crypte au-dessous de la formation en pierre.");
	B_LogEntry		(CH3_Stonehenge,"Milten m'a donn� un parchemin de sortil�ge pour d�faire le gardien dans la crypte. Nous y entrerons ensemble.");
	
	CreateInvItem		(self,	ItArScrollDestroyUndead);
	B_GiveInvItems  (self, hero, ItArScrollDestroyUndead, 1);

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self, "SHGuide");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHARRIVED
//***************************************************************************
instance Info_Milten_SHARRIVED (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHARRIVED_Condition;
	information	= Info_Milten_SHARRIVED_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHARRIVED_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<500) )
	{
		return TRUE;
	};	
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Nous y voici. Le tunnel ici m�ne directement au tombeau. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Allons rendre une petite visite au gardien !

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHHEAL
//***************************************************************************
instance Info_Milten_SHHEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHHEAL_Condition;
	information	= Info_Milten_SHHEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Je suis bless�. Aide-moi s'il te pla�t.";
};

FUNC int Info_Milten_SHHEAL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&		(hero.attribute[ATR_HITPOINTS] < ((hero.attribute[ATR_HITPOINTS_MAX]*7)/10))
	&&		(Npc_HasItems(hero,ItFo_Potion_Health_02) == 0)								)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Je suis bless�. Aide-moi s'il te pla�t.

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Prendre cette potion de gu�rison.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //Je n'ai plus aucune potion de gu�rison en r�serve.
	};	

	AI_StopProcessInfos		(self);
};

//***************************************************************************
//	Info SHRUNNING
//***************************************************************************
instance Info_Milten_SHRUNNING (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHRUNNING_Condition;
	information	= Info_Milten_SHRUNNING_Info;
	important	= 0;
	permanent	= 1;
	description	= "Le garde est toujours vivant !";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// W�chter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Le garde est toujours vivant !
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//D�truit-le alors avec le parchemin.
};

//***************************************************************************
//	Info SHSCROLL
//***************************************************************************
instance Info_Milten_SHSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSCROLL_Condition;
	information	= Info_Milten_SHSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "J'ai utilis� le parchemin de sortil�ge !";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// W�chter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //J'ai employ� le parchemin - mais pas sur le gardien !
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //C'est une catastrophe ! Alors tu vas devoir trouver une autre mani�re de le vaincre !
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Peut-�tre que tu peux acheter un autre parchemin ou une rune dans un des camps.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Je t'attendrai l�-bas, o� nous nous sommes r�unis.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHWait");
};

//***************************************************************************
//	Info SHNEWSCROLL
//***************************************************************************
instance Info_Milten_SHNEWSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHNEWSCROLL_Condition;
	information	= Info_Milten_SHNEWSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "J'ai un nouveau parchemin de sortil�ge 'Mort sur les non-morts' !";
};

FUNC int Info_Milten_SHNEWSCROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSCROLL)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)	
	&&		((Npc_HasItems(hero, ItArScrollDestroyUndead)>0) ||	(Npc_HasItems(hero, ItArRuneDestroyUndead)>0))	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //J'ai un nouveau parchemin de sortil�ge 'Mort sur les non-morts' !
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Tr�s bien. Maintenant nous pouvons faire une autre visite au gardien.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Passe devant, je te suis.

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHFollow");
};

//***************************************************************************
//	Info SHLEAVE
//***************************************************************************
instance Info_Milten_SHLEAVE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLEAVE_Condition;
	information	= Info_Milten_SHLEAVE_Info;
	important	= 1;
	permanent	= 1;
};

FUNC int Info_Milten_SHLEAVE_Condition()
{
	if	 Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)		
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")>10000)
  	&&	(self.aivar[AIV_PARTYMEMBER] ==	TRUE)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Tu sembles avoir perdu de l'int�r�t pour le tombeau.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Si tu changes d'avis, tu peux me rencontrer o� nous nous sommes r�unis avant.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self,	"SHWait");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHCONTINUE
//***************************************************************************
instance Info_Milten_SHCONTINUE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHCONTINUE_Condition;
	information	= Info_Milten_SHCONTINUE_Info;
	important	= 0;
	permanent	= 1;
	description = "Oserons-nous repasser � la garde ?";
};

FUNC int Info_Milten_SHCONTINUE_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	&&	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<9000)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Oserons-nous repasser � la garde ?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Je suis pr�t. Avance, je suivrai.

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHSUCCESS
//***************************************************************************
instance Info_Milten_SHSUCCESS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSUCCESS_Condition;
	information	= Info_Milten_SHSUCCESS_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && Npc_HasItems(hero, ItMi_OrcTalisman))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Bon. Tu as le talisman.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Voil�, prend le. Comme convenu !
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Merci, mon ami. Je n'oublie jamais quelqu'un qui m'a aid�.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Je retournerai au Vieux camp, peut-�tre nous verrons-nous l� bas.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Ensemble nous avons d�fait le GARDIEN sous l'anneau de pierre. Milten a pris sa part du butin et s'est rendu au Vieux Camp.");
	B_LogEntry		(CH3_Stonehenge,"Saturas sera heureux de savoir que j'ai trouv� une pierre focale ici !");
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self, "ReturnToOC");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Milten_OCWARN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWARN_Condition;
	information	= Info_Milten_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Ils... Ils sont tous morts . Tous MORTS. Je n'ai pas pu les aider... Je n'�tais... n'�tais pas l�... je...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Calme-toi, Milten, j'ai d�j� rencontr� Diego de l'autre c�t� du camp.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Bon, alors tu sais. Qu'est-ce que Diego t'as dit ?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Si j'arrive � trouver Gorn et Lester, je les avertirai et les enverrai � ton endroit de r�union.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Bon chance et salut !
		B_LogEntry		(CH4_Firemages,"Comme Diego, Milten se cache pr�s du Vieux Camp. � une distance s�re de la porte principale, le Magicien du Feu avertit ceux qui arrivent, pour qu'ils ne tombent pas dans les mains des gardes.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Calme-toi, Milten, qu'est-il arriv� ?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Ils ont tu� les Magiciens de Feu. TOUS sauf moi, et j'ai fr�l� la mort aussi.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Tu ferais mieux de me dire l'histoire enti�re � partir du d�but, une chose apr�s l'autre.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //D'accord. Reste calme, Milten, reste calme...
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Tout a tout commenc� par l'effondrement de la vieille mine...
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //La Vieille Mine S'EST EFFONFREE ? ? ?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Oui. �a s'est produit tr�s rapidement. Personne dans la mine n'a pu sortir.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Les gardes ont bloqu� l'entr�e de la mine.
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Milten_OCMINE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCMINE_Condition;
	information	= Info_Milten_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Comment est la caverne dans la mine ?";
};

FUNC int Info_Milten_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Comment est la caverne dans la mine ?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Je ne sais pas. Certains des mineurs qui attendaient devant l'entr�e ont dit quelque chose au sujet d'un tremblement de terre massif et d'un nuage �norme de la poussi�re venant du tunnel.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //�tais-tu l� ?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Oui. C'est l� que je me suis renseign� sur l'�boulement.
};

//***************************************************************************
//	Info OCKDW
//***************************************************************************
instance Info_Milten_OCKDW (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCKDW_Condition;
	information	= Info_Milten_OCKDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Que dit-tu sur les Magiciens du Feu ?";
};

FUNC int Info_Milten_OCKDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //Que dit-tu sur les Magiciens du Feu ?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Je sais seulement qu'ils ont �t� tu�s par les Barons de minerai peu de temps apr�s l'effondrement de la mine.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Quand je suis revenu de notre aventure sous l'anneau de la pierre, les gardes � la porte m'ont soudainement attaqu�.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //"Ils m'ont cri� des mots comme ''tra�tre 'et ''collaborateur"". J'ai eu du mal � m'�chapper."
};

//***************************************************************************
//	Info OCWHY
//***************************************************************************
instance Info_Milten_OCWHY (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWHY_Condition;
	information	= Info_Milten_OCWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Pourquoi le Baron du minerai veut tuer les magiciens...";
};

FUNC int Info_Milten_OCWHY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Pourquoi les Barons de minerai voudraient-ils tuer les magiciens ? C'est incompr�hensible...
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //C'est exact. Les gardes ne m'ont donn� aucune occasion de le leur demander. Ils ont tir� leurs �p�es imm�diatement.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Peut-�tre que Diego en sait plus. Il �tait dans le camp quand les choses se sont g�t�es.
};

//***************************************************************************
//	Info OCYOU
//***************************************************************************
instance Info_Milten_OCYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCYOU_Condition;
	information	= Info_Milten_OCYOU_Info;
	important	= 0;
	permanent	= 0;
	description = "Tu dois te cacher. Loin d'ici.";
};

FUNC int Info_Milten_OCYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Tu dois te cacher. Loin d'ici.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //Non. Diego et moi avons accept� de garder un oeil sur les deux portes et d'avertir nos amis loyaux des autres camps.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //S'il te plait, va parler � Diego !
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Apr�s que Diego m'ait parl� d'�v�nements incroyables, j'ai rencontr� Milten en amont du Vieux Camp . J'esp�re qu'ils ne se sont pas fait attrap�s.");
	};
};

//***************************************************************************
//	Info OCDIEGO
//***************************************************************************
instance Info_Milten_OCDIEGO (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCDIEGO_Condition;
	information	= Info_Milten_OCDIEGO_Info;
	important	= 0;
	permanent	= 0;
	description = "O� puis-je trouver Diego ?";
};

FUNC int Info_Milten_OCDIEGO_Condition()
{
	if Npc_KnowsInfo(hero, Info_Milten_OCWHY)
	&& Npc_KnowsInfo(hero, Info_Milten_OCYOU)
	&& !Npc_KnowsInfo(hero, Info_Diego_OCSTORY)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //O� puis-je trouver Diego ?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Il se cache de l'autre c�t� du Vieux camp, pr�s de la porte de derri�re
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //S'il te plait, va lui parler !

	B_LogEntry			(CH4_Firemages,"Milten m'a attrap� devant le Vieux Camp et m'a parl� de l'�croulement de la vielle mine et l'assassinat des Magiciens du Feu.");
	B_LogEntry			(CH4_Firemages,"Diego reste de l'autre c�t� du Vieux Camp , pr�s de porte arri�re . Je dois lui parler, il sait ce qui est arriv�.");
};










//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_LOADSWORD_Condition;
	information	= Info_Milten_LOADSWORD_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_LOADSWORD_Condition()
{
	if (LoadSword)
	{
		return TRUE;
	};	
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Salutations, mon ami, je ne t'ai pas vu depuis des lustres.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Bonjour, Milten. Beaucoup de choses se sont produites depuis la derni�re fois que nous nous sommes rencontr�.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Je voudrais te parler de tout mais je n'ai pas le temps en ce moment. Je suis press�.
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD1 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD1_Condition;
	information		= Info_Milten_LOADSWORD1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Milten, j'ai besoin de ton aide !"; 
};

FUNC int Info_Milten_LOADSWORD1_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Milten, j'ai besoin de ton aide !
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Qu'est-il arriv� ? Comment est-ce que je peux t'aider ?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Allons quelque part o� nous pouvons parler.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Tr�s bien. Suis moi.

	Npc_ExchangeRoutine	(self,	"LSAway");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info LSAWAY
//---------------------------------------------------------------------
instance Info_Milten_LSAWAY (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSAWAY_Condition;
	information		= Info_Milten_LSAWAY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD1)
	&&	(Npc_GetDistToWP(hero, "NC_KDW04_IN") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSAWAY_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //Dis moi maintenant de quoi il s'agit ?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //J'ai besoin des pouvoir magiques du tas de minerai et je ne pense pas que ce serait une bonne chose de le demander aux autres Magiciens de l'Eau.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //Tu plaisantes !
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //Ce n'est pas l'heure de plaisanter. C'est tr�s grave.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //J'ai vu Xardas, le Necromancer !
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Je travaille sous ses ordres !
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS ? ? ? tu commences � m'effrayer !
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Personne ne lui a parl� depuis qu'il a quitt� le Vieux camp.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //J'ai !
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //Pourquoi as-tu besoin des pouvoirs du tas de minerai ?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Je veux les transf�rer dans cette �p�e.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Houl�, quelle arme !
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //Elle s'appelle URIZIEL !
};


//---------------------------------------------------------------------
//	Info LOADSWORD4
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD4 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD4_Condition;
	information		= Info_Milten_LOADSWORD4_Info;
	important		= 0;
	permanent		= 0;
	description		= "Xardas m'a donn� ce sort !"; 
};

FUNC int Info_Milten_LOADSWORD4_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSAWAY)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD4_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas m'a donn� ce sort pour effectuer le transfert !
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //Tu dois le r�citer tandis que je r�unis l'�p�e et le minerai !
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Mmmm... Mmmm� C'est comme si je devais seulement lire ce sort...
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Mais nous aurons des ennuis avec Saturas et les autres magiciens !
};







//---------------------------------------------------------------------
//	Info LSRISK
//---------------------------------------------------------------------
instance Info_Milten_LSRISK (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSRISK_Condition;
	information		= Info_Milten_LSRISK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nous devrons prendre ce risque !"; 
};

FUNC int Info_Milten_LSRISK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD4)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Nous devrons prendre ce risque !
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //Ils sont vraiment TR�S, TR�S important !
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Important pour TOUS LES habitants de la colonie.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Je ne comprends pas...
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Il nous mettra dehors ! Tu peux me faire confiance !
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Bien ! Apr�s tout ce que tu as fait pour nous, je te fais compl�tement confiance.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //En outre, il semble que Xardas te fais aussi confiance.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Rencontre-moi en bas, au tas de minerai, et... ne le dis � personne !
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Bon, rassemblement au tas de minerai ! Je te verrais l�-bas !
	
	B_LogEntry			(CH5_Uriziel,"Je peux convaincre mon ami Milten de m'aider � transf�rer l'�nergie sur l'�p�e. Nous nous rencontrerons au fond du tas de minerai des Magiciens de l'Eau.");
	Npc_ExchangeRoutine	(self,	"LSOreHeap");
	B_ExchangeRoutine	(Sld_726_Soeldner,	"loadsword");

	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LSOREHEAP
//---------------------------------------------------------------------
instance Info_Milten_LSOREHEAP (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSOREHEAP_Condition;
	information		= Info_Milten_LSOREHEAP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSOREHEAP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSRISK )
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSOREHEAP_Info()
{
	//AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //As-tu l'�p�e et le sort ?
};
	
//***************************************************************************
//	Info LSNOW
//***************************************************************************
instance Info_Milten_LSNOW (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSNOW_Condition;
	information		= Info_Milten_LSNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tiens, prend le sortil�ge !"; 
};

FUNC int Info_Milten_LSNOW_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSOREHEAP)
	&&	Npc_HasItems (hero, Mythrilklinge01)
	&&	Npc_HasItems (hero, Scroll4Milten)
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 1000)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Tiens, prend le sortil�ge !
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Es-tu pr�t ?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Aussi pr�t qu'on peut �tre pour ce plan de fou.
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Alors faisons-le !

	B_GiveInvItems 	(hero, self, Scroll4Milten, 1);	
	B_GiveInvItems 	(hero, self, Mythrilklinge01, 1);	

	StartChaptersSix = TRUE;

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info CHAPTERSIX
//---------------------------------------------------------------------
instance Info_Milten_CHAPTERSIX (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_CHAPTERSIX_Condition;
	information		= Info_Milten_CHAPTERSIX_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_CHAPTERSIX_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSNOW)
	&&	StartChaptersSix
	{
		return TRUE;
	};	
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(6);
};
	
//---------------------------------------------------------------------
//	Info LSDONE
//---------------------------------------------------------------------
instance Info_Milten_LSDONE (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSDONE_Condition;
	information		= Info_Milten_LSDONE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSDONE_Condition()
{
	if	(Kapitel == 6)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSDONE_Info()
{
	//AI_GotoNpc				(self, hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //C'est fait !
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Incroyable ! La gemme grise et plate est bleue scintillant maintenant !

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //C'est un bon signe ! Les pouvoirs magiques du tas de minerai semblent vraiment �tre dans la vieille �p�e maintenant !
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Mais notre petite op�ration ici semble avoir attir� une certaine attention.
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //Tu devrais te d�placer par t�l�pathie directement !
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //Et toi ?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //Ne t'inqui�te pas pour moi, je trouverai une solution. Va maintenant !

	B_Story_UrizielLoaded	();
	
	AI_StopProcessInfos	(self);
};




//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
