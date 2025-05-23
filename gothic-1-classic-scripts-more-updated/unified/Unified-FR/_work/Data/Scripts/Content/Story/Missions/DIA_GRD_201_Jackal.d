// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //Ah! Une nouvelle t�te.
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Qu'est-ce que tu veux ?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Je peux t'aider, tu es nouveau ici, et les nouveaux venus ont toujours des ennuis... Cela pourrait te sauver si tu faisais une petite aum�ne.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Juste 10 minerais, l'ami! J'ai pas d'mand� beaucoup!
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"Et si je ne paie pas ?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"Et comment je m'en sors ?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Voici 10 minerais. Et tu devras m'aider si j'ai des ennuies.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Voici 10 minerais. Et tu devras m'aider si j'ai des ennuies.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //tu peux compter sur moi si je ne suis pas loin. Tu me trouveras entre le march� et la porte sud.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Les autres secteurs appartiennent � Fletcher et Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //H�, tu essayes de tricher ! Reviens d�s que tu as le minerai !
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //Et comment je m'en sors ?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Tant que tu es dans ma zone, je te prot�gerai.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Si tu as des ennuis avec les types du Nouveau camp ou si un de la secte des farfelus te tape sur les nerfs, tu peux compter sur moi.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Si tu as des ennuis avec un des mineurs, nous aiderons celui d'entre vous qui a pay� - C'est aussi simple que �a!.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //Et si tous les deux ont pay� ?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Alors nous resterons en arri�re pour observer le spectacle. Mais cela ne se produit pas trop souvent.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //Et si je ne paie pas ?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //H� l'ami, d�tends-toi Tu es un nouveau venu - jette un coup d'oeil autour de toi. Rassemble un peu de minerai et quand tu es pr�t � payer, fais-le.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //tu peux le faire n'importe quand - mais ne compte pas sur mon aide avant d'avoir apport� ta contribution � mes d�penses - je suis s�r que tu comprendras.
	Info_AddChoice		(Info_Jackal_Hello,"On se voit plus tard.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //On se voit plus tard.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Fais juste attention � toi..
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "J'ai r�fl�chi � cette protection - Voila 10 minerais.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) )
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //J'ai r�fl�chi � cette protection - Voila 10 minerais.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Tu as fait le bon choix, l'ami. Je te prot�gerai dor�navant !
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Je ne vois pas les 10 minerais, l'ami. Reviens quand tu les auras
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "H� bien, Comment �a va ?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //H� bien, Comment �a va ?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //tu peux toujours compter sur moi, gamin !
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Tu as fais ton chemin rapidement ! Bien jou�, l'ami!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //H�, regarde �a ! C'est le tra�tre qui a chang� de camp
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Tu ne devrais pas �tre impliqu� avec ces perdants, tu as toujours �t� l'un d'entre nous !
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //H�, regarde �a ! C'est ce type du Nouveau camp, celui qui est � l'origine de tous nos ennuis !
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Si tu t'�tais montr� � un peu plus raisonnable avant, tu pourrais �tre de notre c�t� maintenant - celui des gagnants !
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Regarde moi �a: c'est le type du camp Mar�cageux.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Tu as fr�quent� ces farfelus trop longtemps, ils t'ont ramolli la cervelle !
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //L'argent que tu m'as donn� pour te prot�ger ne va plus t'aider maintenant.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Tu aurait d� me payer quand tu avais toujours de la chance.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Tu a d�pass� les bornes ! C'�tait une id�e stupide d'attaquer la mine !
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //On dirait pourtant que tu as travaill�.  Et tu ne vas pas changer �a, crois moi!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //H� les gars, laissez-le sortir ! ! !
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

