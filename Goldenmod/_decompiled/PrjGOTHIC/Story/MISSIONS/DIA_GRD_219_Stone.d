
instance DIA_Stone_Hello(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = DIA_Stone_Hello_Condition;
	information = DIA_Stone_Hello_Info;
	permanent = 0;
	description = "Ты кузнец, так?";
};


func int DIA_Stone_Hello_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Stone_Hello_Info()
{
	AI_Output(other,self,"DIA_Stone_Hello_15_00");	//Ты кузнец, так?
	AI_Output(self,other,"DIA_Stone_Hello_06_01");	//Верно.
};


instance DIA_Stone_NotSelling(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = DIA_Stone_NotSelling_Condition;
	information = DIA_Stone_NotSelling_Info;
	permanent = 0;
	description = "И ты продаешь оружие и доспехи?";
};


func int DIA_Stone_NotSelling_Condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_GRD) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Stone_NotSelling_Info()
{
	AI_Output(other,self,"DIA_Stone_NotSelling_15_00");	//И ты продаешь оружие и доспехи?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_01");	//Оружием занимается Скип. Я продаю только доспехи.
	AI_Output(other,self,"DIA_Stone_NotSelling_15_02");	//Какие доспехи у тебя сейчас есть?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_03");	//Только доспехи для стражников. А ты не стражник, так что придется тебе поискать снаряжение где-нибудь в другом месте!
	AI_StopProcessInfos(self);
};


instance GRD_219_Stone_GETSTUFF(C_Info)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_GETSTUFF_Condition;
	information = GRD_219_Stone_GETSTUFF_Info;
	important = 0;
	permanent = 0;
	description = "Мне нужны доспехи.";
};


func int GRD_219_Stone_GETSTUFF_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_219_Stone_GETSTUFF_Info()
{
	AI_Output(other,self,"GRD_219_Stone_GETSTUFF_Info_15_01");	//Мне нужны доспехи.
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_02");	//Значит, Торус принял тебя на службу, а? Поздравляю!
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_03");	//Еще одному не терпится свернуть себе шею ради Гомеза. Впрочем, чего я-то волнуюсь?
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_04");	//Вот, возьми доспехи и меч. Добро пожаловать в Стражу!
	CreateInvItems(self,ItMw_1H_Sword_03,2);
	B_GiveInvItems(self,other,ItMw_1H_Sword_03,2);
	Npc_RemoveInvItem(other,ItMw_1H_Sword_03);
	CreateInvItem(other,grd_armor_l);
	AI_EquipBestArmor(hero);
	AI_EquipBestMeleeWeapon(hero);
	B_LogEntry(GE_BecomeGuard,"Я забрал свои первые доспехи у кузнеца Стоуна. Я мог бы там же купить доспехи и получше, но цена уж очень высока.");
	AI_StopProcessInfos(self);
};


instance GRD_219_Stone_BETTERARMOR(C_Info)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_BETTERARMOR_Condition;
	information = GRD_219_Stone_BETTERARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Мне нужны доспехи получше. ";
};


func int GRD_219_Stone_BETTERARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_219_Stone_GETSTUFF) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void GRD_219_Stone_BETTERARMOR_Info()
{
	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_15_01");	//Мне нужны доспехи получше.
	AI_Output(self,other,"GRD_219_Stone_BETTERARMOR_Info_06_02");	//В свое время он у тебя обязательно будет... Только не забудь подкопить достаточно руды.
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,DIALOG_BACK,GRD_219_Stone_BETTERARMOR_BACK);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,B_BuildBuyArmorString(NAME_StoneHeavyGuards,VALUE_GRD_ARMOR_H),GRD_219_Stone_BETTERARMOR_H);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,B_BuildBuyArmorString(NAME_StoneGuards,VALUE_GRD_ARMOR_M),GRD_219_Stone_BETTERARMOR_M);
};

func void GRD_219_Stone_BETTERARMOR_M()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01");	//Мне нужны обычные доспехи для стражника.
	if(Kapitel < 3)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02");	//Торус сказал: прежде чем получить новые доспехи, ты еще послужишь стражником!
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_GRD_ARMOR_M)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//Доспехи для стражника у меня есть, но не похоже, чтобы у тебя была с собой руда. Возвращайся, когда у тебя будет, чем заплатить!
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//Хорошо, новые доспехи для нового стражника! Не позволяй наемникам дырявить его, ха-ха-ха!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_GRD_ARMOR_M);
		B_GiveInvItems(self,hero,grd_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01");	//Мне нужны тяжелые доспехи.
	if(HERO_IS_GRD != TRUE)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02");	//Такие доспехи получают только стражники высшего класса и я боюсь тебе до них еще далеко, малыш.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_GRD_ARMOR_H)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_01");	//У тебя недостаточно руды.
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_03");	//Хорошо, вот доспех.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_GRD_ARMOR_H);
		B_GiveInvItems(self,hero,grd_armor_h,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_BACK()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Я передумал.
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02");	//Делай, как хочешь. Ты знаешь, где меня найти.
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};


