// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "Tu n'as pas l'air bien m�chant, tu devrais laisser passer les gens dans le ch�teau.";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Tu n'as pas l'air bien m�chant, tu devrais laisser passer les gens dans le ch�teau.
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Seuls les hommes de Gomez sont autoris�s au ch�teau.
};

// ************************************************************
// 					Ich will f�r Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Je veux travailler pour Gomez.";
};                       

FUNC INT Info_Thorus_WorkForGomez_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo (hero,Info_Thorus_EnterCastle) )
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_WorkForGomez_Info()
{	
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Je veux travailler pour Gomez.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Ah oui ? Et qui te dis que Gomez voudra te prendre � son service ?
};

// ************************************************************
// 						Diego schickt mich
// ************************************************************

INSTANCE Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_DiegoSentMe_Condition;
	information	= Info_Thorus_DiegoSentMe_Info;
	permanent	= 0;
	description = "Diego a dit que c'est TOI qui d�cide � qui Gomez s'int�resse.";
};                       

FUNC INT Info_Thorus_DiegoSentMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_DiegoSentMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego a dit que c'est TOI qui d�cide � qui Gomez s'int�resse.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Heu... Si Diego pense que tu es loyal, pourquoi ne s'occupe-t-il pas de toi ?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Ecoute, laisse-moi t'expliquer : Diego va te mettre � l'�preuve. S'il pense que tu es suffisamment loyal, je te laisserai rencontrer Gomez au ch�teau.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //Quoiqu'il arrive, apr�s, c'est � toi de jouer, d'accord?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Je parlerai � Diego
	
	B_LogEntry(CH1_JoinOC,"Thorus m'a dit que je devrais parler � Diego si je veux �tre admis au Vieux Camp. Diego me testera.");
};

// ************************************************************
// 						Try Me
// ************************************************************

INSTANCE Info_Thorus_TryMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMe_Condition;
	information	= Info_Thorus_TryMe_Info;
	permanent	= 0;
	description = "Pourquoi ne me donnes-tu pas l'�preuve?";
};                       

FUNC INT Info_Thorus_TryMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Pourquoi ne me donnes-tu pas l'�preuve?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //Ce n'est pas si facile, gamin ! N'importe quel nouveau venu voulant aller quelque part a besoin d'un chef.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Ce chef doit faire partie des hommes de Gomez. Il te mettra � l'�preuve.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //Et si tu �choues, c'est toi qui en seras le seul responsable - c'est la loi ici.
};

// ************************************************************
// 						TryMeAgain
// ************************************************************

INSTANCE Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeAgain_Condition;
	information	= Info_Thorus_TryMeAgain_Info;
	permanent	= 0;
	description = "Il doit y avoir quelque chose que tu voudrais faire.";
};                       

FUNC INT Info_Thorus_TryMeAgain_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeAgain_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Il doit y avoir quelque chose que tu voudrais faire.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Non. Ce que font les gardes n'est pas encore � ta port�e, gamin.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Tu dois simplement ne pas abandonner les missions confi�es par ton chef.
};

// ************************************************************
// 						TryMeICanDoIt
// ************************************************************

INSTANCE Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeICanDoIt_Condition;
	information	= Info_Thorus_TryMeICanDoIt_Info;
	permanent	= 0;
	description = "Je suis capable de faire ce que tu me demanderas.";
};                       

FUNC INT Info_Thorus_TryMeICanDoIt_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeAgain) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeICanDoIt_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Je suis capable de faire ce que tu me demanderas.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Oh ? Alors c'est ton intention d'�chouer, hein... C'est une chose � laquelle seul quelqu'un qui n'est pas avec Gomez peut envisager.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Mais je t'avertis : Si tu �choues, tu auras de grands ennuis.
};

// **************************************************************************
// 							MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
// **************************************************************************
// 							MISSION MORDRAG KO VERGABE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Offer (C_INFO) //E6
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Offer_Condition;
	information	= Info_Thorus_MordragKo_Offer_Info;
	permanent	= 0;
	description = "Je suis pr�t pour ta proposition.";
};                       

