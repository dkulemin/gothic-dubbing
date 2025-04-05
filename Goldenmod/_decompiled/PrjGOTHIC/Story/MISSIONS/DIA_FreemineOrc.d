
instance Info_FreemineOrc_EXIT(C_Info)
{
	npc = FreemineOrc;
	nr = 999;
	condition = Info_FreemineOrc_EXIT_Condition;
	information = Info_FreemineOrc_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

func void Info_FreemineOrc_EXIT_Info()
{
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01");	//Мне нужно пройти!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02");	//Незнакомец прийти снова!
	}
	else
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Спасибо. Я пойду.
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04");	//Добрая дорога,  незнакомец!
	};
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_INTRO(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_INTRO_Condition;
	information = Info_FreemineOrc_INTRO_Info;
	important = 1;
	permanent = 0;
};


func int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01");	//Таррок нужна помощь! Таррок ранен!
};


instance Info_FreemineOrc_WASPASSIERT(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASPASSIERT_Condition;
	information = Info_FreemineOrc_WASPASSIERT_Info;
	important = 0;
	permanent = 0;
	description = "Что здесь произошло?";
};


func int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01");	//Что здесь произошло?
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02");	//Таррок захватить синие солдаты. Вдруг красные солдаты повсюду.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03");	//Красные солдаты убивать все.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04");	//Таррок бежать сюда. Красные солдаты не ходить сюда. Красные солдаты боятся ГАХ ЛЮГ.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05");	//Пожалуйста, помочь, Таррок ранен.
};


instance Info_FreemineOrc_WASTUN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASTUN_Condition;
	information = Info_FreemineOrc_WASTUN_Info;
	important = 0;
	permanent = 0;
	description = "Что я могу для тебя сделать?";
};


func int Info_FreemineOrc_WASTUN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASTUN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01");	//Что я могу сделать?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02");	//Таррок нужна сильная лекарства. Иначе Таррок умирать.
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03");	//Какие лекарства нужны?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04");	//ГАХ ЛЮГ отравить Таррок. Таррок нужна лекарства!
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05");	//У Таррок быть лекарства, но Таррок потерять. Таррок не найти!
};


instance Info_FreemineOrc_OFFER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_OFFER_Condition;
	information = Info_FreemineOrc_OFFER_Info;
	important = 0;
	permanent = 0;
	description = "Я найду твои лекарства!";
};


func int Info_FreemineOrc_OFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_OFFER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//Я найду твои лекарства!
	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02");	//Таррок очень слабый. Незнакомец, торопись, или Таррок умирать!
	AI_StopProcessInfos(self);
	B_Story_FoundOrcSlave();
};


instance Info_FreemineOrc_CRAWLER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_CRAWLER_Condition;
	information = Info_FreemineOrc_CRAWLER_Info;
	important = 0;
	permanent = 0;
	description = "Что такое ГАХ ЛЮГ?";
};


func int Info_FreemineOrc_CRAWLER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01");	//Что такое ГАХ ЛЮГ?
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02");	//Быть большой звери, ходить на много ногах.
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03");	//ГАХ ЛЮГ опасность! Ест люди и орки!
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04");	//Ты, наверное, имеешь в виду ползунов!
};


instance Info_FreemineOrc_TONGUE(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TONGUE_Condition;
	information = Info_FreemineOrc_TONGUE_Info;
	important = 0;
	permanent = 0;
	description = "Ты говоришь по-нашему?";
};


func int Info_FreemineOrc_TONGUE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TONGUE_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01");	//Ты говоришь по-нашему?
	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02");	//Таррок быть рабом у люди много время. Таррок хорошо слушать.
};


instance Info_FreemineOrc_SEARCHPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SEARCHPOTION_Condition;
	information = Info_FreemineOrc_SEARCHPOTION_Info;
	important = 0;
	permanent = 1;
	description = "Я не могу найти твои лекарства!";
};


