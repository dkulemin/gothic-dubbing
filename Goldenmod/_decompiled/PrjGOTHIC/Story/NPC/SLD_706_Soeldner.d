
instance SLD_706_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = npctype_guard;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 706;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Pony",49,1,sld_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoLoaf,6);
	CreateInvItems(self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems(self,ItFoBooze,4);
	CreateInvItems(self,ItLsTorch,5);
	CreateInvItems(self,ItFo_Potion_Health_02,9);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Amphore_01);
	daily_routine = Rtn_start_706;
};


func void Rtn_start_706()
{
	TA_StandAround(7,30,0,0,"NC_HUT02_OUT");
	TA_Sleep(0,0,7,30,"NC_HUT02_IN");
};

func void rtn_gornhelp_706()
{
	TA_GuardPassage(0,0,12,0,"FMC_PATH28");
	TA_GuardPassage(12,0,0,0,"FMC_PATH28");
};

