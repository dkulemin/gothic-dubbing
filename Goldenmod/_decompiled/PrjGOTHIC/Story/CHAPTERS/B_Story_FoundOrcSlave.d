
func void B_Story_FoundOrcSlave()
{
	B_LogEntry(CH4_UluMulu,"� �������� ����� ��-���� � ����� �� ������ �������� ��������� �����. �� �������� ��������. ������ �������� � ���� �� ������ ���������, ������� ������� ��� ������, �� �����. �����, ���� ��� ������. ��������� ���-�� � ������ �������� �����.");
	B_GiveXP(XP_FoundOrcSlave);
	FreemineOrc_SuchePotion = LOG_RUNNING;
};

