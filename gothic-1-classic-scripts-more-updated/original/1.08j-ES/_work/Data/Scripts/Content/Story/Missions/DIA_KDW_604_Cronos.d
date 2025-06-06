// ************************ EXIT **************************
instance  KDW_604_Cronos_Exit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  999;	
	condition	=  KDW_604_Cronos_Exit_Condition;
	information	=  KDW_604_Cronos_Exit_Info;
	permanent	=  1;
	important	=  0;
	description = DIALOG_ENDE;
};                       

FUNC int  KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneIceCube))
	{
	CreateInvItem (self, ItArRuneIceCube);
	};
	if (!Npc_HasItems (self,ItArRuneThunderbolt))
	{
	CreateInvItem (self, ItArRuneThunderbolt);
	};
};

/*
// *****************************************
//					Greet
// *****************************************

instance  KDW_604_Cronos_Greet (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Greet_Condition;
	information	=  KDW_604_Cronos_Greet_Info;
	permanent	=  0;
	description = "Ich gr��e dich, Magier.";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Ich gr��e dich, Magier.
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum st�rst du den H�ter des Erzes?
};
*/

// *****************************************
//					Brief
// *****************************************

instance  KDW_604_Cronos_Brief (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Brief_Condition;
	information	=  KDW_604_Cronos_Brief_Info;
	permanent	=  0;
	description = "Tengo una carta para el Gran Mago del C�rculo del Fuego.";
};                       

FUNC int  KDW_604_Cronos_Brief_Condition()
{
	if	Npc_KnowsInfo(hero, KDW_604_Cronos_Greet)
	&&	(Npc_GetTrueGuild(hero) != GIL_STT)
	&&	(Npc_GetTrueGuild(hero) != GIL_KDF)
	&&	(hero.level < 10)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Brief_Info()
{
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //Tengo una carta para el Gran Mago del C�rculo del Fuego.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //Nosotros somos los Magos del C�rculo del Agua. Los Magos del C�rculo del Fuego viven en el Campamento Viejo.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Pero no puedo entrar en el castillo. �Podr�ais ayudarme?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Bueno, a veces enviamos mensajeros a nuestros hermanos del Campamento Viejo.
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Pero s�lo confiamos tales mensajes a los hombres de Lares. Lleva mucho tiempo encarg�ndose de que nuestros mensajeros lleguen sanos y salvos.
};

// *****************************************
//					Barrier
// *****************************************

instance  KDW_604_Cronos_Barrier (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  2;	
	condition	=  KDW_604_Cronos_Barrier_Condition;
	information	=  KDW_604_Cronos_Barrier_Info;
	permanent	=  0;
	description = "Quieres destruir la Barrera... �C�mo tienes intenci�n de hacerlo?";
};                       

FUNC int  KDW_604_Cronos_Barrier_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Barrier_Info()
{
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //As� que quieres destruir la Barrera; �c�mo piensas hacerlo?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Necesitamos grandes cantidades de mineral m�gico.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Liberaremos todo su poder m�gico en un gran rito de magia y as� volaremos la Barrera.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //�Claro est� que una cantidad tan grande de mineral atraer� a un mont�n de maleantes y bandidos!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Por eso necesitamos a un hombre que defienda nuestro plan.
};

// *****************************************
//					WannaJoin
// *****************************************

instance  KDW_604_Cronos_WannaJoin (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaJoin_Condition;
	information	=  KDW_604_Cronos_WannaJoin_Info;
	permanent	=  0;
	description = "�Me gustar�a unirme a vosotros!";
};                       

FUNC int  KDW_604_Cronos_WannaJoin_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //�Me gustar�a unirme a vosotros!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Si quieres unirte a nosotros, ve a ver a Lee o a Lares.
};

// *****************************************
//					WannaMage
// *****************************************

instance  KDW_604_Cronos_WannaMage (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaMage_Condition;
	information	=  KDW_604_Cronos_WannaMage_Info;
	permanent	=  0;
	description = "�Me gustar�a convertirme en mago!";
};                       

FUNC int  KDW_604_Cronos_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //�Me gustar�a convertirme en un mago!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //No podemos permitir que nuestro conocimiento se difunda entre nuestros enemigos.
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Ni siquiera consideraremos instruirte a no ser que demuestres tu lealtad hacia nosotros.
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 2        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

// *****************************************
//					Bandit --> Messenger
// *****************************************