instance DIA_GRD_219_Stone_Exit(C_Info)
{
	npc = GRD_219_Stone;
	nr = 999;
	condition = DIA_GRD_219_Stone_Exit_Condition;
	information = DIA_GRD_219_Stone_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GRD_219_Stone_Exit_Condition()
{
	return 1;
};

func void DIA_GRD_219_Stone_Exit_Info()
{
	var C_Npc Stone;
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone4))
	{
		AI_StopProcessInfos(self);
		Stone = Hlp_GetNpc(GRD_219_Stone);
		TA_BeginOverlay(Stone);
		TA_Min(Stone,0,0,0,5,ZS_Position,"OCC_MERCS_HALLWAY_BACK");
		TA_Min(Stone,0,5,0,10,ZS_Position,"OCC_MERCS_ENTRANCE");
		TA_Min(Stone,0,10,0,15,ZS_Position,"OCC_SHADOWS_CORNER");
		TA_Min(Stone,0,15,0,20,ZS_Position,"OCC_STABLE_ENTRANCE");
		TA_Min(Stone,0,20,72,0,ZS_Position,"OCC_STABLE_LEFT_FRONT");
		TA_EndOverlay(Stone);
		AI_Output(self,other,"Info_EXIT_06_02");	//Увидимся.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_EXIT_06_03");	//Увидимся.
		AI_StopProcessInfos(self);
	};
};


instance DIA_GRD_219_Stone(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone_Condition;
	information = DIA_GRD_219_Stone_Info;
	important = 1;
	permanent = 0;
};


func int DIA_GRD_219_Stone_Condition()
{
	if(Kapitel >= 5)
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone_Info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone_06_01");	//Что тебе нужно? Ты не похож на прихвостней Гомеза.
};


instance DIA_GRD_219_Stone1(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone1_Condition;
	information = DIA_GRD_219_Stone1_Info;
	important = 0;
	permanent = 0;
	description = "Ты прав, я не служу Гомезу.";
};


func int DIA_GRD_219_Stone1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone1_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_01");	//Ты прав, я не служу Гомезу.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_02");	//Тогда что ты здесь делаешь? Ключи от камер находятся у Гомеза...
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_03");	//Он дал их мне.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_04");	//Уж не хочешь ли ты сказать, что это ты тот парень, который уделал Гомеза?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_05");	//Точно так.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_06");	//Парень, вот уж никогда бы не подумал! Но я рад, что этот паршивый головорез наконец-то получил по заслугам!
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_07");	//Но зачем ты спасаешь меня?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_08");	//Я слышал, что ты угодил за решетку, и воспользовался удобным случаем, чтобы избавиться от Гомеза и освободить тебя.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_09");	//Спасибо...
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_10");	//... За мной должок. Заходи ко мне в кузницу, поговорим.
	Npc_ExchangeRoutine(self,"OTNEW");
};


instance DIA_GRD_219_Stone3(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone3_Condition;
	information = DIA_GRD_219_Stone3_Info;
	important = 1;
	permanent = 0;
};


func int DIA_GRD_219_Stone3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone1) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_STABLE_LEFT_FRONT"))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone3_Info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_01");	//А вот и ты. Я должен как-то отблагодарить тебя, за то что ты вытащил меня из той крысиной дыры!
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_02");	//И знаешь, я подумал: мне ведь совсем нечего подарить тебе, так лучше я что-нибудь для тебя скую.
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_03");	//Кольцо или что-то вроде того...
};


instance DIA_GRD_219_Stone2(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone2_Condition;
	information = DIA_GRD_219_Stone2_Info;
	important = 0;
	permanent = 0;
	description = "Как ты угодил за решетку?";
};


func int DIA_GRD_219_Stone2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone2_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone2_15_01");	//Как ты угодил за решетку?
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_02");	//Гомез! Этот ублюдок обвинил меня в сговоре с магами Огня. Он и не убил-то меня только потому, что я лучший кузнец во всем Старом Лагере.
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_03");	//Меня швырнули в эту крысиную дыру и доставали оттуда, только когда нужно было сделать что-то для Гомеза.
};


instance DIA_GRD_219_Stone4(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone4_Condition;
	information = DIA_GRD_219_Stone4_Info;
	important = 0;
	permanent = 0;
	description = "Ты можешь укрепить эти доспехи?";
};


