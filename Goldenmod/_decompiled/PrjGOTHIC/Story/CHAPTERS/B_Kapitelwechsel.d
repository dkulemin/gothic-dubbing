
func void B_Kapitelwechsel(var int neues_Kapitel)
{
	var C_Npc YBerion;
	var C_Npc Templer;
	var C_Npc Templer_1;
	var C_Npc Novize;
	var C_Npc Novize_1;
	var C_Npc Quentin;
	var C_Npc Thorus;
	var C_Npc jackal;
	var C_Npc gardist_1;
	var C_Npc gardist_2;
	var C_Npc gardist_3;
	var C_Npc gardist_4;
	var C_Npc gardist_5;
	var C_Npc pacho;
	Kapitel = neues_Kapitel;
	if(neues_Kapitel == 1)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS ERSTES KAPITEL ===---");
		B_Give_SkipChapter2Weapons();
		IntroduceChapter("Глава 1","Добро пожаловать!","chapter1.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 2)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS ZWEITE KAPITEL ===---");
		B_Give_FiskChapter2Weapons();
		B_Give_DarrionChapter2Weapons();
		B_Give_SharkyChapter2Weapons();
		B_Give_BaalCadarChapter2Runes();
		B_Give_TorrezChapter2Runes();
		B_Give_CronosChapter2Runes();
		B_GiveRiordianChapter2Potions();
		B_Give_CavalornChapter2Weapons();
		B_Give_WolfChapter2Weapons();
		B_Give_SkipChapter2Weapons();
		B_Story_RespawnOW();
		B_InsertInExtremo();
		IntroduceChapter("Глава 2","Пещеры ползунов","chapter2.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 3)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS DRITTE KAPITEL ===---");
		YBerion_BringFocus = LOG_SUCCESS;
		CorKalom_BringMCQBalls = LOG_SUCCESS;
		CorKalom_BringBook = LOG_SUCCESS;
		B_Give_FiskChapter3Weapons();
		B_Give_DarrionChapter3Weapons();
		B_Give_SharkyChapter3Weapons();
		B_Give_BaalCadarChapter3Runes();
		B_Give_TorrezChapter3Runes();
		B_Give_TorrezChapter3Runes();
		B_Give_CronosChapter3Runes();
		B_GiveRiordianChapter3Potions();
		B_Give_CavalornChapter3Weapons();
		B_Give_WolfChapter3Weapons();
		B_Give_SkipChapter3Weapons();
		B_KillInExtremo();
		B_InExtremoStopMusic();
		PlayVideo("GREATPRAYER.BIK");
		YBerion = Hlp_GetNpc(GUR_1200_YBerion);
		YBerion.flags = 0;
		Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,-YBerion.attribute[ATR_HITPOINTS_MAX] + 1);
		YBerion.flags = NPC_FLAG_IMMORTAL;
		Npc_ExchangeRoutine(YBerion,"DRAINED");
		AI_ContinueRoutine(YBerion);
		Templer = Hlp_GetNpc(TPL_1431_Templer);
		Templer.senses = hero.senses;
		Templer_1 = Hlp_GetNpc(TPL_1430_Templer);
		Templer_1.senses = hero.senses;
		Novize = Hlp_GetNpc(NOV_1319_Novize);
		Novize.senses = hero.senses;
		Novize_1 = Hlp_GetNpc(NOV_1319_Novize);
		Novize_1.senses = hero.senses;
		IntroduceChapter("Глава 3","Артефакты древних сил","chapter3.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 4)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS VIERTE KAPITEL ===---");
		B_ExchangeRoutine(GRD_205_Scorpio,"BANNISHED");
		B_ChangeGuild(GRD_205_Scorpio,GIL_None);
		B_SetPermAttitude(GRD_205_Scorpio,ATT_NEUTRAL);
		B_ChangeGuild(STT_336_Cavalorn,GIL_None);
		B_ExchangeRoutine(Sld_700_Lee,"DAMNPAST");
		B_ExchangeRoutine(BAU_935_Homer,"DAMNPAST");
		oldHeroGuild = Npc_GetTrueGuild(hero);
		B_ExchangeRoutine(GRD_228_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_230_Gardist,"FMTaken");
		B_ExchangeRoutine(GRD_280_Gardist,"FMTaken");
		B_ClearImmortal(GRD_228_Gardist);
		B_ClearImmortal(GRD_230_Gardist);
		B_ClearImmortal(GRD_280_Gardist);
		Npc_RemoveInvItem(SLD_704_Blade,blade_axt);
		CreateInvItem(SLD_704_Blade,ItMw_1H_Sword_01);
		EquipItem(SLD_704_Blade,ItMw_1H_Sword_01);
		B_ExchangeRoutine(SLD_704_Blade,"camp");
		Wld_InsertItem(blade_axt,"WP_BLADE_AXE");
		B_ChangeGuild(PC_Thief,GIL_KDF);
		B_SetPermAttitude(PC_Thief,ATT_FRIENDLY);
		B_SetPermAttitude(PC_Mage,ATT_FRIENDLY);
		B_SetPermAttitude(PC_Fighter,ATT_FRIENDLY);
		B_SetPermAttitude(PC_FighterFM,ATT_FRIENDLY);
		B_SetPermAttitude(PC_Psionic,ATT_FRIENDLY);
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
		Quentin = Hlp_GetNpc(Org_858_Quentin);
		B_ExchangeRoutine(Quentin,"OMFull");
		B_ExchangeRoutine(GRD_255_Fletcher,"FMTaken");
		B_ExchangeRoutine(GRD_214_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_215_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_233_Bloodwyn,"FMTaken");
		B_ExchangeRoutine(GRD_216_Torwache,"FMTaken");
		B_ExchangeRoutine(GRD_217_Torwache,"FMTaken");
		B_KillNpc(Nov_1330_BaalParvez);
		B_KillNpc(Nov_1331_BaalTaran);
		B_KillNpc(Tpl_1422_GorHanis);
		B_KillNpc(Sld_729_Kharim);
		if(GILBERT_OC == TRUE)
		{
			Log_SetTopicStatus(CH1_GILBERT,LOG_FAILED);
			GILBERT_OC = FALSE;
		};
		if(QUENTIN_OK == TRUE)
		{
			B_ExchangeRoutine(Org_858_Quentin,"qd");
			B_ExchangeRoutine(ORG_888_Erpresser,"qd");
			B_ExchangeRoutine(ORG_889_CoErpresser,"qd");
			Npc_RemoveInvItem(Org_858_Quentin,itwr_old_fire_letter_01);
			Npc_RemoveInvItem(Org_858_Quentin,itwr_old_fire_letter_02);
			Npc_RemoveInvItem(Org_858_Quentin,itwr_list_fire_letter);
			Npc_RemoveInvItem(Org_858_Quentin,itwr_raven_fire_letter);
			B_KillNpc(Org_858_Quentin);
			B_KillNpc(ORG_888_Erpresser);
			B_KillNpc(ORG_889_CoErpresser);
			if((GQ_OK == TRUE) && !Npc_KnowsInfo(hero,org_858_quentin_gorn_ok))
			{
				Log_SetTopicStatus(CH1_GQW,LOG_FAILED);
			};
			if(BDT_QT == TRUE)
			{
				Log_SetTopicStatus(CH1_BDT,LOG_FAILED);
				BDT_QT = FALSE;
			};
		}
		else
		{
			B_ExchangeRoutine(Org_858_Quentin,"OMFull");
		};
		if(Npc_GetTrueGuild(hero) != GIL_GRD)
		{
			Thorus = Hlp_GetNpc(GRD_200_Thorus);
			jackal = Hlp_GetNpc(Grd_201_Jackal);
			gardist_1 = Hlp_GetNpc(GRD_252_Gardist);
			gardist_2 = Hlp_GetNpc(GRD_253_Gardist);
			gardist_3 = Hlp_GetNpc(GRD_244_Gardist);
			gardist_4 = Hlp_GetNpc(GRD_232_Gardist);
			gardist_5 = Hlp_GetNpc(GRD_229_Gardist);
			pacho = Hlp_GetNpc(GRD_224_Pacho);
			Thorus.flags = 0;
			jackal.flags = 0;
			gardist_1.flags = 0;
			gardist_2.flags = 0;
			gardist_3.flags = 0;
			gardist_4.flags = 0;
			gardist_5.flags = 0;
			pacho.flags = 0;
			B_ExchangeRoutine(Thorus,"EndFMTaken");
			B_ExchangeRoutine(jackal,"EndFMTaken");
			B_ExchangeRoutine(gardist_1,"EndFMTaken");
			B_ExchangeRoutine(gardist_2,"EndFMTaken");
			B_ExchangeRoutine(gardist_3,"EndFMTaken");
			B_ExchangeRoutine(gardist_4,"EndFMTaken");
			B_ExchangeRoutine(gardist_5,"EndFMTaken");
			B_ExchangeRoutine(pacho,"EndFMTaken");
			YBerion = Hlp_GetNpc(GUR_1200_YBerion);
			YBerion.flags = 0;
			B_ExchangeRoutine(YBerion,"dead");
			Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,YBerion.attribute[ATR_HITPOINTS_MAX]);
			YBerion.flags = NPC_FLAG_IMMORTAL;
			B_Give_ScorpioChapter4Weapons();
			B_Give_DarrionChapter4Weapons();
			B_Give_SharkyChapter4Weapons();
			B_Give_BaalCadarChapter4Runes();
			B_Give_XardasChapter4Runes();
			B_Give_CronosChapter4Runes();
			B_GiveRiordianChapter4Potions();
			B_Give_CavalornChapter4Weapons();
			B_Give_WolfChapter4Weapons();
			Saturas_BringFoci = 5;
			B_ExchangeRoutine(PC_Thief,"OCWait");
			B_ExchangeRoutine(PC_Mage,"OCWait");
			B_ExchangeRoutine(TPL_1439_GorNaDrak,"FMTaken");
			B_ExchangeRoutine(TPL_1440_Templer,"FMTaken");
			CreateInvItem(hero,ItArRuneTeleport2);
			Log_CreateTopic(CH4_Firemages,LOG_MISSION);
			Log_SetTopicStatus(CH4_Firemages,LOG_RUNNING);
			B_LogEntry(CH4_Firemages,"Сатурас, лидер магов воды, попросил меня сделать ему последнее одолжение: чтобы взорвать гору руды, ему понадобится помощь магов огня из Старого Лагеря. Пока не знаю, как я смогу заставить магов Гомеза уничтожить основу их силы, но придется что-то придумать.");
			B_InitMonsterAttitudes();
			B_KillNpc(KDF_400_Rodriguez);
			B_KillNpc(KDF_401_Damarok);
			B_KillNpc(Kdf_402_Corristo);
			B_KillNpc(KDF_403_Drago);
			B_KillNpc(KDF_405_Torrez);
			Wld_SetObjectRoutine(0,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(1,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(2,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(3,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(4,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(5,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(6,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(7,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(8,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(9,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(10,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(11,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(12,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(13,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(14,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(15,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(16,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(17,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(18,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(19,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(20,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(21,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(22,0,"EVT_AM_LOB_GATE_BIG",1);
			Wld_SetObjectRoutine(23,0,"EVT_AM_LOB_GATE_BIG",1);
			IntroduceChapter("Глава 4","Ксардас","chapter4.tga","levelup.wav",6000);
		};
	}
	else if(neues_Kapitel == 5)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS FЬNFTE KAPITEL ===---");
		B_Give_ScorpioChapter5Weapons();
		B_Give_DarrionChapter5Weapons();
		B_Give_SharkyChapter5Weapons();
		B_Give_XardasChapter5Runes();
		B_Give_CavalornChapter5Weapons();
		B_Give_WolfChapter5Weapons();
		B_Give_CronosChapter5Runes();
		B_GiveRiordianChapter5Potions();
		B_Give_ScorpioChapter6Weapons();
		B_Give_DarrionChapter6Weapons();
		B_Give_SharkyChapter6Weapons();
		B_Give_XardasChapter6Runes();
		B_GiveRiordianChapter6Potions();
		B_Give_CavalornChapter6Weapons();
		B_Give_WolfChapter6Weapons();
		B_LogEntry(CH4_EnterTemple,"Горн сомневается, что Улу-Мулу поможет мне в попасть в город орков без боя. Я узнаю это очень скоро ... так или иначе!");
		B_Story_RespawnOW();
		IntroduceChapter("Глава 5","Хранители портала","chapter5.tga","levelup.wav",6000);
	}
	else if(neues_Kapitel == 6)
	{
		PrintDebugNpc(PD_MISSION,"---=== DAS SECHSTE KAPITEL ===---");
		B_Give_XardasChapter6Runes();
		PlayVideo("OREHEAP.BIK");
		CreateInvItem(hero,Mythrilklinge02);
		IntroduceChapter("Глава 6","Логово Спящего","chapter6.tga","levelup.wav",6000);
	};
};

func int C_IsChapter(var int chapter)
{
	if(Kapitel == chapter)
	{
		return TRUE;
	};
	return FALSE;
};

