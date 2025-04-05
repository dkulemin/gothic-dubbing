
instance INFO_ABANDONEDMINEDEMON_EXIT(C_Info)
{
	npc = abandonedminedemon;
	nr = 999;
	condition = info_abandonedminedemon_exit_condition;
	information = info_abandonedminedemon_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_abandonedminedemon_exit_condition()
{
	if(Npc_KnowsInfo(hero,dia_abandonedminedemon_ok) || !Npc_KnowsInfo(hero,sld_704_blade_abandonedmine))
	{
		return 1;
	};
};

func void info_abandonedminedemon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABANDONEDMINEDEMON_MAD(C_Info)
{
	npc = abandonedminedemon;
	nr = 1;
	condition = dia_abandonedminedemon_mad_condition;
	information = dia_abandonedminedemon_mad_info;
	important = 1;
	permanent = 0;
};


func int dia_abandonedminedemon_mad_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_abandonedmine))
	{
		return 1;
	};
};

func void dia_abandonedminedemon_mad_info()
{
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_00");	//Ах вы жалкие создания. Как вы посмели осквернить мое захоронение. Мое, и моих верных слуг!
	AI_Output(other,self,"DIA_AbandonedMineDemon_MAD_15_00");	//Э-э-э! Постой. А ты вообще кто такой?
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_01");	//Я – истинный владыка этих гор, с незапамятных времен.
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_02");	//Но некогда сюда пришли орки, они покорили меня, и моих слуг. Я был похоронен здесь, в надежде, что никто не осквернит мой покой. Но, я ошибся.
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_03");	//Пройдет немного времени я вся долина вновь покорится мне.
	AI_Output(other,self,"DIA_AbandonedMineDemon_MAD_15_01");	//Кто твой хозяин? Бельджар?
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_04");	//Ха-ха-ха. Белиар лишь помог мне набрать сил, для борьбы с вашим ничтожным племенем. Что для меня не является проблемой.
	B_GiveXP(750);
	B_LogEntry(CH4_ABANDONEDMINE,"Похоже, я нашел главного демона.");
	ABANDONEDMINEISOK = TRUE;
};


instance DIA_ABANDONEDMINEDEMON_BLADE(C_Info)
{
	npc = abandonedminedemon;
	nr = 2;
	condition = dia_abandonedminedemon_blade_condition;
	information = dia_abandonedminedemon_blade_info;
	important = 0;
	permanent = 0;
	description = "Что ты сделал с людьми Блейда?";
};


func int dia_abandonedminedemon_blade_condition()
{
	if(Npc_KnowsInfo(hero,dia_abandonedminedemon_mad))
	{
		return 1;
	};
};

func void dia_abandonedminedemon_blade_info()
{
	AI_Output(other,self,"DIA_AbandonedMineDemon_BLADE_15_00");	//Что ты сделал с людьми Блейда?
	AI_Output(self,hero,"DIA_AbandonedMineDemon_BLADE_02_00");	//Те, кто остался в живых, пополнили ряды моих верных слуг.
	AI_Output(self,other,"DIA_AbandonedMineDemon_BLADE_02_01");	//Но не надейся, ты – умрешь.
	B_GiveXP(300);
	B_LogEntry(CH4_ABANDONEDMINE,"Те люди блейда, которым удалось выжить стали слугами демона.");
};


instance DIA_ABANDONEDMINEDEMON_OK(C_Info)
{
	npc = abandonedminedemon;
	nr = 2;
	condition = dia_abandonedminedemon_ok_condition;
	information = dia_abandonedminedemon_ok_info;
	important = 0;
	permanent = 0;
	description = "Мерзкое отродье. Сейчас ты узнаешь, кто я такой!";
};


func int dia_abandonedminedemon_ok_condition()
{
	if(Npc_KnowsInfo(hero,dia_abandonedminedemon_blade))
	{
		return 1;
	};
};

func void dia_abandonedminedemon_ok_info()
{
	AI_Output(other,self,"DIA_AbandonedMineDemon_OK_15_00");	//Мерзкое отродье. Сейчас ты узнаешь, кто я такой!
	AI_Output(self,hero,"DIA_AbandonedMineDemon_OK_02_00");	//Ха-ха-ха-ха! Неужели ты думаешь так просто убить меня? Ведь я уже мертв!
	B_LogEntry(CH4_ABANDONEDMINE,"Я не смогу убить демона самостоятельно. Надо сматываться отсюда!");
	AI_StopProcessInfos(self);
	self.guild = GIL_DEMON;
	Npc_SetTrueGuild(self,GIL_DEMON);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_ExchangeRoutine(sld_9704_blade,"mine");
};

