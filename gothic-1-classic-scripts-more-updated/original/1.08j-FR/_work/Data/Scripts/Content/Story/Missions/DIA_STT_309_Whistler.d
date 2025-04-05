// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "Salut ! Je suis nouveau ici !";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Salut ! Je suis nouveau ici !
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Que veux-tu de moi ?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Je veux �tre l'un de vous - je veux rejoindre le camp.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Tu cherche des personnes pour te soutenir, hein ?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Si tu veux que je dises un mot � Diego � ton sujet, tu dois me rendre un service.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "Quel genre de faveur veux-tu ?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Quel genre de faveur veux-tu ?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Je veux une des armes de Fisk. C'est un des commer�ants du march�.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Il ne me la vendrait pas. C'est un glaive avec des ornements.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Je te donnerai 100 minerai pour acqu�rir l'arme � ma place. Mais pas un mot � mon sujet.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"Bien, donne-moi les 100 p�pites de minerai. J'obtiendrai ton truc.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"N'as-tu jamais pens� que je puisse partir en courant avec le minerai... ?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"Pourquoi il ne veut plus te vendre d'arme d�sormais ?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Bien, donne-moi les 100 p�pites de minerai. J'obtiendrai ton truc.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Voil�. Reviens directement me voir !
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Whistler m'aidera si je vois Fisk au march� et que je lui ach�te une �p�e. Il m'a donn� 100 minerai.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //N'as-tu jamais pens� que je puisse partir en courant avec le minerai... ?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //N'oublie pas : La colonie est petite ! Si tu te sauves avec mon minerai, je te retrouverai !
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Pourquoi il ne veut plus te vendre d'arme d�sormais ?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Nous avons eu une petite discussion.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //Et?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //Et c'est tout ce que tu dois savoir !
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "Fisk veut 110 minerais pour son �p�e maintenant.";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk veut 110 minerais pour son �p�e maintenant.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //Et tu veux que je te donne 10 minerais maintenant...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //J'ai pens� que tu voulais avoir cette �p�e.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Voil�, prend-la, et d�p�che-toi maintenant !
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "Je ne peux pas obtenir l'�p�e - voici tes 100 minerais.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Je ne peux pas obtenir l'�p�e - voici tes 100 minerais.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Idiot ! Nous n'avons pas besoin d'idiots comme toi ici ! Fous le camp !
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Je l'ai ab�m�, Whistler n'obtiendra jamais son �p�e.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Cependant, je ne vois pas les 100 minerais - tu ferais mieux de les avoir le plus vite possible, sinon tu auras des ennuis !
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Te voici ! Tu as voulu te sauver avec mon minerai, hein ? Viens ici, fiston !
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Je l'ai ab�m�. Whistler est vraiment remont� contre moi.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "J'ai ton �p�e...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //J'ai ton �p�e...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //C'�tait pas trop dur. Quoi qu'il en soit - tu me rends un service et je te ferai une faveur.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Si Diego demande apr�s toi, je parlerai en ta faveur. Jusque-l� - amuse-toi bien !
	
	B_LogEntry (CH1_JoinOC,"Whistler �tait content quand je lui ai donn� l'�p�e qu'il voulait. Il me recommandera � Diego.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Whistler �tait content quand je lui ai donn� l'�p�e qu'il voulait. Malheureusement, il n'a rien pour moi, parce que je ne peux pas devenir une Ombre d�sormais.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "Comment �a va...";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //Comment �a va...
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Bien ! Tu m'as rendu service, je ferais de m�me. Je dirai � Diego que tu es un homme digne de confiance.
};





	
	





















