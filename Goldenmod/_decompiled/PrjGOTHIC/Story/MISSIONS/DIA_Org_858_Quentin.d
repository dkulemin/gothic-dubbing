
instance INFO_ORG_858_QUENTIN_EXIT(C_Info)
{
	npc = Org_858_Quentin;
	nr = 999;
	condition = info_org_858_quentin_exit_condition;
	information = info_org_858_quentin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_858_quentin_exit_condition()
{
	return 1;
};

func void info_org_858_quentin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_858_QUENTIN_GUARD(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_guard_condition;
	information = org_858_quentin_guard_info;
	permanent = 0;
	important = 1;
};


func int org_858_quentin_guard_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_13") && !Npc_KnowsInfo(other,org_858_quentin_gorn) && (Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_EBR))
	{
		return TRUE;
	};
};

func void org_858_quentin_guard_info()
{
	AI_Output(self,other,"Org_858_Quentin_GUARD_Info_07_00");	//�� ��� �����? � ���� ������ �� �����.
	AI_Output(other,self,"Org_858_Quentin_GUARD_Info_15_01");	//� ������ ����� �� ����...
	AI_Output(self,other,"Org_858_Quentin_GUARD_Info_07_02");	//�� ���� �� ���� ������. ��� ������ ��������.
	GQ = FALSE;
};


instance ORG_858_QUENTIN_GORN(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_gorn_condition;
	information = org_858_quentin_gorn_info;
	permanent = 0;
	important = 0;
	description = "�� ��� ����� �������?";
};


func int org_858_quentin_gorn_condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void org_858_quentin_gorn_info()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_Info_15_00");	//�� ��� ����� �������?
	if(QUENTIN_WORK == TRUE)
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_Info_07_00");	//� ������ �� ���� ������?
		AI_Output(other,self,"Org_858_Quentin_GORN_Info_15_01");	//���� ������, �� ������ ���������� ��� ������.
	}
	else
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_Info_07_01");	//��� ���� �����?
		AI_Output(other,self,"Org_858_Quentin_GORN_Info_15_02");	//� ��� ������.
	};
	AI_Output(self,other,"Org_858_Quentin_GORN_Info_07_02");	//��� ����� �������, ������� ����� ����������� ��� � ���� ��������� ������� ������.
	Info_AddChoice(org_858_quentin_gorn,"���, ��� �� ��� ����.",org_858_quentin_gorn_no);
	Info_AddChoice(org_858_quentin_gorn,"������, � ��������� ������� ��.",org_858_quentin_gorn_yes);
	Info_AddChoice(org_858_quentin_gorn,"������ �� ��� �� ������� � C����� ������?",org_858_quentin_gorn_about);
};

func void org_858_quentin_gorn_no()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_NO_15_00");	//���, ��� �� ��� ����.
	if(GQ_A == TRUE)
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_NO_07_01");	//�� ������ ������� �����. ��� ��������� ����� ����.
		Org_868_Raeuber.npcType = Npctype_ROGUE;
		Org_869_Raeuber.npcType = Npctype_ROGUE;
		Org_870_Raeuber.npcType = Npctype_ROGUE;
		Org_871_Raeuber.npcType = Npctype_ROGUE;
		Org_874_Raeuber.npcType = Npctype_ROGUE;
		Org_863_Raeuber.npcType = Npctype_ROGUE;
		Org_864_Raeuber.npcType = Npctype_ROGUE;
		Org_865_Raeuber.npcType = Npctype_ROGUE;
		Org_866_Raeuber.npcType = Npctype_ROGUE;
		Info_ClearChoices(org_858_quentin_gorn);
		AI_StopProcessInfos(self);
		Org_858_Quentin.npcType = Npctype_ROGUE;
		Npc_SetPermAttitude(self,ATT_HOSTILE);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_NO_07_02");	//�� ���� �� �����, �������?
		AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00");	//�������.
		Info_ClearChoices(org_858_quentin_gorn);
		AI_StopProcessInfos(self);
	};
	B_ExchangeRoutine(self,"start");
};

