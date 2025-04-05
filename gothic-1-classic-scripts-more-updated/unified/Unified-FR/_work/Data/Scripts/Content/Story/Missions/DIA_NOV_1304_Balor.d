// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Balor_Exit (C_INFO)
{
	npc			=  Nov_1304_Balor;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Balor_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Kraut abholen
// **************************************************
	var int Balor_BotenDay;
// **************************************************

instance  DIA_Balor_FetchWeed (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_FetchWeed_Condition;
	information	= DIA_Balor_FetchWeed_Info;
	permanent	= 0;
	description	= "Baal Orun m'a envoy�. Je dois prendre toute l'Herbe.";
};                       

FUNC int  DIA_Balor_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Baal Orun m'a envoy�. Je dois prendre toute l'Herbe.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Bon. Alors je n'ai pas besoin d'y aller moi-m�me. Voil�, prends-le.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //N'oublie pas d'aller � Viran de l'autre c�t� du marais, si tu n'a pas �t� encore l� bas.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //Autrement ton chargement pourrait bien �tre un peu petit et les gens pourraient penser que tu en as vendu une moiti�, h�, h�.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor m'a donn� la moisson d'Herbe d'aujourd'hui pour Cor Kalom.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"apr�s Balor, il y a un second groupe de ramasseurs qui travaille de l'autre c�t� du marais. Puisque l'on ne m'a pas permis de poser mes questions � Baal Orun , je dois fouiller le marais pour trouver ce second groupe, que je le veuille ou non."); 
	};
	
	Balor_BotenDay = Wld_GetDay(); 
};

// **************************************************
//				Wem verh�kern?
// **************************************************
	var int Balor_PlayerCheating;
// **************************************************

instance  DIA_Balor_SellUnder (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_SellUnder_Condition;
	information	= DIA_Balor_SellUnder_Info;
	permanent	= 0;
	description	= "A qui puis-je vendre l'Herbe ?";
};                       

FUNC int  DIA_Balor_SellUnder_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_Balor_FetchWeed)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_SellUnder_Info()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //A qui puis-je vendre l'Herbe ?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //Oh ho ! Maintenant je t'ai donn� des id�es, n'est-ce pas ?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"N'y pense pas, c'�tait juste une pens�e.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Si tu connais  quelqu'un - nous pouvons faire moiti� moiti�.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Non - dis-moi - qui ?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //N'y pense pas, c'�tait juste une pens�e.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Si tu connais  quelqu'un - nous pouvons faire moiti� moiti�.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Et bien, j'ai rencontr� quelqu'un dans le Nouveau camp, il �tait int�ress� par l'Herbe...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Mais si les Sages t'attrapent avec lui, ils te jetteront en p�ture aux Requins des marais ! Je ne sais rien, d'accord ? !
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Non - dis-moi - qui ?
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Tu as quelque chose en t�te ? Je te pr�viens : si ce truc n'arrive pas jusqu'� Cor Kalom, nous risquons vraiment d'avoir des ennuis tous les deux !
};

// **************************************************
//				Name des Dealers
// **************************************************
	var int Balor_TellsNCDealer;
// **************************************************

instance  DIA_Balor_TellDealer (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_TellDealer_Condition;
	information	= DIA_Balor_TellDealer_Info;
	permanent	= 1;
	description	= "Ok - qui est le marchand dans le Nouveau Camp ?";
};                       

FUNC int  DIA_Balor_TellDealer_Condition()
{
	if ( (Balor_PlayerCheating==TRUE) && (Balor_TellsNCDealer==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_TellDealer_Info()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Ok - qui est le marchand dans le Nouveau Camp ?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Tu penses qu'il suffit que je te donne le nom et qu'il ne te reste plus qu'une simple course � faire avec de l'Herbe - �a marche pas tout a fait comme �a !
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Je veux d'abord voir les 50 minerais comme paiement anticip�. Apr�s nous verrons.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Laisse tomber.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"50 ans d'honn�tet� - comme je te le dis.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50 ans d'honn�tet� - comme je te le dis.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Bon... �coute. Il s'appelle Cipher. Tu le trouveras probablement � la taverne du lac.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Fais attention et ne te laisse pas rouler par quelqu'un.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor a mentionn� un homme appel� Cipher, qui voudrait acheter la moisson d'Herbe. Je peux le trouver au lac du Nouveau Camp. Je vais avoir de grands ennuis avec les Sages.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher ach�te et vend toutes les marchandises au lac. Il est particuli�rement int�ress� par des livraisons principales d'Herbe.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Je ne vois pas les 50 minerais?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Laisse tomber.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Ne crois pas que tu peux simplement marcher dans le Nouveau camp et le vendre � n'importe qui ! Si tu ne connais pas le nom exact, tu ne t'en d�barrasseras jamais.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //� moins que tu n'ai laiss� un bandit te donner un grand coup dans les parties !
	Info_ClearChoices 	(DIA_Balor_TellDealer);
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Balor_RipOff (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 5;
	condition	= DIA_Balor_RipOff_Condition;
	information	= DIA_Balor_RipOff_Info;
	permanent	= 0;
	description	= "Je prend la livraison suivante pour Cor Kalom.";
};                       

FUNC int  DIA_Balor_RipOff_Condition()
{
	if ( (Balor_BotenDay<=(Wld_GetDay()-2)) && Npc_KnowsInfo(hero,DIA_Balor_FetchWeed) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_RipOff_Info()
{
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //C'est moi, je suis de retour. Je dois prendre la prochaine livraison.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //Pas de probl�me ! Pour encore le liquider au Nouveau camp ?
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Je veux voir les 50 minerais - mon avance habituelle.
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Encore toi ? Bon, alors prends-les, mais ne fais pas de b�tises, compris ?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //Je n'oserais pas.
		CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
		B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
	};
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Balor_Perm (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_Perm_Condition;
	information	= DIA_Balor_Perm_Info;
	permanent	= 1;
	description	= "Continue le boulot !";
};                       

FUNC int  DIA_Balor_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_Perm_Info()
{
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //Continue le boulot !
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //�videment, que penses-tu que je vais faire ? Jouer avec mes boules ?
};