FUNC INT Info_Thorus_MordragKo_Offer_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeICanDoIt) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Offer_Info()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Je suis pr�t pour ta proposition.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //Ce que je suis sur le point de te dire doit rester entre toi et moi, et personne d'autre ne doit jamais en entendre parler, compris ?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //D'accord
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //On a un probl�me avec un type du Nouveau camp. Il s'appelle Mordrag. Il a vol� des affaires aux Barons.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Bien s�r beaucoup de bandits du Nouveau camp en ont vol�, mais ce type a le culot de venir dans NOTRE camp pour vendre NOS marchandises vol�es � NOS hommes !
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //Il est all� trop loin. Mais il sait que je ne peux rien faire contre lui.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Pourquoi?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Parce qu'il est sous la protection des Mages

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Je m'en charge.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Veux-tu que je tue le gars ?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"O� puis-je trouver Mordrag ?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Pourquoi est-ce que les Mages prot�gent Mordrag ?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Il me semble que les Mages sont ton probl�me...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus m'a demand� de d�barrasser un bandit du nom de Mordrag du Camp. Je dois me d�brouiller. Mais personne ne dois savoir que Thorus est impliqu�.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Je m'en charge.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Veux-tu que je tue le gars ?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Je veux que tu fasses en sorte que je ne vois plus sa t�te ici. Peu importe les moyens utilis�s.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //O� puis-je trouver Mordrag ?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Tu le trouveras � la porte sud de l'autre c�t� du ch�teau, juste apr�s l'entr�e. Ce b�tard n'ose pas revenir � l'entr�e principale du camp.
	B_LogEntry(CH1_MordragKO,"Mordrag est au portail Sud � l'arri�re du ch�teau.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Pourquoi est-ce que les Mages prot�gent Mordrag ?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Parce qu'ils l'emploient comme coursier. Nos Mages locaux sont en contact avec les Mages du Nouveau camp. Ils envoient souvent des coursiers faire des allers-retours.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Ils sont capables de devenir TR�S d�sagr�ables si je jette un de leurs coursiers en dehors du camp ou si je le fais tuer.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //Et MOI ? Que penses-tu que les Mages me feront ?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Tu es nouveau ici. Tout ira bien. Mais je suis responsable de ce que mes gar�ons font. C'est pourquoi il est essentiel que tu te taises.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Il me semble que les Mages sont ton probl�me...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Ouais, mais eux posent un probl�me difficile � r�soudre. Il y a quelques ann�es une des Ombres a essay� de poignarder le Haut Magicien du Cercle de Feu pendant son sommeil.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Ils l'ont trouv� plus tard dans l'Anneau Ext�rieur - en fait, il a �t� dispers� dans tout l'Anneau Ext�rieur.
};

// **************************************************************************
// 									ANALYZE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Analyze (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Analyze_Condition;
	information	= Info_Thorus_MordragKo_Analyze_Info;
	permanent	= 1;
	description = "A propos de Mordrag...";
};                       

