// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Qu'est-ce que je peux faire pour toi ?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Qui es-tu ?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Qui es-tu ?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Je m'appelle Raven. Bras droit de Gomez. Quiconque veut voir Gomez doit me parler d'abord.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "J'ai de l'Herbe pour Gomez de la part de Cor Kalom.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //J'ai de l'Herbe pour Gomez de la part de Cor Kalom.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //C'est Bartholo qui s'occupe de ces choses l�. Comme �a Gomez n'est pas emb�t� par les coursiers.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Tu le trouveras dans la chambre sur la droite, derri�re l'entr�e, ou dans la cuisine de la grande tour.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //�videment il dort la nuit. Si j'�tais toi, je ne le d�rangerais pas 

	B_LogEntry			(CH1_KrautBote,"l'Herbe pour Gomez doit �tre amen�e chez Bartholo. Je le trouverai dans la maison des Barons du minerai.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "Je veux voir Gomez. Thorus a dit que je suis pris comme Ombre.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Je veux voir Gomez. Thorus a dit que je suis pris comme Ombre.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Nous sommes toujours � la recherche de gens biens. Tu sembles avoir une bonne opinion de toi. Tu pourrais faire l'affaire.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Je te conduirai � Gomez. Suis-moi. Et ne touche � rien !
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT") ) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Gomez est l�-bas. Si tu ne lui montres pas du respect, j'aurai un certain plaisir de t'apprendre les bonnes mani�res, compris?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "Comment le minerai est-il �chang� ?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //Comment le minerai est-il �chang� ?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //La Vieille Mine va bien. La derni�re livraison venant du monde ext�rieur �tait cons�quente.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "Gomez a dit que j'en �tais.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez a dit que j'en �tais.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Magnifique ! Dans ce cas, tu peux prouver ta valeur avec une premi�re mission.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //Ce ne devrait pas �tre trop difficile pour toi, si tes contacts sont aussi bons que tu le dis.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "Que veux-tu que je fasse ?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Que veux-tu que je fasse ?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Nous commer�ons beaucoup avec la Confr�rie, mais cela ne signifie pas que nous leurs faisons confiance.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Va dans le marais.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Quand tu seras dans le camp, ouvre bien tes oreilles. Tu pourras glaner des choses qui pourraient te servir.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Plus tu d�couvres de choses, meilleur c'est. �a n�cessitera un peu de tact, si tu vois ce que veux dire.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Reste calme, je ne vais pas les f�cher
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //J'ai su que tu avais compris
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Raven m'a envoy� � la Confr�rie dans les marais au nom du Vieux Camp. Je dois garder l'oeil ouvert et les oreilles attentives. Peut-�tre que j'obtiendrai quelques informations utiles pour les Barons du minerai.");
};

// *********************************************
// 				Ausr�stung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "O� puis-je trouver un meilleur �quipement ?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //O� puis-je trouver un meilleur �quipement ?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Va voir Diego, il te donnera une armure particuli�re. Elle te prot�gera de la mort et elle te servira � l'identification en m�me temps.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Ton armure devrait te permettre d'acc�der � tous les endroits o� tu voudras te rendre.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Si tu as besoin d'armes, va parler � Skip. Tu le trouveras dans le grand entrep�t du fond, � gauche de la cour de ch�teau.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Diego a une meilleure ARMURE pour les Ombres de Gomez. Il est � l'entr�e du ch�teau.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"Le garde Skip � l'arri�re de la cours vend des ARMES. Mais seulement pour les hommes de Gomez.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "Je pensais juste devoir le rapporter.";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Je pensais juste devoir le rapporter.
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Bien, J'aime �tre remis � neuf.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //La grande invocation a eu lieu.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Tu as bien fait.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Raven m'a roul� avec des mensonges ! Ce n'est pas le genre d'attitude que j'attendais ! A partir de maintenant je suivrai ma voie.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Ils veulent maintenant une Chenille de mine reine avec des oeufs, cela leur permettra de concocter un potion leur permettant d'entrer en contact avec le Dormeur. Je prends les oeufs avec moi.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Tr�s int�ressant. Je me demande si cela fonctionnera. Apporte les oeufs au temple.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Tu as bien fait.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Raven m'a roul� avec des mensonges ! Ce n'est pas le genre d'attitude que j'attendais ! A partir de maintenant je suivrai ma voie.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Je ne sais pas vraiment ce qu'ils manigancent encore
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Alors pourquoi me tracasses-tu?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


