//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		Grd_213_Torwache
//	Lager:		OldCamp		
//	Durchgang:	Inneres Tor zur Burg (linke Wache)
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	N�hert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	N�hert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	N�hert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string	Grd_213_CHECKPOINT		= "OCC_GATE_INSIDE";

instance Info_Grd_213_FirstWarn (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 1;
	condition	= Info_Grd_213_FirstWarn_Condition;
	information	= Info_Grd_213_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_Grd_213_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_Grd_213_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Grd_213_FirstWarn_Info_07_01"); //TIENS LE!
	AI_Output (hero, self,"Info_Grd_213_FirstWarn_Info_15_02"); //Ca va ?
	AI_Output (self, hero,"Info_Grd_213_FirstWarn_Info_07_03"); //Tu n'as pas le droit d'entrer dans le ch�teau ! Rossez-le !

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Grd_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Grd_213_LastWarn (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 1;
	condition	= Info_Grd_213_LastWarn_Condition;
	information	= Info_Grd_213_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Grd_213_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_213_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_Grd_213_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Grd_213_LastWarn_07_01"); 		//Tu es sourd ? Un pas de plus et tu vas nourrir les vers !

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Grd_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Grd_213_Attack (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 1;
	condition	= Info_Grd_213_Attack_Condition;
	information	= Info_Grd_213_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Grd_213_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_213_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_Grd_213_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					//dem Spieler sofort wieder die Kontrolle zur�ckgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance Grd_213_Torwache_WELCOME (C_INFO)
{
	npc				= Grd_213_Torwache;
	condition		= Grd_213_Torwache_WELCOME_Condition;
	information		= Grd_213_Torwache_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_213_Torwache_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_213_Torwache_WELCOME_Info()
{
	AI_Output (self, other,"Grd_213_Torwache_WELCOME_Info_07_01"); //J'apprends que tu es l'un d'entre nous maintenant ? Pas mal pour quelqu'un qui vient d'arriver.
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Grd_213_EXIT (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 999;
	condition	= Info_Grd_213_EXIT_Condition;
	information	= Info_Grd_213_EXIT_Info;
	permanent	= 1;
	description	= DIALOG_ENDE;
};                       

FUNC INT Info_Grd_213_EXIT_Condition()
{	
	return 1;
};

FUNC VOID Info_Grd_213_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						PERM Abblitzen
// ************************************************************

INSTANCE Info_Grd_213_Abblitzen (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 1;
	condition	= Info_Grd_213_Abblitzen_Condition;
	information	= Info_Grd_213_Abblitzen_Info;
	permanent	= 1;
	description	= "Met un peu de piment dans ta vie ! Laisse quelqu'un entrer...";
};                       

FUNC INT Info_Grd_213_Abblitzen_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Grd_213_Abblitzen_Info()
{
	AI_Output (other, self,"Info_Grd_213_Abblitzen_15_00"); //Tu sais, tu devrais vraiment mettre un peu plus de piment dans ta vie. Comme par exemple laisser quelqu'un dans le ch�teau.
	AI_Output (self, other,"Info_Grd_213_Abblitzen_07_01"); //Du piment ? Ce n'est pas une mauvaise id�e - �a fait longtemps que je n'ai pas ross� quelqu'un comme toi.
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						PERM Nach FirstIn
// ************************************************************

INSTANCE Info_Grd_213_Passgate (C_INFO)
{
	npc			= Grd_213_Torwache;
	nr			= 1;
	condition	= Info_Grd_213_Passgate_Condition;
	information	= Info_Grd_213_Passgate_Info;
	permanent	= 1;
	description	= "H�, ca va ?";
};                       

FUNC INT Info_Grd_213_Passgate_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Grd_213_Passgate_Info()
{
	AI_Output (other, self,"Info_Grd_213_Passgate_15_00"); //H�, ca va ?
	AI_Output (self, other,"Info_Grd_213_Passgate_07_01"); //Ne tra�ne pas ici - entre!
	AI_StopProcessInfos	(self);
};
