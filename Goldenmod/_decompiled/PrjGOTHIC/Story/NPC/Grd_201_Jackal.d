
instance Grd_201_Jackal(Npc_Default)
{
	name[0] = "�����";
	npcType = npctype_main;
	guild = GIL_GRD;
	level = 50;
	voice = 7;
	id = 201;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_Fighter",4,1,grd_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Axe_03);
	EquipItem(self,ItRw_Crossbow_03);
	CreateInvItems(self,ItAmBolt,15);
	daily_routine = Rtn_start_201;
};


func void Rtn_start_201()
{
	TA_Stay(6,0,7,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(7,0,8,0,"OCR_OUTSIDE_HUT_42");
	TA_Stay(8,0,9,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(9,0,10,0,"OCR_NORTHGATE_RAMP_BELOW");
	TA_Stay(10,0,11,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(11,0,12,0,"OCR_OUTSIDE_HUT_42");
	TA_Stay(12,0,13,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(13,0,14,0,"OCR_NORTHGATE_RAMP_BELOW");
	TA_Stay(14,0,15,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(15,0,16,0,"OCR_OUTSIDE_HUT_42");
	TA_Stay(16,0,17,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(17,0,18,0,"OCR_NORTHGATE_RAMP_BELOW");
	TA_Stay(18,0,19,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(19,0,20,0,"OCR_OUTSIDE_HUT_42");
	TA_Stay(20,0,21,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(21,0,22,0,"OCR_NORTHGATE_RAMP_BELOW");
	TA_Stay(22,0,23,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(23,0,0,0,"OCR_OUTSIDE_HUT_42");
	TA_Stay(0,0,1,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(1,0,2,0,"OCR_NORTHGATE_RAMP_BELOW");
	TA_Stay(2,0,3,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(3,0,4,0,"OCR_OUTSIDE_HUT_42");
	TA_Stay(4,0,5,0,"OCR_CAMPFIRE_F_1");
	TA_Stay(5,0,6,0,"OCR_NORTHGATE_RAMP_BELOW");
};

func void Rtn_FMTaken_201()
{
	TA_StayNeutral(2,0,3,0,"FMC_FM_ENTRANCE");
	TA_StayNeutral(3,0,2,0,"FMC_FM_ENTRANCE");
};

func void Rtn_FMTaken2_201()
{
	TA_Stay(2,0,3,0,"FMC_FM_ENTRANCE");
	TA_Stay(3,0,2,0,"FMC_FM_ENTRANCE");
};

func void rtn_fmtaking_201()
{
	TA_FollowPC(7,0,20,0,"FM_6");
	TA_FollowPC(20,0,7,0,"FM_6");
};

func void rtn_tofmtaken_201()
{
	TA_Stay(7,0,20,0,"FM_WAR");
	TA_Stay(20,0,7,0,"FM_WAR");
};

func void rtn_endfmtaken_201()
{
	TA_Guard(7,0,20,0,"FM_6");
	TA_Guard(20,0,7,0,"FM_6");
};

