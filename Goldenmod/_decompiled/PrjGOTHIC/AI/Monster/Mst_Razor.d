
prototype Mst_Default_Razor(C_Npc)
{
	name[0] = "���������";
	guild = GIL_SNAPPER;
	aivar[AIV_IMPORTANT] = ID_RAZOR;
	level = 20;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1400;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 4;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_Razor_Visuals()
{
	Mdl_SetVisual(self,"Snapper.mds");
	Mdl_SetVisualBody(self,"Raz_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Razor(Mst_Default_Razor)
{
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};

