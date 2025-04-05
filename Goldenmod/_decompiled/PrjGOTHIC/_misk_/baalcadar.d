
var C_Npc BAALCADAR;
var C_Npc BAALORUN;
var C_Npc BAALTYON;
var C_Npc BAALNAMIB;
var C_Npc BAALTONDRAL;
instance Info_Yberion_EXIT(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 999;
	condition = Info_Yberion_EXIT_Condition;
	information = Info_Yberion_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Yberion_EXIT_Condition()
{
	return 1;
};

func void Info_Yberion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_YBerion_Wache(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Wache_Condition;
	information = DIA_YBerion_Wache_Info;
	permanent = 1;
	important = 1;
};


func int DIA_YBerion_Wache_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void DIA_YBerion_Wache_Info()
{
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//��� �� ����� �������? ��� ���� �������? ������!
	B_IntruderAlert(self,other);
	AI_StopProcessInfos(self);
};


instance DIA_YBerion_Kennen(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Kennen_Condition;
	information = DIA_YBerion_Kennen_Info;
	permanent = 0;
	description = "����������� ���, �������� �'������!";
};


func int DIA_YBerion_Kennen_Condition()
{
	if(Kapitel == 2)
	{
		return 1;
	};
};

func void DIA_YBerion_Kennen_Info()
{
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00");	//����������� ���, �������� �'������!
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//�! � ���� ����!
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//��� ����������. �� ������� �� ����������� ������.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//�� ��� ��������... ������ - ��� ���� �����?
};


instance Info_YBerion_BringFocus(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = Info_YBerion_BringFocus_Condition;
	information = Info_YBerion_BringFocus_Info;
	permanent = 1;
	description = "� ������, �� ���-��� �����.";
};


func int Info_YBerion_BringFocus_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_YBerion_Kennen) && (Npc_GetTrueGuild(hero) != GIL_None) && (YBerion_BringFocus != LOG_RUNNING) && (YBerion_BringFocus != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//� ������, �� ���-��� �����.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//�����. ��� ����� ���������� ������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//�� ������� ������ �� �������� - ������ - ������� ���, �� �� �� ��� ��� �� ��������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//�� ��� �� �� ������, ��� ���������?
	Info_ClearChoices(Info_YBerion_BringFocus);
	Info_AddChoice(Info_YBerion_BringFocus,DIALOG_BACK,Info_YBerion_BringFocus_BACK);
	Info_AddChoice(Info_YBerion_BringFocus,"� ������� ��� ������.",Info_YBerion_BringFocus_OK);
	Info_AddChoice(Info_YBerion_BringFocus,"������ � ������ ������ ������?",Info_YBerion_BringFocus_WO);
	Info_AddChoice(Info_YBerion_BringFocus,"������ ���� ������ ��� �����?",Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK()
{
	Info_ClearChoices(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//� ������� ��� ������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//������ ��� �����. �� ��� �������� �����, ��� ��������� ������.
	B_Story_BringFirstFocus();
	B_LogEntry(CH2_Focus,"�'������ ������ ������� ������ �� ��������, �� �������� ��� � �� ��������. ���� ��� ��� ����� � ��������� � ����������� �����.");
};

func void Info_YBerion_BringFocus_WO()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//������ � ������ ������ ������?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//�� ������ �� ������ ������� ������� � ���������� �� ������� �����. �� ����� �� ������� ����, � ��� �� ������� ������.
};

func void Info_YBerion_BringFocus_FOKUS()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//������ ���� ������ ��� �����?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//���� ���������� �������� �������� ��������������� ���� ����.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//��� ���� �� ���� ������, � ������� ������� ���� ��������� ������.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//��� ���� ������� � ���, ��� �� ������ ������������ ���� ����� �����.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//����� ���������� �������!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//��� ������� ���� ���������� ������. �� ������ �������� ��� � ������� �������!
};


instance Info_YBerion_BringFocus_RUNNING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_RUNNING_Condition;
	information = Info_YBerion_BringFocus_RUNNING_Info;
	permanent = 0;
	description = "� ��� � �� ����� ������.";
};


