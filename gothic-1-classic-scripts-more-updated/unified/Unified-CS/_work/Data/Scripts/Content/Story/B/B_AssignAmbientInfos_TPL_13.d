// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_13_EXIT_Condition;
	information	= Info_Tpl_13_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_13_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chci se st�t templ��em jako ty.";
};                       

FUNC INT Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToOldCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00"); //Chci se st�t templ��em jako ty.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01"); //M� pon�t�, co v�echno jsem musel vytrp�t, abych sm�l slou�it mezi Sp��ov�mi vyvolen�mi jako templ��sk� str�?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02"); //Nemysli si, �e se tu bude� jen tak poflakovat a  po��vat t� nejv�t�� pocty.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03"); //Je�t� ne� se rozhodne�, m�l by ses trochu sezn�mit se Sp��ov�m u�en�m.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04"); //To zabere n�jak� �as a m�lo by to do tebe na�erpat n�jak� v�domosti.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_13_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_13_WichtigePersonen_Condition;
	information	= Info_Tpl_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01"); //Na�i Guru jsou Sp��ovi vyvolen�! Sp�� p�edur�uje n� osud a Guru jej v�t�.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_13_DasLager_Condition;
	information	= Info_Tpl_13_DasLager_Info;
	permanent	= 1;
	description = "Cht�l bych se pod�vat do Sp��ova chr�mu...";
};                       

FUNC INT Info_Tpl_13_DasLager_Condition()
{	
	if (Kapitel <= 1) 
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00"); //Cht�l bych se pod�vat do Sp��ova chr�mu...
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01"); //To je nemysliteln�! Nev�rec v Chr�mu! Dokud se nezav�e� Sp��ovi slou�it, nebude� sm�t do Chr�mu vstoupit!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_13_DieLage_Condition;
	information	= Info_Tpl_13_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Tpl_13_DieLage_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01"); //Od t� doby, co jsem se stal jedn�m z vyvolen�ch ochr�nc� v�ry, c�t�m se l�pe ne� kdykoliv p�edt�m.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02"); //To zn� honosn�...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03"); //Jsi nev�rec. Nerozum� tomu.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_13(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Tpl_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
