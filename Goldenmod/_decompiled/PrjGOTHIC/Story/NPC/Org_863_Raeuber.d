
instance Org_863_Raeuber(Npc_Default)
{
	name[0] = NAME_Raeuber;
	npcType = npctype_main;
	guild = GIL_None;
	level = 12;
	voice = 7;
	id = 863;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",6,1,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoBooze,1);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Teeth_01);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_863;
};


func void Rtn_start_863()
{
	TA_RoastScavenger(13,0,14,0,"LOCATION_11_12");
	TA_RoastScavenger(14,0,13,0,"LOCATION_11_12");
};

func void Rtn_OMFull_863()
{
	TA_RoastScavenger(13,0,14,0,"LOCATION_11_12");
	TA_RoastScavenger(14,0,13,0,"LOCATION_11_12");
};

func void Rtn_FMTaken_863()
{
	TA_RoastScavenger(13,0,14,0,"LOCATION_11_12");
	TA_RoastScavenger(14,0,13,0,"LOCATION_11_12");
};

func void Rtn_OrcAssault_863()
{
	TA_RoastScavenger(13,0,14,0,"LOCATION_11_12");
	TA_RoastScavenger(14,0,13,0,"LOCATION_11_12");
};

