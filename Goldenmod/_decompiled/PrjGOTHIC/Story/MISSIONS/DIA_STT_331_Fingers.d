
instance DIA_STT_331_Fingers_Exit(C_Info)
{
	npc = STT_331_Fingers;
	nr = 999;
	condition = DIA_STT_331_Fingers_Exit_Condition;
	information = DIA_STT_331_Fingers_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

func void DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Fingers_CanTeach;

instance DIA_Fingers_BecomeShadow(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_BecomeShadow_Condition;
	information = DIA_Fingers_BecomeShadow_Info;
	permanent = 1;
	description = "� ���� ����� ���������!";
};


func int DIA_Fingers_BecomeShadow_Condition()
{
	if((Fingers_CanTeach == FALSE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_BecomeShadow_Info()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00");	//� ���� ����� ���������!
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01");	//� ��� � ����?
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
	Info_AddChoice(DIA_Fingers_BecomeShadow,DIALOG_BACK,DIA_Fingers_BecomeShadow_BACK);
	if(Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice(DIA_Fingers_BecomeShadow,"��� ����� ����-������ ���������. ",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice(DIA_Fingers_BecomeShadow,"�� ������ ��� ������?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00");	//�� ������ ��� ������?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01");	//���� �� � ����, ���...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00");	//��� ����� ����-������ ���������.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01");	//��� ������� ���� �� ���?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02");	//�����.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03");	//� ����� ����� ���� ��������.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04");	//���� ������ �������������� � ����� ������, �� ������ ���� ������� ������ - ��� ������� �����.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05");	//�������� ���� ���������� ����. ��� ����� �������, �� ������� �� �� ������ ���������.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06");	//������� ������ ���� ����� � ��������� �����.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07");	//��� �� ����������, ��� � - ������ ��� �� ���� ������ ������.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"������� ����� ������� ��������� ������ � ���������� ������.");
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};


var int Fingers_Wherecavalorn;

instance DIA_Fingers_Lehrer(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Lehrer_Condition;
	information = DIA_Fingers_Lehrer_Info;
	permanent = 1;
	description = "���� �� ������ ���� �������?";
};


func int DIA_Fingers_Lehrer_Condition()
{
	if(Fingers_CanTeach == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_Lehrer_Info()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00");	//���� �� ������ ���� �������?
	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02");	//��� ������� �� ����, ��� �� ������ ������.
	Info_ClearChoices(DIA_Fingers_Lehrer);
	Info_AddChoice(DIA_Fingers_Lehrer,DIALOG_BACK,DIA_Fingers_Lehrer_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Fingers_Lehrer_Pickpocket2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Fingers_Lehrer_Pickpocket);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),DIA_Fingers_Lehrer_Lockpick2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),DIA_Fingers_Lehrer_Lockpick);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,"� ���� ��������� ������������� ��� ����. ",DIA_Fingers_Lehrer_Schleichen);
	};
};

func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00");	//� ���� ��������� ������������� ��� ����.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01");	//����� ��� ������ ����������, ��� � - ���� �� ������ �����, ������� ����������� � ��� �������.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02");	//�� ����� ���� ���� �� �������� ��������� ��������, ���� ����� ���������� � ���������.
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00");	//��� ��������� �������� � ��������?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01");	//������ ������, �? ��� �� ��� �� ������ ��� �������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02");	//������ ����� ����� ������� �� ���, ����� �� ������� �������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03");	//� �������, ����� � ���� ����� �������� �������� � �����, �������, ��� ���� ������� ���� ������ �� �����.
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00");	//������ ��������� ��� �� ����. � ���� ����� ���������!
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01");	//����� ������������� �����, ������� ����������� ������, ����� ������� ������ ���-��� ���������. � ��� ����� ���� ��������!
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02");	//�����, � ���� ���������. ������� ���� ������������ � ����� ������������ �����, � � ������� �� ��������� ���� ���� �������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03");	//� ���������� ������������� ������ ���� ���� ������� ������, �� �������� ��� ���� ����������.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00");	//� ���� ����� ������� �����������.
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01");	//����������� ��������� ����� �� ��� ����������? �����.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02");	//� ������ �������� ���� ������, �� ����, ��� ���� �������, ��� ����� �����.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03");	//��������� ����� ���� � ��� ������, ����� ����� ����� ������ ������ ��� ����������.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04");	//������ ������� ����� ������ �� �������� ���, ��� ������� ������ �� �������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05");	//������ �� ����! �� ������� �� ������� ������� �����, ���� �� ��������� �������� �������������.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00");	//������ ���������� ��� �� ����. � ���� ����� ���������!
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01");	//�����, �� ��� ���������� ������, ����� ������� ��������� �������� ����� �������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02");	//�� �� ������ �����, ��� ����� �� ������� ���������� ���� ������ �� ������.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//������ ����.
	};
};