func int Info_YBerion_BringFocus_RUNNING_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && !Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_YBerion_BringFocus_RUNNING_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//� ��� � �� ����� ������.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//�� ��� ��� ���! ������ ������ ���� ����.
};


instance Info_YBerion_BringFocus_Success(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_Success_Condition;
	information = Info_YBerion_BringFocus_Success_Info;
	permanent = 0;
	description = "� ����� ������.";
};


func int Info_YBerion_BringFocus_Success_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Success_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//� ����� ������.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//�����������! �� ������ ��� ���� ���������� ������.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//������ ������ ������ ��� ������. �� �����, ��� ������.
	if(Kalom_TalkedTo == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//��� � ���� ����� ����� ��� ������?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//������� ����� ������� �� �������� � ����� ����������� � ������� ����� ��������.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//� ����� � ������ �� ������� �������. �� ������ ���������� ��������, ��� ��� ���������.
		B_LogEntry(CH2_Focus,"�'������ ������� ��� ������� ������ � ������� ����, �� ����� ��� �����. ���� ��� ����� ������ ����� ����� � ����� �����������.");
	}
	else
	{
		B_LogEntry(CH2_Focus,"�'������ ������� ��� ������� ������ � ��� ������. ����� ��� ��������� ������������ - ��������� ����� ����� ������ ��������!");
	};
	TPL_1406_Templer.aivar[AIV_PASSGATE] = TRUE;
	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP(XP_BringFocusToYBerion);
};


instance Info_YBerion_NYRAS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_NYRAS_Condition;
	information = Info_YBerion_NYRAS_Info;
	permanent = 0;
	description = "���� �������, �����, - �� ����� � ���!";
};


func int Info_YBerion_NYRAS_Condition()
{
	if(Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_NYRAS_Info()
{
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//���� �������, �����, - �� ����� � ���!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//�� �������, ��� � ��� ������� ������ � ������ ��� ����� ������������ ������!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//� ����� �� ��������� ����� ����!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//���������� ������� ������� ������ ��� ������ �������������.
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//���� ��, ����, ����� ������ ��� ��������� ������ ������� ��� ���� ����, ��� ��������� ��� �������� ����� ����������� �������.
};


instance GUR_1200_Yberion_EARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = GUR_1200_Yberion_EARN_Condition;
	information = GUR_1200_Yberion_EARN_Info;
	important = 0;
	permanent = 0;
	description = "� ��� ������ ��������� �������?";
};


func int GUR_1200_Yberion_EARN_Condition()
{
	if((YBerion_BringFocus == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_NOV) && (Npc_GetTrueGuild(hero) != GIL_TPL) && (Npc_GetTrueGuild(hero) != GIL_GUR) && C_IsChapter(2))
	{
		return 1;
	};
};

func void GUR_1200_Yberion_EARN_Info()
{
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//� ��� ������ ��������� �������?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//��������� �� �� ��������� ������ ��������, � ������� ����.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//����� ���� ������ � ���� ���� �������������.
	CreateInvItem(self,Schutzamulett_Feuer);
	B_GiveInvItems(self,hero,Schutzamulett_Feuer,1);
};


instance DIA_YBERION_GURU(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = dia_yberion_guru_condition;
	information = dia_yberion_guru_info;
	important = 0;
	permanent = 0;
	description = "����� ���� ����� ���� ������.";
};


func int dia_yberion_guru_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_guru) && (Kapitel == 4))
	{
		return 1;
	};
};

