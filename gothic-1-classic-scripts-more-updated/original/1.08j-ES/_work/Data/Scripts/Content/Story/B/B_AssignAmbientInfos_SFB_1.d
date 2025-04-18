// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "�C�mo ingreso en la liga de raspadores?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //�C�mo ingreso en la liga de raspadores?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //�Unirte a nosotros? No te vayas a pensar que no trabajamos porque nadie nos obliga.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Si crees que podemos hacer el vago, vas listo amigo m�o.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Si a�n piensas que �ste es tu sitio, ser� mejor que hables con Swiney. Es el raspador que se tira todo el d�a fumando.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "�Qui�n est� al mando aqu�?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //�Qui�n est� al mando aqu�?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //�Al mando? Echa un vistazo a tu alrededor. No es el que se tira todo el d�a mat�ndose a trabajar para extraer mineral, eso est� claro.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "�Qu� es esto?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //�Qu� es esto?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //�Qu� crees que es? �El palacio real?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Si quieres trabajar en la Mina Libre, tendr�s que abrirte paso primero en la Hondonada para demostrar que nos eres de utilidad.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "�Qu� tal est�s?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //�C�mo te va?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //�Y t� qu� crees? Tan mal como siempre. Sin nada que comer, y con muchas cosas que hacer.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //El �nico que no est� ocupado es Swiney. Okyl lo ascendi� a portavoz de los raspadores. Ahora se pasa todo el d�a comprobando que nadie tenga ampollas en sus manos.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
