
instance GUR_1212_MadCorKalom(Npc_Default)
{
	name[0] = "�������� ��� �����";
	npcType = npctype_main;
	guild = GIL_SFB;
	level = 1000;
	voice = 10;
	id = 1212;
	flags = 0;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 500;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 60;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Psionic",19,0,gur_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	EquipItem(self,Kaloms_Schwert);
	CreateInvItems(self,ItArRunePyrokinesis,1);
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	senses_range = 2000;
	daily_routine = Rtn_OT_1212;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void Rtn_start_1212()
{
	TA_Stay(15,0,22,0,"TPL_408");
	TA_Stay(22,0,15,0,"TPL_408");
};

func void Rtn_OT_1212()
{
	TA_InterceptMadCorKalom(15,0,22,0,"TPL_390");
	TA_InterceptMadCorKalom(22,0,15,0,"TPL_390");
};

