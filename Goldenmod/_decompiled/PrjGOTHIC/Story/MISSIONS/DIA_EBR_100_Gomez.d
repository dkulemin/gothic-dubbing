
instance DIA_Gomez_Exit(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 999;
	condition = DIA_Gomez_Exit_Condition;
	information = DIA_Gomez_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gomez_Exit_Condition()
{
	return 1;
};

func void DIA_Gomez_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gomez_Fault(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Fault_Condition;
	information = DIA_Gomez_Fault_Info;
	permanent = 0;
	description = "� ������, ����� ���������� ���� ������.";
};


func int DIA_Gomez_Fault_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Raven_There))
	{
		return 1;
	};
};

func void DIA_Gomez_Fault_Info()
{
	AI_Output(other,self,"DIA_Gomez_Fault_15_00");	//� ������, ����� ���������� ���� ������.
	AI_Output(self,other,"DIA_Gomez_Fault_11_01");	//�� �������� ���� � ���������, ��� � ���� ������� ����, ������?! ������!
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


var int gomez_kontakte;

instance DIA_Gomez_Hello(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Hello_Condition;
	information = DIA_Gomez_Hello_Info;
	permanent = 1;
	description = "� ������, ����� ���������� ���� ������.";
};


func int DIA_Gomez_Hello_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_There) && (gomez_kontakte < 4))
	{
		return 1;
	};
};

