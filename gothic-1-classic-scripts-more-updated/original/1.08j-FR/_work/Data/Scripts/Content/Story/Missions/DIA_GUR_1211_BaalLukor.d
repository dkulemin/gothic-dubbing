// ************************************************************
// 							EXIT 
// ************************************************************
INSTANCE Info_BaalLukor_EXIT(C_INFO)
{
	npc				= GUR_1211_BaalLukor;
	nr				= 999;
	condition		= Info_BaalLukor_EXIT_Condition;
	information		= Info_BaalLukor_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BaalLukor_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//**************************************************************************
//	Info MEET: Erstes Zusammentreffen mit Baal Lukor
//**************************************************************************
INSTANCE Info_BaalLukor_MEET (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_MEET_Condition;
	information	= Info_BaalLukor_MEET_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_MEET_Info()
{
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Merci pour ton aide. Tu es vraiment arriv� au bon moment.
	
	B_GiveXP		(XP_SaveBaalLukor);
};

//**************************************************************************
//	Info DEAD
//**************************************************************************
INSTANCE Info_BaalLukor_DEAD (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DEAD_Condition;
	information	= Info_BaalLukor_DEAD_Info;
	nr			= 20;
	permanent	= 0;
	important 	= 0;
	description = "J'ai rencontr� quelque templiers mort sur la route !";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //J'ai d�couvert quelques templiers morts sur le chemin ! Que s'est-il pass� ?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Ma�tre Cor Angar nous a envoy�s ici pour �tudier les cavernes.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Nous pensions ne rien trouver,  seulement des tombes poussi�reuses et des momies � moiti� d�compos�es.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Soudain l'obscurit� s'est alt�r�e et des Orcs sont sortis de partout. Je ne sais pas ce qu'ils cherchaient, mais le fait de les voir ici est plus qu'inhabituel !
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //O� sont les autres templiers ?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Morts ! Sans le savoir,  je les ai conduits jusqu'� l'endroit de leur massacre. J'esp�re que le Dormeur me le pardonnera.

	B_LogEntry		(CH3_OrcGraveyard,"J'ai sauv� la vie du Sage Baal Lukor dans le cimeti�re Orc pendant une attaque Orcs. Tout ses templiers sont morts dans la bataille contre ces affreuses cr�atures.");
};

//**************************************************************************
//	Info SUMMONING
//**************************************************************************
INSTANCE Info_BaalLukor_SUMMONING (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SUMMONING_Condition;
	information	= Info_BaalLukor_SUMMONING_Info;
	nr			= 10;
	permanent	= 0;
	important 	= 0;
	description = "Cor Angar m'envoie !";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //C'est Cor Angar qui m'envoie ! As-tu trouv� une trace du Dormeur ?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Pas si vite. Parle-moi d'Y'B�rion ? Est-il revenu � lui ?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Non, il est toujours inconscient.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Nous devons r�soudre l'�nigme de ces cavernes. Apr�s toutes ces pertes terribles je ne peux plus revenir les mains vides � la communaut�.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Mais mes aptitudes de combat sont limit�es et de plus les Orcs r�sistent � mes sorts contrairement aux personnes cr�dules du Vieux camp.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Si notre Confr�rie t'a envoy�, peut-�tre pourrais-tu m'aider � fouiller de nouveau ce tombeau.
};

//**************************************************************************
//	Info HELP
//**************************************************************************
INSTANCE Info_BaalLukor_HELP (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HELP_Condition;
	information	= Info_BaalLukor_HELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Je vais t'aider.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Je vais t'aider.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //Bon, je dirais m�me plus, c'est excellent. Il y a trois galeries qui partent de cette salle. Nous devrions toutes les explorer.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //En avant. Je te suis !

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor m'a rejoint, ensemble nous r�soudrons le secret de ce vieil endroit !");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info FOUNDNONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDNONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDNONE_Condition;
	information	= Info_BaalLukor_FOUNDNONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Je n'ai pu rien d�couvrir !";
};

FUNC INT Info_BaalLukor_FOUNDNONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 0)
	&&		!Npc_HasItems(hero, OrkParchmentOne)
	&&		!Npc_HasItems(hero, OrkParchmentTwo)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDNONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDNONE_15_01"); //Je n'ai pu rien d�couvrir !
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Nous devons fouiller les trois galeries.
	
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info FOUNDONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDONE_Condition;
	information	= Info_BaalLukor_FOUNDONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Apparemment il manque la moiti� du parchemin !";
};