func void org_858_quentin_gorn_yes()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_YES_15_00");	//������, � ��������� ������� ��.
	if(!Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_01");	//������ �� ������� ������ � ����� ������ �� ��������� �������...
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_02");	//... ������� ���������� ����� ������������ �������...
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_03");	//... ��� ��� ����� �����...
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_04");	//... ����� ��� ���������� � ������ �����.
		AI_Output(self,other,"Org_858_Quentin_GORN_YES_07_05");	//� ���� �� ������� ���, �� � ����� � ���� ����, � �����...
		AI_Output(other,self,"DIA_Gorn_DuHehler_15_06");	//(����������) �������.
		GQ_OK = TRUE;
		Log_CreateTopic(CH1_GQW,LOG_MISSION);
		Log_SetTopicStatus(CH1_GQW,LOG_RUNNING);
		B_LogEntry(CH1_GQW,"������� ����� ���� ��� ������ �� ������ �������. � ������ ������, ������� ���������� ����� ������������ ������� � �������� ��� ������ �����, ��� ��� ����� ����� � ����� ��� ���������� � ������ �����.");
	};
	Info_ClearChoices(org_858_quentin_gorn);
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(self,"start");
};

func void org_858_quentin_gorn_about()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_ABOUT_15_00");	//������ �� ��� �� ������� � C����� ������?
	AI_Output(self,other,"Org_858_Quentin_GORN_ABOUT_07_01");	//�������, ����� �� ������ �� ������� ������ �� �����, ���� �� ���������� ������ ��� ����.
	AI_Output(self,other,"Org_858_Quentin_GORN_ABOUT_07_02");	//� ��������� � ���� �� ����, �� ���� �� ��������� �����������, �� ����� �� ������� ������ � ��� ���������.
	AI_Output(self,other,"Org_858_Quentin_GORN_ABOUT_07_03");	//������ � ������� �������� ���� ������ � ���� ������������.
	GQ_A = TRUE;
};


instance ORG_858_QUENTIN_GORN_OK(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_gorn_ok_condition;
	information = org_858_quentin_gorn_ok_info;
	permanent = 0;
	important = 0;
	description = "� �������� �������.";
};


func int org_858_quentin_gorn_ok_condition()
{
	if((GQ_OK == TRUE) && Npc_KnowsInfo(hero,info_kirgo_quentin) && Npc_KnowsInfo(hero,stt_311_fisk_quentin) && Npc_KnowsInfo(hero,dia_grim_quentin))
	{
		return TRUE;
	};
};

func void org_858_quentin_gorn_ok_info()
{
	AI_Output(other,self,"Org_858_Quentin_GORN_OK_Info_15_00");	//� �������� �������.
	if((Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_EBR))
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_00");	//� �� ���� ������� ��� � ������ �� ������� ������.
		Log_SetTopicStatus(CH1_GQW,LOG_FAILED);
		B_LogEntry(CH1_GQW,"�������� ���� �� �������� ��, ��� ������ � ���������� � ������� ������. ������, � ������� ��� ������.");
		B_GiveXP(100);
		AI_StopProcessInfos(self);
	}
	else if(Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_01");	//�� ��� ��������� � ��� ����� ������.
		Log_SetTopicStatus(CH1_GQW,LOG_FAILED);
		B_LogEntry(CH1_GQW,"������� ��� ����� ��������� ������.");
	}
	else
	{
		if(Npc_KnowsInfo(hero,grd_233_bloodwyn_quentin) || Npc_KnowsInfo(hero,dia_dexter_quentin) || Npc_KnowsInfo(hero,dia_vlk_520_quentin))
		{
			AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_02");	//�� � ��������� �������� ������������ ����������.
			AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_03");	//�������, ��� �� ��� �� �����.
		};
		AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_04");	//� ��� �� �����?
		AI_Output(other,self,"Org_858_Quentin_GORN_OK_Info_15_02");	//������� ���������� ����� ���� ����� ����, ��� �� ������� ������ ������� ������.
		AI_Output(other,self,"Org_858_Quentin_GORN_OK_Info_15_03");	//��� ��� ������ ����� ������������ 5, ��� 7 ����������.
		if(!Npc_KnowsInfo(hero,stt_301_ian_getlist))
		{
			AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_05");	//�� ��� �� �������� ������? ���� �� �� �����, ���� �� �� ���� ��� ������ � ������� ������ � ����� ������.
		};
		AI_Output(self,other,"Org_858_Quentin_GORN_OK_Info_07_06");	//�����, �� ��������� 300 ������ ����.
		Log_SetTopicStatus(CH1_GQW,LOG_SUCCESS);
		if(Npc_KnowsInfo(hero,stt_301_ian_getlist))
		{
			B_LogEntry(CH1_GQW,"������� ������� ������� ���������� �����������.");
			B_GiveXP(500);
		}
		else
		{
			B_LogEntry(CH1_GQW,"������� ������� ������� ���������� �����������. �� ��������� ��� ������� ������ � ��� � ������� ��� � ������ � ����� ������.");
			B_GiveXP(300);
		};
		B_GiveInvItems(self,hero,ItMiNugget,300);
	};
};


