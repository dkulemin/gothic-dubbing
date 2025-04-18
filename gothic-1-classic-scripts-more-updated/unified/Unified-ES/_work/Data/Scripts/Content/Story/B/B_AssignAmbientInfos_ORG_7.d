// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_7_EXIT_Condition;
	information	= Info_Org_7_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Org_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_7_EinerVonEuchWerden_Condition;
	information	= Info_Org_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "�Qu� tengo que hacer para ingresar en el campamento?";
};                       

FUNC INT Info_Org_7_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00"); //�Qu� tengo que hacer para ingresar en el campamento?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01"); //Puedes unirte a nuestra banda. Pero antes tienes que demostrar que est�s contra G�mez.
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02"); //�C�mo lo hago?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03"); //Si estuviera en tu lugar, conseguir�a algo importante del Campamento Viejo o la Vieja Mina y se lo llevar�a a Lares.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_7_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_7_WichtigePersonen_Condition;
	information	= Info_Org_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "�Qui�n es vuestro l�der?";
};                       

FUNC INT Info_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00"); //�Qui�n es vuestro l�der?
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01"); //Lares es el jefe de la banda. La mayor�a de la gente lo acepta.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02"); //Pero no nos dice lo que tenemos que hacer.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_7_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_7_DasLager_Condition;
	information	= Info_Org_7_DasLager_Info;
	permanent	= 1;
	description = "�Qu� puedes decirme de este campamento?";
};                       

FUNC INT Info_Org_7_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_7_DasLager_15_00"); //�Qu� puedes decirme de este campamento?
	AI_Output(self,other,"Info_Org_7_DasLager_07_01"); //Es una especie de comunidad libre, si sabes a lo que me refiero. Todos hacemos lo que nos apetece, pero somos tantos que G�mez no se puede librar de nosotros con facilidad.
	AI_Output(self,other,"Info_Org_7_DasLager_07_02"); //Aunque probablemente sea eso con lo que sue�a por las noches.
	AI_Output(other,self,"Info_Org_7_DasLager_15_03"); //�Qu� relaci�n ten�is con G�mez?
	AI_Output(self,other,"Info_Org_7_DasLager_07_04"); //�Le robamos!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_7_DieLage_Condition;
	information	= Info_Org_7_DieLage_Info;
	permanent	= 1;
	description = "�Qu� sucede aqu�?";
};                       

FUNC INT Info_Org_7_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_7_DieLage_15_00"); //�Qu� sucede aqu�?
	AI_Output(self,other,"Info_Org_7_DieLage_07_01"); //No llevas aqu� mucho tiempo, �verdad?
	AI_Output(self,other,"Info_Org_7_DieLage_07_02"); //Los magos llevan a�os prepar�ndose para la explosi�n del mont�culo de mineral. Dicen que no falta mucho.
	AI_Output(self,other,"Info_Org_7_DieLage_07_03"); //Al menos eso parece, teniendo en cuenta el enorme mont�culo que han formado los raspadores.
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_7_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_7_Krautprobe_Condition;
	information	= Info_Org_7_Krautprobe_Info;
	permanent	= 1;
	description = "�Quieres un poco de hierba del pantano?";
};                       

FUNC INT Info_Org_7_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_7_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00"); //�Quieres un poco de hierba del pantano?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01"); //Te dar� 10 pepitas a cambio. Ten.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02"); //Cuando tengas que librarte de un poco m�s, p�sate por aqu�.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_7_Krautprobe_No_Joint_07_00"); //�D�nde? No veo hierba.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_7(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Org_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Org_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Org_7_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_7_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
