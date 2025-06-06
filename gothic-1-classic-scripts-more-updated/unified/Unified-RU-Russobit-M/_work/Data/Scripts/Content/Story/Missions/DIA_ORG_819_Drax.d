
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "�� �������, ��?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //�� �������, ��?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //�������, ��... � ��� ���� �����?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //�� ������ ���������� ���, ��� ����� ���������?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //� ���� ������� ����, �� ��� ����� ���� ����.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //� ������ ��� ����?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //��� ������ ������� ����, � ��� ���������.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "��� ���� ����. ��� �� ���������� ��� �� �����?";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //��� ���� ����. ��� �� ���������� ��� �� �����?
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); // ��� ����� �������� �������� �������. �� �������� �� ������������. ��������� �� ����� ����������. �������� ���������� �� ���� ����� ��������.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //����� �� ��������� �����, ����� �������������, � ����� ������������ �������� �� ����. ����� ������ ��������.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //������ ���� ������. ��������� �����������, � � ���� ����� ����������� ������������. ����� �� � ��������� ��� ��������.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //��, � ���� �� ������ ���� ������, �����... �� ����� ����� �� ���������.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //� ���� ��� ����.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //��� ���� ���. ��� ��� ��������� ���������� ����� �� �������. � ����� ��������� � �����, �������� ������� ����.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //� ���� ������� ���� �������, �� �� ������� ��!
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW, "��� ����� ��������� ��� ��������� ����������� ������, ���� ��� ��� ����� �� �������. ������ �� �������� ����� ������ ������� � ������ ������.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "�� ������ ������� ���� ��������� ����������� ������?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //�� ������ ������� ���� ��������� ����������� ������?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //�������, ����, �� �� ���� ��� �� ����� �� �����������.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //� ������� ����� ����� �������� �����, ����� � �����, ���� �����, ��� ��� ��������. �� �� ��� ������ �������� ���������.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //��������� ������ ������ ������ �������.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures, "�� ������� ������� �����." 				,Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures, "������ ������ (����: 1 ���� ��������, 50 ������ ����)" 		,Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "������ ���� (����: 1 ���� ��������, 100 ������ ����)"		,Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "������ ������ (����: 1 ���� ��������, 50 ������ ����)" 	,Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "����� �������� (����: 1 ���� ��������, 100 ������ ����)"	,Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //��, ���, ������ � ������ ���� �����, ��� ���� ���.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //�� ������� ������� �����.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //�������, ���� ����� - ������� ������ ���������� ����.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //���� �� �� ������, ��� ��������� ����������� ������, �� ��� ������ ����� ����� ������ ������ ��� ������.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //� �� �������� ����������� ���������� �������, ������ �� �����.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //�� ����� ����� � ���������� �� ��������� ��������� ��� ����� �������.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //��� �������� �����?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("�����: ������ ������", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //�� ������ ������� �� ���, ����� ����� �� ���������. ����� ����� ��������, ��������� ����� ������ ���, ��� �����.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //����� ������, ������� � ���������� ������� ���� �����.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"����� ������ ������: ����, ������ ������, �����, ����, ���-��������, ��������.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //�� ������ ��������� �����, ����� �� ������ �� ������� ���������.
			PrintScreen	("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //��� ������� �����? 
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("�����: ������ ����", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //����� �����, ��� �������� ����������� ���� ������� � ������. ����� ����� ������ �������, ������� ������� �� ��������� �� ��� ������.
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //�� ���� ������ � ���������� ���� ������� ������. � ��������� � ���� ������ ������ ������������, ������� �� ��� ���� ����� �� ������ ��� ���.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"����� ������ ����: ����, ������ ������, ��������, ������.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //������ ����� ������������, ����� ��������������� ���� �������.
			PrintScreen	("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("�����: ������ ������", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //����� ���� �������� �����.  
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //��� �����, ��� ������� �� ������ ������. ����� �������� ������ ������, �� ��� ���� �� �������� ��� ��������� � �� �������� �����.
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //�������, ��������� ����� ����� ������ �� � ������� �����. ������ � ���� ���� ����� ������.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"����� ������ ������: �������, �����, ����, ����, ����.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //������ ����� ������������, ����� ��������������� ���� �������.
			PrintScreen	("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("�����: ������ ���� ��������", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //��� ����� ������, ����� ������� ����� � ��������?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //��� ����� �������� �� ��� ��������, � ���� ����� � ����������.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //���� �� ��������� ����� �� �����, �� �� ������� ����� �� �����. ������ �� ������� ����� ����������� � ���� �������.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"����� ������ ���� ��������: ����, ���������.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen	("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //������� ������� ���. ��� ��������� - ����� ���� ����.
	};
};
