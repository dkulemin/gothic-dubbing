
instance NOV_9000_ESCAPED(Npc_Default)
{
	name[0] = "—бежавший послушник";
	npcType = npctype_main;
	guild = GIL_None;
	level = 10;
	voice = 3;
	id = 9000;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 22;
	attribute[ATR_MANA] = 22;
	attribute[ATR_HITPOINTS_MAX] = 152;
	attribute[ATR_HITPOINTS] = 152;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",22,1,nov_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Mace_04);
	CreateInvItem(self,yberion_magic_amulette);
	CreateInvItem(self,Ring_der_Magie);
	CreateInvItem(self,Machtring);
	CreateInvItem(self,ItArScrollIcecube);
	CreateInvItem(self,ItArScrollChainLightning);
	CreateInvItem(self,ItArRuneFirebolt);
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItMiJoint_1,1);
	daily_routine = rtn_start_9000;
};


func void rtn_start_9000()
{
	TA_SitAround(8,0,23,0,"NOV_1");
	TA_SitAround(23,0,8,0,"NOV_1");
};

