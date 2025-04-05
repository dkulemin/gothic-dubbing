// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "Que fais-tu ici ?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Je suis un chasseur. Je gagne ma vie en vendant des peaux et des dents.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //C'est bien pay� ?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Si tu sais bien d�couper les b�tes, ouais.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Aidan, un chasseur vivant sur le chemin entre le Vieux et le Nouveau Camp , peut m'apprendre comment d�pecer des animaux.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Je veux apprendre comment d�pecer des animaux.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Je veux apprendre comment d�pecer des animaux.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //Que veux-tu savoir ?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Extraction Dents (Co�t : 1 point de comp�tence, 50 minerais)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Enl�vement Fourrures (Co�t : 1 point de comp�tence, 100 minerais)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Enl�vement Griffes (Co�t : 1 point de comp�tence, 50 minerais)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"D�pecer Reptiles (Co�t : 1 point de comp�tence, 100 minerais)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Je t'ai enseign� tout ce que je sais.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Comment est-ce que je peux prendre les dents ?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Apprendre : Extraction de dent", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //La chose la plus importante est de s'assurer que les dents ne se brisent pas. Pour �viter cela, mets ton couteau pr�s du centre de la dent et fait levier pour les extraire soigneusement.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //tu peux prendre les dents des loups, des ombres et des claque-macho�res.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur l'extraction de dents - loup, Chien Orc, claque-machoire, mordeur, chien de sang, b�te de l'ombre.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Tu as besoin de plus d'exp�rience, autrement ma connaissance ne te seras d'aucune utilit�.
			PrintScreen	("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Je veux voir un peu de minerai d'abord. Comme je le disais : Tout a son prix !
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Comment est-ce que je peux d�pecer ces cr�atures ?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Apprendre : Enl�vement de la fourrure", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Il est tr�s important de les d�pecer de l'avant vers l'arri�re. Une fois que tu as ce coup de main, ce sera facile. Les fourrures ont une grande valeur !
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Les fourrures des loups et des ombres peuvent �tre employ�es pour faire des v�tements. En examinant la fourrure d'un animal tu�, tu sauras bient�t s'il peut �tre utilis� ou pas. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur enl�vement des peaux - loup, chien Orc, b�te de l'ombre, troll");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Tu as besoin de plus d'exp�rience, autrement ma connaissance ne te seras d'aucune utilit�.
			PrintScreen	("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Je veux voir un peu de minerai d'abord. Comme je le disais : Tout a son prix !
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Apprendre : Enl�vement de la m�choire", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Montre-moi comment enlever les griffes !
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //En fait c'est tr�s simple si tu sais quoi faire. Plie les griffes en avant - jamais vers l'arri�re - et tu NE DOIS PAS tirer dessus non plus !
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Les griffes des l�zards sont particuli�rement utiles. Dor�navant, tu conna�tras quelles cr�atures ont des griffes � prendre.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur enl�vement de la m�choire - l�zard, Claque-machoire, Charognard, mordeur, Razeur");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Tu as besoin de plus d'exp�rience, autrement ma connaissance ne te seras d'aucune utilit�.
			PrintScreen	("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Je veux voir un peu de minerai d'abord. Comme je le disais : Tout a son prix !
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Apprendre : D�pe�age de l�zards", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Qu'est-ce que je dois �tudier en d�pe�ant des reptiles ?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Les seuls reptiles appropri�s � cette fin sont des tapirs et des Requins des marais.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Si tu fends la peau sur les c�t�s, elle s'�pluchera toute seule. Dor�navant tu devrais pouvoir d�pecer des reptiles.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur le d�pe�age - Charognard, requin des marais");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Tu as besoin de plus d'exp�rience, autrement ma connaissance ne te seras d'aucune utilit�.
			PrintScreen	("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Je veux voir un peu de minerai d'abord. Comme je le disais : Tout a son prix !
	};
};
