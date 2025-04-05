// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
	npc			= Vlk_530_Guy;
	nr			= 999;
	condition	= DIA_Guy_Exit_Condition;
	information	= DIA_Guy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_Hello_Condition;
	information		= DIA_Guy_Hello_Info;
	permanent		= 0;
	description 	= "Bonjour !";
};

FUNC INT DIA_Guy_Hello_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_Hello_Info()
{
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Bonjour !
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Hmmm ? Je ne t'ai jamais vu - tu es nouveau ici, n'est-ce pas ?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Tout juste arriv�...
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //As-tu d�j� d�cid� quel camp tu veux rejoindre ?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Non, qu'en penses-tu ?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Bien, �a d�pend - chaque camp a ses avantages, je pense.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Jusqu'� ce que tu aies pris ta d�cision, tu peux rester ici - une cabane vient juste de se lib�rer.
};

// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Guy_AdOC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_AdOC_Condition;
	information		= DIA_Guy_AdOC_Info;
	permanent		= 1;
	description 	= "Quels sont les avantages du Vieux  Camp ?";
};

FUNC INT DIA_Guy_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdOC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Quels sont les avantages du Vieux  Camp ?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Si tu donnes le montant de la protection aux gardes, tu peux avoir une vie facile ici. Ils d�fendent toujours les mineurs qui ont pay�.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //En outre, c'est le seul endroit o� tu peux trouver les marchandises du monde ext�rieur bon march�. Ces choses sont inabordables dans les autres camps.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC,"Je pense que j'en ai assez entendu sur le Vieux Camp .",DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC,"Quelles marchandises sont consid�r�es comme pr�cieuses ici ?",DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC,"Et si deux personnes se battent en ayant pay� pour leur protection ?",DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Je pense que j'en ai assez entendu sur le Vieux Camp .
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //J'aime bien ici.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Quelles marchandises sont consid�r�es comme pr�cieuses ici ?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Tout vient du monde ext�rieur. Pain, fromage, lard et surtout bi�re et vin - pas des alcools de riz bon march� du Nouveau camp, mais des marchandise de premier choix.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Tu peux trouver des armes pas ch�res, seule l'armure est VRAIMENT ch�re.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Les gardes ont pris les vieilles armures des gardes de prison apr�s les avoir tu�s.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Tu peux toujours les reconna�tre par leur armure, elles sont vendues exclusivement � d'autres gardes. Tu ne pourras jamais en avoir une en tant qu'�tranger.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //Et si deux personnes se battent en ayant pay� pour leur protection ?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Les gardes ne font que surveiller - jusqu'� ce que l'un d'entre eux en tue un autre : alors ils le font dedans.
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Guy_AdNC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 3;
	condition		= DIA_Guy_AdNC_Condition;
	information		= DIA_Guy_AdNC_Info;
	permanent		= 0;
	description 		= "Quels sont les avantages du Nouveau Camp ?";
};

FUNC INT DIA_Guy_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdNC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Quels sont les avantages du Nouveau Camp ?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Si tu es pr�t � te faire �gorger pour une tranche de pain, c'est l� que tu dois aller.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Non - ce n'est pas plus dur qu'ailleurs. Mais c'est diff�rent d'ici.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Ici Gomez fait attention � ce que les choses se fassent paisiblement. Dans le Nouveau camp, il y a pas de r�gles.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Les seuls assez puissants pour avoir voix au chapitre sont les Mages de l'Eau, mais ils sont trop occup�s, ils �tudient la Barri�re toute la journ�e.
};	

// **************************************************
// 				Advantages ST
// **************************************************

INSTANCE DIA_Guy_AdST (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 4;
	condition		= DIA_Guy_AdST_Condition;
	information		= DIA_Guy_AdST_Info;
	permanent		= 0;
	description 		= "Pourquoi dois-je rejoindre la secte ?";
};

FUNC INT DIA_Guy_AdST_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdST_Info()
{
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //Pourquoi dois-je rejoindre la secte ?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //Bien, tu ferais mieux de demander � quelqu'un de la camp de la Secte.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //Il y a toujours des couples des novices dans le camp, et je suis s�r qu'ils peuvent te donner beaucoup de renseignements au sujet de la secte.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Je n'y ai jamais appartenu. Mais d'apr�s tout ce qui se dit, ils ont l'air d'�tre vraiment g�n�reux.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Aucun des trois camps ne semble avoir autant besoin de nouveaux que la camp de la Secte.
};

// **************************************************
// 				Welche H�tte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "Laquelle des cabanes puis-je prendre pour moi ?";
};

FUNC INT DIA_Guy_MyOwnHut_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_MyOwnHut_Info()
{
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Laquelle des cabanes puis-je prendre pour moi ?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //La cabane l�-bas avec le petit auvent est vide.
	AI_StopPointAt(self);
};	
