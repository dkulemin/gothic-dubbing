
func void ZS_WaitForPassage()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_WaitForPassage");
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_ObserveIntruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
};

func int ZS_WaitForPassage_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_WaitForPassage_Loop");
	if(Npc_IsWayBlocked(self))
	{
		AI_Wait(self,0.5);
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...Weg nicht mehr geblockt!");
	};
	return 1;
};

func void ZS_WaitForPassage_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_WaitForPassage_End");
};

