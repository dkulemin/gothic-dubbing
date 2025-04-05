
instance SLD_9704_BLADE(Npc_Default)
{
	name[0] = "Αλειδ";
	npcType = npctype_main;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 9704;
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
	daily_routine = rtn_start_9704;
};


func void rtn_start_9704()
{
	TA_Guard(23,0,7,30,"MINE_BLADE_1");
	TA_Guard(7,30,23,0,"MINE_BLADE_1");
};

func void rtn_seek_9704()
{
	TA_FollowPC(23,0,7,30,"MINE_BLADE_1");
	TA_FollowPC(7,30,23,0,"MINE_BLADE_1");
};

func void rtn_mine_9704()
{
	TA_Guard(23,0,7,30,"MINE_BLADE_3");
	TA_Guard(7,30,23,0,"MINE_BLADE_3");
};

func void rtn_run_9704()
{
	TA_FollowPC(23,0,7,30,"WP_BLADE_AM_MINE");
	TA_FollowPC(7,30,23,0,"WP_BLADE_AM_MINE");
};

func void rtn_atmine_9704()
{
	TA_Guard(23,0,7,30,"WP_BLADE_AM_MINE");
	TA_Guard(7,30,23,0,"WP_BLADE_AM_MINE");
};

