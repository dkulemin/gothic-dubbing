
instance GRD_224_Pacho(Npc_Default)
{
	name[0] = "����";
	npcType = npctype_main;
	guild = GIL_GRD;
	level = 10;
	voice = 13;
	id = 224;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",4,1,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	CreateInvItem(self,ItMw_1H_Sword_01);
	CreateInvItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_224;
	fight_tactic = FAI_HUMAN_Strong;
};


func void Rtn_start_224()
{
	TA_SitAround(0,0,12,0,"OW_PATH_018");
	TA_SitAround(12,0,24,0,"OW_PATH_018");
};

func void rtn_fmtaking_224()
{
	TA_FollowPC(7,0,20,0,"FM_END");
	TA_FollowPC(20,0,7,0,"FM_END");
};

func void rtn_tofmtaken_224()
{
	TA_Stay(7,0,20,0,"FM_WAR");
	TA_Stay(20,0,7,0,"FM_WAR");
};

func void rtn_endfmtaken_224()
{
	TA_Guard(7,0,20,0,"FM_END");
	TA_Guard(20,0,7,0,"FM_END");
};

