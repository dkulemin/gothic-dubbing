// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalIsidro_EXIT(C_INFO)
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 999;
	condition	= DIA_BaalIsidro_EXIT_Condition;
	information	= DIA_BaalIsidro_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalIsidro_Hello(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Hello_Condition;
	information	= DIA_BaalIsidro_Hello_Info;
	permanent	= 0;
	description = "Tu ne sembles pas �tre tr�s heureux.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Tu ne sembles pas �tre tr�s heureux.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Je ne le suis pas !
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Je dois me d�barrasser d'un tas enti�re d'Herbe.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //tu es ici juste pour vendre des marchandises du Camp de la Secte ?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Oui. Mais je ne veux pas d'ennuis.
};

// ************************************************************
// 					 	TRADE
// ************************************************************

INSTANCE DIA_BaalIsidro_TRADE(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 800;
	condition	= DIA_BaalIsidro_TRADE_Condition;
	information	= DIA_BaalIsidro_TRADE_Info;
	permanent	= 1;
	description = "Montre moi ce que tu as.";
	trade 		= 1;
};                       

FUNC INT DIA_BaalIsidro_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_TRADE_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Montre moi ce que tu as.
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Ici...
};

// ************************************************************
// 					 Ich verkaufe f�r dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "Je peux te vendre l'Herbe - pour une modique somme, bien s�r.";
};                       

FUNC INT DIA_BaalIsidro_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Je peux te vendre l'Herbe - pour une modique somme, bien s�r.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //N'y pense pas - je ne suis pas aussi ivre que les autres. Tu n'as qu'� partir avec lui.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"Le novice Baal Isidro rode autour de la taverne  du lac compl�tement saoul. Il doit vendre sa part de tiges d'Herbe, mais il ne se d�brouille pas bien. Peut-�tre que je peux le convaincre de me laisser essayer, mais comment dois-je faire ?"); 
};

// ************************************************************
// 					Baal Kagan hat gepetzt
// ************************************************************

INSTANCE DIA_BaalIsidro_Problem(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Problem_Condition;
	information	= DIA_BaalIsidro_Problem_Info;
	permanent	= 0;
	description = "Tu as un probl�me. Baal Kagan t'assurera d'�tre remplac�.";
};                       

FUNC INT DIA_BaalIsidro_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Problem_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Voil� ce que je vais te dire - tu as un probl�me. Baal Kagan s'assurera que tu seras remplac�.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Quoi ? Le Dormeur ait piti� de moi ! Je dois me d�barrasser de la marchandise...
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Isidro a �t� �videmment vex� quand je lui ai parl� du plan de substitution. Mais ce n'�tait toujours pas assez pour lui.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"Les plans de Baal Kagan afin de remplacer l'alcoolique Baal Isidro l'a achev�. Je pense qu'il acceptera mon offre maintenant !");
	};	
};

// ************************************************************
// 					 Trink noch einen
// ************************************************************
	var int BaalIsidro_GotDrink;
// ************************************************************

INSTANCE DIA_BaalIsidro_Drink(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Drink_Condition;
	information	= DIA_BaalIsidro_Drink_Info;
	permanent	= 1;
	description = "Aller - je t'offre une autre boisson.";
};                       

FUNC INT DIA_BaalIsidro_Drink_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Drink_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Aller - je t'offre une autre boisson.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Merci, l'ami. Je boirai � ta sant� !

		if 		(Npc_HasItems(other,ItFoBooze))
		{
			B_GiveInvItems	(other,self,ItFoBooze,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBooze);		
		}
		else if (Npc_HasItems(other,ItFoBeer))
		{
			B_GiveInvItems	(other,self,ItFoBeer,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBeer);		
		}
		else if (Npc_HasItems(other,ItFoWine))
		{
			B_GiveInvItems	(other,self,ItFoWine,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoWine);		
		};
		
		BaalIsidro_GotDrink = TRUE;

		if	Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem)
		{
		    B_LogEntry	(CH1_DealerJob,"La derni�re petite gorg�e de mon offre g�n�reuse a noy� la derni�re particule de r�sistance de Baal Isidro. Je pense qu'il acceptera mon offre maintenant.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Baal Isidro a heureusement accept� la boisson mais il ne veut toujours pas me laisser vendre l'Herbe.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); // Quoi? O� ?
	};
};

// ************************************************************
// 					 �brleg's dir!
// ************************************************************
	var int BaalIsidro_DealerJob;
// ************************************************************

INSTANCE DIA_BaalIsidro_ThinkAgain(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_ThinkAgain_Condition;
	information	= DIA_BaalIsidro_ThinkAgain_Info;
	permanent	= 1;
	description = "Pense-y, donne-moi l'Herbe et nous partagerons le b�n�fice.";
};                       

FUNC INT DIA_BaalIsidro_ThinkAgain_Condition()
{
	if	( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob!=LOG_RUNNING)&&(BaalIsidro_DealerJob!=LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_ThinkAgain_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Pense-y, donne-moi l'Herbe et nous partagerons le b�n�fice.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //H� l'ami, je dois me d�barrasser de la marchandise. Tu n'essayerais pas de me faire passer pour un imb�cile, non ?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Je te donne ma parole.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Bon, voici la marchandise... Tu devrais en obtenir au moins 400 minerais. Cela ferait 200 pour chacun de nous. J'attendrai ici. Reviens d�s que tu auras le minerai.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Sais-tu qui en prendra le plus ici ?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Si je savais que je serais all� moi-m�me.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Je me sens bien mieux maintenant que je me suis d�barrass� de la marchandise.
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro m'a donn� les tiges d'Herbe. Si je les vends il me donnera la moiti� du b�n�fice, qui serait 200 minerai.");	
	
		//Item�bergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items �bergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Non, l'ami. Je commande...
	};
};

// ************************************************************
// 					RUNNING / SUCCESS
// ************************************************************

INSTANCE DIA_BaalIsidro_RUNNING(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_RUNNING_Condition;
	information	= DIA_BaalIsidro_RUNNING_Info;
	permanent	= 0;
	description = "J'ai vendu l'Herbe. Voici tes 200 minerais.";
};                       

FUNC INT DIA_BaalIsidro_RUNNING_Condition()
{
	if (BaalIsidro_DealerJob == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_RUNNING_Info()
{	
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //J'ai vendu l'Herbe.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //Et mes 200 minerais ?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Voici.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Bon... Maintenant je ne me soucie plus gu�re de Baal Kagan.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //C'�tait une bonne id�e de faire des affaires avec toi.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro a �t� soulag� d'obtenir ses 200 minerai.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Je ne l'ai pas sur moi.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Trouve le alors !
		AI_StopProcessInfos	(self);
	};
};

