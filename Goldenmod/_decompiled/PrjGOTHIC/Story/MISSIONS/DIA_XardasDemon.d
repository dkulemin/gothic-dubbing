
instance Info_XardasDemon_EXIT(C_Info)
{
	npc = XardasDemon;
	nr = 999;
	condition = Info_XardasDemon_EXIT_Condition;
	information = Info_XardasDemon_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_XardasDemon_EXIT_Condition()
{
	return 1;
};

func void Info_XardasDemon_EXIT_Info()
{
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
	AI_Output(hero,self,"Info_Saturas_EXIT_15_01");	//... ��������? ... ���, �? ... �����, � ���!
	AI_StopProcessInfos(self);
};


instance Info_XardasDemon_INTRO(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_INTRO_Condition;
	information = Info_XardasDemon_INTRO_Info;
	permanent = 0;
	important = 1;
};


func int Info_XardasDemon_INTRO_Condition()
{
	if(FindXardas)
	{
		return TRUE;
	};
};

func void Info_XardasDemon_INTRO_Info()
{
	AI_TurnAway(hero,self);
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_01");	//������... ���... ��� ������� �� ����?
	AI_WhirlAround(hero,self);
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_02");	//��� ��� �� ������� �� ����??? ���... ��� ���� ������� ���������� � ��� �����?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_03");	//��� �� ����?.. ����� ������ ����������?
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_04");	//�� ����� �� ���������� ���!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
	AI_Output(hero,self,"Info_XardasDemon_INTRO_15_05");	//������, ����� � ��������?
};


instance Info_XardasDemon_MASTERWHO(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_MASTERWHO_Condition;
	information = Info_XardasDemon_MASTERWHO_Info;
	permanent = 0;
	important = 0;
	description = "��������, ������ ���������� �������� ����� �� �������?";
};


func int Info_XardasDemon_MASTERWHO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_INTRO))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_MASTERWHO_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_01");	//��������, ������ ���������� �������� ����� �� �������?
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_02");	//��, ������... ����� �� ������ ����... �����.
	AI_Output(hero,self,"Info_XardasDemon_MASTERWHO_15_03");	//������ ��� �������, ��� ��� � ���� ����� ��������.
};


instance Info_XardasDemon_MASTERHOW(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_MASTERHOW_Condition;
	information = Info_XardasDemon_MASTERHOW_Info;
	permanent = 0;
	important = 0;
	description = "��� ����� ���������� � ����� �����������!";
};


func int Info_XardasDemon_MASTERHOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_INTRO))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_MASTERHOW_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_01");	//��� ����� ���������� � ����� �����������!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_02");	//... �� ��������? ... ���?? ... ��� �� ���������???
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_03");	//... �-��... � �����... ���, ��� ����� ���������� � ����� �����������, ������ ������ ��������, ��� �� ����� �������!
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_04");	//... ������, ��� ��� ����? ... ��������������? ... ������ ��� ���? ... ������ ��� ��������?
	AI_Output(hero,self,"Info_XardasDemon_MASTERHOW_15_05");	//... ������? ... ���? ... �����?
	FindGolemHearts = 1;
	B_LogEntry(CH4_FindXardas,"� ����� �������� � �������� ������, ������� ������������ �� ���� � ���� ������. ������ ��� ������� ���� � ������ �������, �� ����� �������� ��� �������������� � ���� ������� �� ������������ ����, ���� � �����.");
};


instance Info_XardasDemon_NOHEART(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_NOHEART_Condition;
	information = Info_XardasDemon_NOHEART_Info;
	permanent = 1;
	important = 0;
	description = "�� �������� ���������!";
};


func int Info_XardasDemon_NOHEART_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW) && !Npc_HasItems(hero,ItAt_StoneGolem_01) && !Npc_HasItems(hero,ItAt_IceGolem_01) && !Npc_HasItems(hero,ItAt_FireGolem_01) && (FindGolemHearts < 4))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_NOHEART_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_01");	//�� �������� ���������!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_02");	//... �� ��� ��� �������, �� ������������!
	AI_Output(hero,self,"Info_XardasDemon_NOHEART_15_03");	//... ���� ����� �������������� ������ ��� �������� ����, ���� � �����!
};

func void B_XardasDemon_GiveHeart()
{
	if(FindGolemHearts == 1)
	{
		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_01");	//... ���? ... �����! ... ������������ ��������������!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_02");	//... �� �������? �� ������� ��� ����?
		FindGolemHearts = 2;
	}
	else if(FindGolemHearts == 2)
	{
		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_03");	//... ��������������? ... ������ ��������������?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_04");	//... �������� ��� ����?
		FindGolemHearts = 3;
	}
	else if(FindGolemHearts == 3)
	{
		AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//(�����)
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_05");	//... ������������? ... � �������� ���������?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_06");	//���� ���, � ����� ���������� � ����� ����������� ����� ������!
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_07");	//... ��������������? ... � ��� ��� ��? ... ����? ... ���� ��� ����?
		AI_Output(hero,self,"Info_XardasDemon_GIVEHEART_15_08");	//� ����� ������ � �������� ���� ������������ � ���� ������ �������!
		B_Story_AccessToXardas();
	};
};


instance Info_XardasDemon_STONEHEART(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_STONEHEART_Condition;
	information = Info_XardasDemon_STONEHEART_Info;
	permanent = 0;
	important = 0;
	description = "��� ������ ��������� ������.";
};


func int Info_XardasDemon_STONEHEART_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW) && Npc_HasItems(hero,ItAt_StoneGolem_01))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_STONEHEART_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_STONEHEART_15_01");	//��� ������ ��������� ������.
	B_GiveInvItems(hero,self,ItAt_StoneGolem_01,1);
	Npc_RemoveInvItem(self,ItAt_StoneGolem_01);
	B_XardasDemon_GiveHeart();
};


instance Info_XardasDemon_ICEHEART(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_ICEHEART_Condition;
	information = Info_XardasDemon_ICEHEART_Info;
	permanent = 0;
	important = 0;
	description = "��� ������ �������� ������ ����� ������� ���������������?";
};


func int Info_XardasDemon_ICEHEART_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW) && Npc_HasItems(hero,ItAt_IceGolem_01))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_ICEHEART_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_ICEHEART_15_01");	//��� ������ �������� ������ ����� ������� ���������������?
	B_GiveInvItems(hero,self,ItAt_IceGolem_01,1);
	B_XardasDemon_GiveHeart();
};


instance Info_XardasDemon_FIREHEART(C_Info)
{
	npc = XardasDemon;
	condition = Info_XardasDemon_FIREHEART_Condition;
	information = Info_XardasDemon_FIREHEART_Info;
	permanent = 0;
	important = 0;
	description = "��� ������ ������ ��������� ������?";
};


func int Info_XardasDemon_FIREHEART_Condition()
{
	if(Npc_KnowsInfo(hero,Info_XardasDemon_MASTERHOW) && Npc_HasItems(hero,ItAt_FireGolem_01))
	{
		return TRUE;
	};
};

func void Info_XardasDemon_FIREHEART_Info()
{
	AI_Output(hero,self,"Info_XardasDemon_FIREHEART_15_01");	//��� ������ ������ ��������� ������?
	B_GiveInvItems(hero,self,ItAt_FireGolem_01,1);
	B_XardasDemon_GiveHeart();
};

