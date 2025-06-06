
instance Sld_700_Lee_Exit(C_Info)
{
	npc = Sld_700_Lee;
	nr = 999;
	condition = Sld_700_Lee_Exit_Condition;
	information = Sld_700_Lee_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

func void Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Sld_700_Lee_Greet(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Greet_Condition;
	information = Sld_700_Lee_Greet_Info;
	permanent = 0;
	description = "�� ���������� ����������, �����?";
};


func int Sld_700_Lee_Greet_Condition()
{
	return 1;
};

func void Sld_700_Lee_Greet_Info()
{
	AI_Output(other,self,"DIA_Lee_Greet_15_00");	//�� ���������� ����������, �����?
	AI_Output(self,other,"DIA_Lee_Greet_08_01");	//�����, ������!
};


instance Sld_700_Lee_Define(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Define_Condition;
	information = Sld_700_Lee_Define_Info;
	permanent = 0;
	description = "��� ���������� �������� �� ������ � �����?";
};


func int Sld_700_Lee_Define_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

func void Sld_700_Lee_Define_Info()
{
	AI_Output(other,self,"DIA_Lee_Define_15_00");	//��� ���������� �������� �� ������ � �����?
	AI_Output(self,other,"DIA_Lee_Define_08_01");	//��� ����� ������. ���� ������: �������� ���� � �������� �����.
	AI_Output(self,other,"DIA_Lee_Define_08_02");	//������ ���� ���� ����-�� �� ����� ������ �������.
};


instance Sld_700_Lee_Mitmachen(C_Info)
{
	npc = Sld_700_Lee;
	nr = 2;
	condition = Sld_700_Lee_Mitmachen_Condition;
	information = Sld_700_Lee_Mitmachen_Info;
	permanent = 0;
	description = "� ���� �������������� � ���!";
};


func int Sld_700_Lee_Mitmachen_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_Greet) && (Npc_GetTrueGuild(hero) == GIL_None) && (oldHeroGuild == 0))
	{
		return 1;
	};
};

func void Sld_700_Lee_Mitmachen_Info()
{
	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00");	//� ���� �������������� � ���!
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01");	//�������� ���� �� ��������? �� ��� ��, �������, � �������� ������, ��� �� ���� ��������?
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02");	//������ � ������, � ��� ���������. � ���� ������������ �� �����!
};


var int Lee_SldPossible;

instance Sld_700_Lee_NowReady(C_Info)
{
	npc = Sld_700_Lee;
	nr = 700;
	condition = Sld_700_Lee_NowReady_Condition;
	information = Sld_700_Lee_NowReady_Info;
	permanent = 1;
	description = "� ���� ����� ��������� �� ������ � �����.";
};


func int Sld_700_Lee_NowReady_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Lee_SldPossible == FALSE) && (Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10)))
	{
		return 1;
	};
};

func void Sld_700_Lee_NowReady_Info()
{
	AI_Output(other,self,"DIA_Lee_NowReady_15_00");	//� ���� ����� ��������� �� ������ � �����. ������ �� ����� ������� ����?
	if(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01");	//��, ��� �� ������ ��� ����� � ������ �����, ������� ���� �� ����.
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02");	//� � �������� ������� ���� �������������� � ���.
		if(hero.level < 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03");	//�� ��� �� ����� ����� ���������. ���� ����� ��������� �����.
			AI_StopProcessInfos(self);
			B_PrintGuildCondition(10);
		}
		else if(hero.level >= 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//� ��� ���� ����. ��� �������?
			Lee_SldPossible = TRUE;
		};
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"DIA_Lee_NowReady_08_01");	//� ���� ��� ������������ �����. ������������� ���� ������.
		B_PrintGuildCondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//� ��� ���� ����. ��� �������?
		Lee_SldPossible = TRUE;
	};
};


instance Sld_700_Lee_BECOMESLDNOW(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_BECOMESLDNOW_Condition;
	information = Sld_700_Lee_BECOMESLDNOW_Info;
	important = 0;
	permanent = 0;
	description = "� ���� ����� ���������.";
};


