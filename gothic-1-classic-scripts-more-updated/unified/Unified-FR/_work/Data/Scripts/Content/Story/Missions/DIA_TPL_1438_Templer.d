instance  Tpl_1438_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1438_Templer;
	nr			=  999;
	condition	=  Tpl_1438_Templer_Exit_Condition;
	information	=  Tpl_1438_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1438_Templer_Exit_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //Je te verrais plus tard.
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //Puisse le Dormeur se r�veiller !
	
	AI_StopProcessInfos	( self );
};
// ***************** GELABER *****************************

instance  Tpl_1438_Templer_INFO (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_INFO_Condition;
	information		= Tpl_1438_Templer_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Que font les templiers dans la mine ?"; 
};

FUNC int  Tpl_1438_Templer_INFO_Condition()
{	
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

FUNC void  Tpl_1438_Templer_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Que font les templiers dans la mine ?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Nous chassons des Chenilles de mine. Retourne au camp, tu seras en s�ret� l� bas.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pourquoi chasses-tu les Chenilles ?"; 
};

FUNC int  Tpl_1438_Templer_WHY_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
FUNC void  Tpl_1438_Templer_WHY_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Pourquoi chasses-tu les Chenilles ?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Pour leurs mandibules inf�rieures. Elles contiennent une s�cr�tion int�ressante.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Quel genre de s�cr�tion ?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Un poison. Seulement notre Sage Cor Kalom sait brasser des potions avec.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Qui est Cor Kalom ?"; 
};

FUNC int  Tpl_1438_Templer_KALOM_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

FUNC void  Tpl_1438_Templer_KALOM_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Qui est Cor Kalom ?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Un des hommes les plus puissants de toute la Confr�rie. Il conna�t beaucoup de secrets, il peut contr�ler les autres par la pens�e !
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //A part �a, c'est un alchimiste. Il brasse des potions ainsi nous pouvons entrer en contact spirituel avec le Dormeur. Descend au camp. Nous cherchons toujours des gens !
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //J'y r�fl�chirai.
};  
//---------------------WENN DIE EIERSUCHE L�UFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je cherche le nid des Chenilles."; 
};

FUNC int  Tpl_1438_Templer_EGGSEARCH_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Je cherche le nid des Chenilles.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Va voir Gor Na Vid, Gor Na Kosh ou Gor Na Bar. Ils en savent plus que moi sur les Chenilles .

	B_LogEntry		(CH2_MCEggs,"� l'entr�e de la vielle mine, j'ai demand� � un templier le nid des Chenilles des mines. Il m'a attribu� trois autre templiers - Gor Na Vid, Gor Na Kosh et Gor Na. Ces noms de la Confr�rie me rendent fous.");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN						    //
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_ZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_ZANGEN_Condition;
	information		= Tpl_1438_Templer_ZANGEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Comment puis-je extraire les mandibules des Chenilles des mines ?"; 
};

FUNC int  Tpl_1438_Templer_ZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Comment puis-je extraire les mandibules des Chenilles des mines ?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Ce n'est pas celle facile de faire cela. Je peux t'apprendre.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN					//
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_TEACHZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_TEACHZANGEN_Condition;
	information		= Tpl_1438_Templer_TEACHZANGEN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Apprendre � extraire des mandibules (1 point de comp�tence)"; 
};

FUNC int  Tpl_1438_Templer_TEACHZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_ZANGEN))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_TEACHZANGEN_Info()
{
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Peux-tu m'apprendre comment on enl�ve les mandibules inf�rieures ?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //D'abord tu dois couper profond�ment dans la chair. Fait attention � ne pas couper la glande de la mandibule inf�rieure. Si tu le fais, la s�cr�tion s'�chappera dehors.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //�a doit �tre tr�s douloureux.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //Gagn� ! As-tu jamais rencontr� Korgur les Trois-Doigts, le chasseur de Chenille ? Oh non, cela c'�tait avant que tu ne sois arriv�. Bon, allons-y...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Coupe autour des glandes, en laissant un espace large, et puis enl�ve la chair ainsi que la mandibule inf�rieure. Si tu fais comme �a, tu n'auras aucun probl�me pour enlever les mandibules inf�rieures.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Comment extraire des mandibules - Chenilles des mines");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Apprendre : Extraire les mandibules de Chenilles des mines", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Pas assez de points de comp�tence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
