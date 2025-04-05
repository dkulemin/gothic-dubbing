/*
-------------------------------- Die Mission ----------------------------

Die Freemine Mission. 
Der SC metzelt sich durch die FM und findet dort einen Orc, welcher schwer
verletzt ist und einen Orcischen Heiltrank braucht. 
Alls Gegenleistung f�r den Heiltrank sagt er dir was man alles f�r Items
f�r das Ulu-Mulu braucht.
Wenn man ihm die drei Teile bringt bastelt er dir das Ulumulu.

--------------------------------- Die Items -----------------------------
OrcHeiltrank:			Orcmedicine			-> OrcGegengift	
	
Teil vom Ulu-Mulu (1)	ItAt_Waran_01		-> 	Flammenzunge
Teil vom Ulu-Mulu (2)	ItAt_Shadow_02		->	Horn eines Shadowbeast
Teil vom Ulu-Mulu (3)	ItAt_Swampshark_02	->	Z�hne des Sumpfhais
Teil vom Ulu-Mulu (4)   ItAt_Troll_02		->	Hauer eines Trolls

Ulu-Mulu				Ulumulu				-> Das Ulumulu

----------------------------------- ToDo ---------------------------------
-> Monsterhinweise m�ssen noch rein
-> Missionlogs basteln
-> Sprache �berarbeiten
*/


//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance Info_FreemineOrc_EXIT (C_INFO)
{
	npc			= FreemineOrc;
	nr			= 999;
	condition	= Info_FreemineOrc_EXIT_Condition;
	information	= Info_FreemineOrc_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
	
};                       

FUNC int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_FreemineOrc_EXIT_Info()
{
	if (!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))	
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_01"); //Je dois passer !
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_02"); //Reviens �tranger !
	}                                                              
	else                                                           
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); //Merci. Je suis sur le d�part maintenant.
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_04"); //Bon voyage �tranger !
	};
	AI_StopProcessInfos	( self );
};

//---------------------------------------------------------------------
//	Info INTRO
//---------------------------------------------------------------------
instance Info_FreemineOrc_INTRO (C_INFO)
{
	npc				= FreemineOrc;
	condition		= Info_FreemineOrc_INTRO_Condition;
	information		= Info_FreemineOrc_INTRO_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output			(self, hero,"Info_FreemineOrc_INTRO_17_01"); //Tarrok besoin d'aide ! Tarrok mal !
};

//---------------------------------------------------------------------
//	Info WASPASSIERT
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASPASSIERT (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_WASPASSIERT_Condition;
	information	= Info_FreemineOrc_WASPASSIERT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Qu'est-ce qui est arriv� ici ?";
};                       

FUNC int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_WASPASSIERT_15_01"); //Qu'est-ce qui est arriv� ici ?
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //Tarrok captur� ici par soldats bleus. Soudain soldats rouges partout.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //Soldats rouges tout tuer.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //Tarrok se sauve ici. Soldats rouges pas venir. Soldats rouges peur de GACH LUG.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_05"); //De l'aide s'il-te plait aide, Tarrok mal.
};

//---------------------------------------------------------------------
//	Info WASTUN
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASTUN (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_WASTUN_Condition;
	information	= Info_FreemineOrc_WASTUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Qu'est-ce que je peux faire pour toi ?";
};                       

FUNC int Info_FreemineOrc_WASTUN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_WASTUN_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_01"); //Qu'est-ce que je peux faire pour toi ?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_02"); //Tarrok a besoin de puissant rem�de. Sinon Tarrok meurt.
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_03"); //Quel genre de rem�de ?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_04"); //GACH LUG empoisonne Tarrok. Tarrok besoin rem�de !
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_05"); //Tarrok avait rem�de, mais Tarrok perdre. Tarrok pas retrouv� rem�de !
};

//---------------------------------------------------------------------
//	Info OFFER
//---------------------------------------------------------------------
instance Info_FreemineOrc_OFFER (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_OFFER_Condition;
	information	= Info_FreemineOrc_OFFER_Info;
	important	= 0;	
	permanent	= 0;
	description = "Je r�cup�rerai ta m�decine !";
};                       