func void dia_yberion_guru_info()
{
	AI_Output(other,self,"DIA_YBerion_GURU_Info_15_01");	//����� ���� ����� ���� ������.
	AI_Output(self,other,"DIA_YBerion_GURU_Info_12_02");	//��� �����, ����� �� ������� �� ��������� ���������� �����?
	AI_Output(self,other,"DIA_YBerion_GURU_Info_12_03");	//� ��� ������ ��� ����� ����� ������?
	AI_Output(other,self,"DIA_YBerion_GURU_Info_15_02");	//����� ���� ����� ����. ������� �� ������ ����������� � ����� ������.
	AI_Output(other,self,"DIA_YBerion_GURU_Info_15_03");	//���� ���� ����� �������� ���� ����, ����� ���������� ������.
	AI_Output(other,self,"DIA_YBerion_GURU_Info_15_04");	//���� �� ������ ������ ����� ������ �������������� ������� ����.
	AI_Output(self,other,"DIA_YBerion_GURU_Info_12_05");	//� ������ � ����� ���� ���� ������ ������. �� ���������� ������������ � ����� ������.
	B_GiveXP(1000);
	B_LogEntry(CH4_ASKGURU,"�'������ ���������� ������ ����� ����. �� ������ ���� ���� �� ��������� ������ � ���������� � ��������.");
	BAALCADAR = Hlp_GetNpc(GUR_1208_BaalCadar);
	BAALORUN = Hlp_GetNpc(GUR_1209_BaalOrun);
	BAALTYON = Hlp_GetNpc(GUR_1210_BaalTyon);
	BAALNAMIB = Hlp_GetNpc(GUR_1204_BaalNamib);
	BAALTONDRAL = Hlp_GetNpc(GUR_1203_BaalTondral);
	AI_GotoWP(self,"PSI_TEMPLE_SITTING_PRIEST");
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(self,"NEWCAMP");
	B_ExchangeRoutine(baalcadar,"NEWCAMP");
	B_ExchangeRoutine(baalorun,"NEWCAMP");
	B_ExchangeRoutine(baaltyon,"NEWCAMP");
	B_ExchangeRoutine(baalnamib,"NEWCAMP");
	B_ExchangeRoutine(baaltondral,"NEWCAMP");
};


instance DIA_YBERION_BECOME_A_GURU(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = dia_yberion_become_a_guru_condition;
	information = dia_yberion_become_a_guru_info;
	important = 0;
	permanent = 1;
	description = "� ���� ����� ����.";
};


func int dia_yberion_become_a_guru_condition()
{
	if(C_NpcBelongsToPsiCamp(hero) && (hero.guild != GIL_GUR) && (Kapitel >= 4))
	{
		return 1;
	};
};

func void dia_yberion_become_a_guru_info()
{
	AI_Output(other,self,"DIA_YBerion_BECOME_A_GURU_Info_15_01");	//� ���� ����� ����.
	AI_Output(self,other,"DIA_YBerion_BECOME_A_GURU_Info_12_02");	//��� �� ������ ������� ����� �������?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4)
	{
		AI_Output(self,other,"DIA_YBerion_BECOME_A_GURU_Info_12_04");	//������, ������ �� ���� �� ����. ������ �� ��� ������� � ���� ������������� � ������ ���������� �����.
		B_GiveXP(750);
		CreateInvItem(self,gur_armor_m);
		B_GiveInvItems(self,hero,gur_armor_m,1);
		AI_EquipBestArmor(other);
		Npc_SetTrueGuild(hero,GIL_GUR);
		hero.guild = GIL_GUR;
		Wld_InsertNpc(nov_9000_escaped,"NOV_1");
		Wld_InsertNpc(nov_9001_escaped,"NOV_2");
		dia_yberion_become_a_guru.permanent = 0;
	}
	else
	{
		AI_Output(self,other,"DIA_YBerion_BECOME_A_GURU_Info_12_05");	//�� �� �� ������ ������ ������� ������ �����.
	};
};


instance DIA_YBERION_KREIS5(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = dia_yberion_kreis5_condition;
	information = dia_yberion_kreis5_info;
	important = 0;
	permanent = 1;
	description = "� ����� �������� � ����� ����.";
};


func int dia_yberion_kreis5_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && C_NpcBelongsToPsiCamp(hero) && (Npc_GetTrueGuild(hero) == GIL_GUR) && (Kapitel >= 4))
	{
		return 1;
	};
};

