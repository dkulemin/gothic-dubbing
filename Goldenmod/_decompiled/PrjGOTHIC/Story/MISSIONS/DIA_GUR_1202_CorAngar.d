
instance DIA_GUR_1202_CorAngar_Exit(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 999;
	condition = DIA_GUR_1202_CorAngar_Exit_Condition;
	information = DIA_GUR_1202_CorAngar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

func void DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CorAngar_LaterTrainer(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = DIA_CorAngar_LaterTrainer_Condition;
	information = DIA_CorAngar_LaterTrainer_Info;
	permanent = 0;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

func void DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00");	//Ты будешь учить меня?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01");	//Ты хочешь стать хорошим воином и потому ищешь себе наставника.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02");	//Похвально. Но я не тот, кто тебе нужен.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03");	//Я занимаюсь лишь с теми, кто принадлежит к Священному Кругу Стражей.
};


instance DIA_CorAngar_WieTempler(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 1;
	condition = DIA_CorAngar_WieTempler_Condition;
	information = DIA_CorAngar_WieTempler_Info;
	permanent = 1;
	description = "Как стать Стражем?";
};


func int DIA_CorAngar_WieTempler_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL))
	{
		return 1;
	};
};

func void DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00");	//Как стать Стражем?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01");	//Прежде всего, ты должен стать послушником и доказать, что ты действительно веришь в Спящего.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02");	//Потом возвращайся ко мне, и я буду учить тебя.
	AI_StopProcessInfos(self);
};


instance GUR_1202_CorAngar_Teach(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 10;
	condition = GUR_1202_CorAngar_Teach_Condition;
	information = GUR_1202_CorAngar_Teach_Info;
	permanent = 1;
	description = "Ты можешь развить мою силу и ловкость?";
};


func int GUR_1202_CorAngar_Teach_Condition()
{
	if(C_NpcBelongsToPsiCamp(hero) && (Npc_GetTrueGuild(other) == GIL_TPL))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00");	//Ты можешь развить мою силу и ловкость?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01");	//Каждый воин нуждается в силе и ловкости.
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(GUR_1202_CorAngar_Teach);
	Info_AddChoice(GUR_1202_CorAngar_Teach,DIALOG_BACK,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),GUR_1202_CorAngar_Teach_DEX_1);
};


instance GUR_1202_CorAngar_WANNABETPL(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_WANNABETPL_Condition;
	information = GUR_1202_CorAngar_WANNABETPL_Info;
	important = 0;
	permanent = 1;
	description = "Я хочу стать Стражем!";
};


func int GUR_1202_CorAngar_WANNABETPL_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01");	//Я хочу стать Стражем!
	if(hero.level < 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02");	//Ты еще не готов. Ты сможешь присоединиться к нам, когда у тебя будет больше опыта.
		GUR_1202_CorAngar_WANNABETPL.permanent = 1;
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03");	//Пришло время тебе присоединиться к нам.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04");	//Помни, что Стражи - это не просто хорошие воины и охранники Лагеря. Мы - избранные Стражи Спящего, Стражи духа.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05");	//Мы находим применение и физической, и духовной силе. Лишь те, чье тело и дух представляют единое целое, могут стать истинными Стражами.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06");	//Я искренне рад тому, что ты добился столь впечатляющих результатов за столь короткое время. Теперь ты готов стать одним их нас.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07");	//Запомни: невозмутимый дух и тренированное тело помогут тебе выстоять против любого врага.
		AI_Output(self,other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08");	//Отправляйся к Гор На Тофу на тренировочную площадку. Он даст тебе новые доспехи.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero,GIL_TPL);
		hero.guild = GIL_TPL;
		Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
		B_LogEntry(GE_BecomeTemplar,"Сегодня Кор Ангар назначил меня стражем. Гор На Тоф даст мне новые доспехи. Обычно его можно найти на тренировочной площадке.");
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Кор Ангар тренирует СИЛУ, ЛОВКОСТЬ и может научить сражаться ДВУРУЧНЫМ оружием. Но обучать он меня станет только тогда, когда я буду хорош в битве с ОДНОРУЧНЫМ оружием. Обычно Кор Ангара можно найти на тренировочной площадке, на втором уровне мостиков.");
	};
};


instance GUR_1202_CorAngar_ZWEIHAND1(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information = GUR_1202_CorAngar_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};


