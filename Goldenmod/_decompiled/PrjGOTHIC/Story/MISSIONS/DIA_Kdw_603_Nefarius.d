
instance Info_Nefarius_EXIT(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 999;
	condition = Info_Nefarius_EXIT_Condition;
	information = Info_Nefarius_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Nefarius_EXIT_Condition()
{
	return 1;
};

func void Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nefarius_Hallo(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_Hallo_Condition;
	information = Info_Nefarius_Hallo_Info;
	permanent = 0;
	description = "��� ���� �����?";
};


func int Info_Nefarius_Hallo_Condition()
{
	return 1;
};

func void Info_Nefarius_Hallo_Info()
{
	AI_Output(other,self,"Info_Nefarius_Hallo_15_00");	//��� ��?
	AI_Output(self,other,"Info_Nefarius_Hallo_04_01");	//� ��������, ��� ����� ����.
};


instance Info_Nefarius_WoSaturas(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 2;
	condition = Info_Nefarius_WoSaturas_Condition;
	information = Info_Nefarius_WoSaturas_Info;
	permanent = 0;
	description = "��� ��� ����� ��������?";
};


func int Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

func void Info_Nefarius_WoSaturas_Info()
{
	AI_Output(other,self,"Info_Nefarius_WoSaturas_15_00");	//��� ��� ����� ��������?
	AI_Output(self,other,"Info_Nefarius_WoSaturas_04_01");	//��� � ������� ������� ������. ��� �� � ������� ���.
};


instance Info_Nefarius_WannaMage(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_WannaMage_Condition;
	information = Info_Nefarius_WannaMage_Info;
	permanent = 0;
	description = "� ���� ����� ����� ����� ����!";
};


func int Info_Nefarius_WannaMage_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

func void Info_Nefarius_WannaMage_Info()
{
	AI_Output(other,self,"Info_Nefarius_WannaMage_15_00");	//� ���� ����� ����� ����� ����!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_01");	//(�� ������) �� ��� ������, ��� �������!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_02");	//������ ��� �� �������� ������� �������������� � ���, �� ������ �������� ���� � �����-������ ������� ������.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_03");	//� �� ������ ������� ��� �����-�� �����.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_04");	//���� �� �������� � ����� ����������, �� ������ ����� ����� �� ����� ���������. ��� �� ������� ������� ���.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_05");	//� ����� ���� ������� ���� ������������ ���� ������� ���-�� �������.
};


instance Info_Nefarius_NowReady(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_NowReady_Condition;
	information = Info_Nefarius_NowReady_Info;
	permanent = 1;
	description = "� ����� �������������� � ����� ����?";
};


func int Info_Nefarius_NowReady_Condition()
{
	if(!FMTaken && Npc_KnowsInfo(hero,Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero) != GIL_KDW))
	{
		return 1;
	};
};

func void Info_Nefarius_NowReady_Info()
{
	AI_Output(other,self,"Info_Nefarius_NowReady_15_00");	//� ����� �������������� � ����� ����?
	if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_01");	//����� ����� �� ����� ���������, � ��� ���������...
	}
	else
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_02");	//����, �� ���� ����� �� ����� ���������. ����� ������, ����� ������...
		AI_Output(self,other,"Info_Nefarius_NowReady_04_03");	//������ ���� �� ��������...
	};
};


instance Info_Nefarius_OCNews(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = Info_Nefarius_OCNews_Condition;
	information = Info_Nefarius_OCNews_Info;
	permanent = 0;
	important = 1;
};


func int Info_Nefarius_OCNews_Condition()
{
	if(FMTaken && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Nefarius_OCNews_Info()
{
	AI_Output(self,other,"Info_Nefarius_OCNews_04_00");	//���� �����-������ ������� �� ����� ������ �� ������� ������?
	AI_Output(other,self,"Info_Nefarius_OCNews_15_01");	//����� ����������� � ������ ����!
	AI_Output(self,other,"Info_Nefarius_OCNews_04_02");	//���! ������! � ������������ �������� - ��� ������ ��������! �� ������ ���������� �� ���� ��������!
	AI_Output(other,self,"Info_Nefarius_OCNews_15_02");	//�����, � �����.
	AI_StopProcessInfos(self);
};


instance INFO_NEFARIUS_OCNEWS_KDW(C_Info)
{
	npc = Kdw_603_Nefarius;
	nr = 1;
	condition = info_nefarius_ocnews_kdw_condition;
	information = info_nefarius_ocnews_kdw_info;
	permanent = 0;
	important = 1;
};


func int info_nefarius_ocnews_kdw_condition()
{
	if(FMTaken && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void info_nefarius_ocnews_kdw_info()
{
	AI_Output(self,other,"Info_Nefarius_OCNews_04_03");	//������!
	AI_Output(self,other,"Info_Nefarius_OCNews_04_04");	//���� ��� �� ������� ����� ���������� � �������� �� ��������.
	AI_Output(self,other,"Info_Nefarius_OCNews_04_05");	//�����, ��� ������ �� ����� ������ ������� ����� ����.
	AI_Output(self,other,"Info_Nefarius_OCNews_04_06");	//�� ������ �� ������ ���������� � ���������! ��������!
	AI_StopProcessInfos(self);
};

