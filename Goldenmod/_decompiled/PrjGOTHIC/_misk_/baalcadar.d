
var C_Npc BAALCADAR;
var C_Npc BAALORUN;
var C_Npc BAALTYON;
var C_Npc BAALNAMIB;
var C_Npc BAALTONDRAL;
instance Info_Yberion_EXIT(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 999;
	condition = Info_Yberion_EXIT_Condition;
	information = Info_Yberion_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Yberion_EXIT_Condition()
{
	return 1;
};

func void Info_Yberion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_YBerion_Wache(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Wache_Condition;
	information = DIA_YBerion_Wache_Info;
	permanent = 1;
	important = 1;
};


func int DIA_YBerion_Wache_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void DIA_YBerion_Wache_Info()
{
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//Что ты здесь делаешь? Кто тебя впустил? Стража!
	B_IntruderAlert(self,other);
	AI_StopProcessInfos(self);
};


instance DIA_YBerion_Kennen(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Kennen_Condition;
	information = DIA_YBerion_Kennen_Info;
	permanent = 0;
	description = "Приветствую вас, господин Ю'Берион!";
};


func int DIA_YBerion_Kennen_Condition()
{
	if(Kapitel == 2)
	{
		return 1;
	};
};

func void DIA_YBerion_Kennen_Info()
{
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00");	//Приветствую вас, господин Ю'Берион!
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//А! Я тебя знаю!
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//Это невозможно. Мы никогда не встречались прежде.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//Но мне казалось... Хорошо - что тебе нужно?
};


instance Info_YBerion_BringFocus(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = Info_YBerion_BringFocus_Condition;
	information = Info_YBerion_BringFocus_Info;
	permanent = 1;
	description = "Я слышал, вы кое-что ищете.";
};


func int Info_YBerion_BringFocus_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_YBerion_Kennen) && (Npc_GetTrueGuild(hero) != GIL_None) && (YBerion_BringFocus != LOG_RUNNING) && (YBerion_BringFocus != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//Я слышал, вы кое-что ищете.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//Верно. Нам нужен магический юнитор.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//Мы послали одного из новичков - Нираса - забрать его, но он до сих пор не вернулся.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//Не мог бы ты узнать, что произошло?
	Info_ClearChoices(Info_YBerion_BringFocus);
	Info_AddChoice(Info_YBerion_BringFocus,DIALOG_BACK,Info_YBerion_BringFocus_BACK);
	Info_AddChoice(Info_YBerion_BringFocus,"Я принесу вам юнитор.",Info_YBerion_BringFocus_OK);
	Info_AddChoice(Info_YBerion_BringFocus,"Откуда я должен начать поиски?",Info_YBerion_BringFocus_WO);
	Info_AddChoice(Info_YBerion_BringFocus,"Почему этот юнитор так важен?",Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK()
{
	Info_ClearChoices(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//Я принесу вам юнитор.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//Возьми эту карту. На ней отмечено место, где находится юнитор.
	B_Story_BringFirstFocus();
	B_LogEntry(CH2_Focus,"Ю'Берион послал новичка Нираса за юнитором, но парнишка так и не вернулся. Гуру дал мне карту с маршрутом с магическому камню.");
};

func void Info_YBerion_BringFocus_WO()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//Откуда я должен начать поиски?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//На выходе из Лагеря поверни направо и поднимайся на высокую скалу. За лесом ты увидишь море, и там ты найдешь юнитор.
};

func void Info_YBerion_BringFocus_FOKUS()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//Почему этот юнитор так важен?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//Этот магический артефакт способен концентрировать нашу силу.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//Это один из пяти камней, с помощью которых маги сотворили Барьер.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//Мне было видение о том, что мы должны использовать силу этого камня.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//Какое интересное видение!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//Мое видение было ниспослано Спящим. Мы сможем призвать его с помощью юнитора!
};


instance Info_YBerion_BringFocus_RUNNING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_RUNNING_Condition;
	information = Info_YBerion_BringFocus_RUNNING_Info;
	permanent = 0;
	description = "Я так и не нашел юнитор.";
};


