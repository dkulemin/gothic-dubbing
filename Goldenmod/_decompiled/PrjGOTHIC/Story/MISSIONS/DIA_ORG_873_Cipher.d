
instance Org_873_Cipher_Exit(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 999;
	condition = Org_873_Cipher_Exit_Condition;
	information = Org_873_Cipher_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

func void Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_873_Cipher_Hello(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Hello_Condition;
	information = Org_873_Cipher_Hello_Info;
	permanent = 0;
	description = "Как жизнь?";
};


func int Org_873_Cipher_Hello_Condition()
{
	if(Balor_TellsNCDealer == TRUE)
	{
		return 1;
	};
};

func void Org_873_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Cipher_Hello_12_01");	//Мы еще раз крепко насолили Гомезу.
	AI_Output(self,other,"DIA_Cipher_Hello_12_02");	//Три убитых стражника и куча добра на продажу. За это я выпью!
	AI_Output(other,self,"DIA_Cipher_Hello_15_03");	//ВЫ постоянно совершаете набеги на Старый Лагерь?
	AI_Output(self,other,"DIA_Cipher_Hello_12_04");	//Нет, только когда дело того стоит.
};


instance Org_873_Cipher_Fisk(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Fisk_Condition;
	information = Org_873_Cipher_Fisk_Info;
	permanent = 1;
	description = "Фиску из Старого Лагеря нужен компаньон.";
};


func int Org_873_Cipher_Fisk_Condition()
{
	if(Fisk_GetNewHehler == LOG_RUNNING)
	{
		return 1;
	};
};

func void Org_873_Cipher_Fisk_Info()
{
	AI_Output(other,self,"DIA_Cipher_Fisk_15_00");	//Фиску из Старого Лагеря нужен компаньон.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_01");	//Меня это не интересует.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_02");	//Но это вполне может заинтересовать Шарки. Спроси его при встрече.
};


var int Cipher_Trade;

instance Org_873_Cipher_FromBalor(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_FromBalor_Condition;
	information = Org_873_Cipher_FromBalor_Info;
	permanent = 1;
	description = "Что у вас есть?";
};


func int Org_873_Cipher_FromBalor_Condition()
{
	if(Npc_KnowsInfo(hero,Org_873_Cipher_Hello) && (Cipher_Trade == FALSE))
	{
		return 1;
	};
};

func void Org_873_Cipher_FromBalor_Info()
{
	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00");	//Что у вас есть?
	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01");	//Давай изменим вопрос. Что есть у ТЕБЯ? Я занимаюсь только крупными сделками.
	if(Balor_TellsNCDealer == TRUE)
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02");	//Бэлор говорил,  тебе нужен болотник.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03");	//Ммммм. Хочешь обменять его?
		B_GiveXP(250);
		Cipher_Trade = TRUE;
		Org_873_Cipher_FromBalor.permanent = 0;
	}
	else
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04");	//В этом я тебе не помощник.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05");	//Тогда возвращайся, когда ты сможешь мне помочь.
	};
};


instance Org_873_Cipher_TRADE(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 2;
	condition = Org_873_Cipher_TRADE_Condition;
	information = Org_873_Cipher_TRADE_Info;
	permanent = 1;
	description = "Предлагаю сделку.";
	trade = 1;
};


func int Org_873_Cipher_TRADE_Condition()
{
	if(Cipher_Trade == TRUE)
	{
		return 1;
	};
};

func void Org_873_Cipher_TRADE_Info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Предлагаю сделку.
	AI_Output(self,other,"DIA_Cipher_TRADE_12_01");	//Что тебе нужно?
};


instance DIA_CIPHER_TRADE_SWAMPHERB(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = dia_cipher_trade_swampherb_condition;
	information = dia_cipher_trade_swampherb_info;
	permanent = 1;
	description = "(продать партию болотника)";
};


func int dia_cipher_trade_swampherb_condition()
{
	if(Cipher_Trade == TRUE)
	{
		return 1;
	};
};

func void dia_cipher_trade_swampherb_info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_Swampherb_15_00");	//У меня есть болотник.
	AI_Output(self,other,"DIA_Cipher_TRADE_Swampherb_12_00");	//Я покупаю болотник, но только крупные партии.
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 50)
	{
		Info_AddChoice(dia_cipher_trade_swampherb,"(продать 50 стеблей болотника)",dia_cipher_trade_swampherb_b);
	};
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 100)
	{
		Info_AddChoice(dia_cipher_trade_swampherb,"(продать 100 стеблей болотника)",dia_cipher_trade_swampherb_a);
	};
	Info_AddChoice(dia_cipher_trade_swampherb,"Я зайду позже.",dia_cipher_trade_swampherb_no);
};

func void dia_cipher_trade_swampherb_no()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_Swampherb_NO");	//Я зайду позже.
	Info_ClearChoices(dia_cipher_trade_swampherb);
};

func void dia_cipher_trade_swampherb_b()
{
	B_GiveInvItems(hero,self,ItMi_Plants_Swampherb_01,50);
	B_GiveInvItems(self,hero,ItMiNugget,400);
	Info_ClearChoices(dia_cipher_trade_swampherb);
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 50)
	{
		Info_AddChoice(dia_cipher_trade_swampherb,"(продать 50 стеблей болотника)",dia_cipher_trade_swampherb_b);
	};
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 100)
	{
		Info_AddChoice(dia_cipher_trade_swampherb,"(продать 100 стеблей болотника)",dia_cipher_trade_swampherb_a);
	};
	Info_AddChoice(dia_cipher_trade_swampherb,"Я зайду позже.",dia_cipher_trade_swampherb_no);
};

func void dia_cipher_trade_swampherb_a()
{
	B_GiveInvItems(hero,self,ItMi_Plants_Swampherb_01,100);
	B_GiveInvItems(self,hero,ItMiNugget,800);
	Info_ClearChoices(dia_cipher_trade_swampherb);
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 50)
	{
		Info_AddChoice(dia_cipher_trade_swampherb,"(продать 50 стеблей болотника)",dia_cipher_trade_swampherb_b);
	};
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 100)
	{
		Info_AddChoice(dia_cipher_trade_swampherb,"(продать 100 стеблей болотника)",dia_cipher_trade_swampherb_a);
	};
	Info_AddChoice(dia_cipher_trade_swampherb,"Я зайду позже.",dia_cipher_trade_swampherb_no);
};

