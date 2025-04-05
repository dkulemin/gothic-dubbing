// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kirgo_What(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_What_Condition;
	information		= Info_Kirgo_What_Info;
	permanent		= 0;
	description 	= "Salut ! Je suis nouveau ici.";
};                       

FUNC INT Info_Kirgo_What_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func VOID Info_Kirgo_What_Info()
{
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Salut ! Je suis nouveau ici.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Tu ne dis rien ! Parle-moi du monde ext�rieur ! Cela fait plus d'un mois que je n'ai pas de nouvelles de l'ext�rieur.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Je m'appelle Kirgo. Je combats dans l'ar�ne.
};

// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Good (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Good_Condition;
	information		= Info_Kirgo_Good_Info;
	permanent		= 0;
	description 	= "Es-tu bon ? Au combat, je veux dire ?";
};                       

FUNC INT Info_Kirgo_Good_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Good_Info()
{
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //Tu es bon?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //Au combat ? �a fait longtemps que je ne me suis pas battu, mais j'ai d�j� gagn� un combat !
};

// **************************************
//				Fordern (Vorspiel)
// **************************************

instance Info_Kirgo_Charge(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Charge_Condition;
	information		= Info_Kirgo_Charge_Info;
	permanent		= 0;
	description 	= "J'aimerai te d�fier dans un combat dans l'ar�ne !";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1))	// Kapitelfix   ***Bj�rn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //J'aimerai te d�fier dans un combat dans l'ar�ne !
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Quoi ? Mais je ne veux pas me battre. Pourquoi ne pas vider juste une bi�re ensemble en parlant du monde ext�rieur ?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"Non ! Je veux me battre. Maintenant !",Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"D'accord, donne moi une bi�re alors !",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //Non ! Je veux me battre. Maintenant !
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //Dans ce cas... Quand tu veux, je suis pr�t
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //D'accord, donne moi une bi�re alors !
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Te voici!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Merci ! J'ai peur de ne pas pouvoir te raconter grand chose sur le monde ext�rieur - ils m'ont gard� sous les verrous au fond d'un trou noir pendant presque deux mois avant de me jeter ici.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //C'est une honte... Mais peu importe... Et bien, tu as l'air toujours en forme pour quelqu'un qui a �t� enferm� pendant deux mois.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //J'ai fais aussi ce qu'il fallait pour le rester
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //Alors pourquoi d�sires-tu combattre l'un de nous ?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Je veux �tre remarqu� dans le camp !
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //Par Scatty, tu as l'intention ? Hmm, c'est un des hommes les plus influents de l'anneau ext�rieur... Tu pourrais l'impressionner si tu m'�crases...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Mais si tu veux vraiment l'impressionner, c'est Kharim que tu dois vaincre. Seulement la, j'ai bien peur qu'il soit trop fort pour toi !
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Si tu veux toujours me combattre, dis-le moi ! Mais je n'aurai aucun plaisir � te frapper de sang froid.
	
	CreateInvItem (other, ItFoBeer);
	B_GiveInvItems (other, self, ItFoBeer, 1);
	
	self.npctype = npctype_FRIEND;
	
	Info_ClearChoices	(Info_Kirgo_Charge );
};

// **************************************
//				Fordern REAL
// **************************************
	var int Kirgo_Charged;
// **************************************

instance Info_Kirgo_ChargeREAL(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_ChargeREAL_Condition;
	information		= Info_Kirgo_ChargeREAL_Info;
	permanent		= 0;
	description 	= "Combattons - es-tu pr�t ?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Bj�rn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Combattons - es-tu pr�t ?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //Suis moi!
	
	AI_StopProcessInfos	( self );
	
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_InArena_Condition;
	information		= Info_Kirgo_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kirgo_InArena_Condition()
{
	if ( (Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 1)			//Fix f�r sp�tere Kapitel ****Bj�rn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //�a va, allons-y. Et que le meilleur gagne !
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Oublions ce petit argument, d'accord ?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