func void DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Fingers_Lehrer);
};


instance DIA_Fingers_WhereCavalorn(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_WhereCavalorn_Condition;
	information = DIA_Fingers_WhereCavalorn_Info;
	permanent = 0;
	description = "��� ��� ������ ���������?";
};


func int DIA_Fingers_WhereCavalorn_Condition()
{
	if(Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00");	//��� ��� ������ ���������?
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01");	//�� ���������� �� �����. �� ������� ��� �� ���� � ������ ������. � ������ �� ������� ������, ���, ��� ������� ������.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02");	//� ���� ������ ���� ������ ������ ���������. �� ����� ���.
	B_LogEntry(GE_TeacherOW,"�������� ����� ������� ���� ��������������. ��� ������ ��������� � ������� � ������ �� ������� ������.");
};


var int Fingers_Learnt;

instance DIA_Fingers_Learnt(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Learnt_Condition;
	information = DIA_Fingers_Learnt_Info;
	permanent = 1;
	description = "�� ���� ��������� �� ���� �������� ����� �����?";
};


func int DIA_Fingers_Learnt_Condition()
{
	if((Fingers_Learnt != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_Learnt_Info()
{
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00");	//�� ���� ��������� �� ���� �������� ����� �����?
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) + Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) + Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) > 0)
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01");	//��. �� ��� ������� �������� � ������� �������� ������ ����� ������.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02");	//��� ����� ������� ����. � �������� ����.
		Fingers_Learnt = LOG_SUCCESS;
		if(FWV_B == FALSE)
		{
			B_GiveXP(XP_Fingerstrain);
			B_LogEntry(CH1_JoinOC,"������� ������� ������� ���, ��� � ���������.");
			FWV_B = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03");	//��...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04");	//���� �� ��������, ��� ����-�� ������ ��� ���, �� ������ ��� ���� ����!
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05");	//��� ��� �������?
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06");	//����� ���������� ����! ����� � ���� ����� ������ ����� � ��������� ������������� ��������, � ������ � �������� � � ���� ����������, � �������� ����.
		Fingers_Learnt = LOG_RUNNING;
		if(FWV_A == FALSE)
		{
			B_LogEntry(CH1_JoinOC,"������� ���������� � ��� ������, ��� ������ � ������� ����� �� ��������� ������.");
			FWV_A = TRUE;
		};
	};
};


instance DIA_FINGERS_GILBERT(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_gilbert_condition;
	information = dia_fingers_gilbert_info;
	permanent = 0;
	description = "�� ������ ���-������ ������� ��� ���� ����?";
};


func int dia_fingers_gilbert_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert_key) && (GILBERT_OC == TRUE) && (Npc_HasItems(hero,ItKe_OB_Smith_01) == 1))
	{
		return 1;
	};
};

func void dia_fingers_gilbert_info()
{
	AI_Output(other,self,"DIA_Fingers_Gilbert_15_00");	//�� ������ ���-������ ������� ��� ���� ����?
	AI_Output(self,other,"DIA_Fingers_Gilbert_05_01");	//��. ���-�� ��� ���.
	B_GiveInvItems(other,self,ItKe_OB_Smith_01,1);
	AI_Output(self,other,"DIA_Fingers_Gilbert_05_02");	//��� ���������... ���, ����� ���������.
	AI_Output(self,other,"DIA_Fingers_Gilbert_05_03");	//���� ���� ������ � ������ ������, �������� ��������� �������. � ���� �� ��� ��� ��������...
	AI_Output(other,self,"DIA_Fingers_Gilbert_15_01");	//(����������) ����� ��������?
	AI_Output(self,other,"DIA_Fingers_Gilbert_05_04");	//������. � ����� ���� ���� ��������� �����-�� �����.
	B_GiveXP(50);
	B_GiveInvItems(self,other,ItKe_OB_Smith_01,1);
	AI_Output(other,self,"DIA_Fingers_Gilbert_15_02");	//������� �� ������.
	B_LogEntry(CH1_GILBERT,"������� ������, ��� ���� ���� ������ ������� �����-�� �����.");
};