instance ORG_858_QUENTIN_QT_OK(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_qt_ok_condition;
	information = org_858_quentin_qt_ok_info;
	permanent = 0;
	important = 0;
	description = "��������� ������� ���������, �� ������ ������� �����.";
};


func int org_858_quentin_qt_ok_condition()
{
	if((BDT_QT == TRUE) && (QUENTIN_COUNT >= 4))
	{
		return TRUE;
	};
};

func void org_858_quentin_qt_ok_info()
{
	AI_Output(other,self,"Org_858_Quentin_QT_OK_15_00");	//��������� ������� ��������� ���, ��� �� ������ ���� ������� �����.
	AI_Output(self,other,"Org_858_Quentin_QT_OK_07_00");	//� ���-�� ��� ��� ��������?
	AI_Output(other,self,"Org_858_Quentin_QT_OK_15_01");	//�������� ������ ������.
	AI_Output(self,other,"Org_858_Quentin_QT_OK_07_01");	//�� ���� ���������������... ��... �� ������, � ���� ����� ����� �������������.
	AI_Output(other,self,"Org_858_Quentin_QT_OK_15_02");	//(���������) ������.
	AI_Output(self,other,"Org_858_Quentin_QT_OK_07_02");	//����� �� ����� ���� ������, ��� ����� ��������� ����.
	B_LogEntry(CH1_BDT,"������� ���������� ����� ������ ����� ����������� ������.");
	BDT_QT = FALSE;
	QUENTIN_COUNT = 0;
};


instance ORG_858_QUENTIN_BULLIT(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_bullit_condition;
	information = org_858_quentin_bullit_info;
	permanent = 0;
	important = 1;
};


func int org_858_quentin_bullit_condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void org_858_quentin_bullit_info()
{
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_00");	//��, � ���� ���� ��� ���� �������� ������!
	AI_Output(other,self,"Org_858_Quentin_BULLIT_15_00");	//� ��� �� ������ ��� ����������?
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_01");	//���� �������. � � ���� ����� ����� ��������������� �����.
	AI_Output(other,self,"Org_858_Quentin_BULLIT_15_01");	//��� �����? � �������������. � ���� � ��� ������ �����.
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_02");	//� ���� ���� ����� �� �������, � ������� ����� ������ �������.
	AI_Output(other,self,"Org_858_Quentin_BULLIT_15_02");	//�������. � ��� � ������ �� ���?
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_03");	//�� �������� 5000 ������ ���� � ������ �������������� ������������ ���������.
	AI_Output(other,self,"Org_858_Quentin_BULLIT_15_03");	//����, ���� ���������� ���������.
	AI_Output(self,other,"Org_858_Quentin_BULLIT_07_04");	//�� ����� ����� �������, ���.
	Log_CreateTopic(CH3_BULLIT,LOG_MISSION);
	Log_SetTopicStatus(CH3_BULLIT,LOG_RUNNING);
	B_LogEntry(CH3_BULLIT,"������� ��� ��� ������� ����� ������� � ������� ��� ������.");
};


instance ORG_858_QUENTIN_BULLIT_KILLED(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_bullit_killed_condition;
	information = org_858_quentin_bullit_killed_info;
	permanent = 0;
	important = 0;
	description = "� ���� ���.";
};


func int org_858_quentin_bullit_killed_condition()
{
	var C_Npc Bullit;
	Bullit = Hlp_GetNpc(GRD_203_Bullit);
	if((Kapitel >= 3) && Npc_IsDead(Bullit))
	{
		return TRUE;
	};
};

