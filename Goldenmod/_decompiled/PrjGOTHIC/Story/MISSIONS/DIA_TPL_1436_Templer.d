
instance Tpl_1436_Templer_Exit(C_Info)
{
	npc = TPL_1436_Templer;
	nr = 999;
	condition = Tpl_1436_Templer_Exit_Condition;
	information = Tpl_1436_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Tpl_1436_Templer_Exit_Condition()
{
	return TRUE;
};

func void Tpl_1436_Templer_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Tpl_1436_Templer_CRAWLER(C_Info)
{
	npc = TPL_1436_Templer;
	condition = Tpl_1436_Templer_CRAWLER_Condition;
	information = Tpl_1436_Templer_CRAWLER_Info;
	important = 0;
	permanent = 1;
	description = "Как жизнь?";
};


func int Tpl_1436_Templer_CRAWLER_Condition()
{
	return TRUE;
};

func void Tpl_1436_Templer_CRAWLER_Info()
{
	AI_Output(other,self,"Tpl_1436_Templer_CRAWLER_Info_15_01");	//Как жизнь?
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_02");	//Мы здесь охотимся на ползунов. Одновременно получается, что мы защищаем от них рудокопов, - и все довольны.
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_03");	//На самом деле, нам нужна только слюна этих хищных тварей. Из слюны, которая добывается из челюстей ползунов, наш Гуру Кор Галом готовит магические эликсиры.
};

