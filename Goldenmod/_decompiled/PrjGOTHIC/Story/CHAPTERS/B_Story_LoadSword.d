
func void B_Story_LoadSword()
{
	var C_Npc milten;
	B_LogEntry(CH5_Uriziel,"Ксардас создал магическую формулу. Теперь мне нужен по-настоящему большой источник магической энергии и маг, который будет мне помогать. К счастью, в колонии есть некая общность, обладающая такой энергией, и эта общность в долгу передо мной...");
	B_GiveXP(XP_ReturnedFromSunkenTower);
	CreateInvItem(hero,Scroll4Milten);
	milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine(milten,"LSWait");
	LoadSword = TRUE;
};