func int Info_YBerion_BringFocus_RUNNING_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && !Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_YBerion_BringFocus_RUNNING_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//Я так и не нашел юнитор.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//Ну так ищи его! Спящий укажет тебе путь.
};


instance Info_YBerion_BringFocus_Success(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_Success_Condition;
	information = Info_YBerion_BringFocus_Success_Info;
	permanent = 0;
	description = "Я нашел юнитор.";
};


func int Info_YBerion_BringFocus_Success_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Success_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//Я нашел юнитор.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//Превосходно! Ты оказал нам всем неоценимую услугу.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//Теперь отнеси юнитор Кор Галому. Он знает, что делать.
	if(Kalom_TalkedTo == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//Где я могу найти этого Кор Галома?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//Большую часть времени он проводит в своей лаборатории в верхней части платформ.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//У входа в Лагерь ты найдешь Лестера. Он обычно показывает новичкам, где что находится.
		B_LogEntry(CH2_Focus,"Ю'Берион поручил мне забрать юнитор у другого Гуру, по имени Кор Галом. Этот Кор Галом целыми днями сидит в своей лаборатории.");
	}
	else
	{
		B_LogEntry(CH2_Focus,"Ю'Берион поручил мне забрать юнитор у Кор Галома. Какое мне предстоит удовольствие - встретить снова этого милого человека!");
	};
	TPL_1406_Templer.aivar[AIV_PASSGATE] = TRUE;
	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP(XP_BringFocusToYBerion);
};


instance Info_YBerion_NYRAS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_NYRAS_Condition;
	information = Info_YBerion_NYRAS_Info;
	permanent = 0;
	description = "Этот новичок, Нирас, - он сошел с ума!";
};


func int Info_YBerion_NYRAS_Condition()
{
	if(Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_NYRAS_Info()
{
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//Этот новичок, Нирас, - он сошел с ума!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//Он твердит, что с ним говорил Спящий и избрал его своим единственным слугой!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//А затем он попытался убить меня!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//Могущество Спящего слишком велико для разума непосвященных.
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//Лишь мы, Гуру, после долгих лет медитации смогли достичь той силы духа, что позволяет нам выносить голос всемогущего Спящего.
};


instance GUR_1200_Yberion_EARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = GUR_1200_Yberion_EARN_Condition;
	information = GUR_1200_Yberion_EARN_Info;
	important = 0;
	permanent = 0;
	description = "А как насчет небольшой награды?";
};


func int GUR_1200_Yberion_EARN_Condition()
{
	if((YBerion_BringFocus == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) != GIL_NOV) && (Npc_GetTrueGuild(hero) != GIL_TPL) && (Npc_GetTrueGuild(hero) != GIL_GUR) && C_IsChapter(2))
	{
		return 1;
	};
};

func void GUR_1200_Yberion_EARN_Info()
{
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//А как насчет небольшой награды?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//Поскольку ты не являешься членом Братства, я награжу тебя.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//Прими этот амулет в знак моей благодарности.
	CreateInvItem(self,Schutzamulett_Feuer);
	B_GiveInvItems(self,hero,Schutzamulett_Feuer,1);
};


instance DIA_YBERION_GURU(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = dia_yberion_guru_condition;
	information = dia_yberion_guru_info;
	important = 0;
	permanent = 0;
	description = "Магам воды нужна ваша помощь.";
};


func int dia_yberion_guru_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_guru) && (Kapitel == 4))
	{
		return 1;
	};
};

