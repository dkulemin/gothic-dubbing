
instance DIA_Grim_Exit(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 999;
	condition = DIA_Grim_Exit_Condition;
	information = DIA_Grim_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grim_Exit_Condition()
{
	return 1;
};

func void DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grim_Falle(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Falle_Condition;
	information = DIA_Grim_Falle_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_Falle_Condition()
{
	if((Grim_ProtectionBully == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Grim_Falle_Info()
{
	AI_Output(self,other,"DIA_Grim_Falle_06_00");	//Эй! Ты тот самый парень, который хочет присоединиться к нашему Лагерю?
	AI_Output(other,self,"DIA_Grim_Falle_15_01");	//А что если так?
	AI_Output(self,other,"DIA_Grim_Falle_06_02");	//Я мог бы помочь тебе...
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//И как?
	AI_Output(self,other,"DIA_Grim_Falle_06_04");	//За Лагерем расположились двое типов, один из которых украл кое-что у Баронов. Это драгоценный амулет, который должны были прислать с последним грузом.
	AI_Output(self,other,"DIA_Grim_Falle_06_05");	//Пока он еще у них. И я думаю, вдвоем мы с ними справимся. Что скажешь?
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"Меня это не интересует. Поговори с кем-нибудь еще.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"И что будет, когда мы отберем у них амулет?",DIA_Grim_Falle_HowShare);
	Info_AddChoice(DIA_Grim_Falle,"Можем.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00");	//Меня это не интересует. Поговори с кем-нибудь еще.
	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01");	//С таким характером ты здесь долго не протянешь. Дай мне знать, если передумаешь.
	Info_ClearChoices(DIA_Grim_Falle);
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00");	//И что будет, когда мы отберем у них амулет?
	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01");	//Дальше все просто! Я верну амулет и получу свою награду. Еще я скажу им, что ты помогал мне. И ты будешь у Гомеза на хорошем счету...
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"Меня это не интересует. Поговори с кем-нибудь еще.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Нет! Делим награду пополам!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice(DIA_Grim_Falle,"Можем.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00");	//Нет! Либо делим награду пополам, либо можешь отправляться туда один.
	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01");	//Ладно, ладно, пополам - так пополам. Думаю, нам обоим хватит. Так что, я могу на тебя рассчитывать?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00");	//Можем.
	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01");	//Ладно, дай знать, когда будешь готов.
	Info_ClearChoices(DIA_Grim_Falle);
};


instance DIA_Grim_ReadyToGo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_ReadyToGo_Condition;
	information = DIA_Grim_ReadyToGo_Info;
	permanent = 0;
	description = "Я готов. Пошли за амулетом!";
};


func int DIA_Grim_ReadyToGo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

func void DIA_Grim_ReadyToGo_Info()
{
	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00");	//Я готов. Пошли за амулетом!
	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01");	//Ладно, идем...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Grim_AtOCdraussen(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_AtOCdraussen_Condition;
	information = DIA_Grim_AtOCdraussen_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_AtOCdraussen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo) && (Npc_GetDistToWP(hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500))
	{
		return 1;
	};
};

func void DIA_Grim_AtOCdraussen_Info()
{
	var C_Npc Bu520;
	var C_Npc Bu534;
	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00");	//Ну, вот мы и пришли - подальше от твоего друга Диего...
	if(((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520)) || ((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534)))
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01");	//Мы должны передать тебе привет от Бладвина!
	}
	else
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02");	//Я должен передать тебе привет от Бладвина!
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Bu520 = Hlp_GetNpc(VLK_520_Buddler);
	Bu534 = Hlp_GetNpc(VLK_534_Buddler);
	if((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520))
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_Attack,1,"");
	};
	if((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534))
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_Attack,1,"");
	};
};


instance DIA_Grim_NACHFalle(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_NACHFalle_Condition;
	information = DIA_Grim_NACHFalle_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_NACHFalle_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen) && (Npc_GetDistToNpc(self,other) < ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Grim_NACHFalle_Info()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01");	//Значит ты, скотина, просто заманил меня сюда...
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02");	//Эй, парень! Ты же должен меня понять! Просто я тоже не хочу гнуть спину в шахте.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03");	//Если я хорошо справлюсь с этим поручением, меня сделают стражником.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04");	//И то, что мне поручили убрать именно ТЕБЯ, целиком и полностью твоя же вина. Зачем тебе понадобилось наживать врагов среди стражников?
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05");	//Лично я против тебя ничего не имею. Так что ты предпочитаешь - мир или драку?
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Info_AddChoice(DIA_Grim_NACHFalle,"Валяй.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice(DIA_Grim_NACHFalle,"Мир.",DIA_Grim_NACHFalle_Frieden);
};

func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00");	//Мы будем драться!
	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01");	//Парень, ты меня разочаровал...
	Info_ClearChoices(DIA_Grim_NACHFalle);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00");	//Мир всегда лучше драки.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01");	//Я рад, что мы понимаем друг друга. Забудем об этом. Теперь я на твоей стороне.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02");	//Если когда-нибудь еще попадешь в неприятности, можешь на меня рассчитывать - в конце концов, я твой должник.
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};


var int FirstOver;

