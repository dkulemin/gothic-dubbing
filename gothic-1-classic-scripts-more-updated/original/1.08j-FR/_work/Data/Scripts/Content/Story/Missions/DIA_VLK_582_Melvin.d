// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Melvin_Exit (C_INFO)
{
	npc			= Vlk_582_Melvin;
	nr			= 999;
	condition	= DIA_Melvin_Exit_Condition;
	information	= DIA_Melvin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Melvin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Melvin_Hello (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Hello_Condition;
	information		= DIA_Melvin_Hello_Info;
	permanent		= 0;
	description		= "H� ! Tu n'es pas de ce camp, n'est-ce pas ?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //H� ! Tu n'es pas de ce camp, n'est-ce pas ?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //H� bien, mintenant oui ! J'ai quitt� le Vieux Camp depuis une semaine. J'ai dit � mon ami Dusty de venir avec moi mais il est rest�.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Le mineur Melvin a rejoint la Confr�rie. Dusty est toujours dans le Vieux Camp, mais il pense aussi au d�part.");
};

// **************************************************
// 				Dusty getroffen
// **************************************************

INSTANCE DIA_Melvin_MetDusty (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_MetDusty_Condition;
	information		= DIA_Melvin_MetDusty_Info;
	permanent		= 0;
	description		= "Je connais Dusty - je lui ai parl� pendant un court instant.";
};

FUNC INT DIA_Melvin_MetDusty_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Melvin_Hello)) && (Npc_KnowsInfo(hero,DIA_Dusty_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_MetDusty_Info()
{
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Je connais Dusty - je lui ai parl� pendant un court instant.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Si tu le revois, dit-lui qu'il est idiot de rester l�-bas. C'est beaucoup mieux que d'�tre ennuy� par les gardes du Vieux Camp.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Je lui dirai si je le revois.
};