func void dia_yberion_guru_info()
{
	AI_Output(other,self,"DIA_YBerion_GURU_Info_15_01");	//Магам воды нужна ваша помощь.
	AI_Output(self,other,"DIA_YBerion_GURU_Info_12_02");	//Они хотят, чтобы мы помогли им разрушить магический купол?
	AI_Output(self,other,"DIA_YBerion_GURU_Info_12_03");	//А что именно нам нужно будет делать?
	AI_Output(other,self,"DIA_YBerion_GURU_Info_15_02");	//Гомез убил магов огня. Поэтому вы должны отправиться в новый лагерь.
	AI_Output(other,self,"DIA_YBerion_GURU_Info_15_03");	//Маги воды хотят взорвать гору руды, чтобы уничтожить барьер.
	AI_Output(other,self,"DIA_YBerion_GURU_Info_15_04");	//Гуру из вашего лагеря могут помочь контролировать энергию руды.
	AI_Output(self,other,"DIA_YBerion_GURU_Info_12_05");	//Я возьму с собой всех гуру нашего лагеря. Мы немедленно отправляемся в Новый лагерь.
	B_GiveXP(1000);
	B_LogEntry(CH4_ASKGURU,"Ю'Берион согласился помочь магам воды. Он забрал всех гуру из Болотного лагеря и отправился к Сатурасу.");
	BAALCADAR = Hlp_GetNpc(GUR_1208_BaalCadar);
	BAALORUN = Hlp_GetNpc(GUR_1209_BaalOrun);
	BAALTYON = Hlp_GetNpc(GUR_1210_BaalTyon);
	BAALNAMIB = Hlp_GetNpc(GUR_1204_BaalNamib);
	BAALTONDRAL = Hlp_GetNpc(GUR_1203_BaalTondral);
	AI_GotoWP(self,"PSI_TEMPLE_SITTING_PRIEST");
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(self,"NEWCAMP");
	B_ExchangeRoutine(baalcadar,"NEWCAMP");
	B_ExchangeRoutine(baalorun,"NEWCAMP");
	B_ExchangeRoutine(baaltyon,"NEWCAMP");
	B_ExchangeRoutine(baalnamib,"NEWCAMP");
	B_ExchangeRoutine(baaltondral,"NEWCAMP");
};


instance DIA_YBERION_BECOME_A_GURU(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = dia_yberion_become_a_guru_condition;
	information = dia_yberion_become_a_guru_info;
	important = 0;
	permanent = 1;
	description = "Я хочу стать гуру.";
};


func int dia_yberion_become_a_guru_condition()
{
	if(C_NpcBelongsToPsiCamp(hero) && (hero.guild != GIL_GUR) && (Kapitel >= 4))
	{
		return 1;
	};
};

func void dia_yberion_become_a_guru_info()
{
	AI_Output(other,self,"DIA_YBerion_BECOME_A_GURU_Info_15_01");	//Я хочу стать гуру.
	AI_Output(self,other,"DIA_YBerion_BECOME_A_GURU_Info_12_02");	//Так ты хочешь постичь магию Спящего?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4)
	{
		AI_Output(self,other,"DIA_YBerion_BECOME_A_GURU_Info_12_04");	//Хорошо, теперь ты один из гуру. Возьми же это одеяние в знак присоединения к нашему священному кругу.
		B_GiveXP(750);
		CreateInvItem(self,gur_armor_m);
		B_GiveInvItems(self,hero,gur_armor_m,1);
		AI_EquipBestArmor(other);
		Npc_SetTrueGuild(hero,GIL_GUR);
		hero.guild = GIL_GUR;
		Wld_InsertNpc(nov_9000_escaped,"NOV_1");
		Wld_InsertNpc(nov_9001_escaped,"NOV_2");
		dia_yberion_become_a_guru.permanent = 0;
	}
	else
	{
		AI_Output(self,other,"DIA_YBerion_BECOME_A_GURU_Info_12_05");	//Но ты не знаешь первых четырех кругов магии.
	};
};


instance DIA_YBERION_KREIS5(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = dia_yberion_kreis5_condition;
	information = dia_yberion_kreis5_info;
	important = 0;
	permanent = 1;
	description = "Я готов вступить в Пятый Круг.";
};


func int dia_yberion_kreis5_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && C_NpcBelongsToPsiCamp(hero) && (Npc_GetTrueGuild(hero) == GIL_GUR) && (Kapitel >= 4))
	{
		return 1;
	};
};