FUNC INT Info_Thorus_MordragKo_Analyze_Condition()
{	
	if ( (Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices	(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Je m'en charge.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"O� puis-je trouver Mordrag ?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Mordrag ne volera plus jamais rien � qui que ce soit !",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Il ne montrera plus jamais sa t�te dans les environs !",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Je m'en charge.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag ne volera plus jamais rien � qui que ce soit !
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Tu veux dire que tu l'as battu ? Ce n'est pas mal, gamin.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"Thorus a �t� impressionn� que Mordrag soit �limin�. Un avantage pour moi.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Il ne montrera plus jamais sa t�te dans les environs !
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //J'aurais �t� plus  heureux si tu l'avais tu�.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Thorus est content que Mordrag ne soit plus dans le Camp.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_MordragFailed (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragFailed_Condition;
	information	= Info_Thorus_MordragFailed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_MordragFailed_Condition()
{	
	if (MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragFailed_Info()
{
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Tu as �chou� ! Je t'avais dit DE NE PAS MENTIONNER MON NOM ! ! !
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Tu as tout foutu par terre ! Oublie tout �a ! Ne crois pas que tu vas obtenir quelque chose de cette mani�re.
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"Thorus n'a pas aim� le fait que j'ai dit son nom � Mordrag. Je ne pense pas avoir besoin de rester � cet endroit pendant un moment.");
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Bribe Thorus					
// ************************************************************

INSTANCE Info_Thorus_BribeGuard (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_BribeGuard_Condition;
	information	= Info_Thorus_BribeGuard_Info;
	permanent	= 0;
	description = "Si je te donnes une certaine somme de minerai, me laisseras-tu entrer ?";
};                       

FUNC INT Info_Thorus_BribeGuard_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BribeGuard_Info()
{
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Si je te donnes une certaine somme de minerai, me laisseras-tu entrer ?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Pour une certaine quantit�...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Combien ?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //Bon - il doit prendre un moment pour compter le minerai. Assez longtemps pour s'assurer que moi et mes gar�ons sont occup�s � compter tandis que tu te faufileras
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Dites-moi, combien ?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //1000 p�pites devraient suffire
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 p�pites?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Et bien, tu pourrais rejoindre Gomez, �a te permettrai de circuler dans le ch�teau
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "J'ai les 1000 p�pites de minerai. Maintenant laisse moi entrer !";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //J'ai les 1000 p�pites de minerai. Maintenant laisse moi entrer !
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //Bon, vas-y. tu peux entrer dans le ch�teau, mais pas de b�tises, d'accord ?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //N'essaye pas de me rouler, gamin. Tu n'as pas les 1000 p�pites de minerai !
	};
};
		
// ************************************************************
// 					Brief f�r Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 1;
	description = "J'ai besoin d'aller au ch�teau ! J'ai ici une lettre pour le Grand Mage.";
};                       

FUNC INT Info_Thorus_LetterForMages_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Thorus_EnterCastle)
	&&	(Npc_HasItems (hero, ItWr_Fire_Letter_01) || Npc_HasItems (hero, ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_LetterForMages_Info()
{
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Je dois entrer dans le ch�teau ! J'ai une lettre pour le Haut Mage de Feu
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //Et en attendant tu m'as laiss� fl�ner dans le ch�teau pour m'avoir sous la main et r�unir ta r�compense ?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Ouais.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //D'accord, montre-moi la lettre.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Je ne te laisse pas la toucher - oublie-la !
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //D'accord, j'ai oubli�.
};

// ************************************************************
// 					Bereit f�r Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Diego a dit que j'�tais pr�t � voir Gomez !";
};                       

FUNC INT Info_Thorus_ReadyForGomez_Condition()
{	
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_ReadyForGomez_Info()
{
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego a dit que j'�tais pr�t � voir Gomez !
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //C'est ma d�cision !
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //Et que d�cides-tu ?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Je dois admettre que tu sembles avoir r�ussi pratiquement partout.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //D'accord ! tu peux voir Gomez. Il est le seul � d�cider si tu peux nous rejoindre ou pas.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //A partir de maintenant, tu es tout seul, gamin.
				
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Thorus_Krautbote (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_Krautbote_Condition;
	information	= Info_Thorus_Krautbote_Info;
	permanent	= 0;
	description = "J'ai un stock d'Herbe pour Gomez de Cor Kalom.";
};                       

FUNC INT Info_Thorus_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Krautbote_Info()
{
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //J'ai un stock d'Herbe pour Gomez de Cor Kalom.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Montre moi!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //Bon ! C'est parti! Va directement � la maison des Barons du minerai. Bartholo te rencontrera l�.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Tu n'as pas assez de Herbe pour �tre un coursier ! J'esp�re pour toi que tu n'as pas vendu la marchandise ailleurs ! Reviens quand tu auras la bonne quantit� !
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

INSTANCE Info_Thorus_KdWSiegel (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_KdWSiegel_Condition;
	information	= Info_Thorus_KdWSiegel_Info;
	permanent	= 1;
	description = "Je suis coursier pour les Mages de l'Eau. J'ai besoin d'entrer dans le ch�teau !";
};                       

FUNC INT Info_Thorus_KdWSiegel_Condition()
{	
	if 	(( (Npc_KnowsInfo(hero, Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1) )
		&& (thorus_Amulettgezeigt == FALSE) 
		)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_KdWSiegel_Info()
{
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Je suis coursier pour les Mages de l'Eau. J'ai besoin d'entrer dans le ch�teau !
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Tu as un messager qui est une amulette. Cela te permettra de passer les gardes.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Je ne veux pas entendre parler des Mages... Cesse de m'ennuyer, veux-tu ?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //Tu es s�r? Je devine que tu dois avoir �gar� ton amulette, hein ?
	};
};

// ************************************************************
// 					Habs GESCHAFFT
// ************************************************************

INSTANCE Info_Thorus_SttGeschafft (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_SttGeschafft_Condition;
	information	= Info_Thorus_SttGeschafft_Info;
	permanent	= 0;
	description = "Je l'ai fait. Enfin j'appartiens au Camp !";
};                       

FUNC INT Info_Thorus_SttGeschafft_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_SttGeschafft_Info()
{
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Je l'ai fait. Enfin j'appartiens au Camp !
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //F�licitations, gamin ! Tu t'es rapproch� de Diego maintenant.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Va seulement voir Gomez ou Raven si tu as vraiment quelque chose d'important � dire.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2 	   ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "Comment �a va ?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if ( (Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Comment �a va ?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Le Nouveau camp ne nous pose pas beaucoup de probl�mes. Je suis davantage inquiet de cette section de farfelus.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance  GRD_200_Thorus_GARDIST (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_GARDIST_Condition;
	information		= GRD_200_Thorus_GARDIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tu as quelque chose � me dire ?"; 
};

FUNC int  GRD_200_Thorus_GARDIST_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
	&& (Npc_GetTrueGuild (hero ) == GIL_STT)
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Tu as quelque chose � me dire ?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Oui. Ce que tu as fait dans les mines prouve non seulement ton courage, mais �galement ta force et tes aptitudes au combat.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Je suis pr�t � t'accepter dans le rangs des gardes.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Mais tu n'es pas encore tout � fait pr�t pour devenir un garde. Tu dois accumuler un peu plus d'exp�rience avant que je puisse te prendre.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Je te donne une chance. Qu'en dis-tu ?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_AUFNAHME (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_AUFNAHME_Condition;
	information		= GRD_200_Thorus_AUFNAHME_Info;
	permanent		= 0;
	description		= "Je veux devenir un garde."; 
};

FUNC int  GRD_200_Thorus_AUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10)	
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_AUFNAHME_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Je veux devenir un garde.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Je suis heureux de l'apprendre. Mais d'abord je dois te dire quelque chose que je dis � toutes les nouvelles recrues. �coute soigneusement, je ne le r�p�terais pas!
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Jusqu'ici, tu as essay� d'arriver tout seul. C'est le pass�. Mes gar�ons forment un bloc. On prot�ge les Barons du minerai, le minerai, le camp et la mine.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Les mineurs rassemblent le minerai, mais nous nous assurons qu'ils ne soient pas mang�s par des Chenilles. Les Barons du minerai sont en pourparlers avec le roi, mais c'est nous qui les prot�geons.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Jour et nuit, nous sommes dans la mine. Jour et nuit, nous sommes aux portes du camp pour faire en sorte que les gens puissent dormir en paix.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Nous �tions un groupe sauvage quand nous avons commenc� ailleurs, mais maintenant il faudra compter avec notre force. Nous avons tous travaill� dur pour vivre ici.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Je n'attends seulement qu'une chose de mes gar�ons : qu'ils restent soud�s. C'est seulement en restant ensemble que nous pourrons garder ce que nous avons.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //Et de rester vivant.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Tu apprendras tout �a en temps utile. Sois pr�t et donne un coup de main partout o� c'est n�cessaire ou quand il y a quelque chose � faire.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Va demander � Stone de te donner une armure et une �p�e.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Tu trouveras Stone � la boutique du forgeron qui se trouve dans l'Anneau Int�rieur

	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild (hero,GIL_GRD);
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_NOCHWAS_Condition;
	information		= GRD_200_Thorus_NOCHWAS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_200_Thorus_NOCHWAS_Condition()
{	
	if (Npc_KnowsInfo     (hero, GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild  (hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void  GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Oh, encore une chose....
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Bienvenue chez les Gardes
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Aujourd'hui Thorus m'a admit chez les gardes. Je peux aller chercher ma nouvelle armure chez Stone le forgeron, dans le ch�teau");
	
};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_WANNABEMAGE (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_WANNABEMAGE_Condition;
	information		= GRD_200_Thorus_WANNABEMAGE_Info;
	permanent		= 0;
	description		= "Je suis int�ress� par la voie de la magie."; 
};
//
FUNC int  GRD_200_Thorus_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_WANNABEMAGE_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Je suis int�ress� par la voie de la magie.
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Bien, dans ce cas tu devrais peut-�tre parler � Corristo. Il a �t� l'instructeur de Milten. Je suis s�r que rien ne peut t'arr�ter

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc		(KDF_402_Corristo);
	Npc_ExchangeRoutine			(Corristo,"WAITFORSC");
	AI_ContinueRoutine			(Corristo);
};  
//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE GRD_200_Thorus_Teach(C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 10;
	condition	= GRD_200_Thorus_Teach_Condition;
	information	= GRD_200_Thorus_Teach_Info;
	permanent	= 1;
	description = "Peux-tu m'enseigner ?";
};                       

FUNC INT GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Peux-tu m'enseigner ?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Je peux te montrer comment am�liorer tes comp�tences et ta force.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus peut m'aider � am�liorer ma FORCE et ma DEXT�RIT�.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	
	Info_ClearChoices	(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND1 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND1_Condition;
	information		= GRD_200_Thorus_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND1_Info()
{	
	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Thorus peut m'enseigner le combat � l'ARME A DEUX MAINS aussit�t que j'ai ma�tris� le combat � UNE MAIN.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Je vais t'apprendre � manier une �p�e � deux mains.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //D'accord, voyons d'abord les bases.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Tiens l'�p�e horizontalement. Tu auras besoin de balancer plus pour attaquer ton adversaire avec une arme aussi lourde.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Soul�ve ton bras et balance-le directement. D'habitude, ceci est utilis� pour renverser l'adversaire.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Utilise le mouvement de l'arme pour la ramener encore en arri�re.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Les �p�es � deux mains sont id�ales pour coordonner des coups lat�raux qui maintiennent les adversaires � distance.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //Cela devrait suffire pour commencer. Entra�nes-toi.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND2 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND2_Condition;
	information		= GRD_200_Thorus_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Je veux me perfectionner pour combattre avec une �p�e � deux mains.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Tout d'abord, tu dois changer ta position de base. Tiens l'�p�e verticalement, saisis fermement la garde des deux mains et tiens-la sur le c�t�.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Abaisse-la rapidement et balance ta lame au-dessus de ton �paule. Maintenant tu peux trancher rapidement � droite.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Ton adversaire n'auras pas le temps de t'approcher.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Ou abaisse l'�p�e en partant en haut � gauche dans une pouss�e vers l'avant pour faire reculer l'adversaire
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Fais tournoyer ton �p�e autour de toi pour donner � ton prochain coup l'�lan n�cessaire pour envoyer ton adversaire au tapis.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Si ce n'est pas suffisant, sers-toi de ton �lan pour frapper de nouveau
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Quand tu as fini ton attaque, bloque ton adversaire et attends une ouverture pour frapper de nouveau.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //La clef du succ�s consiste � varier tes mouvements et � changer souvent de position.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