func int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SEARCHPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01");	//Я не могу найти твои лекарства!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02");	//Незнакомец искать еще! Лекарства быть здесь!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03");	//Таррок бежать от ГАХ ЛЮГ! Таррок спрятать, когда бежать!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04");	//Незнакомец, искать в нише тоже!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_SUCHEULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SUCHEULUMULU_Condition;
	information = Info_FreemineOrc_SUCHEULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Ты случайно не знаешь Ур-Шака, шамана?";
};


func int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01");	//Ты случайно не знаешь Ур-Шака, шамана?
	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02");	//Ур-Шак быть раб, как Таррок. Ур-Шак убегать! Убегать много зима назад!
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03");	//Твой друг сказал, что ты можешь сделать для меня Улу-Мулу.
	if(FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04");	//Ты помогать мне, так я помогать тебе!
	}
	else
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05");	//Таррок очень слабый. Нет лекарства, Таррок умирать.
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06");	//Незнакомец принести лекарства, тогда Таррок помогать!
	};
};


instance Info_FreemineOrc_GIVEPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_GIVEPOTION_Condition;
	information = Info_FreemineOrc_GIVEPOTION_Info;
	important = 0;
	permanent = 0;
	description = "Вот, я нашел твои лекарства!";
};


func int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01");	//Вот, я нашел твои лекарства!
	B_GiveInvItems(hero,self,OrcMedicine,1);
	EquipItem(self,OrcMedicine);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItemToState(self,OrcMedicine,1);
	AI_UseItemToState(self,OrcMedicine,-1);
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02");	//Незнакомец не плохой, как другие люди! Незнакомец хороший!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03");	//Таррок должен благодарить!
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04");	//Теперь ты можешь дать мне Улу-Мулу?
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05");	//Незнакомец помогать Таррок, и Таррок помогать незнакомец тоже!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06");	//Незнакомец нужно КРОТАК, ХАЗ-ТАК, ДВАХКАРР и ОРФ-АНТАК.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07");	//Незнакомец приносить все, тогда Таррок делать Улу-Мулу!
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER))
	{
		B_Story_FoundOrcSlave();
	};
	B_Story_CuredOrc();
};


instance Info_FreemineOrc_FIREWARAN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN_Condition;
	information = Info_FreemineOrc_FIREWARAN_Info;
	important = 0;
	permanent = 0;
	description = "Что такое КРОТАК?";
};


func int Info_FreemineOrc_FIREWARAN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01");	//Что такое КРОТАК?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02");	//Быть язык огня! Быть язык ящерица огня!
};


instance Info_FreemineOrc_FIREWARAN2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN2_Condition;
	information = Info_FreemineOrc_FIREWARAN2_Info;
	important = 0;
	permanent = 0;
	description = "Где мне искать эту огненную ящерицу?";
};


func int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN) && !Npc_HasItems(hero,ItAt_Waran_01) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01");	//Где мне искать эту огненную ящерицу?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02");	//Огненная ящерица жить дома. Дома Таррок. Незнакомец хорошо искать!
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03");	//Можно найти еще огненная ящерица на песок у моря.
	B_LogEntry(CH4_UluMulu,"Тарроку нужен язык огненной ящерицы для изготовления Улу-Мулу. Эти создания обитают по большей части в орочьих районах, на песчаных пляжах. Кажется, я видел этих ящериц неподалеку от остатков корабля.");
};


instance Info_FreemineOrc_SHADOWBEAST(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST_Condition;
	information = Info_FreemineOrc_SHADOWBEAST_Info;
	important = 0;
	permanent = 0;
	description = "Что означает ХАЗ-ТАК?";
};


func int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01");	//Что означает ХАЗ-ТАК?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02");	//Быть рог мракориса. Острый рог, как нож, твердый, как камень.
};


instance Info_FreemineOrc_SHADOWBEAST2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST2_Condition;
	information = Info_FreemineOrc_SHADOWBEAST2_Info;
	important = 0;
	permanent = 0;
	description = "Где мне искать мракорисов?";
};


