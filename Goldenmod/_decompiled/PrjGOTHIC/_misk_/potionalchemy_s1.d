
func void potionalchemy_s1()
{
	var C_Npc her;
	var C_Npc rock;
	her = Hlp_GetNpc(PC_Hero);
	rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		PLAYER_MOBSI_PRODUCTION = 2;
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_ProcessInfos(her);
	};
};


instance PC_NOALCHEMY(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_noalchemy_condition;
	information = pc_noalchemy_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_noalchemy_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == 2)
	{
		return 1;
	};
};

func void pc_noalchemy_info()
{
	CreateInvItems(self,ItMiFlask,1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_MAINALCHEMY(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_mainalchemy_condition;
	information = pc_mainalchemy_info;
	important = 0;
	permanent = 1;
	description = "Ёликсир дл€ ё'Ѕериона.";
};


func int pc_mainalchemy_condition()
{
	if((POTION_FOR_YBERION == 1) && (PLAYER_MOBSI_PRODUCTION == 2))
	{
		return 1;
	};
};

func void pc_mainalchemy_info()
{
	if(Npc_HasItems(self,ItFo_Plants_Herb_03) >= 5)
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,5);
		CreateInvItems(self,HealthWater,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_KALOMSRECIPEALCHEMY(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_kalomsrecipealchemy_condition;
	information = pc_kalomsrecipealchemy_info;
	important = 0;
	permanent = 1;
	description = "Ёликсир по рецепту  ор √алома.";
};


func int pc_kalomsrecipealchemy_condition()
{
	if((POTION_BY_CORKALOM == TRUE) && (PLAYER_MOBSI_PRODUCTION == 2))
	{
		return 1;
	};
};

func void pc_kalomsrecipealchemy_info()
{
	if(HERO_KNOWS_ALCHEMY == TRUE)
	{
		if((Npc_HasItems(self,ItFo_Plants_Herb_03) >= 1) && (Npc_HasItems(self,ItFo_Plants_Velayis_01) >= 1) && (Npc_HasItems(self,ItFo_Plants_RavenHerb_01) >= 2) && (Npc_HasItems(self,ItFo_Plants_mountainmoos_02) >= 1))
		{
			Print(PRINT_POTIONMADE);
			Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,1);
			Npc_RemoveInvItems(self,ItFo_Plants_Velayis_01,1);
			Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,2);
			Npc_RemoveInvItems(self,ItFo_Plants_mountainmoos_02,1);
			CreateInvItems(self,itfo_potion_health_perma_kalomsrecipe,1);
			POTION_FOR_YBERION = 0;
		}
		else
		{
			Print(PRINT_PRODITEMSMISSING);
			CreateInvItems(self,ItMiFlask,1);
		};
	}
	else
	{
		Print("я не умею готовить эликсиры...");
		CreateInvItems(self,ItMiFlask,1);
	};
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_HEALTHALCHEMY(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_healthalchemy_condition;
	information = pc_healthalchemy_info;
	important = 0;
	permanent = 1;
	description = "Ёликсиры исцелени€";
};


func int pc_healthalchemy_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == 2)
	{
		return 1;
	};
};

func void pc_healthalchemy_info()
{
	Info_AddChoice(pc_healthalchemy,"Ќј«јƒ",pc_healthalchemy_back);
	if(HERO_KNOWS_HEALTH_3 == TRUE)
	{
		Info_AddChoice(pc_healthalchemy,"÷елебный эликсир",pc_healthalchemy_c);
	};
	if(HERO_KNOWS_HEALTH_2 == TRUE)
	{
		Info_AddChoice(pc_healthalchemy,"¬ыт€жка исцелени€",pc_healthalchemy_b);
	};
	if(HERO_KNOWS_HEALTH_1 == TRUE)
	{
		Info_AddChoice(pc_healthalchemy,"Ёссенци€ исцелени€",pc_healthalchemy_a);
	};
};

