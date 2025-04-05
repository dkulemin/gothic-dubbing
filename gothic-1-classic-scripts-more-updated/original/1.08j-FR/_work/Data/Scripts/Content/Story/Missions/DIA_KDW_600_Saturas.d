// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Puisses-tu revenir entier !

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Que fais-tu ici ? Tu n'a rien � faire ici ! Fiche le camp !

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "J'ai des nouvelles importantes du camp de la Confr�rie !";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //J'ai des nouvelles importantes du camp de la Confr�rie !
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Si Cronos t'as donn� la permission de me rendre visite, il doit s'agir de nouvelles importantes en effet !
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Y'B�rion est mort !";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y'B�rion est mort ! Il est mort pendant l'invocation rituelle du Dormeur.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y'B�rion mort ? Ce sont des mauvaises nouvelles, de tr�s mauvaises nouvelles en effet !
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Qui est � la t�te de la Confr�rie maintenant ? Ce fourbe de Cor Kalom aux dents longues ?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Non ! Kalom a tourn� le dos � la Confr�rie. Il a pris quelques templiers avec lui et s'en est all�. Personne ne sait o� !
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Pourquoi �a ? Il venait en second apr�s Y'B�rion !
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Certains �v�nements ont convaincu les Sages que leur m�thode �tait fausse. Leur dieu semble �tre un d�mon de l'Archimonde.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Un des Sages a failli me tuer sous l'influence du Dormeur, alors que je venais de lui sauver la vie.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom �tait le seul Sage qui n'a pas voulu admettre la v�ritable nature de l'atroce cr�ature, c'est pourquoi il a quitt� le camp du marais.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Je vois ! Et bien, au moins nous sommes chanceux � cet �gard. Cor Angar est un homme bon. Il est rude, mais honn�te.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Si quelqu'un peut emp�cher la Confr�rie de tomber en morceaux apr�s cette catastrophe spirituelle, c'est bien lui.

	B_LogEntry		(CH3_EscapePlanNC,"J'ai parl� des incidents � Saturas dans le Camp Mar�cageux. Il �tait heureux que Cor Angar ai repris la direction de la Confr�rie.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "J'ai cet almanach...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //J'ai cet almanach...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'B�rion l'a employ� pour charger la pierre focale.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Tr�s bien. Nous avons besoin du savoir contenu dans ce livre pour charger les cinq pierres focales originales.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Je prends l'almanach !

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai cette pierre focale...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //J'ai cette pierre focale...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Tu as en main la clef qui peut briser toutes nos cha�nes.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //C'est une des cinq pierres focales qui a �t� utilis�e pour cr�er la Barri�re magique.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //Et avec l'aide de la tr�s semblable puissance convergente de ces pierres, nous abattrons le grand mur d'�nergie.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Mais de cette utilisation n'�mergerait-il pas un terrible pouvoir ?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //c'est vrai, mais toutes ces ann�es nous avons extrait le minerai sans r�fl�chir au lieu de l'�changer avec nos ge�liers contre des richesses.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Comme tu dois le savoir, il y a dans chaque p�pite de minerai une certaine quantit� de puissance magique. � l'aide de l'�nergie ainsi amass�e dans le tas de minerai, on pourra d�truire la Barri�re Magique.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //�a me semble dangereux.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //L'explosion aura simplement un caract�re magique, elle d�truira seulement tout qui est modifi� par la magie � l'int�rieur de la Barri�re, donc sans danger pour nous les �tres humains
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Tiens, prends la pierre focale. J'esp�re qu'il sera vraiment utile � ton plan avec le tas de minerai !

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Que vas-tu faire avec la pierre et l'almanach maintenant ?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //Que vas-tu faire avec la pierre et l'almanach maintenant ?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Rien. Nous avons besoin d'abord des quatre derni�res pierres focales !
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Malheureusement nous n'avons aucune de ces quatre pierres magiques.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Je d�sire trouver les quatre pierres focales restantes pour toi !";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Je d�sire trouver les quatre pierres focales restantes pour toi !
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Apr�s tout, j'�tais autrefois tout � fait d�cid� de sortir d'ici.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Je dois t'avertir. Leur recherche montrera que c'�tait aussi difficile que dangereux.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Mais comme le conflit avec le Vieux camp empire un peu plus chaque jour, je ne peux te donner aucun mercenaire.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Tu seras absolument seul.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Bon... Je suis habitu� ! Je trouverai une solution pour m'organiser.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Ta confiance t'honore, mais tu auras besoin quand m�me de quelques objets qui t'aideront.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Prends cette carte. Elle est ancienne, l�-dessus sont marqu�s les endroits o� se trouvaient les pierres focales � l'origine, quand la Barri�re a �t� �rig�e.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //En outre, ce parchemin te permettra de revenir � notre camp plus rapidement.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //En dernier lieu, tu devrais parler � Riordian. C'est lui qui �labore les potions du camp.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Tu le trouveras dans sa cabane, ici, au niveau sup�rieur

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hmmm, c'est un d�but, tu peux mieux faire.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Il manque encore trois pierres focales pour accomplir notre plan.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //A pr�sent part � la recherche des pierres focales manquantes.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Bien, c'est la deuxi�me pierre focale que tu nous as apport�.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //On se rapproche de notre objectif.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Allez, courage, rapporte les deux pierres focales restantes.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Incroyable, nous avons maintenant quatre pierres focales en tout.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Plus qu'une et nous les aurons toutes.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Tu as d�j� rendu un grand service � notre communaut�. Trouve la derni�re pierre, et nous pourrons bient�t nous lib�rer.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Magnifique, nous avons enfin les cinq pierres focales.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Tes actions ont une valeur inestimable pour notre camp. Sois assur� de mon �ternelle reconnaissance.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Va voir Riordian maintenant. Il te donnera quelque chose pour te remercier de tes remarquables efforts.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Parle aussi � Cronos, le gardien du minerai. Il te donnera un autre cadeau de la part de notre communaut�.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"J'ai r�ussi � trouver les quatre pierres focales. Saturas est incroyablement heureux. Je crois qu'il doit me rendre un service dans le Nouveau le Camp.");
		B_LogEntry		(CH3_BringFoci,"Les Magiciens de l'Eau, Cronos et Riordian, m'ont promis une r�compense pour le recouvrement de toutes les pierres focales. Je dois aller les voir.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Auftr�ge bekam.    ***Bj�rn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Je m'aper�ois que tu as utilis� ton parchemin de t�l�portation. Prends en un autre ici.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "J'ai trouv� une pierre focale dans le canyon des Trolls !";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //J'ai trouv� une pierre focale dans le canyon des Trolls !

	B_LogEntry		(CH3_TrollCanyon,"La pierre du canyon des Trolls est maintenant en s�curit� avec Saturas.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai trouv� une pierre focale dans le fort de la montagne !";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //J'ai trouv� une pierre focale dans le fort de la montagne !

	B_LogEntry		(CH3_Fortress,"Saturas a re�u, de ma part, la pierre du fort de la montagne.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai trouv� la pierre focale du monast�re en ruine !";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //J'ai trouv� la pierre focale du monast�re en ruine !
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Gorn le mercenaire �tait l�, il m'a donn� un coup de main dans ma qu�te.

	B_LogEntry		(CH3_MonasteryRuin,"Enfin je peux donner la pierre du monast�re en ruine � Saturas.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai trouv� une pierre focale sous l'anneau de pierre !";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //J'ai trouv� une pierre focale sous l'anneau de pierre !

	B_LogEntry		(CH3_Stonehenge,"J'ai donn� la pierre de la crypte au-dessous de l'anneau de pierre � Saturas.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "Peux-tu d�truire le tas de minerai maintenant ?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Peux-tu d�truire le tas de minerai maintenant ?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Nous avons maintenant tous les artefacts indispensables pour mener � bien notre plan.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Mais la Barri�re a �t� cr��e par douze magiciens.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //Il n'y a pas assez de magiciens dans le Cercle de l'Eau pour contr�ler les �nergies puissantes et les guider correctement.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //Que peut-on faire ?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Je me rends compte que tu as d�j� fait beaucoup pour notre communaut�, nous te devons beaucoup...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //... mais dans l'int�r�t des habitants de la colonie, je dois te demander un service de plus.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "un service de plus ?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //un service de plus ?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Bon. Rends toi au Vieux camp et essaye de gagner � notre cause quelques magiciens du Cercle de Feu.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //MAGICIENS DU FEU ? ? ? Pourquoi voudraient-ils renoncer � leur vie facile ?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //La destruction de la Barri�re mettrait fin � leur position dominante !
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //C'est la raison exacte pour laquelle TU dois accomplir cette mission. Tu connais des personnes dans tous les camps de la colonie.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Rappelle le pass� aux Magiciens du Feu, quand nous �tions ensemble � l'�tude des arts de la magie.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "D'accord, alors, j'essayerai de convaincre les Magiciens du Feu !";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //D'accord, alors, j'essayerai de convaincre les Magiciens du Feu !
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Mais je ne peux rien promettre ! �a me semble presque impossible.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Tu dois tout tenter. Si tu �choues l�, il y a seulement un autre...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Un seul...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //... un QUOI ?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Oublie �a ! Tu DOIS r�ussir !
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //L�, prends cette rune. Remets-la � Corristo, le grand Magicien du Cercle de Feu, en gage de notre confiance.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Avec �a il peut, chaque fois qu'il le d�sire, se d�placer par t�l�pathie dans cette salle en �vitant les gardes.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //J'esp�re que �a convaincra nos anciens amis de nos bonnes intentions.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Je suis heureux de te voir de retour. Quelque chose de terrible est arriv� !
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Laisse-moi deviner...la mine Libre a �t� assailli par les gardes du Vieux camp. Personne ne les a vues venir... ?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Attends... comment... mais bien s�r... Tu l'as appris au Vieux camp !
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn est arriv� ici juste avant toi .
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Qu'est-ce qu'il s'est pass� pour que Gomez prendre une mesure si agressive ?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Il devrait bien se rendre compte qu'un acte aussi honteux puisse seulement provoquer la guerre.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "La Vielle Mine s'est effondr�e apr�s que l'eau est suint�e � l'int�rieur !";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //La Vielle Mine s'est effondr�e apr�s que l'eau est suint�e � l'int�rieur !
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //... Effondr�... naturellement... Puis tout deviens logique.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez est de nouveau le dos au mur. Il est plus dangereux que jamais. Maintenant qu'il n'a plus rien perdre, il fera n'importe quoi !
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gomez a fait tu� tous les Magiciens du Feu !";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez a fait tu� tous les Magiciens du Feu !
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //IL LES A TU� ??? Pourquoi  ferait-il �a au nom de Beliar ?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Ils �taient contre l'attaque de la mine Libre, et Gomez pour.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Alors nous tous sommes maudits. Sans les six autres magiciens, nous ne pourrons jamais contr�ler la puissance concentr�e du tas de minerai.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //En d�pit de cela, je te remercie de m'avoir transmis ce dangereux message.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas n'�tait pas du tout heureux quand je lui ai parl� des incidents dans le Vieux Camp. Quelque soi leur plan d'�vasion... Ils devront se d�brouiller SANS les Magiciens du Feu.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai �t� banni du Vieux Camp parce que je t'ai aid� !"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //J'ai �t� banni du Vieux Camp parce que je t'ai aid� !
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Tu ne veux pas faire partie du Vieux camp plus longtemps ?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Alors je te souhaite la bienvenue au nom de notre communaut�.

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Apr�s que j'ai �t� banni du Vieux Camp, Saturas m'a accueilli au Nouveau Camp.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cela signifie-t-il que les mercenaires me prendront ?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Cela signifie-t-il que les mercenaires me prendront ?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Parle � Lee. Il doit savoir. Puis reviens me voir.

	B_LogEntry			(CH4_BannedFromOC,"Lee, le chef des mercenaires, veut me parler. Je suppose qu'apr�s l'avoir vu, je retourne aupr�s de Saturas."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cela signifie-t-il que j'appartiens maintenant aux Magiciens de l'Eau ?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Est-ce que �a signifie que j'appartiens maintenant � la guilde des Magiciens de l'Eau ?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Pas encore. D'abord tu dois prononcer le serment de l'Eau.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Mais j'ai d�j� prononc� le serment de Feu !
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm....
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //Cela ne veut pas dire que tu romps ton voeu !
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Heuu... Je ne comprends pas...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Tu prolonges ton voeu. De cette fa�on tu deviendras un magicien des deux �l�ments !
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Alors tu auras la force de Feu aussi bien que la sagesse de l'Eau !

	B_LogEntry			(CH4_BannedFromOC,"Saturas me laissera rejoindre le Cercle de l'Eau et je n'ai pas besoin de rompre le serment du Feu."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je suis pr�t � faire le serment."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Je suis pr�t � faire le serment.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Serviteur du Feu, re�ois maintenant la b�n�diction de l'Eau !
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //A pr�sent prononce ces paroles :
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Je jure par la force des dieux...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Je jure par la force des dieux...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... Et par le pouvoir de l'Eau Sacr�e...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... Et par le pouvoir de l'Eau Sacr�e...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... que mon savoir et mes actions dor�navant et pour toujours ne feront qu'un avec l'Eau...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... que mon savoir et mes actions dor�navant et pour toujours ne feront qu'un avec l'Eau...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... jusqu'� ce que mon corps revienne au royaume de Beliar et que la source de ma vie se soit tarie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... jusqu'� ce que mon corps revienne au royaume de Beliar et que la source de ma vie se soit tarie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Par ce serment tu fusionnes en toi la puissance du Feu et la b�n�diction de l'Eau.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Tu as maintenant li� ensemble ce qui �tait distant avant. Puisse ta vie �tre un signe de la fusion des �l�ments.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Rev�ts cette longue robe comme signe de ton lien avec l'Eau sacr�e et avec Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Maintenant j'ai rejoint le Cercle de l'Eau. Dor�navant j'ai acc�s aux deux �coles de magie."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "Peux-tu me former ?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Peux-tu me former ?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Il y a beaucoup � apprendre. Je te formerais d�s que tu seras pr�t.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Il y a un cercle que tu ne connais pas encore. Je te l'enseignerai d�s que tu seras pr�t.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Tu as d�j� ma�tris� le Cinqui�me Cercle de la magie ! Tu en sais maintenant autant que moi.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Je ne peux rien t'apprendre de plus !
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, le chef des Magiciens de l'Eau, enseigne les CERCLES magiques. Il reste toujours au pentacle au niveau sup�rieur.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Je suis pr�t � entrer dans le Premier Cercle.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Pour entrer dans le premier des Cercles tu dois savoir utiliser les runes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Chaque rune contient la structure d'un sort sp�cial.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //En utilisant tes propres pouvoirs magiques, tu pourras jeter le sort correspondant � la rune.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Mais contrairement aux parchemins, qui sont aussi des formules magiques, le pouvoir magique de la rune ne garantie que ce que la structure du sort autorise.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Chaque rune est une source de pouvoir magique qui est toujours disponible.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Ton pouvoir magique s'�puise un peu plus chaque fois que tu utilises une rune, comme avec un parchemin.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Chaque fois que tu entres dans un nouveau Cercle, tu apprends � te servir d'autres runes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Sers toi de la puissance des runes pour te conna�tre..
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Je suis pr�t � entrer dans le Second Cercle.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Tu as appris le fonctionnement des runes. Maintenant il est temps d'approfondir ce savoir.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Quand tu arrives dans le deuxi�me Cercle, tu n'apprends que les sorts basiques de combats, et surtout le secret de la gu�rison.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Mais tu dois beaucoup apprendre pour d�couvrir les vrais secrets de la magie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Tu sais que tu peux utiliser chaque rune aussi souvent que tu le d�sires jusqu'� �puisement de toutes tes propres puissances.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Mais avant de passer aux actes, pense � ce que tu vas faire. Tu poss�des � pr�sent les pouvoirs permettant de semer facilement la mort et la destruction.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Mais un vrai magicien n'utilise la magie qu'en cas de n�cessit�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Analyse la situation, alors tu comprendras le pouvoir des runes.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Peux-tu m'enseigner le troisi�me Cercle ?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Le troisi�me Cercle est l'une des �tapes les plus importantes dans la vie d'un magicien. Une fois atteint, tu n'as plus besoin de chercher.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Tu as bien progress� sur le chemin de la magie. Tu sais utiliser les runes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Ce savoir est la base pour une autre voie. Utilise les runes avec prudence.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Tu as le choix de te servir ou pas d'une rune. C'est � toi de d�cider.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Une fois ce choix fait, il ne faut plus h�siter � te servir de ton pouvoir magique.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Comprends ta voie, alors tu conna�tras le pouvoir de d�cider.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Je suis pr�t � entrer dans le Quatri�me Cercle.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Tu as gravi les trois premiers Cercles. Le temps est venu de t'enseigner les secrets de la magie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //La magie des runes est bas�e sur la pierre. Ce sont des pierres magiques, cr��es � partir de minerai magique.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //C'est le m�me minerai que celui que l'on extrait des mines. Il est enrichi dans les temples de formules magiques . L� les runes sont converties en instruments de notre pouvoir.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Avec les runes que tu contr�les maintenant, tu connais sur le bout des doigts tout le savoir contenu dans les temples du royaume .
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Comprends la magie, tu d�couvriras le secret du pouvoir.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER F�NFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Je suis pr�t � rentrer dans le Cinqui�me Cercle.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Que cela soit. Je t'enseignerai les pouvoirs du Cinqui�me Cercle.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //La Temp�te de Feu, la Vague de Glace et la destruction des morts-vivants, tout cela est �crit maintenant sur les runes que tu peux utiliser.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //"Mais le sort le plus puissant du Cinqui�me Cercle est l'Onde de la Mort. Si un jour cette rune est entre tes mains; tu poss�deras des pouvoir dangereux."
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Fais attention � utiliser le moins possible ce genre de magie. C'est un cadeau du dieu des t�n�bres.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Tu en sais a pr�sent autant que moi, je n'ai plus rien � t'apprendre.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Teste tes possibilit�s, alors tu conna�tras ton vrai pouvoir.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //J'ai aim� rev�tir la Grande Robe de l'Eau.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Le temps n'est pas venu pour toi de porter la Grande Robe longue.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Le peu de minerai que tu poss�des ne couvrirait m�me pas les co�ts de fabrication.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Le moment est venu. Tu es digne de porter la Grande Robe de l'Eau.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee m'a admis parmi les mercenaires.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee m'a admis parmi les mercenaires.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Bien. Tr�s bien. Alors tu fais d�s � pr�sent partie de notre communaut�.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Sois le bienvenu !

	B_LogEntry			(CH4_BannedFromOC,"Saturas m'a maintenant officiellement accueilli comme mercenaire.");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Quand vous m'avez envoy� aux Magiciens du Feu, vous avez mentionn� QUELQU'UN...";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Bj�rn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Bj�rn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Quand tu m'as envoy� chez les Magiciens du Feu, tu as mentionn� que c'�tait... QUELQU'UN.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Et bien, j'avais esp�r� que nous pourrions le faire sans son aide, mais les choses se d�roulent....
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //Qui est-IL ?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //Tr�s bien, tr�s bien!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Il y a tr�s, tr�s longtemps
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Va � l'essentiel, s'il te plait!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Un peu de patience ! Bon, quand nous - les douze magiciens - avons cr�� la Barri�re, nos puissances magiques ont �t� dirig�es et command�es par un treizi�me magicien.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Un treizi�me magicien ? J'ai toujours pens� qu'il y en avait seulement douze !
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //La plupart des personnes qui n'�tait pas l� pendant les premiers jours de la colonie pensent �a.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Ce treizi�me magicien �tait notre chef. Tout ceci a eu lieu avant que nous soyons divis�s en cercles du Feu et de l'Eau.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Mais il a quitt� le Vieux camp, qui �tait par le pass� l'unique camp de la colonie.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Comment s'appelle ce treizi�me magicien ?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Comment s'appelle ce treizi�me magicien ?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Il s'appelle Xardas. Presque personne ne se souvient des vieilles histoires qui couraient � son sujet !
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Ce sont ceux l� qui l'appellent simplement le NECROMANCER !
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Pourquoi a-t-il laiss� le Vieux Camp ?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Pourquoi a-t-il laiss� le Vieux Camp ?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Il a commenc� par �tudier l'invocation des morts-vivants et des cr�atures magiques.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gomez n'�tait pas le seul qui a commenc� � s'inqui�ter. La plupart des autres magiciens se sont oppos�s aussi bien � lui qu'� ses actes impies.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //Qu'est-il arriv� alors ?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //� la diff�rence de Gomez, ce n'�tait pas un �gorgeur, c'est pourquoi il a �vit� le conflit et s'en est all�.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "O� est ce magicien aujourd'hui ?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //O� est ce magicien aujourd'hui ?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Il vit en solitaire dans sa tour, au milieu de la terre des Orcs.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //C'est � l'endroit le plus au sud de la colonie.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Je trouverai mon chemin jusqu'� Xardas et lui demanderai de l'aide !";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Je trouverai mon chemin jusqu'� Xardas et lui demanderai de l'aide !
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //C'est le seul qui peut nous aider maintenant.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //S'il sait que c'est sans issue ou qu'il ne veut pas nous aider...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //IL VOUDRA !
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Il y a un autre probl�me...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Un probl�me ?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Un probl�me ?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Oui. Tout au long de ces derni�res ann�es nous avons essay� de contacter Xardas � maintes reprises.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Mais il il semble qu'il ne veut pas �tre d�rang�.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Qu'est-ce que �a signifie ?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Aucun des messagers n'est jamais revenu de sa tour.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Tu devras trouver une solution pour passer ses cr�atures.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Ressembler � �a, va �tre int�ressant !
	
	B_LogEntry			(CH4_FindXardas,"Saturas m'a averti des cr�atures magiques de Xardas, le N�cromancien. Il a d�crit les dangers et les faiblesses de ces cr�atures dans la biblioth�que des Magiciens de l'Eau. Je dois prendre quelque instants pour y jeter un oeil.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Comment arriverai-je devant ces cr�atures ?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Comment arriverai-je devant ces cr�atures ?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Si je le savais, je te le dirais !
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Je t'ai conseill� de faire quelques recherches dans notre biblioth�que.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Peut-�tre trouveras-tu quelque chose dans les vieux livres concernant les forces et les faiblesses des cr�atures appel�es par magie.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //Je vais fouiller toute la biblioth�que. Et ne t'inqui�te pas...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Je reviendrais !

	B_LogEntry			(CH4_FindXardas,"Il y a des �critures sur les dangers et les faiblesses de ces cr�atures dans la biblioth�que des Magiciens de l'Eau. Je dois prendre quelque instants pour jeter un oeil.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schl�sselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //As-tu parl� � Xardas ?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"H� bien...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Non..",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Cela ne correspond pas � ce que tu penses...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //H� bien...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Bon� Bon quoi�?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //�h ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir d�rfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Non..
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Pourquoi pas ?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Je ne pourrais pas aller dans ce coin pourtant...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Tu devais le trouver et lui demander conseil !
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Cela ne correspond pas � ce que tu penses...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Que veux-tu dire ? Il doit trouver la solution pour faire sauter le tas de minerai !
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Le tas de minerai�ahem...... Il est devenu �norme !
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Trouve Xardas, il � besoin d'aide !
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius a dit que j'�tais pr�t � porter la robe d'un Magicien de l'Eau."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius a dit que j'�tais pr�t � porter la robe d'un Magicien de l'Eau.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Alors je te souhaite la bienvenue au nom de notre communaut�.
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Est-ce que �a signifie que j'appartiens maintenant � la guilde des Magiciens de l'Eau ?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Pas encore. D'abord tu dois prononcer le serment de l'Eau.
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Je suis pr�t � faire le serment."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Je suis pr�t � faire le serment.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //A pr�sent prononce ces paroles :
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Je jure par la force des dieux...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Je jure par la force des dieux...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... Et par le pouvoir de l'Eau Sacr�e...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... Et par le pouvoir de l'Eau Sacr�e...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... que mon savoir et mes actions dor�navant et pour toujours ne feront qu'un avec l'Eau...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... que mon savoir et mes actions dor�navant et pour toujours ne feront qu'un avec l'Eau...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... jusqu'� ce que mon corps revienne au royaume de Beliar et que la source de ma vie se soit tarie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... jusqu'� ce que mon corps revienne au royaume de Beliar et que la source de ma vie se soit tarie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Rev�ts cette longue robe comme signe de ton lien avec l'Eau sacr�e et avec Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas m'a maintenant admis dans le Cercle de l'Eau.");

	AI_StopProcessInfos	(self);
};