FUNC INT Info_BaalLukor_FOUNDONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(((BaalLukor_BringParchment==1) && !Npc_HasItems(hero, OrkParchmentTwo)) || ((BaalLukor_BringParchment==2) && !Npc_HasItems(hero, OrkParchmentOne)))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //Apparemment il manque la moiti� du parchemin !
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Il doit y a une deuxi�me partie. Chacun de nous doit chercher les trois galeries !
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info FIRSTWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTWAIT_Condition;
	information	= Info_BaalLukor_FIRSTWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_FIRSTWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_040")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Nous ne pouvons pas passer par ici ! Peut-�tre trouvera-t-on des indices dans les endroits que l'on cherche.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "WaitInSideTunnelOne");
};

//**************************************************************************
//	Info FIRSTSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTSCROLL_Condition;
	information	= Info_BaalLukor_FIRSTSCROLL_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai trouv� un morceau de parchemin !";
};

FUNC INT Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentOne)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTSCROLL_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //J'ai trouv� un morceau de parchemin !
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 �bergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Tr�s bien ! C'est l'autre moiti� du parchemin des Orcs.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //�a ressemble � un parchemin d'Orc, mais il est coup� en deux.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Il doit y avoir l'autre moiti� quelque part.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 1;
	};
	
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info SECONDWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDWAIT_Condition;
	information	= Info_BaalLukor_SECONDWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_SECONDWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_047")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... ce tunnel se termine en cul-de-sac ! Tu pourras peut-�tre y trouver des indices qui nous aideront plus tard.

	if (!Npc_HasItems	(hero, OrkParchmentTwo)	) 
	{	
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine	(self, "WaitInSideTunnelTwo");
	};
};

//**************************************************************************
//	Info SECONDSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDSCROLL_Condition;
	information	= Info_BaalLukor_SECONDSCROLL_Info;
	permanent	= 0;
	description = "Il y a un morceau de parchemin ici !";
};

FUNC INT Info_BaalLukor_SECONDSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentTwo)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self,	hero);

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Il y a un morceau de parchemin ici !
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 �bergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Tr�s bien ! C'est l'autre moiti� du parchemin des Orcs.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //�a ressemble � un parchemin d'Orc, mais il est coup� en deux.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Il doit y avoir l'autre moiti� quelque part.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 2;
	};

	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info BOTHSCROLLS
//**************************************************************************
INSTANCE Info_BaalLukor_BOTHSCROLLS (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_BOTHSCROLLS_Condition;
	information	= Info_BaalLukor_BOTHSCROLLS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Que faisons-nous avec ces deux morceaux maintenant ?";
};

FUNC INT Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 3)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_BOTHSCROLLS_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Que faisons-nous avec ces deux morceaux maintenant ?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Les deux moiti�s correspondent. Mais je ne comprends pas l'�criture des Orcs.

	B_LogEntry		(CH3_OrcGraveyard,"Nous avons trouv� deux moiti�s d'un parchemin magique Orcish, mais Baal Lukor ne peut pas le traduire. Nous continuerons � chercher.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info RUNES
//**************************************************************************
INSTANCE Info_BaalLukor_RUNES (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_RUNES_Condition;
	information	= Info_BaalLukor_RUNES_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_RUNES_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_BOTHSCROLLS)
	&&		((Npc_GetDistToWP	(hero, "GRYD_025")<600)	|| (Npc_GetDistToWP(hero, "GRYD_048")<600))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_RUNES_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Attends! Voil� qui est int�ressant...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Et bien, je ne trouve rien d'int�ressant ici.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Ne fais pas de bruit et jete plut�t un coup d'oeil aux runes ornementales de cette caverne.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //Ouiii, �a devrait �tre suffisant pour traduire les deux moiti�s du parchemin.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //J'ai compris ! C'est un sort de t�l�portation. Il semble qu'il ne peut seulement �tre utilis� que dans un certain endroit.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //�trange!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-�bergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"� l'aide des inscriptions murales dans une des salles, Baal Lukor est capable de traduire le parchemin. Il semblerai que ce soit un charme de t�l�portation pour une distance tr�s courte."); 


	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2

};

//**************************************************************************
//	Info WHATNOW
//**************************************************************************
INSTANCE Info_BaalLukor_WHATNOW (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_WHATNOW_Condition;
	information	= Info_BaalLukor_WHATNOW_Info;
	permanent	= 1;
	important 	= 0;
	description = "Quel endroit 'certain' ?";
};

FUNC INT Info_BaalLukor_WHATNOW_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_RUNES)
	&&		Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITHOUT)
	&&		!Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITH)		)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_WHATNOW_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //Quel endroit 'certain' ?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //La grande salle que nous avons travers� plus t�t semblait tr�s...... �trange. Retournons-y !

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2

};


