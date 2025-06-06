
instance DIA_Jarvis_EXIT(C_Info)
{
	npc = SLD_728_Jarvis;
	nr = 999;
	condition = DIA_Jarvis_EXIT_Condition;
	information = DIA_Jarvis_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

func void DIA_Jarvis_EXIT_Info()
{
	AI_Output(self,other,"DIA_Jarvis_EXIT_08_00");	//��, �����!
	AI_StopProcessInfos(self);
};


instance DIA_Jarvis_First(C_Info)
{
	npc = SLD_728_Jarvis;
	nr = 1;
	condition = DIA_Jarvis_First_Condition;
	information = DIA_Jarvis_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Jarvis_First_Condition()
{
	return 1;
};

func void DIA_Jarvis_First_Info()
{
	AI_Output(self,other,"DIA_Jarvis_First_08_00");	//�� ����������� ������ ����� ��� ������?
	AI_Output(other,self,"DIA_Jarvis_First_15_01");	//� �� ����������� ���������� ����?
	AI_Output(self,other,"DIA_Jarvis_First_08_02");	//���, �� �� ������ �����, ��� ���� ��� �������. ��� ���� �� ������ ������, �� � � ������ �������� ��������� � ��� ���� ������.
	AI_Output(other,self,"DIA_Jarvis_First_15_03");	//��� ��� �� ���� ��� �������?
	AI_Output(self,other,"DIA_Jarvis_First_08_04");	//����� ��� �� ����������, �� �������, ����� ������������� �� ��������. ����� ������ ��� �� ����. ������ �������� ������ ��, ��������.
};


instance DIA_Jarvis_SldInfo(C_Info)
{
	npc = SLD_728_Jarvis;
	nr = 1;
	condition = DIA_Jarvis_SldInfo_Condition;
	information = DIA_Jarvis_SldInfo_Info;
	permanent = 0;
	description = "��� ���������� ��������?";
};


func int DIA_Jarvis_SldInfo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jarvis_First))
	{
		return 1;
	};
};

func void DIA_Jarvis_SldInfo_Info()
{
	AI_Output(other,self,"DIA_Jarvis_SldInfo_15_00");	//��� ���������� ��������?
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_01");	//�� - �������� �� ������ � ����� ����.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_02");	//���� ������� ���� - ��������� ������. �� ����� �������� � �� ���������� �������������, ��� �� ���� �� ������� ������, ��� ����� �� ���� ���������.
	AI_Output(self,other,"DIA_Jarvis_SldInfo_08_03");	//�� ��� ����������� ��. �� ������� �������. �� ���� �� ���, ��� ������������ ������� � ���� �������� ������.
};


instance DIA_Jarvis_Magier(C_Info)
{
	npc = SLD_728_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_Magier_Condition;
	information = DIA_Jarvis_Magier_Info;
	permanent = 0;
	description = "��� ���������� ����?";
};


func int DIA_Jarvis_Magier_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

func void DIA_Jarvis_Magier_Info()
{
	AI_Output(other,self,"DIA_Jarvis_Magier_15_00");	//��� ���������� ����?
	AI_Output(self,other,"DIA_Jarvis_Magier_08_01");	//��� ������� ���������� �������� ����, ������� '�������' �������� � �����.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_02");	//��������� ��� ��������, ��� ���������� �������� ��� ������� ���� ����, ����� ���������� ������ � ��������� ������.
	AI_Output(other,self,"DIA_Jarvis_Magier_15_03");	//��� ������ ���� ������.
	AI_Output(self,other,"DIA_Jarvis_Magier_08_04");	//��� �������, ��� �� �� ������ �����������.
};


instance DIA_Jarvis_Erzhaufen(C_Info)
{
	npc = SLD_728_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_Erzhaufen_Condition;
	information = DIA_Jarvis_Erzhaufen_Info;
	permanent = 0;
	description = "� ��� ������� ������ ����?";
};


func int DIA_Jarvis_Erzhaufen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jarvis_Magier))
	{
		return 1;
	};
};

func void DIA_Jarvis_Erzhaufen_Info()
{
	AI_Output(other,self,"DIA_Jarvis_Erzhaufen_15_00");	//� ��� ������� ������ ����?
	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_01");	//����� ������� � ���. �� �������� �� �������� �����. �� ��� ����� ������ ���� ���� ������.
	AI_Output(self,other,"DIA_Jarvis_Erzhaufen_08_02");	//�� �� �� ���������� �������� ���� ���� ����� ������� �������. �� ����� ��������� ������!
};


instance DIA_Jarvis_WoHaufen(C_Info)
{
	npc = SLD_728_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_WoHaufen_Condition;
	information = DIA_Jarvis_WoHaufen_Info;
	permanent = 0;
	description = "��� ��������� ��� �������� ����?";
};


func int DIA_Jarvis_WoHaufen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

func void DIA_Jarvis_WoHaufen_Info()
{
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_00");	//��� ��������� ��� �������� ����?
	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_01");	//������� �� ����� ����� ���� ����, �? � ������ ������ ���� ������� ���� - ���� ���������� ����.
	AI_Output(self,other,"DIA_Jarvis_WoHaufen_08_02");	//�� ������ � ��� ���� ��� ����� �� �����������. � ����, � ���� ���� - ��� �������� ���� � ����, � �����.
	AI_Output(other,self,"DIA_Jarvis_WoHaufen_15_03");	//�� � ������ �������.
};


instance DIA_Jarvis_Rest(C_Info)
{
	npc = SLD_728_Jarvis;
	nr = 3;
	condition = DIA_Jarvis_Rest_Condition;
	information = DIA_Jarvis_Rest_Info;
	permanent = 0;
	description = "��� ������ ��������� �����?";
};


func int DIA_Jarvis_Rest_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jarvis_First))
	{
		return 1;
	};
};

func void DIA_Jarvis_Rest_Info()
{
	AI_Output(other,self,"DIA_Jarvis_Rest_15_00");	//��� ������ ��������� �����?
	AI_Output(self,other,"DIA_Jarvis_Rest_08_01");	//���� ����� - ���, ��� ����������. �� ������ �� ��������� � �������� �����. � �� ������ ������� ������-������ ����������� �������� ��� ������, ��� ����-������ �� ���.
};


instance DIA_Jarvis_PERM(C_Info)
{
	npc = SLD_728_Jarvis;
	nr = 10;
	condition = DIA_Jarvis_PERM_Condition;
	information = DIA_Jarvis_PERM_Info;
	permanent = 1;
	description = "��� ���� ����?";
};


func int DIA_Jarvis_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jarvis_Magier))
	{
		return 1;
	};
};

func void DIA_Jarvis_PERM_Info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//��� ���� ����?
	if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Jarvis_PERM_08_01");	//������� ��-�������� �������� ����. ����� ��� ������� ����������, �� ������� ��� �������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_PERM_08_02");	//����� �����. ��������� ������� ������ ��������� ���� �����.
	};
};


instance Sld_728_Jarvis_AUFNAHMESOLDIER(C_Info)
{
	npc = SLD_728_Jarvis;
	condition = Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information = Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important = 1;
	permanent = 0;
};


func int Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && ((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01");	//��, � ������, �� ����� ���� �������� � �����!
	AI_Output(self,other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02");	//�����, �� � �������� ������ ���� � ���� ���������. ������ �������� � ���.
	self.flags = 0;
	Log_CreateTopic(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry(GE_BecomeMercenary,"� ������ ���������� � ��. ����� ����, �� �������� ��� �������������� � ���������.");
};