func void dia_yberion_kreis5_info()
{
	AI_Output(other,self,"DIA_YBerion_KREIS5_Info_15_01");	//Я готов вступить в Пятый Круг.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
	{
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_02");	//Теперь, когда мы поняли, кем на самом деле является Спящий...
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_03");	//... мы должны оградить себя от его магии.
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_04");	//Мы должны получить благословение своих старых богов.
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_05");	//Возвращение к истинной вере образует Пятый Круг.
		AI_Output(self,other,"DIA_YBerion_KREIS5_Info_02_06");	//Теперь я научил тебя всему, что знал сам.
		dia_yberion_kreis5.permanent = 0;
	};
};


instance DIA_YBERION_HEAVYARMOR(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = dia_yberion_heavyarmor_condition;
	information = dia_yberion_heavyarmor_info;
	important = 0;
	permanent = 1;
	description = "Получить облачение высших гуру (1800 кусков руды).";
};


func int dia_yberion_heavyarmor_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void dia_yberion_heavyarmor_info()
{
	AI_Output(other,self,"DIA_YBerion_HEAVYARMOR_Info_15_01");	//Я хочу носить облачение высших гуру.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 5)
	{
		AI_Output(self,other,"DIA_YBerion_WANNBEKDF_Info_14_04");	//Прежде, ты должен познать Пятый Круг магии.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_GUR_ARMOR_H)
	{
		AI_Output(self,other,"DIA_YBerion_HEAVYARMOR_Info_14_03");	//Но у тебя недостаточно руды.
	}
	else
	{
		AI_Output(self,other,"DIA_YBerion_HEAVYARMOR_Info_14_04");	//Теперь ты можешь носить облачение высших гуру.
		CreateInvItem(self,gur_armor_h);
		B_GiveInvItems(self,hero,gur_armor_h,1);
		AI_EquipBestArmor(self);
		B_GiveInvItems(hero,self,ItMiNugget,1800);
		AI_EquipBestArmor(hero);
		dia_yberion_heavyarmor.permanent = 0;
	};
};


instance GUR_1200_YBERION_MANA_LEARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_mana_learn_condition;
	information = gur_1200_yberion_mana_learn_info;
	important = 0;
	permanent = 1;
	description = "Я хочу увеличить силу своей магии.";
};


func int gur_1200_yberion_mana_learn_condition()
{
	if(C_NpcBelongsToPsiCamp(hero) && (Npc_GetTrueGuild(hero) == GIL_GUR) && (Kapitel >= 4))
	{
		return 1;
	};
};

func void gur_1200_yberion_mana_learn_info()
{
	AI_Output(other,self,"GUR_1200_YBerion_MANA_LEARN_15_01");	//Я хочу увеличить силу своей магии.
	AI_Output(self,other,"GUR_1200_YBerion_MANA_LEARN_14_02");	//Я могу помочь тебе увеличить магическую силу. Ты сам должен решать, как ты будешь ее использовать.
	Info_AddChoice(gur_1200_yberion_mana_learn,DIALOG_BACK,gur_1200_yberion_mana_learn_back);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_5);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_1);
};

func void gur_1200_yberion_mana_learn_back()
{
	Info_ClearChoices(gur_1200_yberion_mana_learn);
};

func void gur_1200_yberion_mana_learn_man_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(gur_1200_yberion_mana_learn);
	Info_AddChoice(gur_1200_yberion_mana_learn,DIALOG_BACK,gur_1200_yberion_mana_learn_back);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_5);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_1);
};

func void gur_1200_yberion_mana_learn_man_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(gur_1200_yberion_mana_learn);
	Info_AddChoice(gur_1200_yberion_mana_learn,DIALOG_BACK,gur_1200_yberion_mana_learn_back);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_5);
	Info_AddChoice(gur_1200_yberion_mana_learn,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),gur_1200_yberion_mana_learn_man_1);
};


instance INFO_YBERION_NOV_AWAY(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_nov_away_condition;
	information = info_yberion_nov_away_info;
	permanent = 0;
	description = "Чем я могу быть вам полезен, мой господин?";
};


func int info_yberion_nov_away_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return 1;
	};
};

