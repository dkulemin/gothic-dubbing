
instance DIA_Fletcher_EXIT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 999;
	condition = DIA_Fletcher_EXIT_Condition;
	information = DIA_Fletcher_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

func void DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fletcher_First(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_First_Condition;
	information = DIA_Fletcher_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Fletcher_First_Condition()
{
	if(Wld_IsTime(0,0,6,0))
	{
		return 1;
	};
};

func void DIA_Fletcher_First_Info()
{
	AI_Output(self,other,"DIA_Fletcher_First_06_00");	//Эй, ты!
	AI_Output(other,self,"DIA_Fletcher_First_15_01");	//Кто? Я?
	AI_Output(self,other,"DIA_Fletcher_First_06_02");	//Ты сам знаешь, к кому я обращаюсь!
	AI_Output(self,other,"DIA_Fletcher_First_06_03");	//Вот что я тебе скажу, сынок - это МОЙ район. И мне не нужны неприятности!
	AI_Output(self,other,"DIA_Fletcher_First_06_04");	//Но новички, вроде тебя, всегда становятся их причиной - особенно когда шляются без дела по ночам.
	AI_Output(self,other,"DIA_Fletcher_First_06_05");	//Так почему бы тебе не отправиться домой и не позаботиться о том чтобы я больше тебя здесь не видел? Как раз напротив арены есть пустой дом - ты узнаешь его по навесу. Отправляйся спать.
	AI_Output(self,other,"DIA_Fletcher_First_06_06");	//И если я поймаю тебя в какой-нибудь другой хижине, я лично прослежу за тем, чтобы ты очень пожалел об этом.
	AI_StopProcessInfos(self);
};


var int fletcher_whytalk;

instance DIA_Fletcher_Hello(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 2;
	condition = DIA_Fletcher_Hello_Condition;
	information = DIA_Fletcher_Hello_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Fletcher_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void DIA_Fletcher_Hello_Info()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00");	//Эй, ты!
	AI_Output(self,other,"DIA_Fletcher_Hello_06_01");	//Если собираешься заплатить за защиту, ты выбрал для этого неправильный день.
	AI_Output(other,self,"DIA_Fletcher_Hello_15_02");	//Да? И почему?
	AI_Output(self,other,"DIA_Fletcher_Hello_06_03");	//Потому что меня здесь нет.
	Info_ClearChoices(DIA_Fletcher_Hello);
	Info_AddChoice(DIA_Fletcher_Hello,"Понятно.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice(DIA_Fletcher_Hello,"Тогда почему же я с тобой разговариваю?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice(DIA_Fletcher_Hello,"А-а. И где же ты в таком случае?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00");	//А-а. И где же ты в таком случае?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01");	//Я в замке, сижу возле большого костра, в руках кубок с пивом.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00");	//Тогда почему же я с тобой разговариваю?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01");	//Да потому что Нек пропал, а это его район.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02");	//И до тех пор, пока он не появится, Торус приказал МНЕ стоять на страже.
	fletcher_whytalk = TRUE;
	Info_ClearChoices(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00");	//Понятно.
	Info_ClearChoices(DIA_Fletcher_Hello);
};


instance DIA_Fletcher_WoNek(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WoNek_Condition;
	information = DIA_Fletcher_WoNek_Info;
	permanent = 0;
	description = "Не знаешь, где сейчас может быть Нек?";
};


func int DIA_Fletcher_WoNek_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk == TRUE))
	{
		return 1;
	};
};

func void DIA_Fletcher_WoNek_Info()
{
	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00");	//Не знаешь, где сейчас может быть Нек?
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01");	//Не знаю, да и узнать неоткуда.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02");	//По-любому, местные рудокопы должны что-то знать, вот только не будут они говорить со стражником.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03");	//Особенно сейчас - ведь они знают, как я ненавижу эту чертову работу. Уверен, они смеются у меня за спиной!
	Log_CreateTopic(CH1_LostNek,LOG_MISSION);
	Log_SetTopicStatus(CH1_LostNek,LOG_RUNNING);
	B_LogEntry(CH1_LostNek,"Может, копатели в районе арены знают, куда пропал Нек.");
};


instance DIA_Fletcher_TroSchu(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_TroSchu_Condition;
	information = DIA_Fletcher_TroSchu_Info;
	permanent = 0;
	description = "Почему бы тебе в отместку не собрать с них еще денег за защиту?";
};