func int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST) && !Npc_HasItems(hero,ItAt_Shadow_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01");	//Где мне искать мракорисов?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02");	//Жить в лес или пещера. Не любить свет.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03");	//Быть очень опасный. Незнакомец, осторожно!
	B_LogEntry(CH4_UluMulu,"Тарроку нужен рог мракориса для изготовления Улу-Мулу. По большей части они обитают в чащах и пещерах. Насколько мне известно, самый большой лесной массив расположен между Старым и Болотным Лагерями.");
};


instance Info_FreemineOrc_SWAMPSHARK(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK_Condition;
	information = Info_FreemineOrc_SWAMPSHARK_Info;
	important = 0;
	permanent = 0;
	description = "ДВАХКАРР? А это что?";
};


func int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01");	//ДВАХКАРР? А это что?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02");	//Быть зуб болотожора. Когда этот зуб кусать, жертва никогда не убегать.
};


instance Info_FreemineOrc_SWAMPSHARK2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK2_Condition;
	information = Info_FreemineOrc_SWAMPSHARK2_Info;
	important = 0;
	permanent = 0;
	description = "Где мне искать болотожоров?";
};


func int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK) && !Npc_HasItems(hero,ItAt_Swampshark_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01");	//Где мне искать болотожоров?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02");	//Много болотожоров, где Лагерь людей. Тот Лагерь, где болото, конечно!
	B_LogEntry(CH4_UluMulu,"Для изготовления Улу-Мулу Тарроку нужен зуб болотожора. За Лагерем Братства можно встретить десятки этих тварей.");
};


instance Info_FreemineOrc_TROLL(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL_Condition;
	information = Info_FreemineOrc_TROLL_Info;
	important = 0;
	permanent = 0;
	description = "Что такое ОРФ-АНТАК?";
};


func int Info_FreemineOrc_TROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01");	//Что такое ОРФ-АНТАК?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02");	//Быть зуб большой тролль! Делать большой дырка в добыча!
};


instance Info_FreemineOrc_TROLL2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL2_Condition;
	information = Info_FreemineOrc_TROLL2_Info;
	important = 0;
	permanent = 0;
	description = "Где мне найти троллей?";
};


func int Info_FreemineOrc_TROLL2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL) && !Npc_HasItems(hero,ItAt_Troll_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01");	//Где мне найти троллей?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02");	//Тролли жить, где горы! Тролли любить много место!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03");	//Незнакомец искать в горах на север! Но бояться кулаков троллей!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04");	//Когда кулак бить, незнакомец падать с горы!
	B_LogEntry(CH4_UluMulu,"Для изготовления Улу-Мулу Тарроку нужен зуб тролля. Эти создания обитают в горах на севере колонии. Мне нужно обыскать тамошние ущелья.");
};


instance Info_FreemineOrc_LOOKINGULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information = Info_FreemineOrc_LOOKINGULUMULU_Info;
	important = 0;
	permanent = 1;
	description = "Я пока еще не собрал все, что нужно.";
};


func int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if(!Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02) && Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2) && Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01");	//Я пока еще не собрал все, что нужно.
	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02");	//Незнакомец искать. Таррок ждать здесь!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_EveryUlumulu(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_EVERYULUMULU_Condition;
	information = Info_FreemineOrc_EVERYULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Я собрал все, что нужно для Улу-Мулу!";
};


func int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if((FreemineOrc_LookingUlumulu == LOG_RUNNING) && Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01");	//Я собрал все, что нужно для Улу-Мулу!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02");	//Незнакомец быть сильный воин! Давай вещи! Таррок готовить УЛУ-МУЛУ!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03");	//Вот! Незнакомец носить УЛУ-МУЛУ и быть гордый! Таррок теперь спать!
	CreateInvItems(hero,ItAt_Waran_01,3);
	B_GiveInvItems(hero,self,ItAt_Waran_01,4);
	Npc_RemoveInvItem(hero,ItAt_Shadow_02);
	Npc_RemoveInvItem(hero,ItAt_Swampshark_02);
	Npc_RemoveInvItem(hero,ItAt_Troll_02);
	Npc_RemoveInvItems(self,ItAt_Waran_01,4);
	B_Story_GotUluMulu();
	AI_StopProcessInfos(self);
};