func int Sld_700_Lee_BECOMESLDNOW_Condition()
{
	if((Lee_SldPossible == TRUE) && (hero.level >= 10))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01");	//� ���� ����� ���������.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02");	//���������� ����. �� �� ���� �� ���������.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03");	//������ ��� ��� �� ����� ������. ������ �� ����� �������������� � ���, � �� � ������� ������ ��� � ������ ��������?
	Log_CreateTopic(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry(GE_BecomeMercenary,"�� �������� ��� �������������� � ���������.");
	Info_ClearChoices(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"������ ������ ���� �� �����.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"� � ������ ������ ������ �������.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"������ ��� ����������.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};

func void Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01");	//������ ������ ������ �� �����.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02");	//������������, ��� ���� ����-�� ����� ����� - ��� ������� �� �������. ����� ���������� � ���� ����, �������!
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMds(hero,"Humans_Relaxed.mds");
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01");	//� � ������ ������ ������ �������.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02");	//�� ������� ��. ����� ���������� � ���� ����, �������!
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMds(hero,"Humans_Relaxed.mds");
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01");	//������ ��� ���������.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02");	//�������, ��� �� �� ��������� ����� �������. ����� ���������� � ���� ����, �������!
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	Mdl_RemoveOverlayMds(hero,"Humans_Relaxed.mds");
	AI_StopProcessInfos(self);
};


instance Sld_700_Lee_DAMNPAST(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_DAMNPAST_Condition;
	information = Sld_700_Lee_DAMNPAST_Info;
	important = 1;
	permanent = 0;
};


func int Sld_700_Lee_DAMNPAST_Condition()
{
	if((Saturas_BringFoci == 5) && (Npc_GetDistToNpc(hero,self) < 1000) && (Npc_GetDistToWP(self,"NC_DAM") < 1000))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_DAMNPAST_Info()
{
	var C_Npc Homer;
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01");	//���� �������, ����� ����� ��� ���� ������ ������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02");	//� ��� ����� �� ������ ��������� � ������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03");	//��� ���� ����� � �������� �� ���� ������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04");	//������ ������������� � ���� �������, � �� ��� ����� �� ������ ����. ��� ��������, ��� � ����������� ������ ��� �� ������� �������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05");	//� ���������� �� �����������. ��� ����, ����� ���������� ����, ��� ������� ������� ���� �� ���� ������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06");	//� ��� ������� � ��������, � � ������ ������ �� ���������� ������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07");	//��, ��� � ������ �� ����� ������, ������ ���� �� ��������. �� ��� ������ � ���� �������.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08");	//�������� ����, ����� � ����� �����. ����� � ������� � ������ ����� ������.
	AI_AlignToWP(self);
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09");	//� ������.
	Npc_ExchangeRoutine(self,"START");
	Homer = Hlp_GetNpc(BAU_935_Homer);
	Npc_ExchangeRoutine(Homer,"START");
	AI_ContinueRoutine(Homer);
};


instance Sld_700_Lee_FMTaken(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_FMTaken_Condition;
	information = Sld_700_Lee_FMTaken_Info;
	permanent = 1;
	description = "��� �� ������� �� ������ �����?";
};