func int DIA_Fletcher_TroSchu_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Hello))
	{
		return 1;
	};
};

func void DIA_Fletcher_TroSchu_Info()
{
	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00");	//Почему бы тебе в отместку не собрать с них еще денег за защиту?
	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01");	//Нек уже сделал обход, прежде чем исчезнуть. Теперь у них в карманах пусто.
};


var int fletcher_foundNek;

instance DIA_Fletcher_WegenNek(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WegenNek_Condition;
	information = DIA_Fletcher_WegenNek_Info;
	permanent = 1;
	description = "Я по поводу Нека...";
};


func int DIA_Fletcher_WegenNek_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek == FALSE))
	{
		return 1;
	};
};

func void DIA_Fletcher_WegenNek_Info()
{
	var C_Npc Nek;
	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00");	//Я по поводу Нека...
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_01");	//Да?
	Nek = Hlp_GetNpc(GRD_282_Nek);
	if((Sly_LostNek == LOG_SUCCESS) || !Hlp_IsValidNpc(Nek))
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_02");	//Думаю, я нашел его.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03");	//Что? Где он?
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04");	//Кормит крыс...
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05");	//О, нет! Проклятье! Значит, теперь я останусь здесь насовсем. Я так надеялся, что он вернется!
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06");	//Теперь у меня появилась проблема.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Fletcher_WegenNek_15_07");	//Никаких новостей.
		AI_Output(self,other,"DIA_Fletcher_WegenNek_06_08");	//Держи меня в курсе.
	};
};


instance DIA_Fletcher_Problem(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_Problem_Condition;
	information = DIA_Fletcher_Problem_Info;
	permanent = 0;
	description = "Эй, в чем проблема?";
};


func int DIA_Fletcher_Problem_Condition()
{
	if(fletcher_foundNek == TRUE)
	{
		return 1;
	};
};

func void DIA_Fletcher_Problem_Info()
{
	AI_Output(other,self,"DIA_Fletcher_Problem_15_00");	//Какая проблема?
	AI_Output(self,other,"DIA_Fletcher_Problem_06_01");	//Я по уши в долгах перед Скатти. Теперь он узнает, что я занял место Нека, и будет приходить сюда каждый день...
	Log_CreateTopic(CH1_FLETCHER,LOG_MISSION);
	Log_SetTopicStatus(CH1_FLETCHER,LOG_RUNNING);
	B_LogEntry(CH1_FLETCHER,"Флетчер задолжал Скатти крупную сумму руды.");
};


instance DIA_FLETCHER_NOPROBLEM(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_noproblem_condition;
	information = dia_fletcher_noproblem_info;
	permanent = 0;
	description = "Я думаю, что смогу помочь тебе.";
};


func int dia_fletcher_noproblem_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Problem) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void dia_fletcher_noproblem_info()
{
	AI_Output(other,self,"DIA_Fletcher_NoProblem_15_00");	//Я думаю, что смогу помочь тебе уладить проблему со Скатти.
	AI_Output(self,other,"DIA_Fletcher_NoProblem_06_00");	//Ох, парень! С какой стати тебе это делать? У тебя что слишком много руды?
	AI_Output(other,self,"DIA_Fletcher_NoProblem_15_01");	//Нет. Но я знаю, как сделать, чтобы ее стало много у тебя.
	AI_Output(self,other,"DIA_Fletcher_NoProblem_06_01");	//Что ты задумал?
	AI_Output(other,self,"DIA_Fletcher_NoProblem_15_02");	//Скоро состоится бой. Ты можешь поставить на меня, и я обязательно выиграю!
	AI_Output(self,other,"DIA_Fletcher_NoProblem_06_02");	//Я не знаю, насколько ты хороший боец... Но, пожалуй мне стоит рискнуть.
	AI_Output(self,other,"DIA_Fletcher_NoProblem_06_03");	//Но чтобы полностью расплатится со Скатти мне нужно поставить не меньше 150 кусков руды.
	AI_Output(self,other,"DIA_Fletcher_NoProblem_06_04");	//У меня есть 50, а где я возьму остальное?
	B_LogEntry(CH1_FLETCHER,"Флетчеру нужно 100 кусков руды, чтобы сделать ставку.");
};


