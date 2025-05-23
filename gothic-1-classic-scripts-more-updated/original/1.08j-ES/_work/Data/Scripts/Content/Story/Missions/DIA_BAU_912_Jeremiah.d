// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "�Qu� est�s haciendo?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //�Qu� est�s haciendo?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Estoy elaborando aguardiente de arroz, muchacho.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Ten, toma una botella. Pero no se lo digas a Silas.
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "�C�mo va la destiler�a?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //�C�mo va la destiler�a?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Apenas puedo aguantar el ritmo de estos tipos. �Caramba, c�mo beben!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //En realidad, es bueno que sea as�. Mientras estoy ocupado, los perros falderos del Se�or del Arroz me dejan en paz.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "�Qu� puedes decirme del Se�or del Arroz?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //�Qu� puedes decirme del Se�or del Arroz?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //�Es un maldito cerdo! Sus matones se meten con los d�biles y les obligan a trabajar en los arrozales.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //El �nico que podr�a enfrentarse a �l es Horatio. Pero evita la violencia.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //En una ocasi�n le o� decir que le encantar�a machacar la cabeza del Se�or del Arroz, pero nunca lo har�a.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //Ir�a contra sus convicciones.
};