instance  KDW_604_Cronos_Bandit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  4;	
	condition	=  KDW_604_Cronos_Bandit_Condition;
	information	=  KDW_604_Cronos_Bandit_Info;
	permanent	=  0;
	description = "Ahora soy de los hombres de Lares. �Alg�n mensaje para los Magos del Fuego?";
};                       

FUNC int  KDW_604_Cronos_Bandit_Condition()
{
	if ( (Npc_GetTrueGuild(hero)==GIL_ORG) || (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Bandit_Info()
{
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Ya soy uno de los hombres de Lares. �Tienes alg�n mensaje que deba llevar a los Magos del Fuego?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //En efecto. Pero tendr�s que llevar la ense�a de uno de nuestros mensajeros; si no, los hombres de G�mez no te dejar�n entrar en el castillo.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Aqu� tienes la carta y la ense�a. �Ahora, date prisa!
	
	CreateInvItem (other,KdW_Amulett);
	CreateInvItem (other,Cronos_Brief);
	
	Cronos_Messenger = LOG_RUNNING;
};

// *****************************************
//					BriefBack
// *****************************************

instance  KDW_604_Cronos_BriefBack (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_BriefBack_Condition;
	information	=  KDW_604_Cronos_BriefBack_Info;
	permanent	=  0;
	description = "�He comunicado el mensaje!";
};                       

FUNC int  KDW_604_Cronos_BriefBack_Condition()
{
	if (Cronos_Messenger == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_BriefBack_Info()
{
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //�Ya he entregado el mensaje!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //�Oh, espl�ndido! Aqu� tienes una peque�a recompensa por tus esfuerzos.
	
	CreateInvItems (self,itminugget, 200);
	B_GiveInvItems (self, other, itminugget, 200);
	
	B_GiveXP(XP_CronosLetter);
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 3        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Cronos_NEWS (C_INFO)
{
	npc			= KDW_604_Cronos;
	condition	= Info_Cronos_NEWS_Condition;
	information	= Info_Cronos_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "�Tengo un mensaje importante para Saturas!";
};

FUNC INT Info_Cronos_NEWS_Condition()
{	
	if	(CorAngar_SendToNC==TRUE)
	&&	!Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_NEWS_Info()
{
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //�Tengo un mensaje importante para Saturas!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //�Qu� podr�a ser tan importante como para que nuestro l�der espiritual interrumpa sus importantes estudios?
};

//***************************************************************************
//	Info KALOM
//***************************************************************************
instance Info_Cronos_KALOM (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 10;
	condition	= Info_Cronos_KALOM_Condition;
	information	= Info_Cronos_KALOM_Info;
	permanent	= 0;
	important 	= 0;
	description = "�Cor Kalom ha abandonado la Hermandad!";
};

FUNC INT Info_Cronos_KALOM_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_KALOM_Info()
{
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //�Cor Kalorn ha abandonado la Hermandad con algunos templarios fan�ticos!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Quiere encontrar al Durmiente por su cuenta y despertarlo cueste lo que cueste.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Nunca me fi� de �l. Aunque fuera el Segundo Gur�, es vanidoso, insidioso y capaz de cualquier cosa.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //�La Hermandad estar� mejor sin �l!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Informar� a Saturas cuando tenga la oportunidad. �Ahora, m�rchate!

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Cronos_YBERION (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 20;
	condition	= Info_Cronos_YBERION_Condition;
	information	= Info_Cronos_YBERION_Info;
	permanent	= 0;
	important 	= 0;
	description = "�Y'Berion, el l�der del Campamento de la Secta, ha muerto!";
};

FUNC INT Info_Cronos_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_YBERION_Info()
{
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //�El l�der del Campamento de la Secta, Y'Berion, ha muerto!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //�QU�? �C�mo puede haber ocurrido eso?
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //La Hermandad llev� a cabo un ritual invocando a su dios.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Parece que el esfuerzo mental fue demasiado para Y'Berion.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //Es una l�stima. Y'Berion era un aliado de confianza.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Pero eso no es raz�n suficiente para interrumpir los estudios de Saturas.

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SLEEPER
//***************************************************************************
instance Info_Cronos_SLEEPER (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_SLEEPER_Condition;
	information	= Info_Cronos_SLEEPER_Info;
	permanent	= 0;
	important 	= 0;
	description = "�Los Gur�s han reconocido que est�n rezando a un archidemonio mal�fico!";
};

FUNC INT Info_Cronos_SLEEPER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_SLEEPER_Info()
{
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //�Los Gur�s se han dado cuenta de que est�n rez�ndole a un malvado archidemonio!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //�As�, de repente, han llegado a la conclusi�n de que su Durmiente es un demonio?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //Suena como si fuera otra idea enloquecida de la Hermandad, pero...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...si tuvieran raz�n... Todos en la colonia correr�amos grave peligro.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Debes informar a Saturas de inmediato. Ha de decidir qu� hacer al respecto.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //�D�nde puedo encontrar a Saturas?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Dir�gete al nivel superior. Dile a los guardias que yo te he dado permiso para pasar.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //La contrase�a es TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturas est� junto a la estrella de cinco puntas.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //Pasa all� casi todo el d�a, estudiando c�mo hacer explotar el gran mont�culo de mineral.

	B_LogEntry			(CH3_EscapePlanNC,"Cronos me ha dado permiso para visitar a Saturas en el nivel superior. Normalmente, puede encontrarse al Gran Mago del C�rculo del Agua en la estrella de cinco puntas. La contrase�a para los guardias es... Maldici�n, �cu�l era?");

	B_GiveXP			(XP_GetCronosPermission);

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info PAROLE
//***************************************************************************
instance Info_Cronos_PAROLE (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_PAROLE_Condition;
	information	= Info_Cronos_PAROLE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Dime otra vez cu�l era la contrase�a.";
};

FUNC INT Info_Cronos_PAROLE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_PAROLE_Info()
{
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //�Me puedes repetir la contrase�a?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Eres m�s despistado que mi abuelita. Es 'TETRIANDOCH.'
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Cronos_REWARD (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_REWARD_Condition;
	information	= Info_Cronos_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas dijo que me dar�as una recompensa.";
};

FUNC INT Info_Cronos_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_REWARD_Info()
{
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas me ha dicho que tienes una recompensa para m�.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Como guardi�n del mineral, quiero darte una peque�a cantidad de nuestro mineral como agradecimiento por tus grandes haza�as a favor del Campamento.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //�Espero que hagas tan buen uso de �l como nosotros!

	B_LogEntry		(CH3_BringFoci,"Cronos me ha dado una gran cantidad de mineral, que a duras penas reducir� este gigantesco mont�culo.");
	if	Npc_KnowsInfo(hero, Info_Riordian_REWARD)
	{
		Log_SetTopicStatus	(CH3_BringFoci,	LOG_SUCCESS);
	};
	
	CreateInvItems		(self, ItMiNugget,	1000);
	B_GiveInvItems (self, hero, ItMiNugget,	1000);
};
/*------------------------------------------------------------------------
//						NACH DER WEIHE							//
------------------------------------------------------------------------*/
instance KDW_604_Cronos_WELCOME (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_WELCOME_Condition;
	information		= KDW_604_Cronos_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_604_Cronos_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};
};
func void  KDW_604_Cronos_WELCOME_Info()
{
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Tu decisi�n de unirte a los Magos del Agua fue la correcta. �Bienvenido, hermano!
	AI_StopProcessInfos	( self );  
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDW_604_Cronos_MANA (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 800;
	condition		= KDW_604_Cronos_MANA_Condition;
	information		= KDW_604_Cronos_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Necesito m�s poder m�gico."; 
};

FUNC int  KDW_604_Cronos_MANA_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_MANA_Info()
{
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Necesito m�s poder m�gico.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Puedo ayudarte a incrementar tu poder. Util�zalo sabiamente.
	
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);
};  
func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices	(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};

func void KDW_604_Cronos_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Cronos_SELLSTUFF (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 900;
	condition		= KDW_604_Cronos_SELLSTUFF_Condition;
	information		= KDW_604_Cronos_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Cronos_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Quiero obtener escritos m�gicos.
	
};  
/*------------------------------------------------------------------------
						BEGR�SSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Saludos, mago."; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Saludos, Mago.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Que Adanos te bendiga. Puedo ayudarte a incrementar tus poderes m�gicos o proporcionarte algunos objetos de utilidad.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //�En qu� puedo servirte?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos vende objetos m�gicos, como RUNAS, PERGAMINOS y ANILLOS. Puedo encontrarlo noche y d�a en la rejilla que hay sobre el gran mont�culo de mineral."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos puede ayudarme a incrementar mi MANA. Puedo encontrarlo noche y d�a en la rejilla que hay sobre el gran mont�culo de mineral.");
};
