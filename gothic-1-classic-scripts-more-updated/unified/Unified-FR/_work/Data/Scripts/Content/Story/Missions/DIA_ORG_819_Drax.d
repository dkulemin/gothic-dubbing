
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Tu es en train de chasser, n'est-ce pas ?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Tu es en train de chasser, n'est-ce pas ?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Qu'est-ce que tu veux ?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //As-tu quelques conseils � me donner pour la chasse ?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Je pourrais t'enseigner certaines choses - mais tout a un prix.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Qui serait ?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Une bonne tourn�e de bi�re suffira pour commencer - apr�s nous verrons.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Voil�, prend une bi�re et parle-moi de la chasse.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Voil�, prend une bi�re et parle-moi de la chasse.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Les charognards, c'est comme cela que nous appelons les gros oiseaux, doivent �tre attaqu�s l'un apr�s l'autre. Il est facile d'en attirer un du groupe.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Si tu viens trop pr�s, ils vont s'agiter. Au bout d'un moment, ils vont foncer dans ta direction. Tu devras alors les attendre avec une arme am�lior�e.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Si tu parviens � frapper la b�te avant qu'elle ne te frappe, tu dois continuer le combat, alors tu pourras vaincre la cr�ature sans �tre bless�.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //Si elle te frappe en premier - et bien - Ne la laisse pas faire !
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Je n'ai pas de bi�re.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Alors va en chercher. Ce sera le meilleur conseil gratuit que tu obtiendras pendant longtemps. Et profite en pour rapporter un peu de minerai avec toi !
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Je peux te fournir quelques informations sur les animaux, mais elles ne seront pas gratuites !
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Le brigand Drax m'a promis de m'apprendre le d�pe�age d'animaux si je peux payer ses prix. Il chasse sur le chemin de la place du commerce au Vieux Camp.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "Peux-tu me parler d'autre chose que de la chasse ?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Peux-tu me parler d'autre chose que de la chasse ?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Bien s�r - mais �a te co�tera davantage qu'une bi�re.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Si tu sais comment, tu peux prendre les dents, les griffes et la peau des cr�atures. Il est difficile de les avoir mais elles ont de la valeur.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //Au moins chaque marchand traitera ces choses avec toi.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"Tu demandes beaucoup pour tes conseils.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Extraction de Dents (co�t : 1 point de comp�tence, 50 minerais)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Enl�vement de fourrure (co�t : 1 point de comp�tence, 100 minerais)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Enl�vement de m�choire (co�t : 1 point de comp�tence, 50 minerais)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"D�pe�age de reptile(co�t : 1 point de comp�tence, 100 minerais)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Je t'ai dit tout ce que je sais.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Tu demandes beaucoup pour tes conseils.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Probablement, mais toi tu peux gagner beaucoup de minerai avec ce savoir.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Tous les animaux que tu tues sans savoir les d�pecer se d�composeront.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //C'est une occasion gaspill�e de les d�pecer et de vendre la fourrure � un prix �lev�.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Si j'�tais toi, j'essayerais d'approfondir ce savoir le plus rapidement possible.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Comment est-ce que je peux prendre les dents ?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Apprendre : Extraction de dent", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //La chose la plus importante est de s'assurer que les dents ne se brisent pas. Pour �viter cela, mets ton couteau pr�s du centre de la dent et fait levier pour les extraire soigneusement.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //tu peux prendre les dents des loups, des ombres et des claque-macho�res.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur l'extraction de dent - loup, Chien Orc, Claque-machoire, mordeur, Chien de sang, b�te de l'ombre.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Tu dois acqu�rir plus d'exp�rience autrement ma connaissance ne te serait d'aucune utilit�.
			PrintScreen	("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Je veux voir du minerai d'abord. Comme je te l'ai dit : Tout a un prix !
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Comment est-ce que je peux d�pecer ces cr�atures ?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Apprendre : Enl�vement de la fourrure", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Il est tr�s important de les d�pecer d'arri�re en avant. Une fois que tu as le coup de main, c'est facile. Les fourrures ont une grande valeur !
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Les fourrures des loups et des ombres peuvent �tre employ�es pour faire des v�tements. En examinant la fourrure d'un animal tu�, tu sauras bient�t s'il peut �tre utilis� ou pas. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur l'enl�vement de la fourrure - loup, Chien Orc, b�te de l'ombre, troll");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Tu as besoin de plus d'exp�rience, autrement ma connaissance ne te seras d'aucune utilit�.
			PrintScreen	("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Je veux voir du minerai d'abord. Comme je te l'ai dit : Tout a un prix !
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Apprendre : Enl�vement de la m�choire", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Montre-moi comment enlever les griffes !
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //En fait c'est tr�s simple si tu sais quoi faire. Plie les griffes en avant - jamais vers l'arri�re - et tu NE DOIS PAS tirer dessus non plus !
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Des griffes peuvent �tre prises en particulier sur des l�zards. Dor�navant, tu sauras reconna�tre les cr�atures qui poss�dent des griffes � prendre.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur enl�vement de la m�choire - l�zard, Claque-machoire, Charognard, mordeur, Razeur");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Tu as besoin de plus d'exp�rience, autrement ma connaissance ne te seras d'aucune utilit�.
			PrintScreen	("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Je veux voir du minerai d'abord. Comme je te l'ai dit : Tout a un prix !
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Apprendre : D�pe�age de l�zards", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Qu'est-ce que je dois �tudier en d�pe�ant des reptiles ?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Les seuls reptiles appropri�s � cette fin sont des tapirs et des Requins des marais.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Si tu fends la peau sur les c�t�s, elle s'�pluchera toute seule. Dor�navant tu devrais pouvoir d�pecer des reptiles.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur le d�pe�age - Charognard, requin des marais");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Tu as besoin de plus d'exp�rience, autrement ma connaissance ne te seras d'aucune utilit�.
			PrintScreen	("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Je veux voir du minerai d'abord. Comme je te l'ai dit : Tout a un prix !
	};
};
