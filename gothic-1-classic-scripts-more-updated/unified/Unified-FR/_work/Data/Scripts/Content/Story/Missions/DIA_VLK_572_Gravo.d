// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Gravo_Exit (C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 999;
	condition		= DIA_Gravo_Exit_Condition;
	information		= DIA_Gravo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Gravo_Exit_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Hallo_Condition;
	information		= DIA_Gravo_Hallo_Info;
	permanent		= 0;
	description 	= "Comment �a va ?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Comment �a va ?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Et bien, puisque j'ai cess� de travailler � la mine, je ne peux pas vraiment me plaindre.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //Et d'o� proviens ton minerai ?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //J'aide les gens qui ont des probl�mes.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Si tu as des ennuis avec des personnes influentes ici, je peux t'aider � classer l'affaire.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpHow_Condition;
	information		= DIA_Gravo_HelpHow_Info;
	permanent		= 0;
	description 	= "Si j'ai des ennuis, TU pourras m'aider ? Comment ?";
};                       

FUNC INT DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpHow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Si j'ai des ennuis, TU pourras m'aider ? Comment ?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //Bon, suppose que tu as des ennuis avec Thorus. Tu n'as s�rement jamais eu d'ennuis avec lui, mais on ne sais jamais.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus peut devenir ent�t� - quand il s'est disput� avec toi une fois, il ne te parle plus jamais. Et c'est pas une bonne chose.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Comme tous les blancs-becs, tu d�pends de lui. Ainsi tu viens pour me voir. Je sais qu'un bon nombre de gens ici Thorus �coute.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Ils parleront pour toi, et Thorus sera de nouveau ton ami. Bien sur les gens veulent du minerai pour ce service. Ton minerai.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //Et je fais en sorte que ton minerai arrive aux bonnes personnes...

	B_LogEntry(GE_TraderOC,"Le mineur Gravo vend un genre de service sp�cial . Si j'ai des ennuis avec les gens importants dans le Camp, je peux le payer pour arranger tout �a.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //C'est juste, tu es sur sa liste noire.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Je peux lui parler. 100 minerais et je m'occupe de ton probl�me.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //H� bien, voyons voir combien tu as... Ah ! Ouais, �a devrait suffire. tu peux consid�rer l'affaire class�e.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Et ne parle de �a � personne. Fait juste comme si rien ne s'�tait pass�.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //I don't have that much.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Then I can't do anything for you - I'm sorry, boy.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //Tu appelles �a des ennuis ? Tu rigoles, j'imagine. Je crois qu'il veut te d�couper en petits morceaux, mon gar�on.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //�a ne va pas �tre donn� si je dois convaincre quelques personnes de le calmer � nouveau. �a te co�tera  au moins 500 minerais.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Voyons voir ce que nous avons l�... Tu sembles �tre un gar�on assez riche. Je prend les 500 et te d�barrasse du probl�me.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //Et souviens toi : Il ne doit jamais savoir que je m'occupe des probl�mes - alors ne parle de �a � personne, compris ?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Soviel hab' ich nicht.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Dann kann ich nichts f�r dich tun - tut mit leid, Junge.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Autant que je sache il n'a pas de probl�me avec toi - ne t'inqui�te pas.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpAngryNow_Condition;
	information		= DIA_Gravo_HelpAngryNow_Info;
	permanent		= 1;
	description 	= "Peux-tu m'aider - je pense que j'ai des ennuis.";
};                       

FUNC INT DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Peux-tu m'aider - je pense que j'ai des ennuis.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Je pense, mais je te pr�viens, mon aide co�te entre 100 et 500 minerais.
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Aide-moi avec Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Aide-moi avec Thorus.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Aide-moi avec Gomez.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Aide-moi avec Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Aide-moi avec Thorus.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Aide-moi avec Gomez.
	var C_NPC gomez; gomez = Hlp_GetNpc (Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 2;
	condition		= DIA_Gravo_Influence_Condition;
	information		= DIA_Gravo_Influence_Info;
	permanent		= 1;
	description 	= "Peux-tu me dire qui influe sur les gens ici ?";
};                       

FUNC INT DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Influence_Info()
{
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Peux tu me dire lesquels des Ombres sont les plus influents ici ?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Tu veux impressionner les bonnes personne, n'est-ce pas ?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Diego est le plus haut grad� des Ombres. Il a confiance en Fingers, Whistler et Sly.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter et Fisk vendent leurs affaires sur la place du march�. Ils ont beaucoup de clients, m�me des gardes, et �a les rend tr�s influents.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //Et puis il y a  Scatty. Il se charge de l'ar�ne, et d�termine qui se bat et tout �a. Beaucoup de gens ici lui doivent du minerai - il est tr�s important.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter et Fisk font du commerce de diverses marchandises sur la place du march�.");

	
};