instance DIA_Grim_Hallo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_Hallo_Condition;
	information = DIA_Grim_Hallo_Info;
	permanent = 0;
	description = "Я здесь новенький.";
};


func int DIA_Grim_Hallo_Condition()
{
	if(Grim_ProtectionBully == TRUE)
	{
		FirstOver = TRUE;
	};
	if(FirstOver == FALSE)
	{
		return 1;
	};
};

func void DIA_Grim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Grim_Hallo_15_00");	//Я здесь новенький.
	AI_Output(self,other,"DIA_Grim_Hallo_06_01");	//Только что прибыл, да? Меня зовут Грим. Я тоже здесь недавно: меня забросили с прошлым караваном.
};


instance DIA_Grim_Leben(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Leben_Condition;
	information = DIA_Grim_Leben_Info;
	permanent = 0;
	description = "И как здесь живется?";
};


func int DIA_Grim_Leben_Condition()
{
	return 1;
};

func void DIA_Grim_Leben_Info()
{
	AI_Output(other,self,"DIA_Grim_Leben_15_00");	//И как здесь живется?
	AI_Output(self,other,"DIA_Grim_Leben_06_01");	//Не так уж паршиво, пока ты платишь стражникам за защиту.
};


instance DIA_Grim_Aufnahme(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_Aufnahme_Condition;
	information = DIA_Grim_Aufnahme_Info;
	permanent = 0;
	description = "Что нужно сделать, чтобы меня приняли в этот Лагерь?";
};


func int DIA_Grim_Aufnahme_Condition()
{
	return 1;
};

func void DIA_Grim_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00");	//Что нужно сделать, чтобы меня приняли в этот Лагерь?
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01");	//Ну, прежде всего тебе нужно стать одним из Призраков. Нужно найти кого-нибудь, кто за тебя поручится и будет помогать тебе.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02");	//На твоем месте я бы держался поближе к Диего. Я сам так делал - он мужик что надо.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03");	//Он заставит тебя пройти испытание - для каждого оно свое. Потом будут какие-нибудь мелкие поручения от остальных Призраков.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04");	//Если справишься, станешь одним из нас.
};


var int Grim_Tests;

instance DIA_Grim_HowFarAreYou(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 4;
	condition = DIA_Grim_HowFarAreYou_Condition;
	information = DIA_Grim_HowFarAreYou_Info;
	permanent = 1;
	description = "И как продвигается твое испытание?";
};


func int DIA_Grim_HowFarAreYou_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

func void DIA_Grim_HowFarAreYou_Info()
{
	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00");	//И как продвигается твое испытание?
	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01");	//Я уже поговрил с Декстером, Слаем и Фингерсом - они самые влиятельные Призраки в этом Лагере.
	if(!Grim_Tests)
	{
		B_LogEntry(CH1_JoinOC,"Декстер, Слай и Фингерс - весьма влиятельные Призраки.");
		Grim_Tests = TRUE;
	};
};


instance DIA_Grim_YourPDV(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 5;
	condition = DIA_Grim_YourPDV_Condition;
	information = DIA_Grim_YourPDV_Info;
	permanent = 0;
	description = "Как испытывали ТЕБЯ?";
};


func int DIA_Grim_YourPDV_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

func void DIA_Grim_YourPDV_Info()
{
	AI_Output(other,self,"DIA_Grim_YourPDV_15_00");	//Как испытывали ТЕБЯ?
	AI_Output(self,other,"DIA_Grim_YourPDV_06_01");	//Я не могу сказать тебе, парень. О таких вещах здесь не говорят!
};


instance DIA_Grim_INEXTREMO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMO_Condition;
	information = DIA_Grim_INEXTREMO_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_INEXTREMO_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMO_Info()
{
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01");	//Эй, слышал новости?
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02");	//In Extremo здесь! Они там, на сцене.
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03");	//Торопись, а то пропустишь все интересное!
	Npc_ExchangeRoutine(self,"InExtremo");
	AI_StopProcessInfos(self);
};


instance DIA_Grim_INEXTREMOAWAY(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMOAWAY_Condition;
	information = DIA_Grim_INEXTREMOAWAY_Info;
	permanent = 0;
	important = 0;
	description = "Где In Extremo?";
};


func int DIA_Grim_INEXTREMOAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_INEXTREMO) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01");	//Где In Extremo?
	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02");	//Они уехали. Жаль, я уже привык проводить вечера перед сценой.
	AI_StopProcessInfos(self);
};


instance DIA_GRIM_QUENTIN(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 998;
	condition = dia_grim_quentin_condition;
	information = dia_grim_quentin_info;
	permanent = 0;
	important = 0;
	description = "Что ты можешь сказать о доставке товаров в шахту?";
};


func int dia_grim_quentin_condition()
{
	if(GQ_OK == TRUE)
	{
		return 1;
	};
};

func void dia_grim_quentin_info()
{
	AI_Output(hero,self,"DIA_Grim_Quentin_15_00");	//Что ты можешь сказать о доставке товаров в шахту?
	AI_Output(self,hero,"DIA_Grim_Quentin_06_01");	//Товары доставят через день, после того, как Торус получит список.
	B_LogEntry(CH1_GQW,"Товары будут доставлены на следующий день после того, как Торус получит список.");
};

