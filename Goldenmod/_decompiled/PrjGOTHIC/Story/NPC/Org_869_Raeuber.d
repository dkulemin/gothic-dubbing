
instance Org_869_Raeuber(Npc_Default)
{
	name[0] = "������";
	npcType = npctype_main;
	guild = GIL_None;
	level = 12;
	voice = 13;
	id = 869;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,20);
	CreateInvItems(self,ItMiNugget,110);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoBooze,17);
	CreateInvItems(self,ItLsTorch,3);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItem(self,ItMi_Stuff_Plate_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItAt_Claws_01);
	EquipItem(self,ItMw_1H_Mace_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_start_869;
};


func void Rtn_start_869()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_14");
	TA_StandAround(14,0,13,0,"LOCATION_11_14");
};

func void Rtn_OMFull_869()
{
	TA_StandAround(13,0,14,0,"LOCATION_11_14");
	TA_StandAround(14,0,13,0,"LOCATION_11_14");
};

