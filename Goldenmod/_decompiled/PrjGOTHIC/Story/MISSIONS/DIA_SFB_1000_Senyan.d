
instance DIA_Senyan_EXIT(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 999;
	condition = DIA_Senyan_EXIT_Condition;
	information = DIA_Senyan_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Senyan_EXIT_Condition()
{
	return 1;
};

func void DIA_Senyan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Senyan_Hello(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = DIA_Senyan_Hello_Condition;
	information = DIA_Senyan_Hello_Info;
	permanent = 0;
	description = "�� �� ��������� �����, �����?";
};


func int DIA_Senyan_Hello_Condition()
{
	if(!Npc_KnowsInfo(hero,dia_senyan_spirit_ok) && !Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void DIA_Senyan_Hello_Info()
{
	AI_Output(other,self,"DIA_Senyan_Hello_15_00");	//�� �� ��������� �����, �����?
	AI_Output(self,other,"DIA_Senyan_Hello_01_01");	//�����. ��� �� �����?
	AI_StopProcessInfos(self);
};


instance DIA_Senyan_JustTalk(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = DIA_Senyan_JustTalk_Condition;
	information = DIA_Senyan_JustTalk_Info;
	permanent = 1;
	description = "� ����� �� ���������� � �����.";
};


func int DIA_Senyan_JustTalk_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Senyan_Hello) && !Npc_KnowsInfo(hero,dia_senyan_spirit_ok) && !Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void DIA_Senyan_JustTalk_Info()
{
	AI_Output(other,self,"DIA_Senyan_JustTalk_15_00");	//� ����� �� ���������� � �����.
	AI_Output(self,other,"DIA_Senyan_JustTalk_01_01");	//� ����� �� ��� ����, ����� �������������.
	AI_StopProcessInfos(self);
};


instance DIA_SENYAN_SPIRIT(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = dia_senyan_spirit_condition;
	information = dia_senyan_spirit_info;
	permanent = 0;
	description = "������, �� ������ ������?";
};


func int dia_senyan_spirit_condition()
{
	if(Npc_KnowsInfo(hero,dia_jeremiah_spirit) && !Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void dia_senyan_spirit_info()
{
	AI_Output(other,self,"DIA_Senyan_SPIRIT_15_00");	//������, �� ������ ������?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_01_01");	//��. � ����� ����. � ����� ������. � ���� �� ���?
	AI_Output(other,self,"DIA_Senyan_SPIRIT_15_01");	//�� ������ ������ ������� �����?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_01_02");	//��-��-��-��! �� ��� �����������! �� � ����� ������� ���� ��������, �� �� ��� ���� ������...
	AI_Output(other,self,"DIA_Senyan_SPIRIT_15_02");	//�� ������ �������� �������?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_01_03");	//���?! ������� � ������ � ����� ������� ������? �� �� ���� �� ����� ������. �� �� ����� �����.
	AI_Output(other,self,"DIA_Senyan_SPIRIT_15_03");	//500 ������ ���� � �� � ����, ����?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_01_04");	//(�����������) ����... ����� ���� ����!
	B_LogEntry(CH4_YBERION_INNOS,"������ ���������� ������� ������� �� 500 ������ ����.");
};


instance DIA_SENYAN_SPIRIT_OK(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = dia_senyan_spirit_ok_condition;
	information = dia_senyan_spirit_ok_info;
	permanent = 0;
	description = "(������ 500 ������ ����)";
};


func int dia_senyan_spirit_ok_condition()
{
	if(Npc_KnowsInfo(hero,dia_senyan_spirit) && !Npc_KnowsInfo(hero,dia_silas_spirit_ok) && (Npc_HasItems(hero,ItMiNugget) >= 500))
	{
		return 1;
	};
};

func void dia_senyan_spirit_ok_info()
{
	var C_Npc jeremiah;
	AI_Output(other,self,"DIA_Senyan_SPIRIT_OK_15_00");	//�����.
	AI_Output(self,other,"DIA_Senyan_SPIRIT_OK_01_01");	//�������. � ��� ���. � ����� ����� ������ ��������� ��������� ��� ������ ������� ����.
	B_GiveXP(200);
	B_GiveInvItems(hero,self,ItMiNugget,500);
	jeremiah = Hlp_GetNpc(BAU_912_Jeremiah);
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(jeremiah,"afterstart");
	B_ExchangeRoutine(self,"afterstart");
	B_LogEntry(CH4_YBERION_INNOS,"������ ������� �������. ������ � ����� �������� ���� �����.");
};


instance DIA_SENYAN_SPIRIT_AFTER(C_Info)
{
	npc = SFB_1000_Senyan;
	nr = 1;
	condition = dia_senyan_spirit_after_condition;
	information = dia_senyan_spirit_after_info;
	permanent = 1;
	description = "��� ���� ������?";
};


func int dia_senyan_spirit_after_condition()
{
	if(Npc_KnowsInfo(hero,dia_senyan_spirit_ok) || Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void dia_senyan_spirit_after_info()
{
	AI_Output(other,self,"DIA_Senyan_SPIRIT_AFTER_15_00");	//��� ���� ������?
	AI_Output(self,other,"DIA_Senyan_SPIRIT_AFTER_01_01");	//(��������) ��� �� ����������� �����, ��� ������ ������.
	if(SENYAN_SPIRIT != TRUE)
	{
		AI_Output(self,other,"DIA_Senyan_SPIRIT_AFTER_01_02");	//������ ������?
		SENYAN_SPIRIT = TRUE;
		Info_AddChoice(dia_senyan_spirit_after,"���.",dia_senyan_spirit_after_no);
		Info_AddChoice(dia_senyan_spirit_after,"��.",dia_senyan_spirit_after_yes);
	};
};

func void dia_senyan_spirit_after_yes()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//��.
	AI_Output(self,other,"DIA_Senyan_SPIRIT_AFTER_YES_01_01");	//���, ������ �������.
	B_GiveInvItems(self,hero,ItFoWine,1);
	Info_ClearChoices(dia_senyan_spirit_after);
};

func void dia_senyan_spirit_after_no()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//���.
	Info_ClearChoices(dia_senyan_spirit_after);
};