func int Sld_700_Lee_FMTaken_Condition()
{
	if(FMTaken)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_FMTaken_Info()
{
	AI_Output(other,self,"DIA_Lee_FMTaken_15_00");	//��� �� ������� �� ������ �����?
	if(Lee_freeminereport == 0)
	{
		AI_Output(self,other,"DIA_Lee_FMTaken_08_01");	//��� ����� ������� ������ � ��� �������� �� ����.
	}
	else
	{
		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01");	//������ ��� �� ����� �������!
		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//�� ������ ������ ��� ������ ������. ��� ����� ����� ����, ��� ��.
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//�������. � �����.
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//������!
		AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//����� ��� ���������� ���� � ���� ������������� �� ���� ������ ����.
		AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//��������� ����!
		AI_Output(hero,self,"Info_Exit_Info_15_01");	//��������.
		B_LogEntry(CH4_BannedFromOC,"� ��������������� �� � �������� �� �������� ��������� �����, ������� �� ���������� � ������. �� ������� ����� �������.");
		B_GiveInvItems(self,other,ItArRuneFirestorm,1);
		B_GiveXP(500);
		Lee_freeminereport = 0;
	};
};


instance Sld_700_Lee_CHANGESIDE(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_CHANGESIDE_Condition;
	information = Sld_700_Lee_CHANGESIDE_Info;
	important = 0;
	permanent = 0;
	description = "���� ������� �� ������� ������ � � ���� �������������� � ���!";
};


func int Sld_700_Lee_CHANGESIDE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01");	//���� ������� �� ������� ������ � � ���� �������������� � ���!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//�� ������ ������ ��� ������ ������. ��� ����� ����� ����, ��� ��.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03");	//���� ������. ����� ���������� � ����� ������, �������!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04");	//������ ��� �������. � ���, ��� �� ������ � ����.
	CreateInvItem(self,sld_armor_m);
	B_GiveInvItems(self,hero,sld_armor_m,1);
	Npc_GetInvItemBySlot(hero,INV_ARMOR,2);
	if(Hlp_GetInstanceID(item) == sld_armor_m)
	{
		AI_EquipArmor(hero,item);
	};
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	B_LogEntry(CH4_BannedFromOC,"� ����� ������� �� ������ �������. ����� ���� ��� ������ ������ ���� ������, � ������������� � ���������. ��, � ������ ����� ���������� � ���������.");
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"�� ����� ������� ���� ��������� ��������� �������. ����� ����, �� ����� ������ ��� � ������������ ���� � ��������.");
};


instance Sld_700_Lee_ARMOR(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ARMOR_Condition;
	information = Sld_700_Lee_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "��� ����� ������� �������.";
};


func int Sld_700_Lee_ARMOR_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ARMOR_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01");	//��� ����� ������� �������.
	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02");	//�� ������ ������ �� ���������. �� ������ ��� � ���, ��� ������� ������� ����� ��������.
	Info_ClearChoices(Sld_700_Lee_ARMOR);
	Info_AddChoice(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeMercs,VALUE_SLD_ARMOR_M),Sld_700_Lee_ARMOR_M);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeHeavyMercs,VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};

func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices(Sld_700_Lee_ARMOR);
};

func void Sld_700_Lee_ARMOR_M()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_M_Info_08_01");	//��� ����� ������� �������.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02");	//��� ����� � ���� ��� ������������ �����. ������� �����.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_SLD_ARMOR_M)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03");	//��� ���� �� ��� ��� ����� �� ��������.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04");	//��� ������ �������. ��� ������� ������� ����.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_SLD_ARMOR_M);
		CreateInvItem(hero,sld_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void Sld_700_Lee_ARMOR_H()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_H_Info_08_01");	//��� ����� ������� �������.
	if(Kapitel < 4)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02");	//��� ����� � ���� ��� ������������ �����. ������� �����.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_SLD_ARMOR_H)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03");	//��� ���� �� ��� ��� ����� �� ��������.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04");	//��� ������� - ������ �� ���, ��� ����� �������� ������ �������. � ������ ���, ��� ����� ������� ������������ ���������.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_SLD_ARMOR_H);
		CreateInvItem(hero,sld_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};


instance Sld_700_Lee_Teach(C_Info)
{
	npc = Sld_700_Lee;
	nr = 10;
	condition = Sld_700_Lee_Teach_Condition;
	information = Sld_700_Lee_Teach_Info;
	permanent = 1;
	description = "�� ������ ����-������ ������� ����?";
};


func int Sld_700_Lee_Teach_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00");	//�� ������ ����-������ ������� ����?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01");	//� ���� ������ ���� ����� ����� ������� � ������.
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	Info_ClearChoices(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};


instance Sld_700_Lee_ZWEIHAND1(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND1_Condition;
	information = Sld_700_Lee_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};