func void dia_yberion_kreis5_info()
{
	AI_Output(other,self,"DIA_YBerion_KREIS5_Info_15_01");	//� ����� �������� � ����� ����.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
	{
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_02");	//������, ����� �� ������, ��� �� ����� ���� �������� ������...
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_03");	//... �� ������ �������� ���� �� ��� �����.
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_04");	//�� ������ �������� ������������� ����� ������ �����.
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_05");	//����������� � �������� ���� �������� ����� ����.
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_06");	//������ � ������ ���� �����, ��� ���� ���.
		dia_yberion_kreis5.permanent = 0;
	};
};


instance DIA_YBERION_HEAVYARMOR(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = dia_yberion_heavyarmor_condition;
	information = dia_yberion_heavyarmor_info;
	important = 0;
	permanent = 1;
	description = "�������� ��������� ������ ���� (1800 ������ ����).";
};


func int dia_yberion_heavyarmor_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void dia_yberion_heavyarmor_info()
{
	AI_Output(other,self,"DIA_YBerion_HEAVYARMOR_Info_15_01");	//� ���� ������ ��������� ������ ����.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 5)
	{
		AI_Output(self,other,"DIA_YBerion_WANNBEKDF_Info_14_04");	//������, �� ������ ������� ����� ���� �����.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_GUR_ARMOR_H)
	{
		AI_Output(self,other,"DIA_YBerion_HEAVYARMOR_Info_14_03");	//�� � ���� ������������ ����.
	}
	else
	{
		AI_Output(self,other,"DIA_YBerion_HEAVYARMOR_Info_14_04");	//������ �� ������ ������ ��������� ������ ����.
		CreateInvItem(self,gur_armor_h);
		B_GiveInvItems(self,hero,gur_armor_h,1);
		AI_EquipBestArmor(self);
		B_GiveInvItems(hero,self,ItMiNugget,1800);
		AI_EquipBestArmor(hero);
		dia_yberion_heavyarmor.permanent = 0;
	};
};


instance GUR_1200_YBERION_MANA_LEARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_mana_learn_condition;
	information = gur_1200_yberion_mana_learn_info;
	important = 0;
	permanent = 1;
	description = "� ���� ��������� ���� ����� �����.";
};


func int gur_1200_yberion_mana_learn_condition()
{
	if(C_NpcBelongsToPsiCamp(hero) && (Npc_GetTrueGuild(hero) == GIL_GUR) && (Kapitel >= 4))
	{
		return 1;
	};
};

func void gur_1200_yberion_mana_learn_info()
{
	AI_Output(other,self,"GUR_1200_YBerion_MANA_LEARN_15_01");	//� ���� ��������� ���� ����� �����.
	AI_Output(self,other,"GUR_1200_YBerion_MANA_LEARN_14_02");	//� ���� ������ ���� ��������� ���������� ����. �� ��� ������ ������, ��� �� ������ �� ������������.
	Info_AddChoice(gur_1200_yberion_mana_learn,DIALOG_BACK,gur_1200_yberion_mana_learn_back);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_5);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_1);
};

func void gur_1200_yberion_mana_learn_back()
{
	Info_ClearChoices(gur_1200_yberion_mana_learn);
};

func void gur_1200_yberion_mana_learn_man_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(gur_1200_yberion_mana_learn);
	Info_AddChoice(gur_1200_yberion_mana_learn,DIALOG_BACK,gur_1200_yberion_mana_learn_back);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_5);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_1);
};

func void gur_1200_yberion_mana_learn_man_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(gur_1200_yberion_mana_learn);
	Info_AddChoice(gur_1200_yberion_mana_learn,DIALOG_BACK,gur_1200_yberion_mana_learn_back);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_5);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_1);
};


instance INFO_YBERION_NOV_AWAY(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_nov_away_condition;
	information = info_yberion_nov_away_info;
	permanent = 0;
	description = "��� � ���� ���� ��� �������, ��� ��������?";
};


func int info_yberion_nov_away_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return 1;
	};
};