FUNC int Info_FreemineOrc_OFFER_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&&	!Npc_HasItems (hero,Orcmedicine) 
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_OFFER_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_OFFER_15_01"); //Je r�cup�rerai ta m�decine !
	AI_Output			(self, hero,"Info_FreemineOrc_OFFER_17_02"); //Tarrok tr�s faible. Vite �tranger, sinon Tarrok meurt !
	AI_StopProcessInfos	(self);

	B_Story_FoundOrcSlave();
};

//---------------------------------------------------------------------
//	Info CRAWLER
//---------------------------------------------------------------------
instance Info_FreemineOrc_CRAWLER (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_CRAWLER_Condition;
	information	= Info_FreemineOrc_CRAWLER_Info;
	important	= 0;	
	permanent	= 0;
	description = "Qu'est ce que GACH LUG veut dire ?";
};                       

FUNC int Info_FreemineOrc_CRAWLER_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT)
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_01"); //Qu'est ce que GACH LUG veut dire ?
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_02"); //�tre de grands animaux, marche sur beaucoup de jambes.
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_03"); //GACH LUG dangereux ! Manger Orcs et humains !
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_04"); //Tu veux parler des Chenilles de mines du dessous !
};

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance Info_FreemineOrc_TONGUE (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TONGUE_Condition;
	information	= Info_FreemineOrc_TONGUE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Tu parles notre langue ?";
};                       

FUNC int Info_FreemineOrc_TONGUE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TONGUE_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TONGUE_15_01"); //Tu parles notre langue ?
	AI_Output			(self, hero,"Info_FreemineOrc_TONGUE_17_02"); //Tarrok esclave des humains longtemps. Tarrok bien entendre.
};

//---------------------------------------------------------------------
//	Info SEARCHPOTION - Medizin noch nicht gefunden
//---------------------------------------------------------------------
instance Info_FreemineOrc_SEARCHPOTION (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SEARCHPOTION_Condition;
	information	= Info_FreemineOrc_SEARCHPOTION_Info;
	important	= 0;	
	permanent	= 1;
	description	= "Je ne peux pas trouver la m�decine !";
};                       

FUNC int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)	
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&&	!Npc_HasItems (hero,Orcmedicine) 
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SearchPotion_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //Je ne peux pas trouver la m�decine !
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //Cherche encore �tranger ! Rem�de ici !
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //Tarrok se sauve de GACH LUG ! Tarrok cach� pour se sauver !
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //�tranger cherche niches aussi !
	 
	AI_StopProcessInfos	( self );
};
  
//---------------------------------------------------------------------
//	Info SUCHEULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_SUCHEULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SUCHEULUMULU_Condition;
	information	= Info_FreemineOrc_SUCHEULUMULU_Info;
	important	= 0;	
	permanent	= 0;
	description = "Est-ce que tu es un ami d'Ur-Shak, le chaman ?";
};                       

FUNC int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if	Npc_KnowsInfo(hero, Info_FreemineOrc_INTRO)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //Est-ce que tu es un ami d'Ur-Shak, le chaman ?
	AI_Output		(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //Ur-Shak esclave, comme Tarrok. Ur-Shak partir loin ! Beaucoup hivers pass�s !
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //ton ami m'a dit que tu me pourrais faire un Ulu-Mulu !
	if (FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //Toi aider moi, et moi aider toi !
	}
	else
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //Tarrok tr�s faible. Pas rem�de, Tarrok meurt.
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //�tranger apporte rem�de, puis Tarrok aide !
	};
};

//---------------------------------------------------------------------
//	Info GIVEPOTION
//---------------------------------------------------------------------
instance Info_FreemineOrc_GIVEPOTION (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_GIVEPOTION_Condition;
	information	= Info_FreemineOrc_GIVEPOTION_Info;
	important	= 0;	
	permanent	= 0;
	description = "Regarde, j'ai trouv� ta m�decine !";
};                       

