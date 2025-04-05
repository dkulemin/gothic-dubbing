// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Tu es de la camp de la Secte, n'est-ce pas ?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Tu es de la camp de la Secte, n'est-ce pas ?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Nous l'appelons la Confr�rie.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Je m'appelle Baal Kagan. Le Dormeur soit avec toi.
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Que fais-tu ici ?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Que fais-tu ici ?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Au d�part, j'ai �t� envoy� ici pour convaincre des personnes de rejoindre notre Confr�rie.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Mais ces barbares ne sont pas int�ress�s par l'�panouissement spirituel. Ce qui fait que je me suis limit� au commerce d'Herbe de marais.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Et c'est un m�tier appr�ci� ici. Tr�s appr�ci�. J'ai de la peine � satisfaire � la demande.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Baal Kagan vend des tiges d'Herbe aux bandits et aux mercenaires du Nouveau Camp.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Montre moi tes marchandises.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Montre moi tes marchandises.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Comme tu veux.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "Pourquoi ils n'envoient pas � un homme suppl�mentaire ?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Pourquoi ils n'envoient pas � un homme suppl�mentaire ?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Baal Isidro est cens� m'aider, mais il ne fait que passer son temps � la taverne du lac et �changer son Herbe contre de l'alcool de riz.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Il est alcoolique. Je crains qu'il ne puisse plus ne m'�tre d'aucun secours
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro est assis � la taverne du lac et boit toute la journ�e.");	
	};
};

// ************************************************************
// 					Ich k�nnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Je peux t'aider � vendre ton Herbe aux gens .";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Je peux t'aider � vendre ton Herbe aux gens .
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Je ne peux confier une si grande quantit� d'Herbe qu'aux seuls membres de la Confr�rie.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Mais tu pourrais m'aider � distribuer les cadeaux.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Tout le monde n'a pas encore go�t� ma marchandise. D�s qu'ils essayeront l'Herbe, ils en voudront plus, ce qui signifie pour moi en vendre plus.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Je pensais que tu pouvais � peine accomplir ta t�che maintenant.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //On prendra soin de Baal Isidro bient�t. J'ai d�j� envoy� un message � Cor Kalom.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "Qu'est-ce que j'obtiens si je vends de l'Herbe pour toi ?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Qu'est-ce que j'obtiens si je vends de l'Herbe pour toi ?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //J'ai beaucoup de solutions pour te r�compenser.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Je peux t'offrir des parchemins, renfor�ant la puissante magie du Dormeur.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Ou je peux t'aider � rejoindre notre communaut�, si c'est ce que tu veux. J'ai de tr�s bons contacts avec Cor Kalom et Baal Tyon.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Tous les deux sont tr�s proches d'Y'B�rion, notre ma�tre.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Si tu pr�f�res je peux te payer aussi avec du simple minerai . Dans ce cas, 100 p�pites devraient �tre suffisantes pour tes efforts.
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "Bien, donne-moi l'Herbe. A qui veux-tu que je la redonne ?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Bien, donne-moi l'Herbe. A qui veux-tu que je la redonne ?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Tu es s�r de trouver quelqu'un qui te le prendra. Parle aux gens. Mais donne seulement UNE tige par personne.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //Encore une chose : si tu laisses quelqu'un prendre ton Herbe ou si tu la fumes toi-m�me, notre affaire s'arr�te.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //D'accord
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"Le novice Baal Kagan m'a donn� 10 tiges d'Herbe de Novice Vert, que je dois distribuer dans le Nouveau Camp.");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "J'ai partag� l'Herbe.";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //J'ai partag� l'Herbe.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //Les premiers nouveaux clients sont d�j� venus me voir. Tu as bien travaill�.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Que m'offres-tu comme r�compense ?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Je prend le minerai.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Aide-moi � rejoindre la Confr�rie.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Ces parchemins de sortil�ge sont tout � fait int�ressants - quel genre de sort est-ce ?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan a de nouveaux clients et j'ai ma r�compense.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Je n'ai vu encore aucun nouveau client. Distribue encore plus.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Ces parchemins de sortil�ge sont tout � fait int�ressants - quel genre de sort est-ce ?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Poing de Vent, Charme, T�l�kin�sie, Pyrokin�sie, Sommeil. Parmi ces sorts, choisis en 3.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Je prendrai les trois parchemins de sortil�ge.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Aide-moi � rejoindre la Confr�rie.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Ton souhait est modeste. Je t'aiderai, alors �coute-moi. Baal Tyon est l'un des Sages inf�rieurs - juste comme moi.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'B�rion lui a fait un de ses conseillers. Cela ne l'a pas fait de bien.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Il pense maintenant qu'il est si important qu'il parle plus � personne sauf � ses disciples.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Si tu lui donnes ceci, �a va lui d�lier la langue.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"'''Baal Kagan m'a donn� un ''''appel de r�ve'''' sp�cial pour Baal Tyon. Cela m'aidera � rejoindre la Confr�rie de la secte.'''");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Je prendrai les 100 minerais.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Tr�s bien. Ici.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Je prendrai les parchemins.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Une bonne d�cision. Choisis-en 3.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Poing du Vent",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"T�l�kin�sie",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Pyrokin�sie",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Torpeur",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Charme",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'�tait les trois. Utilise-les avec sagesse.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'�tait les trois. Utilise-les avec sagesse.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'�tait les trois. Utilise-les avec sagesse.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'�tait les trois. Utilise-les avec sagesse.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'�tait les trois. Utilise-les avec sagesse.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