func int Sld_700_Lee_ZWEIHAND1_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && (Kapitel >= 4))))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01");	//� ���� ��������� ������� ��������� �����.
	if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02");	//������, ������ � ������ ��������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03");	//����� ��� �������������. ���� ����������� ������� �����, ����� ��������� ���������� ������� �������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04");	//������� ���� � ��� ����������� ����. ������ ����� ����������, ����� ���������� �� ������ �����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05");	//��������� ������� ��������, ����� ��������� � �������� �������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06");	//��������� ��� ������ ������� ��� ������� ������, ����� ������� ���������� �� ����������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07");	//�������, ������ � �����. ��������.
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
};


instance Sld_700_Lee_ZWEIHAND2(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND2_Condition;
	information = Sld_700_Lee_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0);
};


func int Sld_700_Lee_ZWEIHAND2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && (Kapitel >= 4))))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01");	//� ���� ������ ������ � ��������� ����.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02");	//������ �����, ����� �������� ������. ����� ��� �����������, �������� �� ������� ������ ������ � ������ ��� � �������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03");	//������ ������ ������ ��� ���� � ����� ����� �� �����. � ������ - ������� ���� ������!
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04");	//� ���������� �� ����� �� ������� �����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05");	//�� ����� �� ��������� ����� ������� ������ ������� ���� ������, ����� �������� �����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06");	//����������, ����� ������� ���� ������� ������, - � ��� ���� ������� ����!
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07");	//���� ����� �������� ������������, ��� �� ������� ����� �������� � �������� ���������.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08");	//�������� �����, �������� � ���� � ��� �������, ����� ��������� �����.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09");	//������ ������ ������� � ����������� ������ � ������ �����.
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
};


instance SLD_700_LEE_GORN_HELP(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = sld_700_lee_gorn_help_condition;
	information = sld_700_lee_gorn_help_info;
	permanent = 0;
	description = "����� ����� ������������.";
};


func int sld_700_lee_gorn_help_condition()
{
	if(GORNHELP == TRUE)
	{
		return 1;
	};
};

func void sld_700_lee_gorn_help_info()
{
	var C_Npc soeldner_1;
	var C_Npc soeldner_2;
	AI_Output(other,self,"DIA_Lee_Gorn_Help_15_00");	//�� ������ ���������� �� �����. ������ ����� ����� ������������.
	AI_Output(self,other,"DIA_Lee_Gorn_Help_08_01");	//������, � �������� � ����� ���� ���������.
	AI_Output(self,other,"DIA_Lee_Gorn_Help_08_02");	//�� ����� �������� ����� �������.
	B_GiveXP(300);
	B_LogEntry(CH4_GORNHELP,"�� ������ � ����� ���� ���������.");
	soeldner_1 = Hlp_GetNpc(SLD_705_Soeldner);
	soeldner_2 = Hlp_GetNpc(SLD_706_Soeldner);
	B_ExchangeRoutine(soeldner_1,"GornHelp");
	B_ExchangeRoutine(soeldner_2,"GornHelp");
};


instance SLD_700_LEE_GORN_PROHOD(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = sld_700_lee_gorn_prohod_condition;
	information = sld_700_lee_gorn_prohod_info;
	permanent = 0;
	description = "�� ����� ������ � �����.";
};


func int sld_700_lee_gorn_prohod_condition()
{
	if(Npc_KnowsInfo(hero,info_gorn_prohod_found))
	{
		return 1;
	};
};

func void sld_700_lee_gorn_prohod_info()
{
	var C_Npc gorn;
	AI_Output(other,self,"DIA_Lee_Gorn_Prohod_15_00");	//�� � ������ ����� ������ � ����� � ��������� �����. �� ��������� ����� �� ������ �� ��������� ������.
	AI_Output(other,self,"DIA_Lee_Gorn_Prohod_15_01");	//���� ������, ��� ��������� ������ ������.
	AI_Output(self,other,"DIA_Lee_Gorn_Prohod_08_01");	//������. ������ �� �����, ������ ������� ���������.
	B_GiveXP(800);
	Log_SetTopicStatus(CH4_GORNPROHOD,LOG_SUCCESS);
	B_LogEntry(CH4_GORNPROHOD,"�� ������� ������� ���, ��� �� � ������ ���������� ������.");
	gorn = Hlp_GetNpc(PC_Fighter);
	B_ExchangeRoutine(gorn,"WaitFM");
};