func void info_yberion_nov_away_info()
{
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_15_00");	//��� � ���� ���� ��� �������, ��� ��������?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_00");	//�� ��������� �� ��� ��� ��� �������.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_01");	//� ���� ���� ��� ���� ������ ����. ��������, �� ������ ������ ���� �����������...
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_15_01");	//(���������) � �� ������ ����� � ������ ��?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_02");	//(������) ���������� ����. ���� ������������ � ��� �����, � ����� ������.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_03");	//(����������) ��� ���, ���� ��������� ��, ��� ��� ����� � �����.
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_15_02");	//��... � ��� �� ��� �����?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_03");	//(����������) ��� ���, ���� ��������� ��, ��� ��� ����� � �����.
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_15_02");	//��... � ��� �� ��� �����?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_04");	//�����-�� ����� � ������ ����� ���� � ���� ����� ����� ����������� � ��������� ������.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_05");	//������ � ���� � ��� ������������ ���� ����������� � �������� ����.
	Info_AddChoice(info_yberion_nov_away,"��� ���� � ������ ���!",info_yberion_nov_away_yes);
	Info_AddChoice(info_yberion_nov_away,"� ���� ��� ������ ���� ������?",info_yberion_nov_away_about);
};

func void info_yberion_nov_away_yes()
{
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_YES_15_00");	//��� ���� � ������ ���!
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_YES_12_01");	//� �� ������ �� ���� ������� ������.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_YES_12_02");	//�� �� ������� ����� ���� ������. �����, ��� ������ �� �������� ���� ������� ���.
	Log_CreateTopic(CH4_YBERION_AMULETTE,LOG_MISSION);
	Log_SetTopicStatus(CH4_YBERION_AMULETTE,LOG_RUNNING);
	B_LogEntry(CH4_YBERION_AMULETTE,"���� ����������� ������ ������ �'������� � ������� �� ������. � ������ ����� ����������� � ������� ������.");
	B_LogEntry(CH4_YBERION_AMULETTE,"����� �� �������� ������������ ���� ������. ��������, ������ ���������� ���������� ����.");
	YBERION_AMULETTE = TRUE;
	Info_ClearChoices(info_yberion_nov_away);
	Info_AddChoice(info_yberion_nov_away,"��� ��� ��� ������ ���� ������?",info_yberion_nov_away_where);
};

func void info_yberion_nov_away_where()
{
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_WHERE_15_00");	//��� ��� ��� ������ ���� ������?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_WHERE_12_01");	//���-������ � ������ ������ ��� ������, ���� ����������� ����������.
	B_LogEntry(CH4_YBERION_AMULETTE,"� ���� ����������� � ������, ���� ����������� ����������.");
	Info_ClearChoices(info_yberion_nov_away);
};

func void info_yberion_nov_away_about()
{
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_ABOUT_15_00");	//� ���� ��� ������ ���� ������? ������ � ��� ��� ����������. �� �������� ���� ������.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_ABOUT_12_01");	//��� ����� �������, � ��� ����� ��� �������.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_ABOUT_12_02");	//� ������ ������ �������� ����������� �� ������� �������.
};


instance GUR_1200_YBERION_NOV_AWAY_OK(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_nov_away_ok_condition;
	information = gur_1200_yberion_nov_away_ok_info;
	important = 0;
	permanent = 0;
	description = "� ����� ��� ������.";
};


func int gur_1200_yberion_nov_away_ok_condition()
{
	if(Npc_HasItems(hero,yberion_magic_amulette) == 1)
	{
		return 1;
	};
};

func void gur_1200_yberion_nov_away_ok_info()
{
	AI_Output(other,self,"GUR_1200_Yberion_NOV_AWAY_OK_Info_15_01");	//� ����� ��� ������.
	AI_Output(self,other,"GUR_1200_Yberion_NOV_AWAY_OK_Info_12_00");	//����� ������. ������ � ������� ��� ����.
	B_GiveXP(800);
	B_GiveInvItems(hero,self,yberion_magic_amulette,1);
	B_GiveInvItems(self,hero,ItArRuneControl,1);
	Log_SetTopicStatus(CH4_YBERION_AMULETTE,LOG_SUCCESS);
	B_LogEntry(CH4_YBERION_AMULETTE,"� ������ ������ �'�������.");
};


