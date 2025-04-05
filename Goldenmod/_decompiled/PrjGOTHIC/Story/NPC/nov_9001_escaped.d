
instance NOV_9001_ESCAPED(Npc_Default)
{
	name[0] = "—бежавший послушник";
	npcType = npctype_main;
	guild = GIL_None;
	level = 15;
	voice = 1;
	id = 9001;
	flags = 0;
	attribute[ATR_STRENGTH] = 27;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 19;
	attribute[ATR_MANA] = 19;
	attribute[ATR_HITPOINTS_MAX] = 106;
	attribute[ATR_HITPOINTS] = 106;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",26,3,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	EquipItem(self,ItMw_1H_Hatchet_01);
	CreateInvItem(self,Schutzamulett_Waffen);
	CreateInvItem(self,Schutzring_Feuer1);
	CreateInvItems(self,ItArScrollFireball,3);
	CreateInvItem(self,ItArRuneThunderball);
	CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
	CreateInvItems(self,ItMiNugget,7);
	CreateInvItems(self,ItFoRice,3);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItMiJoint_1,4);
	daily_routine = rtn_start_9001;
};


func void rtn_start_9001()
{
	TA_SitAround(7,0,19,0,"NOV_2");
	TA_SitAround(19,0,7,0,"NOV_2");
};

