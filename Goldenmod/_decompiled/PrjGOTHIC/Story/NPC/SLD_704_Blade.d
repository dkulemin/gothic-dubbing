
instance SLD_704_Blade(Npc_Default)
{
	name[0] = "Αλειδ";
	npcType = npctype_main;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 704;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Pony",47,2,sld_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,blade_axt);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,22);
	CreateInvItems(self,ItFoRice,9);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems(self,ItFoBooze,7);
	CreateInvItems(self,ItLsTorch,5);
	CreateInvItems(self,ItFo_Potion_Health_02,11);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Mug_01);
	CreateInvItem(self,ItMi_Stuff_Amphore_01);
	daily_routine = Rtn_start_704;
};


func void Rtn_start_704()
{
	TA_Sleep(23,0,7,30,"NC_HUT10_IN");
	TA_Smalltalk(7,30,23,0,"NC_HUT09_OUT");
};

func void rtn_camp_704()
{
	TA_SitAround(23,0,7,30,"BLADE_CAMP");
	TA_SitAround(7,30,23,0,"BLADE_CAMP");
};

func void rtn_nearmine_704()
{
	TA_Guard(23,0,7,30,"WP_BLADE_1");
	TA_Guard(7,30,23,0,"WP_BLADE_1");
};

func void rtn_mine_704()
{
	TA_Guard(23,0,7,30,"WP_BLADE_2");
	TA_Guard(7,30,23,0,"WP_BLADE_2");
};

func void rtn_aftermine_704()
{
	TA_SitAround(23,0,7,30,"OW_BLADE_SIT");
	TA_SitAround(7,30,23,0,"OW_BLADE_SIT");
};

func void rtn_atmine_704()
{
	TA_Guard(23,0,7,30,"WP_BLADE_OW_MINE");
	TA_Guard(7,30,23,0,"WP_BLADE_OW_MINE");
};