func void pc_healthalchemy_a()
{
	if(Npc_HasItems(self,ItFo_Plants_Herb_01) >= 3)
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_01,3);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_healthalchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_healthalchemy_b()
{
	if(Npc_HasItems(self,ItFo_Plants_Herb_02) >= 3)
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_02,3);
		CreateInvItems(self,ItFo_Potion_Health_02,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_healthalchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_healthalchemy_c()
{
	if(Npc_HasItems(self,ItFo_Plants_Herb_03) >= 3)
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,3);
		CreateInvItems(self,ItFo_Potion_Health_03,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_healthalchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_healthalchemy_back()
{
	Info_ClearChoices(pc_healthalchemy);
};


instance PC_MANAALCHEMY(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_manaalchemy_condition;
	information = pc_manaalchemy_info;
	important = 0;
	permanent = 1;
	description = "Ёликсиры маны";
};


func int pc_manaalchemy_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == 2)
	{
		return 1;
	};
};

func void pc_manaalchemy_info()
{
	Info_AddChoice(pc_manaalchemy,"Ќј«јƒ",pc_manaalchemy_back);
	if(HERO_KNOWS_MANA_3 == TRUE)
	{
		Info_AddChoice(pc_manaalchemy,"Ёликсир магической энергии",pc_manaalchemy_c);
	};
	if(HERO_KNOWS_MANA_2 == TRUE)
	{
		Info_AddChoice(pc_manaalchemy,"¬ыт€жка магической энергии",pc_manaalchemy_b);
	};
	if(HERO_KNOWS_MANA_1 == TRUE)
	{
		Info_AddChoice(pc_manaalchemy,"Ёссенци€ магической энергии",pc_manaalchemy_a);
	};
};

func void pc_manaalchemy_a()
{
	if(Npc_HasItems(self,ItFo_Plants_RavenHerb_02) >= 3)
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_02,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_manaalchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_manaalchemy_b()
{
	if(Npc_HasItems(self,ItFo_Plants_Stoneroot_01) >= 3)
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Stoneroot_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_02,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_manaalchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_manaalchemy_c()
{
	if(Npc_HasItems(self,ItFo_Plants_Stoneroot_02) >= 3)
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Stoneroot_02,3);
		CreateInvItems(self,ItFo_Potion_Mana_03,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_manaalchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_manaalchemy_back()
{
	Info_ClearChoices(pc_manaalchemy);
};


instance PC_HASTEALCHEMY(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = pc_hastealchemy_condition;
	information = pc_hastealchemy_info;
	important = 0;
	permanent = 1;
	description = "Ёликсиры скорости";
};


func int pc_hastealchemy_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == 2)
	{
		return 1;
	};
};

func void pc_hastealchemy_info()
{
	Info_AddChoice(pc_hastealchemy,"Ќј«јƒ",pc_hastealchemy_back);
	if(HERO_KNOWS_HASTE_3 == TRUE)
	{
		Info_AddChoice(pc_hastealchemy,"Ёликсир скорости",pc_hastealchemy_c);
	};
	if(HERO_KNOWS_HASTE_2 == TRUE)
	{
		Info_AddChoice(pc_hastealchemy,"Ёликсир быстроты",pc_hastealchemy_b);
	};
	if(HERO_KNOWS_HASTE_1 == TRUE)
	{
		Info_AddChoice(pc_hastealchemy,"Ёликсир проворства",pc_hastealchemy_a);
	};
};

func void pc_hastealchemy_a()
{
	if((Npc_HasItems(self,ItFo_Plants_Seraphis_01) >= 1) && (Npc_HasItems(self,ItFo_Plants_Nightshadow_01) >= 1))
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_01,1);
		CreateInvItems(self,ItFo_Potion_Haste_01,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_hastealchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_hastealchemy_b()
{
	if((Npc_HasItems(self,ItFo_Plants_Seraphis_01) >= 1) && (Npc_HasItems(self,ItFo_Plants_Nightshadow_02) >= 1))
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_02,1);
		CreateInvItems(self,ItFo_Potion_Haste_02,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_hastealchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_hastealchemy_c()
{
	if((Npc_HasItems(self,ItFo_Plants_Seraphis_01) >= 1) && (Npc_HasItems(self,ItFo_Plants_mountainmoos_01) >= 1))
	{
		Print(PRINT_POTIONMADE);
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Haste_03,1);
		POTION_FOR_YBERION = 0;
	}
	else
	{
		Print(PRINT_PRODITEMSMISSING);
		CreateInvItems(self,ItMiFlask,1);
	};
	Info_ClearChoices(pc_hastealchemy);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = 0;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

func void pc_hastealchemy_back()
{
	Info_ClearChoices(pc_hastealchemy);
};

