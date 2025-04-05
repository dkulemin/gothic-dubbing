
func void B_Story_FoundOrcSlave()
{
	B_LogEntry(CH4_UluMulu,"Я встретил друга Ур-Шака в одном из нижних туннелей Свободной Шахты. Он назвался Тарроком. Таррок отравлен и если не найдет лекарство, которое потерял при побеге, то умрет. Думаю, надо ему помочь. Лекарство где-то в нижних туннелях шахты.");
	B_GiveXP(XP_FoundOrcSlave);
	FreemineOrc_SuchePotion = LOG_RUNNING;
};

