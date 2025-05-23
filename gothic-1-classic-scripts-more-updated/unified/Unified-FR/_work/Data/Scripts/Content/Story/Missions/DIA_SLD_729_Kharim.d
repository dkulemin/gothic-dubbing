// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kharim_Exit (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 999;
	condition		= Info_Kharim_Exit_Condition;
	information		= Info_Kharim_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kharim_Exit_Condition()
{
	return 1;
};

func VOID Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "Je suis nouveau ici. Qui es-tu ?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Je suis nouveau ici. Qui es-tu ?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Je m'appelle Kharim ! Tu dois avoir �t� jet� ici - ou bien tu as d� avoir entendu parler de moi !
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Je suis le meilleur combattant que ce foutu camp damn� n'a jamais vu.
};

// **************************************
//				Fordern
// **************************************
	var int Kharim_Charged;
// **************************************

instance Info_Kharim_Charge(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 2;
	condition		= Info_Kharim_Charge_Condition;
	information		= Info_Kharim_Charge_Info;
	permanent		= 1;
	description 	= "Je te d�fi ! Allons dans l'ar�ne !";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Bj�rn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Je te d�fi ! Allons dans l'ar�ne !
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //TU ? ! Je t'aurai comme petit d�jeuner, gamin !
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Fais toi plaisir: fous le camp !

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Bien, bien, oublions.",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Alors ? tu n'es pas bless�, sale l�che ?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Bien, bien, oublions.
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Alors ? tu n'es pas bless�, sale l�che ?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //N'as-tu pas de meilleures id�es, gamin ?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Tu es seulement ici pour l�cher le cul de Gomez !",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"Ta m�re couche avec les moutons...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"Non, il n'y a rien � penser de toi en r�alit� .",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"Tu as des petits bras, mais j'ai tout de m�me vu ta figure immonde.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Bien, bien, oublions.",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //Ta m�re couche avec les moutons...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Ouais, je devine quoi...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Tu es seulement ici pour l�cher le cul de Gomez !
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //Quoi?! ? ! Sale vermisseau ! Tu ne connais rien de nous ! Le Nouveau camp n'a rien � voir avec toute cette merde !
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //Et ind�pendamment de �a il y a une seule raison pour laquelle je suis ici : je peux vaincre les cerveaux d'�nes b�t�s comme toi.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Ce sera un plaisir pour moi de te faire la m�me chose ! Ton destin t'attend dans l'ar�ne !
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Pense � ceci : non, il n'y a rien que je puisse penser que tu ne puisses comprendre r�ellement.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Peut-�tre que tu devrais lui donner une chance.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //D'abord j'ai voulu dire quelque chose au sujet de tes bras maigres, mais c'est alors j'ai vu ta sale gueule.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //Je pense finalement que c'est ta derni�re chance DE PERDRE  !
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 1)				// Kapitelfix ***Bj�rn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //La douleur est une question de volont� !
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Von mir aus k�nnen wir unseren Streit vergessen ...	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