func void info_yberion_nov_away_info()
{
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_15_00");	//Чем я могу быть вам полезен, мой господин?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_00");	//Ты обратился ко мне как раз вовремя.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_01");	//У меня есть для тебя важное дело. Накануне, из лагеря бежали двое послушников...
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_15_01");	//(перебивая) И ты хочешь чтобы я вернул их?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_02");	//(гневно) Попридержи язык. Этих бездельников и так полно, а толку ничуть.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_03");	//(продолжает) Так вот, меня беспокоит ТО, что они ВЗЯЛИ с собой.
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_15_02");	//Хм... И что же они взяли?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_03");	//(продолжает) Так вот, меня беспокоит ТО, что они ВЗЯЛИ с собой.
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_15_02");	//Хм... И что же они взяли?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_04");	//Когда-то давно я изучал магию огня и даже хотел стать послушником в монастыре Инноса.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_12_05");	//Теперь я вижу в нем единственный путь возвращения к истинной вере.
	Info_AddChoice(info_yberion_nov_away,"Мой долг – помочь вам!",info_yberion_nov_away_yes);
	Info_AddChoice(info_yberion_nov_away,"К чему вам теперь этот амулет?",info_yberion_nov_away_about);
};

func void info_yberion_nov_away_yes()
{
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_YES_15_00");	//Мой долг – помочь вам!
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_YES_12_01");	//Я не ожидал от тебя другого ответа.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_YES_12_02");	//Но не пытайся одеть этот амулет. Боюсь, что Спящий не позволит тебе сделать это.
	Log_CreateTopic(CH4_YBERION_AMULETTE,LOG_MISSION);
	Log_SetTopicStatus(CH4_YBERION_AMULETTE,LOG_RUNNING);
	B_LogEntry(CH4_YBERION_AMULETTE,"Двое послушников украли амулет Ю'Бероина и сбежали из лагеря. Я должен найти послушников и вернуть амулет.");
	B_LogEntry(CH4_YBERION_AMULETTE,"Лучше не пытаться использовать этот амулет. Возможно, Спящий попытается остановить меня.");
	YBERION_AMULETTE = TRUE;
	Info_ClearChoices(info_yberion_nov_away);
	Info_AddChoice(info_yberion_nov_away,"Так где мне искать этих бродяг?",info_yberion_nov_away_where);
};

func void info_yberion_nov_away_where()
{
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_WHERE_15_00");	//Так где мне искать этих бродяг?
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_WHERE_12_01");	//Кто-нибудь в лагере должен был видеть, куда направились послушники.
	B_LogEntry(CH4_YBERION_AMULETTE,"Я могу попрашивать в лагере, куда направились послушники.");
	Info_ClearChoices(info_yberion_nov_away);
};

func void info_yberion_nov_away_about()
{
	AI_Output(other,self,"Info_YBerion_NOV_AWAY_ABOUT_15_00");	//К чему вам теперь этот амулет? Лагерь и так уже раскололся. Вы потеряли свою власть.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_ABOUT_12_01");	//Без этого амулета, я уже точно все потеряю.
	AI_Output(self,other,"Info_YBerion_NOV_AWAY_ABOUT_12_02");	//Я должен успеть оградить послушников от влияния Спящего.
};


instance GUR_1200_YBERION_NOV_AWAY_OK(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_nov_away_ok_condition;
	information = gur_1200_yberion_nov_away_ok_info;
	important = 0;
	permanent = 0;
	description = "Я нашел ваш амулет.";
};


func int gur_1200_yberion_nov_away_ok_condition()
{
	if(Npc_HasItems(hero,yberion_magic_amulette) == 1)
	{
		return 1;
	};
};

func void gur_1200_yberion_nov_away_ok_info()
{
	AI_Output(other,self,"GUR_1200_Yberion_NOV_AWAY_OK_Info_15_01");	//Я нашел ваш амулет.
	AI_Output(self,other,"GUR_1200_Yberion_NOV_AWAY_OK_Info_12_00");	//Очень хорошо. Возьми в награду эту руну.
	B_GiveXP(800);
	B_GiveInvItems(hero,self,yberion_magic_amulette,1);
	B_GiveInvItems(self,hero,ItArRuneControl,1);
	Log_SetTopicStatus(CH4_YBERION_AMULETTE,LOG_SUCCESS);
	B_LogEntry(CH4_YBERION_AMULETTE,"Я вернул амулет Ю'Бериона.");
};