instance INFO_YBERION_INNOS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_innos_condition;
	information = info_yberion_innos_info;
	permanent = 0;
	description = "� ��� �� ������ ������ ������?";
};


func int info_yberion_innos_condition()
{
	if(Npc_KnowsInfo(hero,gur_1200_yberion_nov_away_ok))
	{
		return 1;
	};
};

func void info_yberion_innos_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_15_00");	//� ��� �� ������ ������ ������?
	AI_Output(self,other,"Info_YBerion_INNOS_12_00");	//� �������, ����� ������� ����� ����� ����� ����.
	AI_Output(other,self,"Info_YBerion_INNOS_15_01");	//� ��� �� ������? ��� ������ � ��������������� �������?
	AI_Output(self,other,"Info_YBerion_INNOS_12_01");	//��, ��� �� ������� ������.
	AI_Output(self,other,"Info_YBerion_INNOS_12_02");	//���� �� ������������, � ����������� � ��� �������.
	AI_Output(self,other,"Info_YBerion_INNOS_12_03");	//� � ������ �����, ��� ������ ��������� ���-��, ��� �������� ������� ����������� � ���� ����� �������.
	AI_Output(other,self,"Info_YBerion_INNOS_15_02");	//��, ��� ����� �� ������.
};


instance INFO_YBERION_INNOS_PLAN(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_innos_plan_condition;
	information = info_yberion_innos_plan_info;
	permanent = 0;
	description = "�� � ��� ��� ���� �����-������ ����?";
};


func int info_yberion_innos_plan_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_15_00");	//�� � ��� ��� ���� �����-������ ����?
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_00");	//����� ����� ����� �������, ����� ����� ������� �������� �� ��� �������.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_01");	//�� � ����� ��������� �����.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_02");	//� ���� �������� ���� ������. � ��������� ��� �����, ��� ���� ���� �������� ��� � ����� ������.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_03");	//���������� ������ ��������, ��� ��� ���� ��� ������.
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_15_01");	//�� ��� �� �����!
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_04");	//� ����. �� ������� ���� ������ ���. ����� ����, �� ��������� ������, �� ������ ������������ � ���� ������� �������, ���� � ��� ����� ������ ������ ������ ����� ����.
};


instance INFO_YBERION_INNOS_WORK(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_innos_work_condition;
	information = info_yberion_innos_work_info;
	permanent = 0;
	description = "��, � ���� ����� �������, ��� � ���� � ���� �������...";
};


func int info_yberion_innos_work_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_plan))
	{
		return 1;
	};
};

func void info_yberion_innos_work_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_00");	//��, � ���� ����� �������, ��� � ���� � ���� �������...
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_00");	//�! �� ����.
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_01");	//����, ��� ���� �����?
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_01");	//���-����� ����������� � ���� �������. �� ��� ����� �� ������ ������ �������� �� �������, ����� ������ ������ ������ � ������ ������.
	Log_CreateTopic(CH4_YBERION_INNOS,LOG_MISSION);
	Log_SetTopicStatus(CH4_YBERION_INNOS,LOG_RUNNING);
	B_LogEntry(CH4_YBERION_INNOS,"��� ���������� ������� �'������� ����� 10 �������� �� �������, 12 ������ ������ � ������ ������.");
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_02");	//� ��� � ������ ������� ������?
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"GUR_6"))
	{
		AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_02");	//� ������, �����, � ���� �� ����� ����� ����������� �������.
	}
	else
	{
		AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_03");	//� ������, � ���� � ������ ������ ����� ����������� �������.
	};
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_04");	//� ��� ��������� ���� �����.
	B_LogEntry(CH4_YBERION_INNOS,"����� � ���� ����� � ���� � ����� ������.");
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_03");	//� ��� ��� �� ������ ������?
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_05");	//��� ���������� ���� ��� ���������� ������� � ����� ������.
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_06");	//��� ������, ��������� � �����, ����� ���� �� ����� ����. ����� �� ��� ����� �������.
	B_LogEntry(CH4_YBERION_INNOS,"������ ������ ����� ��� �������.");
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_04");	//� ���� ��������.
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_07");	//��� ��� �� �� ������? ������!
};


