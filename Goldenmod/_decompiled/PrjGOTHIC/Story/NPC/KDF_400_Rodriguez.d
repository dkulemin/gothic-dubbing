
instance KDF_400_Rodriguez(Npc_Default)
{
	name[0] = "Родригез";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 25;
	voice = 12;
	id = 400;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 90;
	attribute[ATR_MANA] = 90;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",6,1,kdf_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,ItArRuneFirebolt);
	CreateInvItem(self,ItMi_Stuff_OldCoin_02);
	daily_routine = Rtn_start_400;
};


func void Rtn_start_400()
{
	TA_SitCampfire(22,0,7,0,"OCC_CHAPEL_MAGE_03");
	TA_Smalltalk(7,0,22,0,"OCC_CENTER_2");
};

func void Rtn_KDFRITUAL_400()
{
	TA_Position(8,0,20,0,"OCC_CHAPEL_MAGE_01");
	TA_Position(20,0,8,0,"OCC_CHAPEL_MAGE_01");
};