func int DIA_GRD_219_Stone4_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && Npc_HasItems(hero,ore_armor_m) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone4_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone4_15_01");	//Ты можешь укрепить эти доспехи?
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_02");	//Конечно. Давай их сюда и подожди минутку.
	AI_UnequipArmor(hero);
	B_GiveInvItems(hero,self,ore_armor_m,1);
	Npc_RemoveInvItem(self,ore_armor_m);
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	CreateInvItem(self,ore_armor_h);
	B_GiveInvItems(self,hero,ore_armor_h,1);
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_03");	//Вот тебе усиленные доспехи. Теперь мы в расчете.
	KnowStone = 1;
};


instance DIA_GRD_219_Stone5(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone5_Condition;
	information = DIA_GRD_219_Stone5_Info;
	important = 0;
	permanent = 0;
	description = "С помощью кольца я мог бы повысить запас здоровья.";
};


func int DIA_GRD_219_Stone5_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone5_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone5_15_01");	//С помощью кольца я мог бы повысить запас здоровья.
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_02");	//Это совсем не сложно, подожди минутку.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_03");	//Кольцо Здоровья даст тебе дополнительный запас жизненных сил. Теперь мы в расчете - этого должно быть более чем достаточно.
	CreateInvItem(self,Ring_des_Lebens2);
	B_GiveInvItems(self,other,Ring_des_Lebens2,1);
	KnowStone = 1;
};


instance DIA_GRD_219_Stone6(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone6_Condition;
	information = DIA_GRD_219_Stone6_Info;
	important = 0;
	permanent = 0;
	description = "Кольцо пригодилось бы мне для защиты.";
};


func int DIA_GRD_219_Stone6_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone6_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone6_15_01");	//Кольцо пригодилось бы мне для защиты.
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_02");	//Кольцо Защиты? Хорошо, я начну прямо сейчас. Подожди немного.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_03");	//Тебе было нужно Кольцо Защиты - ты его получил, так что теперь мы в расчете.
	CreateInvItem(self,Schutzring_Total2);
	B_GiveInvItems(self,other,Schutzring_Total2,1);
	KnowStone = 1;
};


instance DIA_GRD_219_Stone7(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone7_Condition;
	information = DIA_GRD_219_Stone7_Info;
	important = 0;
	permanent = 0;
	description = "Мне нужно что-нибудь, чтобы повысить мою магическую силу.";
};


func int DIA_GRD_219_Stone7_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone7_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone7_15_01");	//Мне нужно что-нибудь, чтобы повысить мою магическую силу.
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_02");	//...Что-нибудь, чтобы повысить магическую силу?.. Амулет! Хорошо, я скую для тебя Амулет Магии. Это не займет много времени.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_03");	//Ну вот, амулет готов. Скажу без лишней скромности - это хорошая работа. Теперь мы в расчете.
	CreateInvItem(self,Amulett_der_Magie);
	B_GiveInvItems(self,other,Amulett_der_Magie,1);
	KnowStone = 1;
};


instance DIA_STONE_GILBERT(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = dia_stone_gilbert_condition;
	information = dia_stone_gilbert_info;
	permanent = 0;
	description = "Что ты знаешь о Жильбере?";
};


func int dia_stone_gilbert_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_gilbert_about) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_stone_gilbert_info()
{
	AI_Output(other,self,"DIA_Stone_Gilbert_15_00");	//Что ты знаешь о Жильбере?
	AI_Output(self,other,"DIA_Stone_Gilbert_06_01");	//Я не знаю никакого Жильбера.
	AI_Output(other,self,"DIA_Stone_Gilbert_15_01");	//Он работал в этой кузнице.
	AI_Output(self,other,"DIA_Stone_Gilbert_06_02");	//Когда я попал сюда, он здесь уже не работал.
};


instance DIA_STONE_TRADE_SWORD(C_Info)
{
	npc = GRD_219_Stone;
	nr = 600;
	condition = dia_stone_trade_sword_condition;
	information = dia_stone_trade_sword_info;
	permanent = 0;
	description = "(продать оружие)";
};


func int dia_stone_trade_sword_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Stone_Hello))
	{
		return 1;
	};
};

func void dia_stone_trade_sword_info()
{
	AI_Output(other,self,"DIA_Stone_TRADE_SWORD_15_00");	//Я хочу продать выкованные мной мечи.
	if(Npc_KnowsInfo(hero,DIA_Stone_NotSelling))
	{
		AI_Output(self,other,"DIA_Stone_TRADE_SWORD_06_00");	//Как я уже сказал, оружием занимается Скип.
	}
	else
	{
		AI_Output(self,other,"DIA_Stone_TRADE_SWORD_06_01");	//Поговори об этом со Скипом.
	};
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Скип может покупать оружие, сделанное мной.");
};

