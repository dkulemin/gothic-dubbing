
instance Info_GorHanis_Exit(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GorHanis_What(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	permanent = 0;
	description = "Чем ты занимаешься?";
};


func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//Чем ты занимаешься?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//Я? Сражаюсь во славу Спящего!
};


instance Info_GorHanis_Arena(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	permanent = 1;
	description = "Ты дерешься на арене?";
};


func int Info_GorHanis_Arena_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Arena_Info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//Ты дерешься на арене?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//Болотные братья послали меня сюда сражаться во славу Спящего.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//Я дерусь во имя Спящего - и неверные видят, какой силой он наделил меня!
};


instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "Кто такой Спящий?";
};


func int Info_GorHanis_Sleeper_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Sleeper_Info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Кто такой Спящий?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//Жрецы в нашем Лагере расскажут тебе о нем куда лучше, чем я.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//Я только вот что тебе скажу: Спящий - наш спаситель. Он привел нас сюда, он же и выведет нас отсюда.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//То есть вы ждете, пока ваш бог подарит вам свободу?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//Да! И наше ожидание скоро окончится. Уже готовится Великая Церемония.
};


instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "Что за церемония?";
};


func int Info_GorHanis_Summoning_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func void Info_GorHanis_Summoning_Info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//Что за церемония?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//Наши пророки говорят, что Великая Церемония вызова Спящего откроет нам путь к свободе!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//Если хочешь узнать об этом больше, приходи в наш Лагерь.
};


instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 1;
	description = "Как добраться до вашего Лагеря?";
};


func int Info_GorHanis_WayToST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning))
	{
		return 1;
	};
};

func void Info_GorHanis_WayToST_Info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//Как добраться до вашего Лагеря?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//Здесь, в Старом Лагере, всегда можно найти кого-нибудь из послушников. Они с радостью проводят тебя в наш Лагерь. Тебе просто нужно поговорить с ними.
};


instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "Я вызываю тебя на бой!";
};


func int Info_GorHanis_Charge_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Charge_Info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//Я вызываю тебя на бой!
	AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//Невелика слава для Спящего, если я буду убивать каждого бездельника на глазах у толпы.
	AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//Я буду драться с тобой только тогда, когда ты станешь достойным противником.
	AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//Но я думаю, что у бойцов из других Лагерей куда меньше принципов...
};


var int gorhanis_charged;

instance Info_GorHanis_ChargeGood(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	permanent = 1;
	description = "Ну что, теперь ты будешь драться со мной?";
};


func int Info_GorHanis_ChargeGood_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Charge) && (GORHINIS_FIGHT_OK == FALSE) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void Info_GorHanis_ChargeGood_Info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//Ну что, теперь ты будешь драться со мной?
	if(!Npc_KnowsInfo(hero,dia_fletcher_noproblem_start))
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//Нет! Ты еще недостаточно силен для этого!
	}
	else if(SCATTY_OK == FALSE)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_02");	//Скатти не дал тебе свое согласие на проведение боев.
	}
	else
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_03");	//Ты готов сразиться со мной?
		AI_Output(other,self,"Info_GorHanis_ChargeGood_15_01");	//Да, я готов.
		SCATTY_OK = FALSE;
		Info_GorHanis_ChargeGood.permanent = 0;
		AI_StopProcessInfos(self);
		GORHANIS_CHARGED = TRUE;
		GORHINIS_FIGHT_OK = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
	};
};


instance INFO_GORHANIS_INARENA(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = info_gorhanis_inarena_condition;
	information = info_gorhanis_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_gorhanis_inarena_condition()
{
	if((GORHANIS_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void info_gorhanis_inarena_info()
{
	var C_Npc scatty;
	var C_Npc fletcher;
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"Info_GorHanis_InArena_08_00");	//Начинаем!
		GORHANIS_OK = TRUE;
		SCATTYNUGGESTNO = TRUE;
		scatty = Hlp_GetNpc(GRD_210_Scatty);
		fletcher = Hlp_GetNpc(GRD_255_Fletcher);
		Npc_SetTrueGuild(scatty,GIL_None);
		scatty.guild = GIL_None;
		Npc_SetTrueGuild(fletcher,GIL_None);
		fletcher.guild = GIL_None;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_8_LetsForgetOurLittleFight");	//Забудем об этом, ладно?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};