instance DIA_FLETCHER_NOPROBLEM_START(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_noproblem_start_condition;
	information = dia_fletcher_noproblem_start_info;
	permanent = 0;
	description = "(отдать 100 кусков руды)";
};


func int dia_fletcher_noproblem_start_condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_noproblem) && (Npc_HasItems(hero,ItMiNugget) >= 100) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void dia_fletcher_noproblem_start_info()
{
	AI_Output(other,self,"DIA_Fletcher_NoProblem_Start_15_00");	//Вот руда.
	AI_Output(self,other,"DIA_Fletcher_NoProblem_Start_06_00");	//Хорошо. Я верну ее тебе, если ты выиграешь бой.
	B_GiveInvItems(hero,self,ItMiNugget,100);
	B_LogEntry(CH1_FLETCHER,"Я отдал Флетчеру 100 кусков руды. Теперь он поставит на меня.");
};


instance DIA_FLETCHER_NOPROBLEM_FINISH(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_noproblem_finish_condition;
	information = dia_fletcher_noproblem_finish_info;
	permanent = 0;
	description = "Я сражался с Гор Ханисом.";
};


func int dia_fletcher_noproblem_finish_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_gorhanissuccess) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void dia_fletcher_noproblem_finish_info()
{
	AI_Output(other,self,"DIA_Fletcher_NoProblem_Finish_15_00");	//Я сражался с Гор Ханисом.
	if(GORHANIS_SUCCESS == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_NoProblem_Finish_06_00");	//И ты победил его.
		AI_Output(self,other,"DIA_Fletcher_NoProblem_Finish_06_01");	//Вот твои 100 кусков.
		B_GiveXP(800);
		B_GiveInvItems(self,hero,ItMiNugget,100);
		Log_SetTopicStatus(CH1_FLETCHER,LOG_SUCCESS);
		B_LogEntry(CH1_FLETCHER,"Флетчер был очень рад тому, что я побил Гор Ханиса. Теперь он расплатился со Скатти.");
	}
	else
	{
		AI_Output(self,other,"DIA_Fletcher_NoProblem_Finish_06_02");	//И ты проиграл.
		AI_Output(self,other,"DIA_Fletcher_NoProblem_Finish_06_03");	//Из-за тебя у меня совсем не осталось руды.
		Log_SetTopicStatus(CH1_FLETCHER,LOG_FAILED);
		B_LogEntry(CH1_FLETCHER,"Из-за меня Флетчер проиграл последние 50 кусков руды. Зря я взялся за это дело.");
	};
};


instance DIA_FLETCHER_PROBLEM_FINISH(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_problem_finish_condition;
	information = dia_fletcher_problem_finish_info;
	permanent = 1;
	description = "Как дела?";
};


func int dia_fletcher_problem_finish_condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_noproblem_finish) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void dia_fletcher_problem_finish_info()
{
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00");	//Как дела?
	if(GORHANIS_SUCCESS == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Problem_Finish_06_00");	//Отлично! Теперь у меня нет проблем с рудой.
	}
	else
	{
		AI_Output(self,other,"DIA_Fletcher_Problem_Finish_06_01");	//Не зли меня, парень.
	};
};


instance Grd_255_Fletcher_WELCOME(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = Grd_255_Fletcher_WELCOME_Condition;
	information = Grd_255_Fletcher_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int Grd_255_Fletcher_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01");	//Ты быстро нашел здесь свое место. Добро пожаловать в Стражу!
};


instance Info_Fletcher_DIE(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = Info_Fletcher_DIE_Condition;
	information = Info_Fletcher_DIE_Info;
	permanent = 0;
	important = 1;
};


func int Info_Fletcher_DIE_Condition()
{
	if((Kapitel == 4) && (Npc_GetTrueGuild(hero) != GIL_GRD))
	{
		return TRUE;
	};
};

