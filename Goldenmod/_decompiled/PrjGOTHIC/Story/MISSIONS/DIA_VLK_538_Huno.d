
instance DIA_Huno_Exit(C_Info)
{
	npc = VLK_538_Huno;
	nr = 999;
	condition = DIA_Huno_Exit_Condition;
	information = DIA_Huno_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Huno_Exit_Condition()
{
	return 1;
};

func void DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Huno_YouKnowYourJob(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_YouKnowYourJob_Condition;
	information = DIA_Huno_YouKnowYourJob_Info;
	permanent = 0;
	important = 0;
	description = "Похоже, ты хорошо знаешь свое дело.";
};


func int DIA_Huno_YouKnowYourJob_Condition()
{
	return TRUE;
};

func void DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//Похоже, ты хорошо знаешь свое дело.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//Пока еще никто не жаловался.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//Да и что толку жаловаться? Здесь каждому идиоту нужен свой меч, а хорошие мечи делаю только я.
};


instance DIA_Huno_HowLong(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowLong_Condition;
	information = DIA_Huno_HowLong_Info;
	permanent = 0;
	important = 0;
	description = "Сколько времени уходит на изготовление одного меча?";
};


func int DIA_Huno_HowLong_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowLong_Info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//Сколько времени уходит на изготовление одного меча?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//Смотря какой нужен меч. Обычные я делаю практически моментально.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//Ну, разумеется, если цена меня устраивает.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//Ну а уродам, вроде Уистлера, приходится ждать дольше, чем всем остальным.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//Почему? Он мало платит?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//Как раз наоборот. За последний меч он заплатил мне 150 кусков руды.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//Парню нравятся украшения и прочьи бабьи штучки, а это стоит недешево.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//Эй, да ты меня совсем не слушаешь!
};


instance DIA_Huno_HowsYourBusiness(C_Info)
{
	npc = VLK_538_Huno;
	nr = 1;
	condition = DIA_Huno_HowsYourBusiness_Condition;
	information = DIA_Huno_HowsYourBusiness_Info;
	permanent = 0;
	important = 0;
	description = "Как дела, кузнец?";
};


func int DIA_Huno_HowsYourBusiness_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//Как дела, кузнец?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//Интересно, почему ты спрашиваешь...
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//Может, у меня есть для тебя работа.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_04");	//Лучше бы сам что-нибудь сделал!
};


var int Huno_LearnSmith;

instance DIA_Huno_LEARNSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_LEARNSMITH_Condition;
	information = DIA_Huno_LEARNSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Я бы тоже хотел здесь поработать.";
};


func int DIA_Huno_LEARNSMITH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_LEARNSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//Я бы тоже хотел здесь поработать.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//Уж не думаешь ли ты, что способен делать хорошие клинки?
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Что я должен делать?
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Вот, бери заготовку и суй ее в огонь.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Когда металл раскалится докрасна, клади его на наковальню.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Готовый меч нужно опустить в ведро с водой, чтобы охладить металл.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Ну а потом ты затачиваешь его на точильном камне.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07");	//Понятно.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08");	//Для всего этого понадобятся инструменты - и я могу продать их тебе.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_09");	//И ты можешь продавать мне свои мечи.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Кузнец Хуно может продать мне стальные заготовки. Также он будет покупать выкованные мной мечи.");
	Huno_LearnSmith = TRUE;
};


instance DIA_Huno_BUYSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_BUYSMITH_Condition;
	information = DIA_Huno_BUYSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Мне нужны инструменты!";
	trade = 1;
};


func int DIA_Huno_BUYSMITH_Condition()
{
	if(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Huno_BUYSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//Мне нужны инструменты!
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) < 5)
	{
		CreateInvItems(self,ItMiSwordrawhot,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) < 5)
	{
		CreateInvItems(self,ItMiSwordbladehot,5);
	};
	if(Npc_HasItems(self,ItMiSwordblade) < 5)
	{
		CreateInvItems(self,ItMiSwordblade,5);
	};
};


instance DIA_HUNO_TRADE_SWORD(C_Info)
{
	npc = VLK_538_Huno;
	nr = 600;
	condition = dia_huno_trade_sword_condition;
	information = dia_huno_trade_sword_info;
	permanent = 1;
	description = "(продать оружие)";
};


func int dia_huno_trade_sword_condition()
{
	if(Huno_LearnSmith == TRUE)
	{
		return 1;
	};
};

func void dia_huno_trade_sword_info()
{
	AI_Output(other,self,"DIA_Huno_TRADE_SWORD_15_00");	//Я хочу продать выкованные мной мечи.
	if(HUNO_ST == FALSE)
	{
		AI_Output(self,other,"DIA_Huno_TRADE_SWORD_09_00");	//Я заплачу тебе 70 кусков руды за каждый меч.
		Log_CreateTopic(GE_TRADERSWORD,LOG_NOTE);
		B_LogEntry(GE_TRADERSWORD,"Кузнец Хуно в Старом лагере будет покупать мои мечи за 70 кусков руды.");
		HUNO_ST = TRUE;
	};
	if(Npc_HasItems(other,ItMw_1H_Sword_01) >= 1)
	{
		Info_AddChoice(dia_huno_trade_sword,"(продать 1 меч)",dia_huno_trade_sword_b);
	};
	Info_AddChoice(dia_huno_trade_sword,"Я зайду позже.",dia_huno_trade_sword_no);
};

func void dia_huno_trade_sword_no()
{
	AI_Output(other,self,"DIA_Huno_TRADE_SWORD_NO");	//Я зайду позже.
	Info_ClearChoices(dia_huno_trade_sword);
};

func void dia_huno_trade_sword_b()
{
	B_GiveInvItems(other,self,ItMw_1H_Sword_01,1);
	B_GiveInvItems(self,other,ItMiNugget,70);
	Info_ClearChoices(dia_huno_trade_sword);
	if(Npc_HasItems(other,ItMw_1H_Sword_01) >= 1)
	{
		Info_AddChoice(dia_huno_trade_sword,"(продать 1 меч)",dia_huno_trade_sword_b);
	};
	Info_AddChoice(dia_huno_trade_sword,"Я зайду позже.",dia_huno_trade_sword_no);
};