//**************************************************************************
//	Info HALLWITHOUT
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITHOUT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITHOUT_Condition;
	information	= Info_BaalLukor_HALLWITHOUT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITHOUT_Condition()
{
	if (	!Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		(Npc_GetDistToWP(hero, "GRYD_055")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop		(hero);
	AI_SetWalkmode	(self,	NPC_WALK);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Cet endroit... Je ne peux pas l'expliquer, mais cet endroit, ici...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Bah, oublie �a. �a doit �tre mon imagination qui me joue des tours.

	B_LogEntry	(CH3_OrcGraveyard,"Quand nous sommes entr�s dans la grande salle de colonne rectangulaire, le Sage a senti quelque chose. Cependant il n'�tait pas confiant.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info HALLWITH
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITH (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITH_Condition;
	information	= Info_BaalLukor_HALLWITH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITH_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		Npc_GetDistToWP	(hero, "GRYD_055")<500			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //Cet endroit a une atmosph�re particuli�re... Une impression de secret.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //Cette salle me rappelle une image de ma vision.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //La vision... Nous sommes tout pr�s du but...

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor a �t� investi par une puissance invisible, il est all� directement � un des murs de la grande salle.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "DOOR");
};

//**************************************************************************
//	Info DOOR
//**************************************************************************
INSTANCE Info_BaalLukor_DOOR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DOOR_Condition;
	information	= Info_BaalLukor_DOOR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_DOOR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HALLWITH)
	&&		Npc_GetDistToWP	(hero, "GRYD_060")<500				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_DOOR_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Derri�re le mur� �a doit �tre l� !
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Mes pouvoirs magiques sont toujours tr�s faibles.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Utilise le sort de t�l�portation des Orcs ici, devant ce mur.
	
	CreateInvItem		(self,			ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems  	(self, hero,	ItArScrollTeleport4, 1); //Teleport �bergeben
	
	AI_StopProcessInfos	(self);
};

//**************************************************************************
//	Info TELEPORT
//**************************************************************************
INSTANCE Info_BaalLukor_TELEPORT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_TELEPORT_Condition;
	information	= Info_BaalLukor_TELEPORT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_TELEPORT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_DOOR)
	&&		Npc_CanSeeNpcFreeLOS(self,	hero)	
	&&		Npc_GetDistToWP	(hero, "GRYD_072")<550				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Tu as trouv� l'endroit secret. Mon flair ne m'a pas tromp�.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //Et est-ce que la r�ponse � l'invocation �trange du Dormeur se trouve r�ellement ici ? ?
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //Pour moi, cela ressemble plus � une autre chambre mortuaire.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Nous devons continuer.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //En avant. Je te suis !

	B_LogEntry		(CH3_OrcGraveyard,"� l'aide du charme de t�l�portation Orcish ,j'ai d�couvert une galerie secr�te d�bouchant directement dans la grande salle.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"TELEPORT");
};

//**************************************************************************
//	Info ALTAR
//**************************************************************************
INSTANCE Info_BaalLukor_ALTAR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_ALTAR_Condition;
	information	= Info_BaalLukor_ALTAR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_ALTAR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_TELEPORT)
	&&		Npc_GetDistToWP	(hero, "GRYD_082")<400
	&&		Npc_CanSeeNpcFreeLOS(self,hero)						)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_ALTAR_Info()
{
	B_FullStop			(hero);
	AI_GotoWP			(hero, "GRYD_081");
	AI_AlignToWP		(hero);

	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //NON ! Ce n'est pas vrai ! Il n'y a rien ici � part... de la poussi�re et... et des os.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //NON!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //MA�TRE, REPONDS MOI !!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //Dormeur, MONTRE TOI !!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NOOONNN!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //�a y est. Maintenant il est compl�tement fou !

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //Tout �a est de ta faute. Ta pr�sence profane a exasp�r� le Dormeur tout-puissant !
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Maintenant je vais devoir supporter ton attitude sacril�ge !
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Je dois faire un sacrifice pour le ma�tre. Un SACRIFICE HUMAIN ! ! !
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Alors il va s�rement m'�clairer et faire de moi son serviteur.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //MEURT, INFID�LE !!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AIIIEEEE!!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor est devenu fou quand il a compris qu'il n'y a ABSOLUMENT RIEN ici. Finalement il m'a m�me attaqu�. Cor Angar va n�cessairement s'inqui�ter quand il entendra cette histoire.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