instance INFO_YBERION_INNOS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_innos_condition;
	information = info_yberion_innos_info;
	permanent = 0;
	description = "А что ты будешь делать теперь?";
};


func int info_yberion_innos_condition()
{
	if(Npc_KnowsInfo(hero,gur_1200_yberion_nov_away_ok))
	{
		return 1;
	};
};

func void info_yberion_innos_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_15_00");	//А что ты будешь делать теперь?
	AI_Output(self,other,"Info_YBerion_INNOS_12_00");	//Я надеюсь, смогу вернуть часть своей былой силы.
	AI_Output(other,self,"Info_YBerion_INNOS_15_01");	//А как же лагерь? Что делать с последователями Спящего?
	AI_Output(self,other,"Info_YBerion_INNOS_12_01");	//Ох, это не простая задача.
	AI_Output(self,other,"Info_YBerion_INNOS_12_02");	//Пока ты отсутствовал, я советовался с Кор Ангаром.
	AI_Output(self,other,"Info_YBerion_INNOS_12_03");	//И я сделал вывод, что должно произойти что-то, что способно вселить уверенность в души наших братьев.
	AI_Output(other,self,"Info_YBerion_INNOS_15_02");	//Да, это будет не просто.
};


instance INFO_YBERION_INNOS_PLAN(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_innos_plan_condition;
	information = info_yberion_innos_plan_info;
	permanent = 0;
	description = "Но у вас уже есть какой-нибудь план?";
};


func int info_yberion_innos_plan_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_15_00");	//Но у вас уже есть какой-нибудь план?
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_00");	//Нужно очень много времени, чтобы Иннос обратил внимание на мои призывы.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_01");	//Но я думаю поступить иначе.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_02");	//Я хочу провести один ритуал. Я несколько раз видел, как маги огня проводят его в Круге Солнца.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_03");	//Послушники должны поверить, что это дело рук Инноса.
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_15_01");	//Но это же обман!
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_12_04");	//Я знаю. Но другого пути сейчас нет. Кроме того, на поддержку Инноса, мы сможем рассчитывать в куда большей степени, если и все члены нашего лагеря примут новую веру.
};


instance INFO_YBERION_INNOS_WORK(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_innos_work_condition;
	information = info_yberion_innos_work_info;
	permanent = 0;
	description = "Хм, у меня такое чувство, что я буду в этом замешан...";
};


func int info_yberion_innos_work_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_plan))
	{
		return 1;
	};
};

func void info_yberion_innos_work_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_00");	//Хм, у меня такое чувство, что я буду в этом замешан...
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_00");	//О! Ты прав.
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_01");	//Итак, что тебе нужно?
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_01");	//Кое-какие ингредиенты у меня имеются. Но мне нужно не меньше десяти мензурок со спиртом, около дюжины темных грибов и Кольцо Стихий.
	Log_CreateTopic(CH4_YBERION_INNOS,LOG_MISSION);
	Log_SetTopicStatus(CH4_YBERION_INNOS,LOG_RUNNING);
	B_LogEntry(CH4_YBERION_INNOS,"Для проведения ритуала Ю'Бериону нужны 10 мензурок со спиртом, 12 адских грибов и Кольцо Стихий.");
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_02");	//А где я возьму столько спирта?
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"GUR_6"))
	{
		AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_02");	//Я слышал, здесь, в баре на озере варят собственную выпивку.
	}
	else
	{
		AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_03");	//Я слышал, в баре в Нового Лагеря варят собственную выпивку.
	};
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_04");	//У них наверняка есть запас.
	B_LogEntry(CH4_YBERION_INNOS,"Спирт я могу найти в баре в Новом лагере.");
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_03");	//А что это за Кольцо Стихий?
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_05");	//Его используют маги для проведения ритуала в Круге Солнца.
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_06");	//Это кольцо, насколько я помню, носит один из магов огня. Вроде бы его зовут Мильтен.
	B_LogEntry(CH4_YBERION_INNOS,"Кольцо Стихий носит маг Мильтен.");
	AI_Output(other,self,"Info_YBerion_INNOS_WORK_15_04");	//Я знаю Мильтена.
	AI_Output(self,other,"Info_YBerion_INNOS_WORK_12_07");	//Так что же ты стоишь? Вперед!
};


