
instance DIA_Sld_702_EXIT(C_Info)
{
	npc = SLD_702_Soeldner;
	nr = 999;
	condition = DIA_Sld_702_EXIT_Condition;
	information = DIA_Sld_702_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Sld_702_EXIT_Condition()
{
	return 1;
};

func void DIA_Sld_702_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sld_702_First(C_Info)
{
	npc = SLD_702_Soeldner;
	nr = 1;
	condition = DIA_Sld_702_First_Condition;
	information = DIA_Sld_702_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Sld_702_First_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Sld_702_First_Info()
{
	AI_Output(self,other,"DIA_Sld_702_First_04_00");	//Ты хоть знаешь, куда направляешься?
	AI_Output(other,self,"DIA_Sld_702_First_15_01");	//Куда?
	AI_Output(self,other,"DIA_Sld_702_First_04_02");	//Ты идешь к нашему предводителю Ли.
};


instance DIA_Sld_702_PERM(C_Info)
{
	npc = SLD_702_Soeldner;
	nr = 1;
	condition = DIA_Sld_702_PERM_Condition;
	information = DIA_Sld_702_PERM_Info;
	permanent = 0;
	description = "Что нужно сделать, чтобы ты пропустил меня к нему?";
};


func int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

func void DIA_Sld_702_PERM_Info()
{
	AI_Output(other,self,"DIA_Sld_702_PERM_15_00");	//Что нужно сделать, чтобы ты пропустил меня к нему?
	AI_Output(self,other,"DIA_Sld_702_PERM_04_01");	//Ничего!
	AI_Output(self,other,"DIA_Sld_702_PERM_04_02");	//Здесь не Старый Лагерь, да и Ли совсем не такой, как Гомез.
	AI_Output(self,other,"DIA_Sld_702_PERM_04_03");	//Ему не нужна армия головорезов за спиной. Он сам способен защитить себя.
	AI_Output(self,other,"DIA_Sld_702_PERM_04_04");	//МЫ здесь лишь затем, чтобы помогать ему.
};

