
func void B_Story_AccessToXardas()
{
	CreateInvItem(hero,ItArRuneTeleport3);
	B_LogEntry(CH4_FindXardas,"я передал все три сердца големов демону-охраннику. ¬ обмен получил магическую руну портала. Ќадо проверить, куда она мен€ приведет.");
	B_GiveXP(XP_DeliveredGolemhearts);
	FindGolemHearts = 4;
};

