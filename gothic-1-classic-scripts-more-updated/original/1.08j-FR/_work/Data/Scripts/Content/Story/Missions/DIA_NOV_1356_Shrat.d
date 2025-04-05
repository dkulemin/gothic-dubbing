// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Shrat_Exit (C_INFO)
{
	npc			=  Nov_1356_Shrat;
	nr			=  999;
	condition	=  DIA_Shrat_Exit_Condition;
	information	=  DIA_Shrat_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Shrat_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance  DIA_Shrat_WhyHere (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_WhyHere_Condition;
	information	= DIA_Shrat_WhyHere_Info;
	permanent	= 0;
	description	= "Que fais-tu ici ?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Est-ce que je t'ai donn� l'autorisation de me parler ?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Je plaisantais ! Ces farfelus me tapent sur les nerfs, c'est pourquoi je suis ici !
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //Ne me parle pas! - 'prie pour la r�demption du Dormeur!' - 'ta mission est d'une importance capitale!'
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //C'est suffisant pour qu'un homme devienne fou - pas �tonnant qu'ils le soit tous ici.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Je suis Shrat, novice du premier rang - et c'est ce que  je serais pour toujours !
};

// **************************************************
//				Hilfe bei Join PSI ??
// **************************************************

instance DIA_Shrat_JoinPSI (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_JoinPSI_Condition;
	information	= DIA_Shrat_JoinPSI_Info;
	permanent	= 0;
	description	= "Je veux rejoindre la Confr�rie - peux-tu m'aider ?";
};                       

FUNC int DIA_Shrat_JoinPSI_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	{
		return 1;
	};
};

FUNC void DIA_Shrat_JoinPSI_Info()
{
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Je veux rejoindre la Confr�rie - peux-tu m'aider ?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Tu veux rejoindre cet endroit ? Je suis en ce moment en train de penser � la mani�re de partir loin d'ici.
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Nous pourrions parcourir la colonie. Soulager quelques numskulls de leur argent, amasser un peu de minerai - qu'en penses-tu ?
};

// **************************************************
//					Komm mit
// **************************************************

instance DIA_Shrat_ComeWithMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_ComeWithMe_Condition;
	information	= DIA_Shrat_ComeWithMe_Info;
	permanent	= 1;
	description	= "D�pla�ons nous ensemble ! Vient avec moi !";
};                       

FUNC int DIA_Shrat_ComeWithMe_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER]==FALSE) )
	{
		return 1;
	};
};

FUNC void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //D�pla�ons nous ensemble ! Vient avec moi !
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //A pr�sent voil�  ce que j'aime � entendre ! Allons-y !

	Npc_ExchangeRoutine (self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// **************************************************
//					Verlassen
// **************************************************

instance DIA_Shrat_LeaveMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 700;
	condition	= DIA_Shrat_LeaveMe_Condition;
	information	= DIA_Shrat_LeaveMe_Info;
	permanent	= 1;
	description	= "Nos chemins se s�parent ici - je continuerai tout seul.";
};                       

FUNC int DIA_Shrat_LeaveMe_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER]==TRUE)
	{
		return 1;
	};
};

FUNC void DIA_Shrat_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Nos chemins se s�parent ici - je continuerai tout seul.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Ok. Je vais retourner � ma cachette dans le marais. Prends soin de toi !

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
