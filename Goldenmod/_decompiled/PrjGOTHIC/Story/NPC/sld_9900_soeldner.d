
instance SLD_9900_SOELDNER(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = npctype_guard;
	guild = GIL_None;
	level = 21;
	voice = 8;
	id = 9900;
	attribute[ATR_STRENGTH] = 79;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 332;
	attribute[ATR_HITPOINTS] = 332;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,2,sld_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems(self,ItFoRice,8);
	CreateInvItems(self,ItFoLoaf,8);
	CreateInvItems(self,ItFoMutton,6);
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems(self,ItFoBooze,6);
	CreateInvItems(self,ItLsTorch,5);
	CreateInvItems(self,ItFo_Potion_Health_02,7);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Amphore_01);
	daily_routine = rtn_start_9900;
};


func void rtn_start_9900()
{
	TA_GuardPalisade(6,30,22,15,"AM_SLD_DMT");
	TA_GuardPalisade(22,15,6,30,"AM_SLD_DMT");
};

