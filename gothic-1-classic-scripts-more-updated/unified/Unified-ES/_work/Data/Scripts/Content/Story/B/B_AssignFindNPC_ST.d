// *************************************************************************
// 									FIND NPC
// *************************************************************************

INSTANCE Info_FindNPC_ST(C_INFO)
{
	nr			= 900;
	condition	= Info_FindNPC_ST_Condition;
	information	= Info_FindNPC_ST_Info;
	permanent	= 1;
	description = "�D�nde puedo encontrar...";
};                       

FUNC INT Info_FindNPC_ST_Condition()
{
	return 1;
};

FUNC VOID Info_FindNPC_ST_Info()
{
	Info_ClearChoices(Info_FindNPC_ST);
	Info_AddChoice(Info_FindNPC_ST, DIALOG_BACK, Info_FindNPC_ST_BACK);

	VAR C_NPC CorAngar;		CorAngar = Hlp_GetNpc(Gur_1202_CorAngar);
	if (CorAngar.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_ST,"...a Cor Angar?", Info_FindNPC_ST_CorAngar);
	};

	VAR C_NPC CorKalom;		CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	if ( (CorKalom.aivar[AIV_FINDABLE] == TRUE) && (CorAngar_GotoOGY != TRUE) )
	{
		Info_AddChoice(Info_FindNPC_ST,"...a Cor Kalom?", Info_FindNPC_ST_CorKalom);
	};
	
	VAR C_NPC YBerion;		YBerion	= Hlp_GetNpc(Gur_1200_Yberion);
	if ( (YBerion.aivar[AIV_FINDABLE] == TRUE) && (Kapitel < 3) )
	{
		Info_AddChoice(Info_FindNPC_ST,"...a Y'Berion?", Info_FindNPC_ST_YBerion);
	};
};

FUNC VOID Info_FindNPC_ST_BACK()
{
	Info_ClearChoices(Info_FindNPC_ST);
};

// **********************
// 			Angar
// **********************

FUNC VOID Info_FindNPC_ST_CorAngar()
{
	AI_Output(other,self,"Info_FindNPC_ST_CorAngar_15_00"); //�D�nde puedo encontrar a Cor Angar?

	VAR C_NPC CorAngar;		CorAngar = Hlp_GetNpc(Gur_1202_CorAngar);
	
	if (Npc_GetDistToNpc(self, CorAngar) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,CorAngar);
	}
	else
	{
		if (self.guild == GIL_NOV)
		{
			if (self.voice == 2)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorAngar_02_01"); //El campo de entrenamiento de los templarios est� en el segundo nivel. Suele estar all� durante el d�a.
			}
			else if (self.voice == 3)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorAngar_03_01"); //El campo de entrenamiento de los templarios est� en el segundo nivel. Suele estar all� durante el d�a.
			}
			else if (self.voice == 5)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorAngar_05_01"); //El campo de entrenamiento de los templarios est� en el segundo nivel. Suele estar all� durante el d�a.
			};
		}
		else if (self.guild == GIL_TPL) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorAngar_08_01"); //El campo de entrenamiento de los templarios est� en el segundo nivel. Suele estar all� durante el d�a.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorAngar_13_01"); //El campo de entrenamiento de los templarios est� en el segundo nivel. Suele estar all� durante el d�a.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_ST);
};

// **********************
// 			Kalom
// **********************

FUNC VOID Info_FindNPC_ST_CorKalom()
{
	AI_Output(other,self,"Info_FindNPC_ST_CorKalom_15_00"); //�D�nde puedo encontrar a Cor Kalom?

	VAR C_NPC CorKalom;		CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	
	if (Npc_GetDistToNpc(self, CorKalom) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,CorKalom);
	}
	else
	{
		if (self.guild == GIL_NOV)
		{
			if (self.voice == 2)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorKalom_02_01"); //El laboratorio alqu�mico est� en el segundo nivel, cerca de la colina del templo. Trabaja all� d�a y noche.
			}
			else if (self.voice == 3)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorKalom_03_01"); //El laboratorio alqu�mico est� en el segundo nivel, cerca de la colina del templo. Trabaja all� d�a y noche.
			}
			else if (self.voice == 5)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorKalom_05_01"); //El laboratorio alqu�mico est� en el segundo nivel, cerca de la colina del templo. Trabaja all� d�a y noche.
			};
		}
		else if (self.guild == GIL_TPL) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorKalom_08_01"); //El laboratorio alqu�mico est� en el segundo nivel, cerca de la colina del templo. Trabaja all� d�a y noche.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_ST_CorKalom_13_01"); //El laboratorio alqu�mico est� en el segundo nivel, cerca de la colina del templo. Trabaja all� d�a y noche.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_ST);
};

// **********************
// 		Y'Berion
// **********************

FUNC VOID Info_FindNPC_ST_YBerion()
{
	AI_Output(other,self,"Info_FindNPC_ST_YBerion_15_00"); //�D�nde puedo encontrar a Y'Berion?

	VAR C_NPC YBerion;		YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	
	if (Npc_GetDistToNpc(self, YBerion) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,YBerion);
	}
	else
	{
		if (self.guild == GIL_NOV)
		{
			if (self.voice == 2)
			{
				AI_Output(self,other,"Info_FindNPC_ST_YBerion_02_01"); //El Iluminado vive aislado al abrigo de la colina del templo. S�lo sale en ocasiones se�aladas.
			}
			else if (self.voice == 3)
			{
				AI_Output(self,other,"Info_FindNPC_ST_YBerion_03_01"); //El Iluminado vive aislado al abrigo de la colina del templo. S�lo sale en ocasiones se�aladas.
			}
			else if (self.voice == 5)
			{
				AI_Output(self,other,"Info_FindNPC_ST_YBerion_05_01"); //El Iluminado vive aislado al abrigo de la colina del templo. S�lo sale en ocasiones se�aladas.
			};
		}
		else if (self.guild == GIL_TPL) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_ST_YBerion_08_01"); //El Iluminado vive aislado al abrigo de la colina del templo. S�lo sale en ocasiones se�aladas.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_ST_YBerion_13_01"); //El Iluminado vive aislado al abrigo de la colina del templo. S�lo sale en ocasiones se�aladas.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_ST);
};

// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

FUNC VOID B_AssignFindNpc_ST (VAR C_NPC slf)
{
	Info_FindNPC_ST.npc = Hlp_GetInstanceID(slf);
};