func int GUR_1202_CorAngar_ZWEIHAND1_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01");	//Я хочу научиться владеть двуручным мечом.
	if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02");	//Бой с двуручным оружием требует определенной силы и ловкости.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03");	//Для того чтобы овладеть им, ты должен тренировать не только свое тело, но и свой разум.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04");	//Лишь достигнув контроля над своей физической и духовной силой, ты сможешь получить этот навык.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05");	//Суть кроется в концентрации. В концентрации объединяются тело и разум.
		GUR_1202_CorAngar_ZWEIHAND1.permanent = 0;
		AI_StopProcessInfos(self);
		B_PracticeCombat("PSI_PATH_6_7");
	};
};


instance GUR_1202_CorAngar_ZWEIHAND2(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information = GUR_1202_CorAngar_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0);
};


func int GUR_1202_CorAngar_ZWEIHAND2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");	//Я хочу узнать что-нибудь еще про двуручное оружие.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02");	//Ты уже вполне освоил танец с клинком. Теперь я расскажу тебе про настоящий бой.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03");	//Используй свою духовную силу, для того чтобы предугадать движение противника, прежде чем он нанесет удар.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04");	//Если ты знаешь, как дерется твой враг, то ты уже наполовину победил.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05");	//Будь быстр, твои движения должны быть плавными и неожиданными, а удары - сильными и точными.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06");	//Учись терпеть боль. Твоя сила воли в конечном счете решает исход боя.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07");	//Оставайся спокоен. Ты сможешь уцелеть, только если будешь вступать в бой спокойным и сосредоточенным.
		AI_Output(self,other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08");	//Используй свои навыки с умом. И помни: спровоцировать бой - значит, проиграть его.
		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;
		AI_StopProcessInfos(self);
		B_PracticeCombat("PSI_PATH_6_7");
	};
};


instance GUR_1202_CorAngar_SENDS(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_SENDS_Condition;
	information = GUR_1202_CorAngar_SENDS_Info;
	important = 0;
	permanent = 0;
	description = "Что теперь?";
};


func int GUR_1202_CorAngar_SENDS_Condition()
{
	if((Kapitel == 3) && (CorAngar_GotoOGY == FALSE))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_01");	//Что еще случилось?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_02");	//Видение было очень неясным, оно принесло больше вопросов, нежели ответов на них.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_03");	//Одно я знаю точно: я видел орка в пещере. Это было заброшенное оркское капище, здесь, неподалеку.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_04");	//Когда-то орки хоронили там своих умерших, вот почему мы называем эти пещеры оркским кладбищем.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_05");	//Гуру Идол Люкор отправился туда с несколькими Стражами. Возможно ему удастся отыскать что-то, что поможет нам понять это видение.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_06");	//Мне нужно, чтобы кто-нибудь отправился туда и затем доложил мне о ситуации.
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_Info_15_07");	//Почему ты не пойдешь сам? Ведь ты же командуешь всеми Стражами!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_08");	//Моя задача - защищать Просвещенного. Я должнен оставаться здесь, с Ю'Берионом, и охранять его.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_09");	//Ты хорошо послужил нашему Лагерю. Я доверяю тебе больше, чем кому-либо еще.
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_Info_08_10");	//Я прошу тебя отправиться на оркское кладбище и выяснить, что удалось найти Стражам.
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"Что я получу взамен?",GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice(GUR_1202_CorAngar_SENDS,"Я отправляюсь в путь прямо сейчас!",GUR_1202_CorAngar_SENDS_KNOW);
};

func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01");	//Что я получу взамен?
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02");	//Тебе нужна руда? Похоже, я переоценил тебя. Но все равно, ты мне нужен. Вот, возьми сотню кусков руды. Больше ты не получишь!
	CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,hero,ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output(other,self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01");	//Я отправляюсь в путь прямо сейчас!
	AI_Output(self,other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02");	//Прежде возьми это кольцо. Оно защитит тебя в бою.
	B_Story_GotoOrcGraveyard();
	CreateInvItem(self,Schutzring_Geschosse1);
	B_GiveInvItems(self,hero,Schutzring_Geschosse1,1);
	Info_ClearChoices(GUR_1202_CorAngar_SENDS);
};


instance GUR_1202_CorAngar_WHERE(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_WHERE_Condition;
	information = GUR_1202_CorAngar_WHERE_Info;
	important = 0;
	permanent = 0;
	description = "Где находится кладбище орков?";
};


func int GUR_1202_CorAngar_WHERE_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_SENDS))
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WHERE_Info_15_01");	//Где находится кладбище орков?
	AI_Output(self,other,"GUR_1202_CorAngar_WHERE_Info_08_02");	//Недалеко отсюда. Дорогу тебе покажет послушник Талас. Ты найдешь его во дворе храма.
	B_LogEntry(CH3_OrcGraveyard,"Послушник Талас покажет мне путь на орочье кладбище. Он ждет меня на храмовой площади.");
};