func void org_858_quentin_bullit_killed_info()
{
	AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_00");	//� ���� ���.
	if(Kapitel == 3)
	{
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_00");	//�� ����� ������?
		if(((Npc_HasItems(hero,itwr_old_fire_letter_01) == 1) || (Npc_HasItems(hero,itwr_old_fire_letter_02) == 1)) && (Npc_HasItems(hero,itwr_list_fire_letter) == 1) && (Npc_HasItems(hero,itwr_raven_fire_letter) == 1))
		{
			AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//��.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_01");	//�-�-�! ��! � �����! �������� �����. �� � ����� ��� �������, ��� �� ���!
			AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_02");	//��� ��, ��� �� ������?!
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_02");	//�� �������, ����� ��� ������ ��� �������!
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_03");	//���, �����.
			if(Npc_HasItems(hero,itwr_old_fire_letter_01) == 1)
			{
				B_GiveInvItems(other,self,itwr_old_fire_letter_01,1);
			}
			else
			{
				B_GiveInvItems(other,self,itwr_old_fire_letter_02,1);
			};
			B_GiveInvItems(other,self,itwr_list_fire_letter,1);
			B_GiveInvItems(other,self,itwr_raven_fire_letter,1);
			B_GiveInvItems(self,other,ItMiNugget,5000);
			B_GiveInvItems(self,other,grd_armor_i,1);
			B_GiveInvItems(self,other,ItMw_2H_Sword_Light_01,1);
			B_GiveInvItems(self,other,ItRw_Crossbow_02,1);
			B_GiveXP(3500);
			Log_SetTopicStatus(CH3_BULLIT,LOG_SUCCESS);
			B_LogEntry(CH3_BULLIT,"� �������� �������. ������� ��� ����� �������.");
			AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_03");	//������ ����.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_04");	//�� ��, ����� �� ����!
			CreateInvItems(self,ItFoWine,2);
			B_GiveInvItems(self,other,ItFoWine,1);
			AI_UseItem(self,ItFoWine);
			AI_UseItem(other,ItFoWine);
			AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_04");	//������� ����.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_05");	//�����. ������. �� ���� �������� �����.
			AI_Output(other,self,"VLK_585_Aleph_Exit_Info_15_01");	//�����.
			QUENTIN_OK = TRUE;
		}
		else
		{
			AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//���.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_06");	//����� ��� ��.
			AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_07");	//���� ��������� ��������� ���� ������, ��� ��������� ������� ��� ������.
			BULLIT_LATER = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_08");	//������ ������� ������ ������ �� ������������ ������� ��������.
		Log_SetTopicStatus(CH3_BULLIT,LOG_FAILED);
		B_LogEntry(CH3_BULLIT,"�������� ������ �� ����� ��� ������.");
	};
};


instance ORG_858_QUENTIN_BULLIT_LATER(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = org_858_quentin_bullit_later_condition;
	information = org_858_quentin_bullit_later_info;
	permanent = 0;
	important = 0;
	description = "� ������ ������.";
};


func int org_858_quentin_bullit_later_condition()
{
	var C_Npc Bullit;
	Bullit = Hlp_GetNpc(GRD_203_Bullit);
	if((BULLIT_LATER == TRUE) && ((Npc_HasItems(hero,itwr_old_fire_letter_01) == 1) || (Npc_HasItems(hero,itwr_old_fire_letter_02) == 1)) && (Npc_HasItems(hero,itwr_list_fire_letter) == 1) && (Npc_HasItems(hero,itwr_raven_fire_letter) == 1))
	{
		return TRUE;
	};
};

func void org_858_quentin_bullit_later_info()
{
	AI_Output(other,self,"Org_858_Quentin_BULLIT_LATER_15_00");	//� ������ ������.
	if(Kapitel == 3)
	{
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_01");	//�-�-�! ��! � �����! �������� �����. �� � ����� ��� �������, ��� �� ���!
		AI_Output(other,self,"Org_858_Quentin_BULLIT_KILLED_15_02");	//��� ��, ��� �� ������?!
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_02");	//�� �������, ����� ��� ������ ��� �������!
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_03");	//���, �����.
		if(Npc_HasItems(hero,itwr_old_fire_letter_01) == 1)
		{
			B_GiveInvItems(other,self,itwr_old_fire_letter_01,1);
		}
		else
		{
			B_GiveInvItems(other,self,itwr_old_fire_letter_02,1);
		};
		B_GiveInvItems(other,self,itwr_list_fire_letter,1);
		B_GiveInvItems(other,self,itwr_raven_fire_letter,1);
		B_GiveInvItems(self,other,ItMiNugget,5000);
		B_GiveInvItems(self,other,grd_armor_i,1);
		B_GiveInvItems(self,other,ItMw_2H_Sword_Light_01,1);
		B_GiveInvItems(self,other,ItRw_Crossbow_02,1);
		B_GiveXP(3500);
		Log_SetTopicStatus(CH3_BULLIT,LOG_SUCCESS);
		B_LogEntry(CH3_BULLIT,"� �������� �������. ������� ��� ����� �������.");
		BULLIT_LATER = FALSE;
		QUENTIN_OK = TRUE;
	}
	else
	{
		AI_Output(self,other,"Org_858_Quentin_BULLIT_KILLED_07_08");	//������ ������� ������ ������ �� ������������ ������� ��������.
		Log_SetTopicStatus(CH3_BULLIT,LOG_FAILED);
		B_LogEntry(CH3_BULLIT,"�������� ������ �� ����� ��� ������.");
	};
};

