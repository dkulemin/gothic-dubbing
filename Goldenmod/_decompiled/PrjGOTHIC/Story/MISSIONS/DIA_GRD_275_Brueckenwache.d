
instance Info_GRD_275_PreExit(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 999;
	condition = Info_GRD_275_PreExit_Condition;
	information = Info_GRD_275_PreExit_Info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int Info_GRD_275_PreExit_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_GRD_275_PreExit_Info()
{
	AI_Output(self,other,"Info_GRD_275_PreExit_06_01");	//Не забудь заглянуть в Старый Лагерь - у них уже есть для тебя кирка. Ха-ха-ха-ха!
	AI_StopProcessInfos(self);
};


instance Info_GRD_275_Exit(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 999;
	condition = Info_GRD_275_Exit_Condition;
	information = Info_GRD_275_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GRD_275_Exit_Condition()
{
	if((Kapitel > 1) || Npc_KnowsInfo(hero,Info_GRD_275_PreExit))
	{
		return 1;
	};
};

func void Info_GRD_275_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GRD_275_WasMachtIhrHier(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 1;
	condition = Info_GRD_275_WasMachtIhrHier_Condition;
	information = Info_GRD_275_WasMachtIhrHier_Info;
	permanent = 1;
	description = "Чем ты занимаешься?";
};


func int Info_GRD_275_WasMachtIhrHier_Condition()
{
	return 1;
};

func void Info_GRD_275_WasMachtIhrHier_Info()
{
	AI_Output(other,self,"Info_GRD_275_WasMachtIhrHier_15_00");	//Что вы здесь делаете?
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_01");	//А как по-твоему? Охраняем мост, конечно!
	AI_Output(self,other,"Info_GRD_275_WasMachtIhrHier_06_02");	//Мы следим за тем, чтобы ни одна хищная тварь не перебралась на другую сторону реки.
};


instance Info_GRD_275_Tips(C_Info)
{
	npc = GRD_275_Brueckenwache;
	nr = 1;
	condition = Info_GRD_275_Tips_Condition;
	information = Info_GRD_275_Tips_Info;
	permanent = 1;
	description = "Возможно, у вас есть для меня какой-то совет?";
};


func int Info_GRD_275_Tips_Condition()
{
	return 1;
};

func void Info_GRD_275_Tips_Info()
{
	AI_Output(other,self,"Info_GRD_275_Tips_15_00");	//Возможно, у вас есть для меня какой-то совет?
	AI_Output(self,other,"Info_GRD_275_Tips_06_01");	//Ага. Никогда не ходи в лес в одиночку...
	AI_Output(self,other,"Info_GRD_275_Tips_06_02");	//...Если, конечно, не собираешься перебить всех тварей, которые там обитают.
};