instance INFO_YBERION_INNOS_PLAN_RING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_innos_plan_ring_condition;
	information = info_yberion_innos_plan_ring_info;
	permanent = 0;
	description = "� ������ ������ ������.";
};


func int info_yberion_innos_plan_ring_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work) && (Npc_HasItems(hero,ring_kdf_kdw) == 1))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_ring_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_RING_15_00");	//� ������ ������ ������.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_RING_12_00");	//������. � ����� ��� �������� ����� �������.
	B_GiveXP(250);
	B_GiveInvItems(hero,self,ring_kdf_kdw,1);
	B_LogEntry(CH4_YBERION_INNOS,"� ����� �'������� ������ ������.");
};


instance INFO_YBERION_INNOS_PLAN_SPIRIT(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 2;
	condition = info_yberion_innos_plan_spirit_condition;
	information = info_yberion_innos_plan_spirit_info;
	permanent = 0;
	description = "� ���� ���� 10 �������� �� �������.";
};


func int info_yberion_innos_plan_spirit_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work) && (Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 10))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_spirit_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_SPIRIT_15_00");	//� ���� ���� 10 �������� �� �������.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_SPIRIT_12_00");	//�������! ����� �� ����.
	B_GiveXP(250);
	B_GiveInvItems(hero,self,ItMi_Alchemy_Alcohol_01,10);
	B_LogEntry(CH4_YBERION_INNOS,"� ������ �������� �� �������.");
};


instance INFO_YBERION_INNOS_PLAN_MUSHROOMS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 2;
	condition = info_yberion_innos_plan_mushrooms_condition;
	information = info_yberion_innos_plan_mushrooms_info;
	permanent = 0;
	description = "��� ������ ������ ������.";
};


func int info_yberion_innos_plan_mushrooms_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work) && (Npc_HasItems(hero,ItFo_Plants_mushroom_01) >= 12))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_mushrooms_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_MUSHROOMS_15_00");	//��� ������ ������ ������.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_MUSHROOMS_12_00");	//����� ������.
	B_GiveXP(250);
	B_GiveInvItems(hero,self,ItFo_Plants_mushroom_01,12);
	B_LogEntry(CH4_YBERION_INNOS,"� ������ ������ �����.");
};


instance INFO_YBERION_INNOS_PLAN_OK(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 2;
	condition = info_yberion_innos_plan_ok_condition;
	information = info_yberion_innos_plan_ok_info;
	permanent = 0;
	description = "��� ������ ��� ���������� �������?";
};


func int info_yberion_innos_plan_ok_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_plan_ring) && Npc_KnowsInfo(hero,info_yberion_innos_plan_spirit) && Npc_KnowsInfo(hero,info_yberion_innos_plan_mushrooms))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_ok_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_OK_15_00");	//��� ������ ��� ���������� �������?
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_OK_12_00");	//��, �� � ��� ������ �������� ��� � ��� �������.
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"GUR_6"))
	{
		AI_Output(self,other,"Info_YBerion_INNOS_PLAN_OK_12_01");	//� ������� � ������ ������ ����� ���� �������� �������� ����.
	};
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_OK_12_02");	//������ ��� ���� � �������� ��������������.
	B_GiveXP(2000);
	B_GiveInvItems(self,hero,ItMiNugget,3000);
	Log_SetTopicStatus(CH4_YBERION_INNOS,LOG_SUCCESS);
	B_LogEntry(CH4_YBERION_INNOS,"������ ��� ������ ��� ���������� �������.");
};

