
instance Info_Bloodwyn_EXIT_Schutzgeld(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 999;
	condition = Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information = Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

func void Info_Bloodwyn_EXIT_Schutzgeld_Info()
{
	AI_Output(other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00");	//Увидимся.
	if(Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01");	//Береги себя, малыш.
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02");	//Ты теперь ни о чем не волнуйся. Мы приглядим за тобой.
	};
	AI_StopProcessInfos(self);
};


instance Info_Bloodwyn_Hello(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_Hello_Condition;
	information = Info_Bloodwyn_Hello_Info;
	permanent = 0;
	important = 1;
};


func int Info_Bloodwyn_Hello_Condition()
{
	if(Kapitel <= 2)
	{
		return 1;
	};
};

func void Info_Bloodwyn_Hello_Info()
{
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_00");	//Эй, ты!
	AI_Output(other,self,"Info_Bloodwyn_Hello_15_01");	//Это ты мне говоришь?
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_02");	//Я предупреждаю тебя! Такие типы, как ты, очень быстро попадают здесь в неприятности!
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_03");	//Сюда бросают, в основном, законченных ублюдков.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_04");	//И они думают, что могут делать с тобой все, что хотят. Но мы им этого не позволим.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_05");	//Гомез хочет, чтобы в Лагере был мир, и мы, стражники, следим за этим. Но эта работа обходится нам недешево.
	AI_Output(self,other,"Info_Bloodwyn_Hello_08_06");	//Вот почему я предлагаю тебе поделиться запасом руды. Скажем так, в знак дружбы. Ты помогаешь нам, мы помогаем тебе. И если у тебя будут проблемы, мы придем на помощь.
	Info_ClearChoices(Info_Bloodwyn_Hello);
	Info_AddChoice(Info_Bloodwyn_Hello,"Почему бы и нет? Сколько ты хочешь получить?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice(Info_Bloodwyn_Hello,"Я сам могу о себе позаботиться!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice(Info_Bloodwyn_Hello,"Это угроза?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output(other,self,"Info_Bloodwyn_ForgetIt_15_00");	//Ты предлагаешь мне платить деньги за защиту? Нет, спасибо, я сам могу о себе позаботиться!
	AI_Output(self,other,"Info_Bloodwyn_ForgetIt_08_01");	//Решать тебе, малыш. Скоро ты пожалеешь о том, что отверг мое дружеское предложение.
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output(other,self,"Info_Bloodwyn_SollDrohungSein_15_00");	//Это угроза?
	AI_Output(self,other,"Info_Bloodwyn_SollDrohungSein_08_01");	//Совсем наоборот! Это предложение дружбы!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_HowMuch_15_01");	//Почему бы и нет? Сколько ты хочешь получить?
	AI_Output(self,other,"Info_Bloodwyn_Hello_HowMuch_08_02");	//Немного. Десять кусков будет вполне достаточно.
	Info_ClearChoices(Info_Bloodwyn_Hello);
	Info_AddChoice(Info_Bloodwyn_Hello,"У меня нет десяти кусков руды.",Info_Bloodwyn_Hello_NotNow);
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		Info_AddChoice(Info_Bloodwyn_Hello,"Вот твоя руда. Дружба всегда в цене.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};

func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_OkTakeIt_15_00");	//Вот твоя руда. Дружба всегда в цене.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_01");	//Похоже, ты умный парень. С этого момента мы будем защищать тебя.
	AI_Output(self,other,"Info_Bloodwyn_Hello_OkTakeIt_08_02");	//Но это не значит, что ты можешь делать все, что захочешь - из некоторых неприятностей даже мы не сможем тебя вытащить.
	B_GiveInvItems(other,self,ItMiNugget,10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output(other,self,"Info_Bloodwyn_Hello_NotNow_15_00");	//У меня нет десяти кусков руды.
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_01");	//Давай сколько есть, а остальное отдашь потом.
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_08_02");	//Посмотрим...
	if(Npc_HasItems(other,ItMiNugget) > 0)
	{
		if(Npc_HasItems(other,ItMiNugget) > 9)
		{
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00");	//Ты только поглади на это... Похоже, кто-то не умеет считать до десяти, а?
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01");	//Пожалуй, я заберу все, что у тебя есть. Может быть тогда я сумею забыть, что ты пытался обмануть меня.
		}
		else
		{
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00");	//Мало - лучше, чем ничего. Спасибо за руду, малыш!
			AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01");	//С этого момента я буду приглядывать за тобой, пока ты находишься в Лагере.
		};
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00");	//Похоже, у тебя сейчас не лучшие времена, приятель. Ну ничего, как-нибудь в другой раз...
	};
	B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices(Info_Bloodwyn_Hello);
};


instance Info_Bloodwyn_PayDay(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_PayDay_Condition;
	information = Info_Bloodwyn_PayDay_Info;
	permanent = 1;
	important = 1;
};


func int Info_Bloodwyn_PayDay_Condition()
{
	if((Kapitel <= 2) && (Bloodwyn_PayDay <= (Wld_GetDay() - 1)) && (Npc_HasItems(other,ItMiNugget) >= 10))
	{
		return 1;
	};
};

func void Info_Bloodwyn_PayDay_Info()
{
	if(Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_00");	//А, рад тебя видеть, дружище!
		AI_Output(self,other,"Info_Bloodwyn_PayDay_08_01");	//Как насчет дневной платы? Ты должен десять кусков, помнишь?
		Info_ClearChoices(Info_Bloodwyn_PayDay);
		Info_AddChoice(Info_Bloodwyn_PayDay,"Вот, возьми. Для друга и 10 кусков не жалко.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice(Info_Bloodwyn_PayDay,"Я не буду платить.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if(Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_00");	//Эй, ты!
		AI_Output(other,self,"Info_Bloodwyn_PayDay_Den_15_01");	//Что еще?
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_02");	//Пришло время доказать, что мы на самом деле друзья.
		AI_Output(self,other,"Info_Bloodwyn_PayDay_Den_08_03");	//Всего десять кусков руды - что скажешь?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayAgain_15_00");	//Вот, возьми. Для друга и десяти кусков не жалко.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayAgain_08_01");	//Я так и думал - мы друзья!
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Info_ClearChoices(Info_Bloodwyn_PayDay);
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_00");	//Я не буду платить - ты и так получил с меня более чем достаточно.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_01");	//Ты меня разочаровал. Больше мы не друзья. Сам гляди теперь, чтобы никто тебя не обидел и не ограбил.
	AI_Output(other,self,"Info_Bloodwyn_PayDay_PayNoMore_15_02");	//Не волнуйся, я могу о себе позаботиться.
	AI_Output(self,other,"Info_Bloodwyn_PayDay_PayNoMore_08_03");	//Посмотрим...
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(Info_Bloodwyn_PayDay);
};


instance Info_Bloodwyn_Doch(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 3;
	condition = Info_Bloodwyn_Doch_Condition;
	information = Info_Bloodwyn_Doch_Info;
	permanent = 1;
	description = "Я передумал. Вот десять кусков руды. ";
};


func int Info_Bloodwyn_Doch_Condition()
{
	if(Bloodwyn_ProtectionPaid == FALSE)
	{
		return 1;
	};
};

func void Info_Bloodwyn_Doch_Info()
{
	AI_Output(other,self,"Info_Bloodwyn_Doch_15_00");	//Я передумал. Вот десять кусков руды.
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_01");	//Вот это другое дело! Видишь - ты МОЖЕШЬ принимать правильные решения.
		AI_Output(self,other,"Info_Bloodwyn_Doch_08_02");	//Теперь ты будешь платить мне каждый день, так?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output(self,other,"Info_Bloodwyn_Doch_NoOre_08_00");	//Возвращайся, когда у тебя будет чем заплатить.
		AI_StopProcessInfos(self);
	};
};


instance Info_Bloodwyn_PayForJesse(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 5;
	condition = Info_Bloodwyn_PayForJesse_Condition;
	information = Info_Bloodwyn_PayForJesse_Info;
	permanent = 1;
	description = "Джесс просил заплатить за него десять кусков руды.";
};


func int Info_Bloodwyn_PayForJesse_Condition()
{
	if(Jesse_PayForMe == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Bloodwyn_PayForJesse_Info()
{
	AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_00");	//Джесс просил заплатить за него десять кусков руды.
	if(Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_01");	//Мне кажется, прежде ты должен заплатить СВОИ десять кусков.
	};
	AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_02");	//Забудь про Джесса. Он неудачник и все равно долго не протянет.
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_03");	//Нет, я заплачу за него. Возьми десять кусков и оставь его в покое.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_04");	//Ладно, парень, как хочешь.
		B_GiveInvItems(other,self,ItMiNugget,10);
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output(other,self,"Info_Bloodwyn_PayForJesse_15_05");	//Черт! Кажется, у меня не хватает руды.
		AI_Output(self,other,"Info_Bloodwyn_PayForJesse_08_06");	//Это знак свыше, парень! Подумай еще раз! Зачем тебе тратить руду на этого лодыря?
	};
};


instance GRD_233_Bloodwyn_WELCOME(C_Info)
{
	npc = GRD_233_Bloodwyn;
	condition = GRD_233_Bloodwyn_WELCOME_Condition;
	information = GRD_233_Bloodwyn_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_233_Bloodwyn_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output(self,other,"GRD_233_Bloodwyn_WELCOME_Info_08_01");	//Теперь ты один из нас. Хорошо. Страже нужны такие парни, как ты.
};


instance Info_Bloodwyn_DIE(C_Info)
{
	npc = GRD_233_Bloodwyn;
	condition = Info_Bloodwyn_DIE_Condition;
	information = Info_Bloodwyn_DIE_Info;
	permanent = 0;
	important = 1;
};


func int Info_Bloodwyn_DIE_Condition()
{
	if((Kapitel == 4) && (Npc_GetTrueGuild(hero) != GIL_GRD))
	{
		return TRUE;
	};
};

func void Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc(self,hero);
	if((oldHeroGuild == GIL_STT) || (oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		if(oldHeroGuild == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_01");	//Предатель в наших рядах! ТЬФУ! И мы называли тебя стражником!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_02");	//Похоже, мы засекли одного из мятежных магов Огня!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_03");	//Нас предал один из Призраков!
			if(hero.guild == GIL_STT)
			{
				Npc_SetTrueGuild(hero,GIL_None);
				hero.guild = GIL_None;
			};
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_04");	//Погоди. О чем ты говоришь, Бладвин?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_05");	//Связался с Новым Лагерем, да?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_06");	//Нет, постой, я...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_07");	//Похоже. ты думал, что сможешь бесконечно пудрить нам мозги.
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_08");	//Что за чушь...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_09");	//Предатели должны умереть.
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_10");	//УМРИ, ПРЕДАТЕЛЬ!!!
		if(Npc_KnowsInfo(hero,Info_Fletcher_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"Флетчер, охраняющий основные ворота, отреагировал так же, как и Бладвин. Не знаю точно, почему, но, должно быть, это как-то связано с моими поисками юниторов для Нового Лагеря.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Бладвин, охраняющий задние ворота Старого Лагеря, назвал меня предателем и перебежчиком. Он не хотел слушать меня и сразу же напал!");
			B_LogEntry(CH4_BannedFromOC,"Похоже, меня изгнали из Старого Лагеря!");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_11");	//Так ты решил высунуть нос из своего Нового Лагеря? Это было очень глупо с твоей стороны!
		}
		else
		{
			AI_Output(self,hero,"Info_Bloodwyn_DIE_08_12");	//О, так ты решил высунуть нос из своего болота? Это было очень глупо с твоей стороны!
		};
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_13");	//Что?! Что ты имеешь в виду?
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_14");	//Ты что, не слышал о нападении на шахте?
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_15");	//Что...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_16");	//Прости, но мы не можем позволить тебе болтать об этом направо и налево.
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_17");	//Эй, я не хочу неприятностей...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_18");	//Тебе стоило подумать об этом раньше!
		AI_Output(hero,self,"Info_Bloodwyn_DIE_15_19");	//Все, с меня довольно...
		AI_Output(self,hero,"Info_Bloodwyn_DIE_08_20");	//С меня тоже! УБЕЙТЕ ЕГО!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	B_ExchangeRoutine(GRD_216_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_217_Torwache,"FMTaken2");
	B_SetPermAttitude(GRD_233_Bloodwyn,ATT_HOSTILE);
	B_SetPermAttitude(GRD_216_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_217_Torwache,ATT_HOSTILE);
	if(!Npc_KnowsInfo(hero,Info_Fletcher_DIE))
	{
		B_LogEntry(CH4_Firemages,"Ворота Старого Лагеря теперь закрыты и охраняются стражниками. Они атакуют любого, кто подходит близко.");
	};
	AI_StopProcessInfos(self);
};


instance GRD_233_BLOODWYN_QUENTIN(C_Info)
{
	npc = GRD_233_Bloodwyn;
	condition = grd_233_bloodwyn_quentin_condition;
	information = grd_233_bloodwyn_quentin_info;
	important = 1;
	permanent = 0;
};


func int grd_233_bloodwyn_quentin_condition()
{
	if(Npc_KnowsInfo(hero,dia_dexter_quentin) || Npc_KnowsInfo(hero,dia_vlk_520_quentin))
	{
		return TRUE;
	};
};

func void grd_233_bloodwyn_quentin_info()
{
	AI_Output(self,other,"GRD_233_Bloodwyn_Quentin_Info_08_01");	//Ты шпион одного из лагерей! Тебе здесь нечего делать.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance INFO_BLOODWYN_GILBERT(C_Info)
{
	npc = GRD_233_Bloodwyn;
	nr = 1;
	condition = info_bloodwyn_gilbert_condition;
	information = info_bloodwyn_gilbert_info;
	permanent = 0;
	description = "Тебе что-нибудь говорит имя Жильбер?";
};


func int info_bloodwyn_gilbert_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void info_bloodwyn_gilbert_info()
{
	AI_Output(other,self,"Info_Bloodwyn_Gilbert_15_00");	//Тебе что-нибудь говорит имя Жильбер?
	AI_Output(self,other,"Info_Bloodwyn_Gilbert_08_00");	//Нет.
	AI_Output(other,self,"Info_Bloodwyn_Gilbert_15_01");	//Это парень, который давным-давно обворовал Торуса.
	AI_Output(self,other,"Info_Bloodwyn_Gilbert_08_01");	//(удивленно) А что Торуса когда-то обворовывали?
	AI_Output(self,other,"Info_Bloodwyn_Gilbert_08_02");	//Я пошутил. Конечно я помню этого... как там... Жилреха.
	AI_Output(other,self,"Info_Bloodwyn_Gilbert_15_02");	//Жильбера!
	AI_Output(self,other,"Info_Bloodwyn_Gilbert_08_03");	//Ну да, я так и сказал. Что тебя интересует?
	AI_Output(other,self,"Info_Bloodwyn_Gilbert_15_03");	//Я хочу знать какую именно вещь он украл у Торуса.
	AI_Output(self,other,"Info_Bloodwyn_Gilbert_08_04");	//Ну, это обойдется тебе в 50 кусков руды.
	Info_AddChoice(info_bloodwyn_gilbert,"У меня нет столько руды.",info_bloodwyn_gilbert_no);
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		Info_AddChoice(info_bloodwyn_gilbert,"Вот возьми.",info_bloodwyn_gilbert_yes);
	};
};

func void info_bloodwyn_gilbert_yes()
{
	AI_Output(other,self,"Info_Bloodwyn_Gilbert_YES_15_00");	//Вот возьми.
	B_GiveInvItems(other,self,ItMiNugget,50);
	AI_Output(self,other,"Info_Bloodwyn_Gilbert_YES_08_00");	//Спасибо парень! Пожалуй, сегодня я напьюсь.
	AI_Output(other,self,"Info_Bloodwyn_Gilbert_YES_15_01");	//Эй! Теперь скажи мне что украл Жильбер.
	AI_Output(self,other,"Info_Bloodwyn_Gilbert_YES_08_01");	//Эээ... Что он украл? Очень ценную для Торуса вещь. А теперь мне пора идти.
	B_LogEntry(CH1_GILBERT,"Этот подлец Бладвин взял с меня 50 кусков руды и не сказал ничего нового.");
	Info_ClearChoices(info_bloodwyn_gilbert);
};

func void info_bloodwyn_gilbert_no()
{
	AI_Output(other,self,"Info_Bloodwyn_Gilbert_NO_15_00");	//У меня нет столько руды.
	AI_Output(self,other,"Info_Bloodwyn_Gilbert_NO_08_00");	//Значит тебе это не интересно.
	B_LogEntry(CH1_GILBERT,"Бладвин требует слишком много за информацию. К тому же у меня сложилось впечатление, что он об этом ничего не знает.");
	Info_ClearChoices(info_bloodwyn_gilbert);
};