instance INFO_YBERION_INNOS_PLAN_RING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = info_yberion_innos_plan_ring_condition;
	information = info_yberion_innos_plan_ring_info;
	permanent = 0;
	description = "Я принес Кольцо Стихий.";
};


func int info_yberion_innos_plan_ring_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work) && (Npc_HasItems(hero,ring_kdf_kdw) == 1))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_ring_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_RING_15_00");	//Я принес Кольцо Стихий.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_RING_12_00");	//Хорошо. Я верну его Мильтену после ритуала.
	B_GiveXP(250);
	B_GiveInvItems(hero,self,ring_kdf_kdw,1);
	B_LogEntry(CH4_YBERION_INNOS,"Я отдал Ю'Бериону Кольцо Стихий.");
};


instance INFO_YBERION_INNOS_PLAN_SPIRIT(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 2;
	condition = info_yberion_innos_plan_spirit_condition;
	information = info_yberion_innos_plan_spirit_info;
	permanent = 0;
	description = "У меня есть 10 мензурок со спиртом.";
};


func int info_yberion_innos_plan_spirit_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work) && (Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 10))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_spirit_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_SPIRIT_15_00");	//У меня есть 10 мензурок со спиртом.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_SPIRIT_12_00");	//Отлично! Давай их сюда.
	B_GiveXP(250);
	B_GiveInvItems(hero,self,ItMi_Alchemy_Alcohol_01,10);
	B_LogEntry(CH4_YBERION_INNOS,"Я принес мензурки со спиртом.");
};


instance INFO_YBERION_INNOS_PLAN_MUSHROOMS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 2;
	condition = info_yberion_innos_plan_mushrooms_condition;
	information = info_yberion_innos_plan_mushrooms_info;
	permanent = 0;
	description = "Вот дюжина адских грибов.";
};


func int info_yberion_innos_plan_mushrooms_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work) && (Npc_HasItems(hero,ItFo_Plants_mushroom_01) >= 12))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_mushrooms_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_MUSHROOMS_15_00");	//Вот дюжина адских грибов.
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_MUSHROOMS_12_00");	//Очень хорошо.
	B_GiveXP(250);
	B_GiveInvItems(hero,self,ItFo_Plants_mushroom_01,12);
	B_LogEntry(CH4_YBERION_INNOS,"Я принес адские грибы.");
};


instance INFO_YBERION_INNOS_PLAN_OK(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 2;
	condition = info_yberion_innos_plan_ok_condition;
	information = info_yberion_innos_plan_ok_info;
	permanent = 0;
	description = "Все готово для проведения ритуала?";
};


func int info_yberion_innos_plan_ok_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_plan_ring) && Npc_KnowsInfo(hero,info_yberion_innos_plan_spirit) && Npc_KnowsInfo(hero,info_yberion_innos_plan_mushrooms))
	{
		return 1;
	};
};

func void info_yberion_innos_plan_ok_info()
{
	AI_Output(other,self,"Info_YBerion_INNOS_PLAN_OK_15_00");	//Все готово для проведения ритуала?
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_OK_12_00");	//Да, но я еще должен обсудить все с Кор Ангаром.
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"GUR_6"))
	{
		AI_Output(self,other,"Info_YBerion_INNOS_PLAN_OK_12_01");	//И сначала я должен помочь магам воды взорвать железную гору.
	};
	AI_Output(self,other,"Info_YBerion_INNOS_PLAN_OK_12_02");	//Возьми эту руду в качестве вознаграждения.
	B_GiveXP(2000);
	B_GiveInvItems(self,hero,ItMiNugget,3000);
	Log_SetTopicStatus(CH4_YBERION_INNOS,LOG_SUCCESS);
	B_LogEntry(CH4_YBERION_INNOS,"Теперь все готово для проведения ритуала.");
};

