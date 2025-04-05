
instance ORG_889_CoErpresser(Npc_Default)
{
	name[0] = "Помощник шантажиста";
	npcType = npctype_ambient;
	guild = GIL_ORG;
	level = 11;
	voice = 7;
	id = 889;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 227;
	attribute[ATR_HITPOINTS] = 227;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Pony",8,1,org_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoBooze,5);
	CreateInvItems(self,ItLsTorch,1);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Teeth_01);
	EquipItem(self,ItMw_1H_Mace_War_01);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = rtn_start_889;
};


func void rtn_start_889()
{
	TA_StandAround(13,0,14,0,"WP_BANDIT_COERPRESSER");
	TA_StandAround(14,0,13,0,"WP_BANDIT_COERPRESSER");
};

func void rtn_qd_889()
{
	TA_StandAround(13,0,14,0,"WP_BANDIT_2_D");
	TA_StandAround(14,0,13,0,"WP_BANDIT_2_D");
};

