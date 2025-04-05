
instance SLD_9200_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = npctype_main;
	guild = GIL_SLD;
	level = 12;
	voice = 10;
	id = 9200;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,3,"Hum_Head_FatBald",9,2,sld_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoLoaf,6);
	CreateInvItems(self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,22);
	CreateInvItems(self,ItFoBooze,5);
	CreateInvItems(self,ItLsTorch,5);
	CreateInvItems(self,ItFo_Potion_Health_02,7);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Amphore_01);
	daily_routine = rtn_start_9200;
};


func void rtn_start_9200()
{
	TA_SitAround(1,0,13,0,"WP_FM_SLD_2");
	TA_SitAround(13,0,1,0,"WP_FM_SLD_2");
};

func void rtn_mine_9200()
{
	TA_GuardPalisade(1,0,13,0,"OW_SLD_2");
	TA_GuardPalisade(13,0,1,0,"OW_SLD_2");
};