instance GUR_1202_CorAngar_AFTER(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = GUR_1202_CorAngar_AFTER_Condition;
	information = GUR_1202_CorAngar_AFTER_Info;
	important = 0;
	permanent = 0;
	description = "Я был на кладбище орков. ";
};


func int GUR_1202_CorAngar_AFTER_Condition()
{
	if(BaalLukor_BringParchment == 4)
	{
		return 1;
	};
};

func void GUR_1202_CorAngar_AFTER_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_01");	//Я был на кладбище орков. Там нет НИЧЕГО. Ни Спящего, ни зацепки, вообще ничего.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_02");	//А Идол Люкор и его Стражи?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_03");	//Они все мертвы.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_04");	//Мертвы? Но почему, что произошло?
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_05");	//Пещеры кишмя кишат орками. Они перебили всех Стражей.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_06");	//Мне и Люкору удалось выжить, но он при этом сошел с ума.
	AI_Output(other,self,"GUR_1202_CorAngar_AFTER_Info_15_07");	//Он кричал, что Спящий приказал ему убить меня, и искренне пытался выполнить этот приказ.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_08");	//Похоже, он просто не мог смириться с мыслью о том, что ему так и не удалось ничего найти.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_09");	//Я не верю, что воля Спящего подвигла его на столь ужасный поступок.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_10");	//Этого не может... не может... ЭТО НЕ ОТНОСИТСЯ К ДЕЛУ!
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_11");	//Важнее всего то, что Идол Люкор еще не зашел слишком далеко в своем безумии.
	AI_Output(self,other,"GUR_1202_CorAngar_AFTER_Info_08_12");	//Теперь вся наша надежда на Ю'Бериона.
	B_GiveXP(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};


instance Info_CorAngar_FindHerb(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_FindHerb_Condition;
	information = Info_CorAngar_FindHerb_Info;
	permanent = 0;
	important = 0;
	description = "Как поживает Ю'Берион?";
};


func int Info_CorAngar_FindHerb_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_AFTER))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Info()
{
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_01");	//Как поживает Ю'Берион?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_02");	//Он не очнется, если мы не поможем ему. Видишь - он слабеет с каждой минутой. Я знаю, как разбудить его, но для этого мне понадобится твоя помощь.
	AI_Output(other,self,"Mis_3_NC_CorAngar_FindHerb_15_03");	//Что я должен сделать?
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_04");	//Принеси мне целебные травы с болота. Пяти кустов самого сильного сорта должно быть достаточно.
	AI_Output(self,other,"Mis_3_NC_CorAngar_FindHerb_08_05");	//Прошу тебя, поторопись!
	AI_StopProcessInfos(self);
	CorAngar_FindHerb = LOG_RUNNING;
	Log_CreateTopic(CH3_FindHerbs,LOG_MISSION);
	Log_SetTopicStatus(CH3_FindHerbs,LOG_RUNNING);
	B_LogEntry(CH3_FindHerbs,"Ю'Берион по-прежнему без сознания. Кор Ангар попросил меня собрать пять целебных трав.");
};


instance Info_CorAngar_FindHerb_WHERE(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 2;
	condition = Info_CorAngar_FindHerb_WHERE_Condition;
	information = Info_CorAngar_FindHerb_WHERE_Info;
	permanent = 0;
	important = 0;
	description = "Где я смогу найти эти травы?";
};


func int Info_CorAngar_FindHerb_WHERE_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_WHERE_15_01");	//Где я смогу найти эти травы?
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_02");	//Ищи их на болоте позади Лагеря. Тебе придется зайти далеко вглубь болота - постарайся не попасться болотожорам!
	AI_Output(self,other,"Info_CorAngar_FindHerb_WHERE_08_03");	//И хватит тратить время впустую. Иди!
	AI_StopProcessInfos(self);
	B_LogEntry(CH3_FindHerbs,"Нужные травы растут в болотах за Лагерем. Но там же обитают опаснейшие твари - болотожоры.  Надо держать глаза открытыми.");
};


