
instance Info_Erpresser(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_Erpresser_Condition;
	information = Info_Erpresser_Info;
	permanent = 1;
	important = 1;
};


func int Info_Erpresser_Condition()
{
	if((Npc_GetAttitude(self,other) != ATT_FRIENDLY) && (self.aivar[AIV_HAS_ERPRESSED] == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void Info_Erpresser_Info()
{
	AI_Output(self,other,"Info_Erpresser_Info_13_01");	//Вот что, парень, если хочешь пройти, тебе придется заплатить 10 кусков руды. Или начнутся сплошные неприятности, усек?
	Info_ClearChoices(Info_Erpresser);
	Info_AddChoice(Info_Erpresser,"Ну, почему бы тебе не подойти сюда и не забрать свою руду?",Info_Erpresser_Choice_AufsMaul);
	Info_AddChoice(Info_Erpresser,"Три куска руды? Не так уж много. Вот...",Info_Erpresser_Choice_Zahlen);
};

func void Info_Erpresser_Choice_AufsMaul()
{
	var C_Npc coerpresser;
	AI_Output(other,self,"Info_Erpresser_Choice_AufsMaul_15_01");	//Ну, почему бы тебе не подойти сюда и не забрать свою руду?
	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02");	//Спасибо, парень. Выручил.
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	Npc_SetTarget(self,other);
	coerpresser = Hlp_GetNpc(ORG_889_CoErpresser);
	Npc_SetTarget(coerpresser,other);
	AI_StopProcessInfos(self);
	AI_StartState(coerpresser,ZS_Attack,1,"");
	AI_StartState(self,ZS_Attack,1,"");
};

func void Info_Erpresser_Choice_Zahlen()
{
	var C_Npc coerpresser;
	if(Npc_HasItems(other,ItMiNugget) >= 3)
	{
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01");	//Вот, 10 кусков.
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02");	//Вот досада.
		B_GiveInvItems(other,self,ItMiNugget,3);
		self.aivar[AIV_HAS_ERPRESSED] = 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03");	//У-мм... Кажется, у меня сейчас нет 10 кусков...
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04");	//Какая жалость...
		self.aivar[AIV_HAS_ERPRESSED] = 2;
		Npc_SetTarget(self,other);
		coerpresser = Hlp_GetNpc(ORG_889_CoErpresser);
		Npc_SetTarget(coerpresser,other);
		AI_StopProcessInfos(self);
		AI_StartState(coerpresser,ZS_Attack,1,"");
		AI_StartState(self,ZS_Attack,1,"");
	};
};


instance Info_BereitsErpresst(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_BereitsErpresst_Condition;
	information = Info_BereitsErpresst_Info;
	permanent = 1;
	important = 1;
};


func int Info_BereitsErpresst_Condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 1) && Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void Info_BereitsErpresst_Info()
{
	AI_Output(self,other,"Info_BereitsErpresst_Info_13_02");	//Ты заплатил. Можешь пройти, пока я не передумал.
};


instance Info_BereitsAufsMaul(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_BereitsAufsMaul_Condition;
	information = Info_BereitsAufsMaul_Info;
	permanent = 1;
	important = 1;
};


func int Info_BereitsAufsMaul_Condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 2) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void Info_BereitsAufsMaul_Info()
{
	AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02");	//Исчезни, пока я не начистил твою тупую рожу!
};


instance Info_Exit(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 999;
	condition = Info_Exit_Condition;
	information = Info_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Exit_Condition()
{
	return 1;
};

func void Info_Exit_Info()
{
	AI_StopProcessInfos(self);
};

