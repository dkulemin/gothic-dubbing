
func int Spell_Logic_Teleport5(var int manaInvested)
{
	var C_Npc Thorus;
	var C_Npc jackal;
	var C_Npc gardist_1;
	var C_Npc gardist_2;
	var C_Npc gardist_3;
	var C_Npc gardist_4;
	var C_Npc gardist_5;
	var C_Npc pacho;
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Teleport5");
	if(manaInvested >= SPL_SENDCAST_TELEPORT)
	{
		if(Npc_KnowsInfo(hero,thorus_freemine_war_end) && (Npc_GetTrueGuild(other) == GIL_GRD) && (FMTaken == TRUE))
		{
			Thorus = Hlp_GetNpc(GRD_200_Thorus);
			jackal = Hlp_GetNpc(Grd_201_Jackal);
			gardist_1 = Hlp_GetNpc(GRD_252_Gardist);
			gardist_2 = Hlp_GetNpc(GRD_253_Gardist);
			gardist_3 = Hlp_GetNpc(GRD_244_Gardist);
			gardist_4 = Hlp_GetNpc(GRD_232_Gardist);
			gardist_5 = Hlp_GetNpc(GRD_229_Gardist);
			pacho = Hlp_GetNpc(GRD_224_Pacho);
			Thorus.flags = 0;
			jackal.flags = 0;
			gardist_1.flags = 0;
			gardist_2.flags = 0;
			gardist_3.flags = 0;
			gardist_4.flags = 0;
			gardist_5.flags = 0;
			pacho.flags = 0;
			B_SetPermAttitude(Thorus,ATT_HOSTILE);
			B_SetPermAttitude(jackal,ATT_HOSTILE);
			B_SetPermAttitude(gardist_1,ATT_HOSTILE);
			B_SetPermAttitude(gardist_2,ATT_HOSTILE);
			B_SetPermAttitude(gardist_3,ATT_HOSTILE);
			B_SetPermAttitude(gardist_4,ATT_HOSTILE);
			B_SetPermAttitude(gardist_5,ATT_HOSTILE);
			B_SetPermAttitude(pacho,ATT_HOSTILE);
			Thorus.npcType = Npctype_ROGUE;
			jackal.npcType = Npctype_ROGUE;
			gardist_1.npcType = Npctype_ROGUE;
			gardist_2.npcType = Npctype_ROGUE;
			gardist_3.npcType = Npctype_ROGUE;
			gardist_4.npcType = Npctype_ROGUE;
			gardist_5.npcType = Npctype_ROGUE;
			pacho.npcType = Npctype_ROGUE;
			Npc_SetTrueGuild(hero,GIL_None);
			hero.guild = GIL_None;
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Это была плохая идея, телепортироваться в Болотный лагерь на глазах у стражников. Похоже, теперь они считают меня предателем.");
			NA_GIL = FALSE;
		};
		AI_Teleport(self,"PSI_TEMPLE_COURT_GURU");
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

