// *******************************
// 				EXIT
// *******************************

instance  DIA_GorNaRan_Exit (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  999;
	condition	=  DIA_GorNaRan_Exit_Condition;
	information	=  DIA_GorNaRan_Exit_Info;
	permanent	=  1;
	description = "FIN";
};                       

FUNC int  DIA_GorNaRan_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// *******************************
// 				Wache
// *******************************

instance  DIA_GorNaRan_Wache (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  1;
	condition	=  DIA_GorNaRan_Wache_Condition;
	information	=  DIA_GorNaRan_Wache_Info;
	permanent	=  1;
	description = "Que fais-tu ici ?";
};                       

FUNC int  DIA_GorNaRan_Wache_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Wache_Info()
{
	AI_Output (other, self,"DIA_GorNaRan_Wache_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_01"); //Je m'assure que les requins des marais ne s'approchent pas trop pr�s du camp.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_02"); //Si j'�tais toi, j'�viterais ces b�tes. Tu n'as aucune chance contre elles.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_03"); //Maintenant ne me d�range plus, je dois ouvrir l'�il.
	AI_StopProcessInfos	( self );
};









instance Info_TPL_1405_GorNaRan (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	condition	= Info_TPL_1405_GorNaRan_Condition;
	information	= Info_TPL_1405_GorNaRan_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_TPL_1405_GorNaRan_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};	
};

FUNC VOID Info_TPL_1405_GorNaRan_Info()
{
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_01"); //O� penses-tu que je vais ? Personne n'a le droit de passer ici !
};


// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan2 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan2_Condition;
	information	= Info_TPL_1405_GorNaRan2_Info;
	permanent	= 1;
	description = "Qu'est-ce qui se passe ici ?";
};                       

FUNC INT Info_TPL_1405_GorNaRan2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan2_Info()
{
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_02"); //Qu'est-ce qui se passe ici ?
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03"); //Tu me demandes ce qui se passe ici ? Prosterne-toi dans la poussi�re et rend hommage au Dormeur, parce qu'en ce moment pr�cis il se r�veille pour bannir tous les infid�les de ce monde.
};


// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan3 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan3_Condition;
	information	= Info_TPL_1405_GorNaRan3_Info;
	permanent	= 1;
	description = "J'ai juste voulu regarder.";
};                       

FUNC INT Info_TPL_1405_GorNaRan3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan3_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_04"); //J'ai juste voulu regarder.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_05"); //Sale vermisseau, toi et les gens de ta sorte n'ont plus rien � faire ici quand le Dormeur se r�veille ! Je vais te mettre � l'�cart.
	
	AI_StopProcessInfos	( self );
	
	Npc_SetTarget 	( self, hero );
	AI_StartState 		( self, ZS_Attack, 1 ,"" );
};



INSTANCE Info_TPL_1405_GorNaRan4 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan4_Condition;
	information	= Info_TPL_1405_GorNaRan4_Info;
	permanent	= 0;
	description = "Tu ne peux pas m'arr�ter !";
};                       

FUNC INT Info_TPL_1405_GorNaRan4_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan4_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_06"); //Tu ne peux pas m'arr�ter !
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_07"); //Quelque soit ce que tu dis, mon gar�on, pour le Dormeur !

	AI_StopProcessInfos	( self );

	Npc_SetTarget 	( self, hero );
	AI_StartState 	( self, ZS_Attack, 1 ,"" );
};
