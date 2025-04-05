
instance Info_Kirgo_Exit(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 999;
	condition = Info_Kirgo_Exit_Condition;
	information = Info_Kirgo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Kirgo_Exit_Condition()
{
	return 1;
};

func void Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Kirgo_What(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_What_Condition;
	information = Info_Kirgo_What_Info;
	permanent = 0;
	description = "Привет! Я здесь новенький.";
};


func int Info_Kirgo_What_Condition()
{
	if(Kapitel <= 2)
	{
		return 1;
	};
};

func void Info_Kirgo_What_Info()
{
	AI_Output(other,self,"Info_Kirgo_What_15_00");	//Привет! Я здесь новенький.
	AI_Output(self,other,"Info_Kirgo_What_05_01");	//Мог бы и не говорить! Расскажи мне, что делается во внешнем мире. Уже больше месяца нет никаких новостей оттуда.
	AI_Output(self,other,"Info_Kirgo_What_05_02");	//Меня зовут Кирго. Я дерусь на арене.
};


instance Info_Kirgo_Good(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Good_Condition;
	information = Info_Kirgo_Good_Info;
	permanent = 0;
	description = "И насколько ты хорош? Я имею ввиду - в бою.";
};


func int Info_Kirgo_Good_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func void Info_Kirgo_Good_Info()
{
	AI_Output(other,self,"Info_Kirgo_Good_15_00");	//И как, успешно?
	AI_Output(self,other,"Info_Kirgo_Good_05_01");	//Дерусь-то? Я уже давно этим не занимался, но однажды я победил!
};


instance Info_Kirgo_Charge(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Charge_Condition;
	information = Info_Kirgo_Charge_Info;
	permanent = 0;
	description = "Я хочу вызвать тебя на бой!";
};


func int Info_Kirgo_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kirgo_What) && (Kapitel <= 1))
	{
		return 1;
	};
};

func void Info_Kirgo_Charge_Info()
{
	AI_Output(other,self,"Info_Kirgo_Charge_15_00");	//Я хочу вызвать тебя на бой!
	AI_Output(self,other,"Info_Kirgo_Charge_05_01");	//Что? Но я не хочу драться. Может, просто выпьем по пиву и поговорим о внешнем мире?
	Info_ClearChoices(Info_Kirgo_Charge);
	Info_AddChoice(Info_Kirgo_Charge,"Нет! Я хочу драться. Сейчас!",Info_Kirgo_Charge_NOW);
	Info_AddChoice(Info_Kirgo_Charge,"Ладно, давай твое пиво!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00");	//Нет! Я хочу драться. Сейчас!
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01");	//Раз так... я готов.
	Info_ClearChoices(Info_Kirgo_Charge);
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00");	//Ладно, давай твое пиво!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01");	//Держи!
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02");	//Спасибо! Боюсь, я не много смогу рассказать о внешнем мире - меня два месяца держали в грязной яме, прежде чем бросить сюда.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03");	//Жалко... Ну ладно, ничего... Для парня, которого два месяца продержали в яме, ты выглядишь очень даже ничего.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04");	//Хотелось бы и дальше таким оставаться.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05");	//Почему ты хочешь драться с одним из нас?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06");	//Я хочу, чтобы обо мне узнали в Лагере!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07");	//От Скатти что ли? Х-м, он один из самых влиятельных людей во Внешнем Кольце... Победив меня, ты мог бы произвести на него впечатление...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08");	//Но если ты на самом деле хочешь удивить его, тебе стоит побить Харима. Но боюсь, тебе он не по зубам!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09");	//Если все еще хочешь драться, дай мне знать. Но знаешь, мне совсем не хочется вышибать из тебя дух.
	CreateInvItem(other,ItFoBeer);
	B_GiveInvItems(other,self,ItFoBeer,1);
	self.npcType = npctype_friend;
	Info_ClearChoices(Info_Kirgo_Charge);
};


var int Kirgo_Charged;

instance Info_Kirgo_ChargeREAL(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_ChargeREAL_Condition;
	information = Info_Kirgo_ChargeREAL_Info;
	permanent = 0;
	description = "Мы будем драться - ты готов?";
};


func int Info_Kirgo_ChargeREAL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_Charge) && (Kapitel <= 1))
	{
		return 1;
	};
};

func void Info_Kirgo_ChargeREAL_Info()
{
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00");	//Мы будем драться - ты готов?
	AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01");	//Иди за мной!
	AI_StopProcessInfos(self);
	Kirgo_Charged = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance Info_Kirgo_InArena(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_InArena_Condition;
	information = Info_Kirgo_InArena_Info;
	permanent = 0;
	important = 1;
};


func int Info_Kirgo_InArena_Condition()
{
	if((Kirgo_Charged == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void Info_Kirgo_InArena_Info()
{
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"Info_Kirgo_InArena_05_00");	//Ладно, поехали. Пусть победит сильнейший!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_5_LetsForgetOurLittleFight");	//Забудем об этом, ладно?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};


instance INFO_KIRGO_QUENTIN(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 998;
	condition = info_kirgo_quentin_condition;
	information = info_kirgo_quentin_info;
	permanent = 0;
	description = "Ты что-нибудь знаешь о доставке товаров в шахту?";
};


func int info_kirgo_quentin_condition()
{
	if(GQ_OK == TRUE)
	{
		return 1;
	};
};

func void info_kirgo_quentin_info()
{
	AI_Output(other,self,"Info_Kirgo_Quentin_15_00");	//Ты что-нибудь знаешь о доставке товаров в шахту?
	AI_Output(self,other,"Info_Kirgo_Quentin_05_01");	//Да, что тебе нужно?
	AI_Output(other,self,"Info_Kirgo_Quentin_15_01");	//Сколько стражников будут сопровождать следущую доставку груза?
	AI_Output(self,other,"Info_Kirgo_Quentin_05_02");	//Торус пошлет 5, или 7 человек, как обычно.
	B_LogEntry(CH1_GQW,"К шахте отправятся 5, или 7 стражников.");
};