func void DIA_Gomez_Hello_Info()
{
	AI_Output(other,self,"DIA_Gomez_Hello_15_00");	//� ������, ����� ���������� ���� ������.
	AI_Output(self,other,"DIA_Gomez_Hello_11_01");	//� ������ �� �������, ��� ���� ������ ����� ���?
	Info_ClearChoices(DIA_Gomez_Hello);
	Info_AddChoice(DIA_Gomez_Hello,"�������, ��� �� ����������� �������� ���� ������.",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice(DIA_Gomez_Hello,"������ ���� �������.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice(DIA_Gomez_Hello,"� ���� ���� ����� �� ���� �������.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice(DIA_Gomez_Hello,"� ������ ���������.",DIA_Gomez_Hello_ThorusSays);
};

func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output(other,self,"DIA_Gomez_Hello_ThorusSays_15_00");	//� ������ ��������� �� �����������, � ����� ������, ��� � ������� �����.
	AI_Output(self,other,"DIA_Gomez_Hello_ThorusSays_11_01");	//���� �� ��� ���� �� ���, �� �� ������ �� ���� �����. �� ������� ������, ��� �� �������� �� �������.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_15_00");	//� ����� ������������� �� �������, � � ���� ���� ����� �� ���� �������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_11_01");	//��� ����� ��������� ��������. � ���, ��������, �� ������?
	Info_ClearChoices(DIA_Gomez_Hello);
	Info_AddChoice(DIA_Gomez_Hello,"��� ���� ����� ����������� ����.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice(DIA_Gomez_Hello,"��������� �������������� � ����� ������.",DIA_Gomez_Hello_Kontakte_NLHehler);
	Info_AddChoice(DIA_Gomez_Hello,"� �������.",DIA_Gomez_Hello_Kontakte_Lares);
	Info_AddChoice(DIA_Gomez_Hello,"��������� ������ � ������ ��������.",DIA_Gomez_Hello_Kontakte_Baals);
	Info_AddChoice(DIA_Gomez_Hello,"��� �����.",DIA_Gomez_Hello_Kontakte_Kalom);
	if(gomez_kontakte < 3)
	{
		Info_AddChoice(DIA_Gomez_Hello,"�'������.",DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Spinner_15_00");	//������ ���� �������, ������� ������ � ������, ��� �������� ���������� ���� ������ �� ����� ��������, ������ ���� ����� ��������� �� �����.
	AI_Output(self,other,"DIA_Gomez_Hello_Spinner_11_01");	//�� ��������� �����������, ��� ������������� ���. �� � ��� ����� �� ���� ������� �������� ��� ������ �������.
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output(other,self,"DIA_Gomez_Hello_KopfAb_15_00");	//�������, ��� �� �������� �������� ��� ������, ����� ��������, ��� � ������ ������ �������.
	AI_Output(self,other,"DIA_Gomez_Hello_KopfAb_11_01");	//�����, ��������� ��������... ��� �������.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00");	//�'������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01");	//�'������ �� ������ ������� ����� �� ����� ����� ����.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02");	//�� ������ ���. ������, �� �������, ��� � �����.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03");	//� ����� ������� ���, ��� �� �������� ���� �������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04");	//� ������ ���? � �������� ����������.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00");	//��� �����.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01");	//�?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Baals_15_00");	//��������� ������ � ������ ��������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Baals_11_01");	//�?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Lares()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_Lares_15_00");	//�����.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_Lares_11_01");	//� ���?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00");	//��������� �������������� � ����� ������.
	AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01");	//���.
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output(other,self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00");	//��� ���� ����� ����������� ����.
	if(gomez_kontakte >= 4)
	{
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01");	//�� ��� �� ����� ��� �������...
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02");	//� ���� ����� ����.
		Info_ClearChoices(DIA_Gomez_Hello);
	}
	else
	{
		AI_Output(self,other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00");	//�� ��������� ������� ���� ����? � ��� ���� �������� � ������� �������!
		Info_ClearChoices(DIA_Gomez_Hello);
	};
};


instance DIA_Gomez_Dabei(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_Dabei_Condition;
	information = DIA_Gomez_Dabei_Info;
	permanent = 0;
	description = "��� ��� �� - � � ����?";
};


func int DIA_Gomez_Dabei_Condition()
{
	if((gomez_kontakte >= 3) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Gomez_Dabei_Info()
{
	AI_Output(other,self,"DIA_Gomez_Dabei_15_00");	//��� ��� �� - � � ����?
	AI_Output(self,other,"DIA_Gomez_Dabei_11_01");	//����� ���. ������ �� ���� �� ���, �����.
	AI_Output(self,other,"DIA_Gomez_Dabei_11_02");	//����� ������ ���� � ���� ����.
	Npc_SetTrueGuild(hero,GIL_STT);
	hero.guild = GIL_STT;
	Mdl_ApplyOverlayMds(hero,"Humans_Relaxed.mds");
	Org_858_Quentin.npcType = Npctype_ROGUE;
	Org_868_Raeuber.npcType = Npctype_ROGUE;
	Org_869_Raeuber.npcType = Npctype_ROGUE;
	Org_870_Raeuber.npcType = Npctype_ROGUE;
	Org_871_Raeuber.npcType = Npctype_ROGUE;
	Org_874_Raeuber.npcType = Npctype_ROGUE;
	Org_863_Raeuber.npcType = Npctype_ROGUE;
	Org_864_Raeuber.npcType = Npctype_ROGUE;
	Org_865_Raeuber.npcType = Npctype_ROGUE;
	Org_866_Raeuber.npcType = Npctype_ROGUE;
	B_GiveXP(XP_BecomeShadow);
	B_LogEntry(CH1_JoinOC,"� ������������ ��� � ������� �� ������ � ������ ������. ������ ��� ��������� �����.");
	Log_SetTopicStatus(CH1_JoinOC,LOG_SUCCESS);
	Log_CreateTopic(CH1_JoinNC,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinNC,LOG_FAILED);
	B_LogEntry(CH1_JoinNC,"��������� � ���������� � ����� ������, ����� ������ ������ �� ��� ����!");
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_FAILED);
	B_LogEntry(CH1_JoinPsi,"� ������������ ��� ������ ������ ���������� ���� �����. �������� �������� ���-�� ���������� ��� ����.");
	if(HORATIO_LORD == TRUE)
	{
		Log_SetTopicStatus(CH1_HORATIO_OK,LOG_FAILED);
		B_LogEntry(CH1_HORATIO_OK,"������, ����� � ������������� � ������� ������, ��� �������� ������ ����� � ��� ����������� ������ �� �����.");
		HORATIO_LORD = FALSE;
		NA_GIL_SLD = FALSE;
	};
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(Org_858_Quentin,"start");
};


instance DIA_Gomez_NurSo(C_Info)
{
	npc = EBR_100_Gomez;
	nr = 1;
	condition = DIA_Gomez_NurSo_Condition;
	information = DIA_Gomez_NurSo_Info;
	permanent = 1;
	description = "� �������, ��� ����� �������� � ��������.";
};


func int DIA_Gomez_NurSo_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Gomez_NurSo_Info()
{
	AI_Output(other,self,"DIA_Gomez_NurSo_15_00");	//� ����� �������� � ��������.
	AI_Output(self,other,"DIA_Gomez_NurSo_11_00");	//������ ������. ������� �� ��������� �� ��� ��� ����������!
};


instance DIA_EBR_100_Gomez_Wait4SC(C_Info)
{
	npc = EBR_100_Gomez;
	condition = DIA_EBR_100_Gomez_Wait4SC_Condition;
	information = DIA_EBR_100_Gomez_Wait4SC_Info;
	important = 1;
	permanent = 0;
};


func int DIA_EBR_100_Gomez_Wait4SC_Condition()
{
	if(ExploreSunkenTower && Hlp_StrCmp(Npc_GetNearestWP(other),self.wp))
	{
		return TRUE;
	};
};

func void DIA_EBR_100_Gomez_Wait4SC_Info()
{
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_01");	//��� �� ���� �����?
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_02");	//�������-��! �� �� �� �� �������� � ����� ������ � ��������� �����?
	AI_Output(other,self,"DIA_EBR_100_Gomez_Wait4SC_15_03");	//����� ����� �� ������ ���������� ����. � ������ ������� �� �� ����� �������.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_04");	//������������� ����� ����� �� ����, �������, - ��� ������ ��������. �� � ����� ������� ��� ����� ���� ������� ��������� ���������� �����.
	AI_Output(self,other,"DIA_EBR_100_Gomez_Wait4SC_11_05");	//� ����� ���������� � ���, ����� ������ ���� ���� �� ������������.
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
};