FUNC int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)	
	&&  Npc_HasItems(hero,Orcmedicine)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_01"); //Regarde, j'ai trouv� ta m�decine !

	B_GiveInvItems      (hero, self, Orcmedicine, 1); 	
	EquipItem			(self, Orcmedicine);
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self, hero);
	};
	AI_UseItemToState	(self, Orcmedicine, 1);
	AI_UseItemToState	(self, Orcmedicine, -1);

	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_02"); //�tranger pas mauvais comme autres ! �tranger bon !
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //Tarrok dire merci � toi !
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_04"); //Peux-tu me donner un Ulu-Mulu maintenant ?
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //�tranger aider Tarrok, alors Tarrok aider �tranger aussi !
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //�tranger besoin KROTAHK, KHAZ-TAK, DWACHKARR and ORTH-ANTAK.
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //L'�tranger rapporter, alors Tarrok faire Ulu-Mulu !
	
	if	!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)
	{
		B_Story_FoundOrcSlave();
	};

	B_Story_CuredOrc	();
};


//---------------------------------------------------------------------
//	Info FIREWARAN
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_FIREWARAN_Condition;
	information	= Info_FreemineOrc_FIREWARAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Qu'est ce qu'un KROTAHK ?";
};                       

FUNC int Info_FreemineOrc_FIREWARAN_Condition()
{
	if	(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN_15_01"); //Qu'est ce qu'un KROTAHK ?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN_17_02"); //�tre langue du Feu ! �tre langue de l�zard du Feu !
	
};

//---------------------------------------------------------------------
//	Info FIREWARAN2
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_FIREWARAN2_Condition;
	information	= Info_FreemineOrc_FIREWARAN2_Info;
	important	= 0;	
	permanent	= 0;
	description = "O� puis-je trouver un l�zard de feu ?";
};                       

FUNC int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN)
	&&	!Npc_HasItems (hero,ItAt_Waran_01)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN2_15_01"); //O� puis-je trouver un l�zard de feu ?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //L�zard de feu vivre maison. Maison de Tarrok. �tranger besoin chercher !
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //En outre trouver le l�zard du Feu sur le sable pr�s de la mer.

	B_LogEntry			(CH4_UluMulu,"Tarrok a besoin de la langue d'un l�zard de feu pour l'Ulu-Mulu. Ils vivent principalement dans le secteur qui et sur des c�tes sablonneuses. Il n'y avait pas de naufrage plein de l�zards ?");
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SHADOWBEAST_Condition;
	information	= Info_FreemineOrc_SHADOWBEAST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Qu'est-ce que KHAZ-TAK veut dire ?";
};                       

FUNC int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01"); //Qu'est-ce que KHAZ-TAK veut dire ?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //�tre corne de B�te des Ombres. Corne pointue comme couteau et dure comme pierre.
	
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SHADOWBEAST2_Condition;
	information	= Info_FreemineOrc_SHADOWBEAST2_Info;
	important	= 0;	
	permanent	= 0;
	description = "O� puis-je trouver des b�tes de l'ombre ?";
};                       

FUNC int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if 	 Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST)
	&&	!Npc_HasItems (hero,ItAt_Shadow_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //O� puis-je trouver des b�tes de l'ombre ?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //Vivre en for�t ou caverne. Pas aimer lumi�re.
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //�tre tr�s dangereux. �tranger surveiller !

	B_LogEntry			(CH4_UluMulu,"Tarrok a besoin de la corne d'une b�te de l'ombre pour l'Ulu-Mulu. Ils vivent principalement dans des for�ts sombres et des cavernes. La for�t la plus grande de la colonie est entre le Vieux Camp et le Camp Mar�cageux autant que je sache.");
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SWAMPSHARK_Condition;
	information	= Info_FreemineOrc_SWAMPSHARK_Info;
	important	= 0;	
	permanent	= 0;
	description = "DWACHKARR ? Qu'est-ce que cela ?";
};                       

FUNC int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //DWACHKARR ? Qu'est-ce que cela ?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //�a �tre dents de Requin des marais. Si dents mordre, victime jamais s'�chapper.
	
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SWAMPSHARK2_Condition;
	information	= Info_FreemineOrc_SWAMPSHARK2_Info;
	important	= 0;	
	permanent	= 0;
	description = "O� puis-je trouver des requins des marais ?";
};                       