instance Info_CorAngar_FindHerb_LOOK(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 3;
	condition = Info_CorAngar_FindHerb_LOOK_Condition;
	information = Info_CorAngar_FindHerb_LOOK_Info;
	permanent = 0;
	important = 0;
	description = "Как я узнаю, что это именно те травы, которые мне нужны?";
};


func int Info_CorAngar_FindHerb_LOOK_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output(other,self,"Info_CorAngar_FindHerb_LOOK_15_01");	//Как я узнаю, что это именно те травы, которые мне нужны?
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_02");	//Они похожи на звезды с восемью зелеными и оранжевыми листьями.
	AI_Output(self,other,"Info_CorAngar_FindHerb_LOOK_08_03");	//В путь!
	AI_StopProcessInfos(self);
	B_LogEntry(CH3_FindHerbs,"Целебные травы похожи на звезду с четырьмя зелеными и с четырьмя оранжевыми листьями.");
};


instance Info_CorAngar_FindHerb_Running(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 4;
	condition = Info_CorAngar_FindHerb_Running_Condition;
	information = Info_CorAngar_FindHerb_Running_Info;
	permanent = 0;
	important = 0;
	description = "Я еще не собрал достаточно трав.";
};


func int Info_CorAngar_FindHerb_Running_Condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) < 5) && Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE) && Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK))
	{
		return 1;
	};
};

func void Info_CorAngar_FindHerb_Running_Info()
{
	var C_Npc fortuno;
	AI_Output(other,self,"Info_CorAngar_FindHerb_Running_15_01");	//Я еще не собрал достаточно трав.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_02");	//Возможно, у Фортуно, травника, есть что-нибудь в запасе.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Running_08_04");	//Скажи ему, чтобы он сварил целебный эликсир.
	AI_StopProcessInfos(self);
	fortuno = Hlp_GetNpc(NOV_1357_Fortuno);
	B_ExchangeRoutine(fortuno,"afterstart");
	CreateInvItems(fortuno,ItFo_Plants_Herb_03,5);
	POTION_FOR_YBERION = 2;
	B_LogEntry(CH3_FindHerbs,"Возможно, они есть у Фортуно, торговца травами из Братства. Я должен сказать ему, чтобы он сварил целебный эликсир.");
};


instance INFO_CORANGAR_HEALTHWATER_RUNNING(C_Info)
{
	npc = GUR_1202_CorAngar;
	nr = 4;
	condition = info_corangar_healthwater_running_condition;
	information = info_corangar_healthwater_running_info;
	permanent = 0;
	important = 0;
	description = "Я собрал травы.";
};


func int info_corangar_healthwater_running_condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) >= 5))
	{
		return 1;
	};
};

