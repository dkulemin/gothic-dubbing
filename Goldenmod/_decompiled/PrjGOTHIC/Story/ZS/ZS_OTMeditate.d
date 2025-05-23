
func void ZS_OTMeditate()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Meditate");
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_InterceptAssessDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_OTMeditate_AssessMurder);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 3500;
	if(Npc_GetPermAttitude(self,hero) != ATT_HOSTILE)
	{
		Npc_SetPermAttitude(self,ATT_ANGRY);
	};
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"MEDITATE"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"MEDITATE"))
	{
		AI_GotoFP(self,"MEDITATE");
		AI_AlignToFP(self);
	};
	Wld_DetectNpc(self,-1,ZS_Teaching,-1);
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT)
	{
		B_SmartTurnToNpc(self,other);
	};
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
};

func void ZS_OTMeditate_Loop()
{
	var int praytime;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Meditate_Loop");
	praytime = Hlp_Random(100);
	if(praytime <= 2)
	{
		AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
	};
	if(praytime >= 98)
	{
		AI_Output(self,NULL,"ZS_Meditate_Om");	//���...
	};
	AI_Wait(self,1);
};

func void ZS_OTMeditate_End()
{
	C_StopLookAt(self);
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
	PrintDebugNpc(PD_TA_FRAME,"ZS_Meditate_End");
};

func void B_OTMeditate_AssessMurder()
{
	var int npcInstance;
	PrintDebugNpc(PD_TA_FRAME,"B_OTMeditate_AssessMurder");
	PrintGlobals(PD_TA_DETAIL);
	npcInstance = Hlp_GetInstanceID(victim);
	if(npcInstance == GUR_1212_MadCorKalom)
	{
		B_FullStop(self);
		B_WhirlAround(self,other);
		Npc_SetPermAttitude(self,ATT_HOSTILE);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,0,"");
		SLF_FIRE = TRUE;
	};
};

