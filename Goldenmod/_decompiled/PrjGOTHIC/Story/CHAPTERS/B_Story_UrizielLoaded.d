
func void B_Story_UrizielLoaded()
{
	B_LogEntry(CH5_Uriziel,"�������. ������, ���� ������� ���������. � ���� ������ �������� � ��� ����� ����, ��� ��� ����� �������� �� � ����� �� �����-�� �����. �� ��� � �� �����, ������ ��� ���� ������� ������!");
	if((Npc_GetTrueGuild(hero) != GIL_KDF) && (Npc_GetTrueGuild(hero) != GIL_KDW) && (Npc_GetTrueGuild(hero) != GIL_GUR))
	{
		Log_SetTopicStatus(CH5_Uriziel,LOG_SUCCESS);
	}
	else
	{
		B_LogEntry(CH5_Uriziel,"� ��� ������� ����� ������� ��������, ��� � ����� ������������ ���� �������, ���� ������ �����. �� ������� ���� �������� ���������� ��� ���.");
	};
	B_GiveXP(XP_LoadedUriziel);
	B_SetPermAttitude(Kdw_600_Saturas,ATT_HOSTILE);
	B_SetPermAttitude(Kdw_601_Myxir,ATT_HOSTILE);
	B_SetPermAttitude(Kdw_602_Merdarion,ATT_HOSTILE);
	B_SetPermAttitude(Kdw_603_Nefarius,ATT_HOSTILE);
	B_SetPermAttitude(KDW_604_Cronos,ATT_HOSTILE);
	B_SetPermAttitude(KDW_605_Riordian,ATT_HOSTILE);
	B_ClearImmortal(Kdw_600_Saturas);
	B_ClearImmortal(Kdw_601_Myxir);
	B_ClearImmortal(Kdw_602_Merdarion);
	B_ClearImmortal(Kdw_603_Nefarius);
	B_ClearImmortal(KDW_604_Cronos);
	B_ClearImmortal(KDW_605_Riordian);
	B_SetNpcType(Kdw_600_Saturas,npctype_main);
	B_SetNpcType(Kdw_601_Myxir,npctype_main);
	B_SetNpcType(Kdw_602_Merdarion,npctype_main);
	B_SetNpcType(Kdw_603_Nefarius,npctype_main);
	B_SetNpcType(KDW_604_Cronos,npctype_main);
	B_SetNpcType(KDW_605_Riordian,npctype_main);
};