FUNC int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK)
	&&	!Npc_HasItems (hero,ItAt_Swampshark_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //O� puis-je trouver des requins des marais ?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //Beaucoup Requins des marais dans camp des humains. Parce que Camp dans marais !

	B_LogEntry			(CH4_UluMulu,"Tarrok a besoin des dents d'un requin des marais pour l'Ulu-Mulu. Il y a beaucoup de ces b�tes derri�re le camp de la Confr�rie."); 
};

//---------------------------------------------------------------------
//	Info TROLL
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TROLL_Condition;
	information	= Info_FreemineOrc_TROLL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Quel est un ORTH-ANTAK ?";
};                       

FUNC int Info_FreemineOrc_TROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TROLL_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL_15_01"); //Quel est un ORTH-ANTAK ?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL_17_02"); //�a �tre dent de grand troll ! Faire trou profond dans proie !
};

//---------------------------------------------------------------------
//	Info TROLL2
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TROLL2_Condition;
	information	= Info_FreemineOrc_TROLL2_Info;
	important	= 0;	
	permanent	= 0;
	description = "O� puis-je trouver les Trolls ?";
};                       

FUNC int Info_FreemineOrc_TROLL2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL)
	&&	!Npc_HasItems (hero,ItAt_Troll_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TROLL2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL2_15_01"); //O� puis-je trouver les Trolls ?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_02"); //Troll vivre en montagne ! Troll besoin beaucoup espace !
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_03"); //�tranger va chercher dans montagne du nord ! Mais prendre garde poing de troll !
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_04"); //Si poing frapper, �tranger tomber montagne !

	B_LogEntry			(CH4_UluMulu,"Tarrok a besoin des d�fenses d'un Troll pour l'Ulu-Mulu. Ces monstres vivent dans les montagnes du nord de la colonie, Je dois fouiller dans les ravins.");
};

//---------------------------------------------------------------------
//	Info LOOKINGULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_LOOKINGULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information	= Info_FreemineOrc_LOOKINGULUMULU_Info;
	important	= 0;	
	permanent	= 1;
	description = "Je n'ai pas encore les quatre ingr�dients.";
};                       

FUNC int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if	!Npc_HasItems(hero,ItAt_Waran_01)
	&&	Npc_HasItems (hero,ItAt_Shadow_02)
	&&	Npc_HasItems (hero,ItAt_Swampshark_02)
	&&	Npc_HasItems (hero,ItAt_Troll_02)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output 			(hero, self,"Info_FreemineOrc_LOOKINGULUMULU_15_01"); //Je n'ai pas encore les quatre ingr�dients.
	AI_Output 			(self, hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //�tranger rechercher. Tarrok attendre ici !

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info EVERYULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_EVERYULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_EVERYULUMULU_Condition;
	information	= Info_FreemineOrc_EVERYULUMULU_Info;
	important	= 0;	
	permanent	= 0;
	description = "J'ai les quatre ingr�dients pour l'Ulu-Mulu !";
};                       

FUNC int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_RUNNING)
	&&	 Npc_HasItems(hero,ItAt_Waran_01		)
	&&	 Npc_HasItems(hero,ItAt_Shadow_02		)
	&&	 Npc_HasItems(hero,ItAt_Swampshark_02	)
	&&	 Npc_HasItems(hero,ItAt_Troll_02		)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //J'ai les quatre ingr�dients pour l'Ulu-Mulu !
	AI_Output			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //�tranger doit �tre plus fort ! Donner ingr�dients ! Tarrok faire Ulu-Mulu !
	AI_Output 			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //Voila ! �tranger porter Ulu-Mulu et fier ! Tarrok dormir maintenant !
    
    CreateInvItems      (hero,  ItAt_Waran_01, 3);
	B_GiveInvItems	    (hero, self, ItAt_Waran_01, 4); //Notwendig f�r Ausschrift "4 Gegenst�nde �bergegen", wird sofort ausgeglichen
	Npc_RemoveInvItem	(hero, ItAt_Shadow_02		);
	Npc_RemoveInvItem	(hero, ItAt_Swampshark_02	);
	Npc_RemoveInvItem	(hero, ItAt_Troll_02		);
	
	Npc_RemoveInvItems	(self, ItAt_Waran_01, 4);    
	 

	B_Story_GotUluMulu	();
	
	AI_StopProcessInfos	(self);
};