func void info_corangar_healthwater_running_info()
{
	AI_Output(other,self,"Info_CorAngar_HealthWater_Running_15_00");	//Я собрал травы.
	AI_Output(self,other,"Info_CorAngar_HealthWater_Running_08_00");	//Хорошо. Ты умеешь готовить эликсиры?
	if(HERO_KNOWS_ALCHEMY == TRUE)
	{
		AI_Output(other,self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01");	//Да.
		AI_Output(self,other,"Info_CorAngar_HealthWater_Running_08_01");	//Тогда иди в лабораторию и приготовь из трав целебный эликсир.
		AI_Output(self,other,"Info_CorAngar_HealthWater_Running_08_02");	//Просто прокипяти отвар 2-3 минуты на алхимическом столе.
		AI_Output(self,other,"Info_CorAngar_HealthWater_Running_08_03");	//Возьми этот лабораторный флакон.
		CreateInvItems(self,ItMiFlask,1);
		B_GiveInvItems(self,other,ItMiFlask,1);
		POTION_FOR_YBERION = 1;
		B_LogEntry(CH3_FindHerbs,"Я должен приготовить целебный эликсир для Ю'Бериона. Нужно прокипетить собранные травы в лабораторном флаконе, который мне дал Кор Ангар.");
	}
	else
	{
		AI_Output(other,self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01");	//Нет.
		AI_Output(self,other,"Info_CorAngar_HealthWater_Running_08_04");	//Тогда отнеси травы Фортуно. Скажи, чтобы он сварил из них целебный эликсир.
		B_ExchangeRoutine(NOV_1357_Fortuno,"afterstart");
		POTION_FOR_YBERION = 2;
		B_LogEntry(CH3_FindHerbs,"Я должен отнести травы Фортуно. Он сварит целебный эликсир.");
	};
	AI_Output(self,other,"Info_CorAngar_HealthWater_Running_08_05");	//Поторопись.
	AI_StopProcessInfos(self);
};


instance INFO_CORANGAR_HEALTHWATER_SUCCESS(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = info_corangar_healthwater_success_condition;
	information = info_corangar_healthwater_success_info;
	permanent = 0;
	description = "Вот эликсир для Ю'Бериона.";
};


func int info_corangar_healthwater_success_condition()
{
	if((Npc_HasItems(other,HealthWater) >= 1) && (CorAngar_FindHerb == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void info_corangar_healthwater_success_info()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_CorAngar_HealthWater_OK_Success_15_00");	//Вот эликсир для Ю'Бериона.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_02");	//Отличная работа. Пока ты уходил, Ю'Берион ненадолго пришел в себя.
	AI_Output(other,self,"Info_CorAngar_FindHerb_Success_15_03");	//Он что-нибудь говорил?
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_04");	//Да, он сказал, что Спящий - не то, что мы думаем. Мы больше не должны пытаться пробудить его.
	AI_Output(self,other,"Info_CorAngar_FindHerb_Success_08_05");	//Нам остается только надеяться, что для Ю'Бериона еще не все потеряно.
	Yberion_dead = LOG_RUNNING;
	B_GiveInvItems(other,self,HealthWater,1);
	B_GiveXP(XP_FindHerbs);
	CorAngar_FindHerb = LOG_SUCCESS;
	B_LogEntry(CH3_FindHerbs,"Я доставил Кор Ангару эликсир для Ю'Бериона. Остается надеяться, что еще не слишком поздно.");
	Log_SetTopicStatus(CH3_FindHerbs,LOG_SUCCESS);
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	AI_Wait(self,1);
	AI_GotoNpc(self,YBerion);
	AI_TurnToNPC(self,YBerion);
	AI_PlayAni(self,"T_PLUNDER");
	Npc_RemoveInvItems(self,HealthWater,1);
	AI_WaitTillEnd(self,YBerion);
	AI_Output(self,other,"Info_CorAngar_HealthWater_Success_08_03");	//Ю'Берион еще очень слаб, но он поправится.
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"Info_CorAngar_HealthWater_Success_08_04");	//С твоей помощью нам удалось спасти его!
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_02");	//Что же теперь, Кор Ангар?
	AI_Output(self,other,"Info_CorAngar_HealthWater_Success_08_05");	//Я доверяю Ю'Бериону. Он возложил все свои надежды на план спасения, разработанный магами Воды.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_04");	//Так что теперь мы должны поддерживать магов Воды и их идеи.
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_05");	//Им понадобятся магический юнитор и альманах. И тем, и другим владеет Кор Галом.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_06");	//Где сейчас Кор Галом?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_07");	//Он был в ярости - забрал нескольких Стражей и отправился искать свой собственный путь к Спящему.
	AI_Output(other,self,"GUR_1202_CorAngar_DEATH_Info_15_08");	//Проклятье, как же нам теперь добыть юнитор?
	AI_Output(self,other,"GUR_1202_CorAngar_DEATH_Info_08_09");	//Я думаю, что он оставил книгу и юнитор в своей лаборатории. Вот ключ от сундука.
	CreateInvItem(self,itke_psi_kalom_01);
	B_GiveInvItems(self,other,itke_psi_kalom_01,1);
};


instance Info_CorAngar_TELEPORT(C_Info)
{
	npc = GUR_1202_CorAngar;
	condition = Info_CorAngar_TELEPORT_Condition;
	information = Info_CorAngar_TELEPORT_Info;
	permanent = 0;
	important = 1;
};


func int Info_CorAngar_TELEPORT_Condition()
{
	if(Npc_KnowsInfo(hero,info_corangar_healthwater_success))
	{
		return TRUE;
	};
};

func void Info_CorAngar_TELEPORT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_01");	//Минуту!
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_02");	//Да?
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_03");	//Прими эту магическую руну в знак благодарности за твои добрые дела.
	AI_Output(self,hero,"Info_CorAngar_TELEPORT_08_04");	//Она позволит тебе легко и быстро переноситься во двор нашего храма, когда в этом возникнет необходимость.
	AI_Output(hero,self,"Info_CorAngar_TELEPORT_15_05");	//Благодарю тебя!
	B_Story_SentToNC();
};