func void Info_Fletcher_DIE_Info()
{
	AI_GotoNpc(self,hero);
	if((oldHeroGuild == GIL_STT) || (oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		if(oldHeroGuild == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_01");	//Предатель! Подумать только - мы позволили тебе стать одним из стражников!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_02");	//Это один из предателей-магов!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_03");	//Привет, предатель! Пусть ты и один из Призраков Гомеза - тебе это не поможет!
			if(hero.guild == GIL_STT)
			{
				Npc_SetTrueGuild(hero,GIL_None);
				hero.guild = GIL_None;
			};
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_04");	//Эй, Флетчер, о чем ты говоришь?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_05");	//Ты в сговоре с этим отребьем из Нового Лагеря, ведь так?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_06");	//Постой...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_07");	//Полагаю, ты думал, что никто и не догадается, а?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_08");	//Ух ты... Попридержи-ка коней!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_09");	//Нет, лучше уж ты попридержи свою голову - потому что скоро ты ее лишишься!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_10");	//УМРИ, ПРЕДАТЕЛЬ!!!
		if(Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"Бладвин окопался у задних ворот. Он отреагировал точно так же, как и Флетчер. Я не знаю точно, почему, должно быть, это как-то связано с моими поисками юниторов для Нового Лагеря.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Флетчер, охраняющий основные ворота, назвал меня предателем и перебежчиком. Он не стал слушать меня и тут же напал!");
			B_LogEntry(CH4_BannedFromOC,"Похоже, меня изгнали из Старого Лагеря!");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_11");	//Ты только посмотри - парень из Нового Лагеря!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_12");	//Ты только посмотри - парень из Болотного Лагеря!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_13");	//И что? Какое тебе до этого дело?
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_14");	//Скоро нам будет принадлежать ваша шахта.
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_21");	//Скоро нам будет принадлежать Свободная шахта.
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_15");	//Да? Мечтай дальше!
		AI_Output(self,hero,"Info_Fletcher_DIE_06_16");	//Но сам понимаешь - теперь я не могу позволить тебе болтать об этом на каждом углу!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_17");	//Постой, мне не нужны неприятности.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_18");	//Тебе стоило подумать об этом, прежде чем приходить сюда!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//Эй, какого...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_20");	//Вперед, парни, взять его!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	B_ExchangeRoutine(GRD_214_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_215_Torwache,"FMTaken2");
	B_SetPermAttitude(GRD_255_Fletcher,ATT_HOSTILE);
	B_SetPermAttitude(GRD_214_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_215_Torwache,ATT_HOSTILE);
	if(!Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
	{
		B_LogEntry(CH4_Firemages,"Ворота Старого Лагеря теперь закрыты и охраняются стражниками. Они атакуют любого, кто подходит близко.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_FLETCHER_GILBERT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_gilbert_condition;
	information = dia_fletcher_gilbert_info;
	permanent = 0;
	description = "(спросить про Жильбера)";
};


func int dia_fletcher_gilbert_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_fletcher_gilbert_info()
{
	AI_Output(other,self,"DIA_Fletcher_Gilbert_15_00");	//Извини, что отрываю тебя от дел...
	AI_Output(self,other,"DIA_Fletcher_Gilbert_06_00");	//Чего тебе?
	AI_Output(other,self,"DIA_Fletcher_Gilbert_15_01");	//Ты мог бы мне помочь?
	AI_Output(self,other,"DIA_Fletcher_Gilbert_06_01");	//Плати 10 кусков руды и ты будешь под моей защитой.
	AI_Output(other,self,"DIA_Fletcher_Gilbert_15_02");	//Я имел ввиду другое... Что ты знаешь о Жильбере?
	AI_Output(self,other,"DIA_Fletcher_Gilbert_06_02");	//Постой. Это как-то связано с Торусом, я прав?
	AI_Output(other,self,"DIA_Fletcher_Gilbert_15_03");	//Да. Это парень, который его обчистил.
	AI_Output(self,other,"DIA_Fletcher_Gilbert_06_03");	//Точно. И что ты хочешь о нем узнать?
	AI_Output(other,self,"DIA_Fletcher_Gilbert_15_04");	//Он украл какую-то вещь у Торуса. Мне надо знать, что это было.
	AI_Output(self,other,"DIA_Fletcher_Gilbert_06_04");	//Я не настолько близок с Торусом, чтобы знать такие вещи.
	AI_Output(self,other,"DIA_Fletcher_Gilbert_06_05");	//Попробуй распросить об этом Бладвина.
	B_LogEntry(CH1_GILBERT,"Флетчер слышал про Жильбера, но об украденной вещи ничего не знает. Он отправил меня к Бладвину.");
};

