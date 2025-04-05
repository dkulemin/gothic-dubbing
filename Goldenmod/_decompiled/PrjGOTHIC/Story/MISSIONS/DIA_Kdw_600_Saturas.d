
instance Info_Saturas_EXIT(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 999;
	condition = Info_Saturas_EXIT_Condition;
	information = Info_Saturas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Saturas_EXIT_Condition()
{
	return 1;
};

func void Info_Saturas_EXIT_Info()
{
	AI_Output(self,other,"Info_Saturas_EXIT_14_01");	//Надеюсь, ты вернешься целым и невредимым!
	AI_StopProcessInfos(self);
};


instance Info_Saturas_Intruder(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 1;
	condition = Info_Saturas_Intruder_Condition;
	information = Info_Saturas_Intruder_Info;
	permanent = 1;
	important = 1;
};


func int Info_Saturas_Intruder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Info_Saturas_Intruder_Info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//Что ты здесь делаешь? Тебе здесь нечего делать! Убирайся!
	AI_StopProcessInfos(self);
};


instance Info_Saturas_NEWS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_NEWS_Condition;
	information = Info_Saturas_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "У меня есть важные новости из Лагеря Братства!";
};


func int Info_Saturas_NEWS_Condition()
{
	if((CorAngar_SendToNC == TRUE) && Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	};
};

func void Info_Saturas_NEWS_Info()
{
	AI_Output(other,self,"Info_Saturas_NEWS_15_01");	//У меня есть важные новости из Лагеря Братства!
	AI_Output(self,other,"Info_Saturas_NEWS_14_02");	//Это должны быть действительно важные новости, если Кронос позволил тебе встретиться со мной!
};


instance Info_Saturas_YBERION(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_YBERION_Condition;
	information = Info_Saturas_YBERION_Info;
	permanent = 0;
	important = 0;
	description = "Братство выяснило, что Спящий на самом деле является злым демоном.";
};


func int Info_Saturas_YBERION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_NEWS))
	{
		return TRUE;
	};
};

func void Info_Saturas_YBERION_Info()
{
	AI_Output(other,self,"Info_Saturas_YBERION_15_06");	//События последних дней убедили Гуру в том, что они избрали неправильный путь. Похоже, их бог оказался всего лишь злым демоном.
	AI_Output(other,self,"Info_Saturas_YBERION_15_07");	//Под влиянием Спящего один из Гуру чуть не убил меня, несмотря на то, что незадолго до этого я спас ему жизнь.
	AI_Output(other,self,"Info_Saturas_YBERION_15_08");	//Единственным из Гуру, кто отказался признать истинную сущность этого адского создания, был Кор Галом. Вот почему он покинул Болотный Лагерь.
	B_LogEntry(CH3_EscapePlanNC,"Я рассказал Сатурасу о случае в Болотном Лагере.");
};


instance Info_Saturas_BOOK(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BOOK_Condition;
	information = Info_Saturas_BOOK_Info;
	permanent = 0;
	important = 0;
	description = "У меня есть альманах...";
};


func int Info_Saturas_BOOK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_YBERION) && Npc_HasItems(hero,ItWrFokusbuch))
	{
		return TRUE;
	};
};

func void Info_Saturas_BOOK_Info()
{
	AI_Output(other,self,"Info_Saturas_BOOK_15_01");	//У меня есть альманах...
	AI_Output(other,self,"Info_Saturas_BOOK_15_02");	//Ю'Берион использовал его, для того чтобы зарядить юнитор.
	AI_Output(self,other,"Info_Saturas_BOOK_14_03");	//Отлично! Знание, которое содержится в этой книге, поможет нам зарядить пять главных камней-юниторов.
	AI_Output(self,other,"Info_Saturas_BOOK_14_04");	//Я возьму этот альманах.
	B_GiveInvItems(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem(self,ItWrFokusbuch);
	B_GiveXP(XP_DeliverBookToSaturas);
};


instance Info_Saturas_FOCUS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_FOCUS_Condition;
	information = Info_Saturas_FOCUS_Info;
	permanent = 0;
	important = 0;
	description = "У меня есть юнитор...";
};


func int Info_Saturas_FOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_YBERION) && Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_Saturas_FOCUS_Info()
{
	AI_Output(other,self,"Info_Saturas_FOCUS_15_01");	//У меня есть юнитор...
	AI_Output(self,other,"Info_Saturas_FOCUS_14_02");	//Ты держишь ключ от наших оков.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_03");	//Это один из пяти камней-юниторов, с помощью которых был создан магический Барьер.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_04");	//Их же сила поможет нам обрушить эту гигантскую стену.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_05");	//Но для этого же потребуется чертова уйма энергии?!
	AI_Output(self,other,"Info_Saturas_FOCUS_14_06");	//Верно. Все эти годы мы неустанно копили руду, вместо того чтобы выменивать на нее предметы роскоши у наших тюремщиков.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_07");	//Тебе, должно быть, известно, что в каждом куске руды заключена небольшая частица магии. Силы, которая содержится в нашей железной горе, должно быть достаточно, чтобы уничтожить Барьер.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_08");	//Это рискованно.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_09");	//Это будет магический взрыв, не обычный, и опасен он лишь для магии внутри Барьера. Нам, людям, он не причинит вреда.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_10");	//Вот, возьми юнитор. Надеюсь, ты найдешь ему применение в своих планах.
	B_GiveInvItems(hero,self,Focus_1,1);
	Npc_RemoveInvItem(self,Focus_1);
	B_GiveXP(XP_DeliverFocusToSaturas);
};


instance Info_Saturas_WHATNOW(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_WHATNOW_Condition;
	information = Info_Saturas_WHATNOW_Info;
	permanent = 0;
	important = 0;
	description = "Как ты собираешься использовать юнитор и альманах?";
};


func int Info_Saturas_WHATNOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_FOCUS) && Npc_KnowsInfo(hero,Info_Saturas_BOOK))
	{
		return TRUE;
	};
};

func void Info_Saturas_WHATNOW_Info()
{
	AI_Output(other,self,"Info_Saturas_WHATNOW_15_01");	//Как ты собираешься использовать юнитор и альманах?
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_03");	//Пока никак. Нам нужны еще четыре камня-юнитора.
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_04");	//К сожалению, пока у нас нет ни одного.
};


instance Info_Saturas_OFFER(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_OFFER_Condition;
	information = Info_Saturas_OFFER_Info;
	permanent = 0;
	important = 0;
	description = "Я готов найти для тебя четыре камня-юнитора!";
};


func int Info_Saturas_OFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_WHATNOW))
	{
		return TRUE;
	};
};

func void Info_Saturas_OFFER_Info()
{
	AI_Output(other,self,"Info_Saturas_OFFER_15_01");	//Я готов найти для тебя четыре камня-юнитора!
	AI_Output(other,self,"Info_Saturas_OFFER_15_02");	//Ведь я и сам не прочь убраться отсюда.
	AI_Output(self,other,"Info_Saturas_OFFER_14_03");	//Должен предупредить тебя: поиски будут нелегкими и даже опасными.
	AI_Output(self,other,"Info_Saturas_OFFER_14_04");	//Наши отношения со Старым Лагерем портятся с каждым днем, и каждый человек на счету - я не могу дать никого тебе в помощь.
	AI_Output(self,other,"Info_Saturas_OFFER_14_05");	//Тебе придется действовать в одиночку.
	AI_Output(other,self,"Info_Saturas_OFFER_15_06");	//Ну... Ничего нового. Обычно я справлялся и так.
	AI_Output(self,other,"Info_Saturas_OFFER_14_07");	//Твоя уверенность делает тебе честь, но кое-что тебе все-таки понадобится.
	AI_Output(self,other,"Info_Saturas_OFFER_14_08");	//Возьми эту старую карту. На ней отмечены места, где находились юниторы в момент сотворения Барьера.
	AI_Output(self,other,"Info_Saturas_OFFER_14_09");	//Кроме того, заклинание, записанное в этом магическом свитке, поможет тебе быстро вернуться в наш Лагерь.
	AI_Output(self,other,"Info_Saturas_OFFER_14_10");	//Наконец, поговори с Риорданом - он готовит для нашего Лагеря эликсиры.
	AI_Output(self,other,"Info_Saturas_OFFER_14_11");	//Ты найдешь его дом здесь же, на верхнем уровне.
	B_Story_BringFoci();
};

func void B_DeliverFocus()
{
	if(Saturas_BringFoci == 1)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_01");	//Х-м, дело продвигается. Ты молодец!
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_02");	//Для осуществления нашего плана нужны еще три камня.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_03");	//Принеси мне оставшиеся юниторы.
		Saturas_BringFoci = 2;
		B_GiveXP(XP_DeliverSecondFocus);
	}
	else if(Saturas_BringFoci == 2)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_04");	//Хорошо! Ты принес нам второй камень.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_05");	//Мы все ближе и ближе к цели.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_06");	//Наберись храбрости и терпения и достань еще два юнитора.
		Saturas_BringFoci = 3;
		B_GiveXP(XP_DeliverThirdFocus);
	}
	else if(Saturas_BringFoci == 3)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_07");	//Невероятно: теперь у нас есть уже четыре камня!
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_08");	//Осталось найти всего один, и тогда у нас будет все необходимое для осуществления нашего плана.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_09");	//Ты уже оказал всем нам великую услугу. Найди же и пятый камень, и тогда вскоре все мы будем свободны.
		Saturas_BringFoci = 4;
		B_GiveXP(XP_DeliverFourthFocus);
	}
	else if(Saturas_BringFoci == 4)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_10");	//Великолепно: теперь у нас есть все пять камней!
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_11");	//Ты оказал нашему Лагерю неоценимую помощь. Прими же уверения в моей бесконечной признательности.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_12");	//И загляни к Риордану. Он знает, чем вознаградить тебя за труды.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_13");	//Еще поговори с Кроносом, хранителем руды. У него также приготовлен для тебя подарок.
		Saturas_BringFoci = 5;
		B_GiveXP(XP_DeliverFifthFocus);
		B_LogEntry(CH3_BringFoci,"Я сумел отыскать все четыре юнитора. Сатурас счастлив без меры. Думаю, теперь Болотный Лагерь в долгу передо мной.");
		B_LogEntry(CH3_BringFoci,"Маги воды Кронос и Риордан пообещали мне награду за все юниторы. Возможно, стоит пойти поговорить с ними.");
		Log_SetTopicStatus(CH3_MonasteryRuin,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_Stonehenge,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_Fortress,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_TrollCanyon,LOG_SUCCESS);
	};
	if(!Npc_HasItems(hero,ItArScrollTeleport2) && (Saturas_BringFoci < 5))
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_14");	//Я вижу, ты воспользовался свитком с Заклинанием Портал. Вот, возьми еще один.
		CreateInvItem(self,ItArScrollTeleport2);
		B_GiveInvItems(self,other,ItArScrollTeleport2,1);
	};
};


instance Info_Saturas_BRINGFOCUS2(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS2_Condition;
	information = Info_Saturas_BRINGFOCUS2_Info;
	permanent = 0;
	important = 0;
	description = "Я нашел юнитор в ущелье троллей!";
};


func int Info_Saturas_BRINGFOCUS2_Condition()
{
	if(Npc_HasItems(hero,Focus_2) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS2_15_01");	//Я нашел юнитор в ущелье троллей!
	B_LogEntry(CH3_TrollCanyon,"Юнитор из каньона тролля теперь находится у Сатураса.");
	Log_SetTopicStatus(CH3_TrollCanyon,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_2,1);
	Npc_RemoveInvItem(self,Focus_2);
	B_DeliverFocus();
};


instance Info_Saturas_BRINGFOCUS3(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS3_Condition;
	information = Info_Saturas_BRINGFOCUS3_Info;
	permanent = 0;
	important = 0;
	description = "Я нашел юнитор в форте на горе!";
};


func int Info_Saturas_BRINGFOCUS3_Condition()
{
	if(Npc_HasItems(hero,Focus_3) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS3_15_01");	//Я нашел юнитор в форте на горе!
	B_LogEntry(CH3_Fortress,"Сатурас получил от меня юнитор из форта.");
	Log_SetTopicStatus(CH3_Fortress,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_3,1);
	Npc_RemoveInvItem(hero,Focus_3);
	B_DeliverFocus();
};


instance Info_Saturas_BRINGFOCUS4(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS4_Condition;
	information = Info_Saturas_BRINGFOCUS4_Info;
	permanent = 0;
	important = 0;
	description = "Я нашел юнитор в разрушенном монастыре!";
};


func int Info_Saturas_BRINGFOCUS4_Condition()
{
	if(Npc_HasItems(hero,Focus_4) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_01");	//Я нашел юнитор в разрушенном монастыре!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_02");	//Там был Горн, наемник, он помогал мне в поисках.
	B_LogEntry(CH3_MonasteryRuin,"Наконец-то я смог отдать юнитор из монастыря Сатурасу.");
	Log_SetTopicStatus(CH3_MonasteryRuin,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_4,1);
	Npc_RemoveInvItem(hero,Focus_4);
	B_DeliverFocus();
};


instance Info_Saturas_BRINGFOCUS5(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS5_Condition;
	information = Info_Saturas_BRINGFOCUS5_Info;
	permanent = 0;
	important = 0;
	description = "Я нашел юнитор под каменным кольцом!";
};


func int Info_Saturas_BRINGFOCUS5_Condition()
{
	if(Npc_HasItems(hero,Focus_5) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS5_15_01");	//Я нашел юнитор под каменным кольцом!
	B_LogEntry(CH3_Stonehenge,"Я отдал Сатурасу юнитор из склепа под кругом камней.");
	Log_SetTopicStatus(CH3_Stonehenge,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_5,1);
	Npc_RemoveInvItem(hero,Focus_5);
	B_DeliverFocus();
};


instance Info_Saturas_ALLFOCI(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_ALLFOCI_Condition;
	information = Info_Saturas_ALLFOCI_Info;
	permanent = 0;
	important = 0;
	description = "Теперь ты можешь взорвать железную гору?";
};


func int Info_Saturas_ALLFOCI_Condition()
{
	if((Saturas_BringFoci == 5) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void Info_Saturas_ALLFOCI_Info()
{
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_01");	//Теперь ты можешь взорвать железную гору?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_02");	//Теперь у нас есть все для осуществления нашего плана.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_03");	//Но Барьер был сотворен двенадцатью магами.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_04");	//В Круге Воды недостаточно магов, чтобы управлять столь могущественной силой и направлять ее в нужное русло.
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_05");	//Что мы можем сделать?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_06");	//Я понимаю, что мы уже и так в неоплатном долгу перед тобой за все, что ты для нас сделал...
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_07");	//... но в интересах всех жителей колонии я должен попросить тебя оказать нам еще одну услугу.
};


instance Info_Saturas_FAVOR(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_FAVOR_Condition;
	information = Info_Saturas_FAVOR_Info;
	permanent = 0;
	important = 0;
	description = "Еще одну услугу?";
};


func int Info_Saturas_FAVOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};
};

func void Info_Saturas_FAVOR_Info()
{
	AI_Output(other,self,"Info_Saturas_FAVOR_15_01");	//Еще одну услугу?
	AI_Output(self,other,"Info_Saturas_FAVOR_14_02");	//Да. Отправляйся в Старый Лагерь и попытайся убедить магов Круга Огня помочь нам.
	AI_Output(other,self,"Info_Saturas_FAVOR_15_03");	//МАГОВ ОГНЯ??? Почему ты думаешь, что они будут рисковать своим положением ради кого-то еще?
	AI_Output(other,self,"Info_Saturas_FAVOR_15_04");	//Уничтожив Барьер, они потеряют все, к чему так привыкли, лишатся своей силы и власти!
	AI_Output(self,other,"Info_Saturas_FAVOR_14_05");	//Именно поэтому ТЫ должен взяться за выполнение этой миссии. У тебя есть друзья во всех Лагерях колонии.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_06");	//Напомни магам Огня про то старое доброе время, когда мы вместе постигали искусство магии.
};


instance Info_Saturas_ACCEPT(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_ACCEPT_Condition;
	information = Info_Saturas_ACCEPT_Info;
	permanent = 0;
	important = 0;
	description = "Ладно, я постараюсь убедить магов Огня.";
};


func int Info_Saturas_ACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};
};

func void Info_Saturas_ACCEPT_Info()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_01");	//Ладно, я постараюсь убедить магов Огня.
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_02");	//Но я ничего не обещаю! Я по-прежнему считаю эту затею чистым безумием.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_03");	//Ты должен попробовать. Если ты не добьешься успеха, останется только один...
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_04");	//Только один...
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_05");	//... один ЧТО?
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_06");	//Не важно. У тебя ДОЛЖНО получиться!
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_07");	//Вот, возьми эту магическую руну. Передай ее Корристо, Верховному Магу Круга Огня, в знак нашего доверия.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_08");	//С ее помощью он сможет в любой момент, минуя стражу, перенестись сюда, в эту комнату.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_09");	//Это должно убедить наших бывших друзей в наших добрых намерениях.
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		B_ExchangeRoutine(GRD_200_Thorus,"WaitHero");
		YBerion = Hlp_GetNpc(GUR_1200_YBerion);
		YBerion.flags = 0;
		B_ExchangeRoutine(YBerion,"dead");
		Npc_ChangeAttribute(YBerion,ATR_HITPOINTS,YBerion.attribute[ATR_HITPOINTS_MAX]);
		YBerion.flags = NPC_FLAG_IMMORTAL;
		B_Give_ScorpioChapter4Weapons();
		B_Give_DarrionChapter4Weapons();
		B_Give_SharkyChapter4Weapons();
		B_Give_BaalCadarChapter4Runes();
		B_Give_XardasChapter4Runes();
		B_Give_CronosChapter4Runes();
		B_GiveRiordianChapter4Potions();
		B_Give_CavalornChapter4Weapons();
		B_Give_WolfChapter4Weapons();
		Saturas_BringFoci = 5;
		B_ExchangeRoutine(PC_Thief,"OCWait");
		B_ExchangeRoutine(PC_Mage,"OCWait");
		B_ExchangeRoutine(TPL_1439_GorNaDrak,"FMTaken");
		B_ExchangeRoutine(TPL_1440_Templer,"FMTaken");
		CreateInvItem(hero,ItArRuneTeleport2);
		Log_CreateTopic(CH4_Firemages,LOG_MISSION);
		Log_SetTopicStatus(CH4_Firemages,LOG_RUNNING);
		B_LogEntry(CH4_Firemages,"Сатурас, лидер магов воды, попросил меня сделать ему последнее одолжение: чтобы взорвать гору руды, ему понадобится помощь магов огня из Старого Лагеря. Пока не знаю, как я смогу заставить магов Гомеза уничтожить основу их силы, но придется что-то придумать.");
		B_InitMonsterAttitudes();
		B_KillNpc(KDF_400_Rodriguez);
		B_KillNpc(KDF_401_Damarok);
		B_KillNpc(Kdf_402_Corristo);
		B_KillNpc(KDF_403_Drago);
		B_KillNpc(KDF_405_Torrez);
		Wld_SetObjectRoutine(0,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(1,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(2,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(3,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(4,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(5,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(6,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(7,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(8,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(9,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(10,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(11,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(12,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(13,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(14,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(15,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(16,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(17,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(18,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(19,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(20,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(21,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(22,0,"EVT_AM_LOB_GATE_BIG",1);
		Wld_SetObjectRoutine(23,0,"EVT_AM_LOB_GATE_BIG",1);
		HERO_IS_GRD = TRUE;
		IntroduceChapter("Глава 4","Ксардас","chapter4.tga","levelup.wav",6000);
	}
	else
	{
		B_Kapitelwechsel(4);
	};
};


instance Info_Saturas_AMBUSH(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_AMBUSH_Condition;
	information = Info_Saturas_AMBUSH_Info;
	permanent = 0;
	important = 1;
};


func int Info_Saturas_AMBUSH_Condition()
{
	if(FMTaken && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Saturas_AMBUSH_Info()
{
	var C_Npc gorn;
	gorn = Hlp_GetNpc(PC_Fighter);
	AI_TurnToNPC(gorn,hero);
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_01");	//Я рад, что ты вернулся. Случилось нечто ужасное!
	AI_Output(hero,self,"Info_Saturas_AMBUSH_15_02");	//Дай-ка я угадаю: на Свободную Шахту напали стражники из Старого Лагеря. Никто не видел, откуда они появились?..
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_03");	//Постой... как... но конечно... Ты узнал об этом еще в Старом Лагере!
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_04");	//Горн прибыл сюда незадолго до тебя.
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_05");	//Что заставило Гомеза пойти на столь агрессивный шаг?
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_06");	//Он должен отдавать себе отчет в том, что этот гнусный поступок станет причиной войны!
};


instance Info_Saturas_COLLAPSE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_COLLAPSE_Condition;
	information = Info_Saturas_COLLAPSE_Info;
	permanent = 0;
	important = 0;
	description = "Старую Шахту залило водой, и она обрушилась!";
};


func int Info_Saturas_COLLAPSE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return TRUE;
	};
};

func void Info_Saturas_COLLAPSE_Info()
{
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01");	//Старую Шахту залило водой, и она обрушилась!
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_02");	//... Обрушилась... конечно же... это проясняет дело.
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_03");	//Мы загнали Гомеза в угол, и теперь он опаснее, чем когда бы то ни было. Ему нечего терять, и он пойдет на все!
};


instance Info_Saturas_MURDER(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_MURDER_Condition;
	information = Info_Saturas_MURDER_Info;
	permanent = 0;
	important = 0;
	description = "Гомез расправился с магами Огня!";
};


func int Info_Saturas_MURDER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return TRUE;
	};
};

func void Info_Saturas_MURDER_Info()
{
	AI_Output(hero,self,"Info_Saturas_MURDER_15_01");	//Гомез избавился от всех магов Огня!
	AI_Output(self,hero,"Info_Saturas_MURDER_14_02");	//УБИЛ ИХ??? Но во имя Бельджара, зачем ему это понадобилось?
	AI_Output(hero,self,"Info_Saturas_MURDER_15_03");	//Они выступили против нападения на Свободную Шахту, против Гомеза.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_04");	//Тогда все мы обречены. Без этих шестерых магов мы не сможем контролировать магическую силу при взрыве железной горы.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_05");	//Но несмотря ни на что, я благодарю тебя за скорбную весть, которую ты, невзирая на опасность, принес в нашу обитель.
	B_GiveXP(XP_ReportToSaturas);
	B_LogEntry(CH4_Firemages,"Сатурас вовсе не был счастлив историей о происшествии в Старом Лагере. Как бы дальше ни шел их план побега, теперь им придется осуществлять его без магов огня.");
	Log_SetTopicStatus(CH4_Firemages,LOG_SUCCESS);
};


instance KDW_600_Saturas_NOMOREOC(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_NOMOREOC_Condition;
	information = KDW_600_Saturas_NOMOREOC_Info;
	important = 0;
	permanent = 0;
	description = "За помощь вам меня изгнали из Старого Лагеря!";
};


func int KDW_600_Saturas_NOMOREOC_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_MURDER) && ((oldHeroGuild == GIL_GRD) || (hero.guild == GIL_KDF) || (oldHeroGuild == GIL_STT)))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_NOMOREOC_Info_15_01");	//За помощь вам меня изгнали из Старого Лагеря!
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_02");	//Ты больше не принадлежишь к Старому Лагерю?
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//Тогда добро пожаловать к нам!
	Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
	B_LogEntry(CH4_BannedFromOC,"После моего изгнания из Старого Лагеря Сатурас пригласил меня в Новый Лагерь.");
};


instance KDW_600_Saturas_GOTOLEE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_GOTOLEE_Condition;
	information = KDW_600_Saturas_GOTOLEE_Info;
	important = 0;
	permanent = 0;
	description = "Ты хочешь сказать, что наемники примут меня к себе?";
};


func int KDW_600_Saturas_GOTOLEE_Condition()
{
	if(((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_STT)) && Npc_KnowsInfo(hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_GOTOLEE_Info_15_01");	//Ты хочешь сказать, что наемники примут меня к себе?
	AI_Output(self,other,"KDW_600_Saturas_GOTOLEE_Info_14_02");	//Поговори с Ли. Он будет решать. А затем возвращайся ко мне.
	B_LogEntry(CH4_BannedFromOC,"Ли, лидер наемников, хочет поговорить со мной. Я должен повидаться с ним и вернуться к Сатурасу.");
};


instance KDW_600_Saturas_OATH(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_OATH_Condition;
	information = KDW_600_Saturas_OATH_Info;
	important = 0;
	permanent = 0;
	description = "Означает ли это, что теперь я принадлежу к гильдии магов Воды?";
};


func int KDW_600_Saturas_OATH_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_OATH_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//Означает ли это, что теперь я принадлежу к гильдии магов Воды?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//Пока еще нет. Прежде ты должен принести клятву Воде.
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_03");	//Но я уже приносил клятву Огню!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_04");	//Х-ммм...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_05");	//Это не значит, что ты должен нарушить старый обет!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_06");	//Ух... Я не понимаю...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_07");	//Твой обет просто расширится, и ты станешь магом сразу двух стихий!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_08");	//Тебе будут подвластны и сила Огня, и мудрость Воды!
	B_LogEntry(CH4_BannedFromOC,"Сатурас позволит мне присоединиться к кругу воды, и мне не надо разрывать клятву огню.");
};


instance KDW_600_Saturas_KDWAUFNAHME(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_KDWAUFNAHME_Condition;
	information = KDW_600_Saturas_KDWAUFNAHME_Info;
	important = 0;
	permanent = 0;
	description = "Я готов принести клятву.";
};


func int KDW_600_Saturas_KDWAUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KDWAUFNAHME_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//Я готов принести клятву.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02");	//Верный служитель Огня, отныне ты получишь благословение Воды!
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//Повторяй за мной слова клятвы:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//Мощью богов я клянусь...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//Мощью богов я клянусь...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//... и силой священной Воды...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//... и силой священной Воды...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//... что знания мои и поступки мои с этого дня и вовеки веков будут едины с Водой...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//... что знания мои и поступки мои с этого дня и вовеки веков будут едины с Водой...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//... до тех пор, пока тело мое не вернется в чертоги Бельджара и не иссякнет источник моей жизни.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//... до тех пор пока тело мое не вернется в чертоги Бельджара и не иссякнет источник моей жизни.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12");	//Этой клятвой ты объединил в себе силу Огня и благословение Воды.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13");	//Ты связал воедино две противоположности. Так пусть же жизнь твоя послужит знаком объединения стихий!
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//Носи это облачение в знак связи со священной Водой и Аданосом.
	CreateInvItem(self,kdw_armor_l);
	B_GiveInvItems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	B_LogEntry(CH4_BannedFromOC,"Я присоединился к кругу воды. Теперь у меня есть доступ к обеим школам магии.");
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};


instance KDW_600_Saturas_LESSON(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_LESSON_Condition;
	information = KDW_600_Saturas_LESSON_Info;
	important = 0;
	permanent = 0;
	description = "Ты будешь моим наставником?";
};


func int KDW_600_Saturas_LESSON_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_LESSON_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_LESSON_Info_15_01");	//Ты будешь моим наставником?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 3)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_02");	//Тебе предстоит многому научиться. Мы приступим, как только ты будешь готов.
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_03");	//Есть еще один Круг, до сих пор не пройденный тобою. Мы приступим, как только ты будешь готов.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_04");	//Ты уже прошел Пятый Круг магии. Ты знаешь то же, что знаю я.
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_05");	//Я не могу больше учить тебя.
	};
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Сатурас, лидер магов воды, может посвятить меня в новые круги магии. Его всегда можно найти рядом с пентаграммой, наверху.");
};


instance KDW_600_Saturas_KREIS1(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS1_Condition;
	information = KDW_600_Saturas_KREIS1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0);
};


func int KDW_600_Saturas_KREIS1_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS1_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS1_Info_15_01");	//Я готов вступить в Первый Круг.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_02");	//Вступив в Первый Круг, ты научишься использовать магические руны.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_03");	//Каждая руна содержит структуру особого магического заклинания.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_04");	//Использовав свою собственную магическую силу, ты сможешь высвободить магию руны.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_05");	//Но в отличие от свитков, которые по сути являются магическими формулами, магия рун поддерживает структуру заклинания всегда.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_06");	//Каждая руна таит в себе магическую силу, воспользоваться которой ты можешь в любой момент.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_07");	//Так же, как и со свитком, в момент, когда ты используешь руну, расходуется твоя собственная магическая сила.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_08");	//С каждым новым Кругом ты будешь узнавать о рунах все больше и больше.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_09");	//Используй их силу, для того чтобы познать себя.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};


instance KDW_600_Saturas_KREIS2(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS2_Condition;
	information = KDW_600_Saturas_KREIS2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0);
};


func int KDW_600_Saturas_KREIS2_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS2_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS2_Info_15_01");	//Я готов вступить во Второй Круг.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_02");	//Ты уже научился понимать руны. Пришло время углубить твои познания.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_03");	//Вступив во Второй Круг, ты постигнешь основы мощных боевых заклятий и познаешь все секреты целительства.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_04");	//Но для того чтобы познать истинные секреты магии, тебе предстоит многому научиться.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_05");	//Ты уже знаешь о том, что можешь использовать любую руну бессчетное число раз, но лишь до тех пор, пока не израсходуешь всю свою магическую силу.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_06");	//Но прежде чем сделать что-либо, подумай о том, есть ли в этом смысл. Ты обладаешь силой, которая позволяет с легкостью сеять смерть и разрушения.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_07");	//Но истинный маг использует ее лишь по необходимости.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_08");	//Научись оценивать ситуацию, и ты познаешь истинную силу рун.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};
};


instance KDW_600_Saturas_KREIS3(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS3_Condition;
	information = KDW_600_Saturas_KREIS3_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0);
};


func int KDW_600_Saturas_KREIS3_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS3_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS3_Info_15_01");	//Какие знания сопутствуют Третьему Кругу?
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_02");	//Третий Круг является одним из важнейших этапов в жизни каждого мага. Достигнув его, ты завершаешь свой поиск.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_03");	//Ты уже преодолел значительный этап на пути магии. Ты научился использовать руны.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_04");	//Это знание послужит основой для следующего этапа. Используй руны осмотрительно.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_05");	//Ты можешь использовать их или нет. Но ты должен определиться с выбором.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_06");	//Сделав выбор, используй свою силу без колебаний.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_07");	//Найди свой путь, и тогда ты познаешь силу решения.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};
};


instance KDW_600_Saturas_KREIS4(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS4_Condition;
	information = KDW_600_Saturas_KREIS4_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0);
};


func int KDW_600_Saturas_KREIS4_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS4_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS4_Info_15_01");	//Я готов вступить в Четвертый Круг.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_02");	//Ты завершил первые три Круга. Пришло время постичь секреты магии.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_03");	//Основа магии рун - камень. Магический камень, добытый из магической руды.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_04");	//Это та самая руда, которую добывают в шахтах. В храмах она наделяется магическими формулами, и там же руны превращаются в орудия нашей силы.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_05");	//С рунами, которыми ты сейчас владеешь, ты обрел знание храмов этого мира.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_07");	//Пойми магию, и ты откроешь для себя секрет силы.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};


instance KDW_600_Saturas_KREIS5(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS5_Condition;
	information = KDW_600_Saturas_KREIS5_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_5,LPCOST_TALENT_MAGE_5,0);
};


func int KDW_600_Saturas_KREIS5_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS5_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS5_Info_15_01");	//Я готов вступить в Пятый Круг.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_02");	//Да будет так. Я открою тебе истинный смысл Пятого Круга.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_03");	//Огненный Шторм и Ледяная Волна - так называются руны, магия которых отныне подвластна тебе, как и способность истреблять нежить.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_04");	//Но самое сильное заклинание Пятого Круга - Смертельная Зыбь. Завладев этой руной, ты получишь великую и очень опасную силу.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_05");	//Используй ее как можно реже, ибо дар этот - от богов Тьмы.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06");	//Теперь ты научился всему, что знаю я сам.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_06");	//Познай предел своих возможностей, и ты познаешь свою истинную силу.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};


instance KDW_600_Saturas_HEAVYARMOR(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_HEAVYARMOR_Condition;
	information = KDW_600_Saturas_HEAVYARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H);
};


func int KDW_600_Saturas_HEAVYARMOR_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01");	//Я хочу носить облачение высших магов Воды.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 4) && (Kapitel < 5))
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02");	//Твое время еще не пришло.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03");	//Твоих запасов руды не хватит даже на то, чтобы заплатить за ткань.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04");	//Время пришло. Ты достоин носить облачение высших магов Воды.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_KDW_ARMOR_H);
		CreateInvItem(hero,kdw_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
	};
};


instance Info_Saturas_NOWSLD(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_NOWSLD_Condition;
	information = Info_Saturas_NOWSLD_Info;
	permanent = 0;
	important = 0;
	description = "Ли принял меня в наемники.";
};


func int Info_Saturas_NOWSLD_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_CHANGESIDE))
	{
		return TRUE;
	};
};

func void Info_Saturas_NOWSLD_Info()
{
	AI_Output(hero,self,"Info_Saturas_NOWSLD_15_01");	//Ли принял меня в наемники.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_02");	//Хорошо. Очень хорошо. Теперь ты стал членом нашего Лагеря.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_03");	//Добро пожаловать!
	B_LogEntry(CH4_BannedFromOC,"Сатурас официально приветствовал меня в качестве наемника.");
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_SUCCESS);
};


instance INFO_SATURAS_GURU(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = info_saturas_guru_condition;
	information = info_saturas_guru_info;
	permanent = 0;
	important = 0;
	description = "Мы можем попросить гуру о помощи.";
};


func int info_saturas_guru_condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_COLLAPSE) && Npc_KnowsInfo(hero,Info_Saturas_MURDER))
	{
		return TRUE;
	};
};

func void info_saturas_guru_info()
{
	AI_Output(hero,self,"Info_Saturas_GURU_15_01");	//Мы можем попросить гуру о помощи.
	AI_Output(self,hero,"Info_Saturas_GURU_14_02");	//Гуру? Но захотят ли они помогать нам?
	AI_Output(hero,self,"Info_Saturas_GURU_15_03");	//У нас нет другого выхода.
	AI_Output(hero,self,"Info_Saturas_GURU_15_06");	//Я уверен, Ю'Берион согласится участвовать в осуществлении нашего плана.
	AI_Output(self,hero,"Info_Saturas_GURU_14_07");	//Хорошо. Тогда иди.
	AI_Output(self,hero,"Info_Saturas_GURU_14_11");	//Надеюсь, они помогут нам.
	Log_CreateTopic(CH4_ASKGURU,LOG_MISSION);
	Log_SetTopicStatus(CH4_ASKGURU,LOG_RUNNING);
	B_LogEntry(CH4_ASKGURU,"Я отправляюсь в лагерь братства. Я должен убедить гуру помочь магам воды.");
};


instance INFO_SATURAS_GURU_OK(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = info_saturas_guru_ok_condition;
	information = info_saturas_guru_ok_info;
	permanent = 0;
	important = 1;
};


func int info_saturas_guru_ok_condition()
{
	if(Npc_KnowsInfo(hero,dia_yberion_guru) && Npc_KnowsInfo(hero,info_saturas_guru))
	{
		return TRUE;
	};
};

func void info_saturas_guru_ok_info()
{
	AI_Output(self,hero,"Info_Saturas_GURU_OK_14_00");	//У тебя получилось! Гуру согласились взорвать нашу руду!
	AI_Output(hero,self,"Info_Saturas_GURU_OK_15_00");	//Да... Может мы уже начнем уничтожение барьера?
	AI_Output(self,hero,"Info_Saturas_GURU_OK_14_01");	//Не так быстро.
	AI_Output(self,hero,"Info_Saturas_GURU_OK_14_02");	//Магической силы гуру недостаточно, чтобы контролировать такой сильный выброс энергии.
	if((Npc_GetTrueGuild(hero) == GIL_KDF) || (Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		AI_Output(hero,self,"Info_Saturas_GURU_OK_15_01");	//Но я тоже маг.
		AI_Output(self,hero,"Info_Saturas_GURU_OK_14_03");	//У тебя пока нехватает опыта.
	};
	AI_Output(self,hero,"Info_Saturas_GURU_OK_14_04");	//К тому же нам нужен кто-нибудь еще, чтобы руководить процессом уничтожения барьера.
	B_GiveXP(4200);
	Log_SetTopicStatus(CH4_ASKGURU,LOG_SUCCESS);
	B_LogEntry(CH4_ASKGURU,"Сатурас остался очень доволен тем, что мне удалось привести помощь. Надеюсь, теперь мы взоврем эту гору руды.");
};


instance Info_Saturas_XARDAS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDAS_Condition;
	information = Info_Saturas_XARDAS_Info;
	permanent = 0;
	important = 0;
	description = "Отправляя меня к магам Огня, ты упомянул... КОГО-ТО.";
};


func int Info_Saturas_XARDAS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_COLLAPSE) && Npc_KnowsInfo(hero,Info_Saturas_MURDER) && Npc_KnowsInfo(hero,info_saturas_guru_ok))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDAS_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_01");	//Отправляя меня к магам Огня, ты упомянул... КОЕ-КОГО.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_02");	//Ну, я надеялся, что мы справимся и без его помощи, но судя по тому, как развиваются события...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_03");	//Кто ОН?
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_04");	//Хорошо, хорошо!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_05");	//Много, много лет назад...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_06");	//Нельзя ли подсократить историю, а?
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_07");	//Терпение! Итак, когда все мы, двенадцать магов, создавали магический Барьер, наша сила направлялась и контролировалась тринадцатым.
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_08");	//Тринадцатый маг? Я думал, вас была только дюжина!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_09");	//Большинство из тех, кто не застал основания колонии, думают точно так же.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_10");	//Тринадцатый маг руководил нами, и было это еще до того, как мы разделились на Круги Огня и Воды.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_11");	//Но он покинул Старый Лагерь, который когда-то был единственным Лагерем в колонии.
};


instance Info_Saturas_XARDASWHO(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHO_Condition;
	information = Info_Saturas_XARDASWHO_Info;
	permanent = 0;
	important = 0;
	description = "Как зовут этого тринадцатого мага?";
};


func int Info_Saturas_XARDASWHO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHO_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHO_15_01");	//Как зовут этого тринадцатого мага?
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_02");	//Эго имя Ксардас. Едва ли сейчас кто-нибудь помнит о нем.
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_03");	//А те, кто помнит, называют его не иначе как НЕКРОМАНТОМ!
};


instance Info_Saturas_XARDASWHY(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHY_Condition;
	information = Info_Saturas_XARDASWHY_Info;
	permanent = 0;
	important = 0;
	description = "Почему он покинул Старый Лагерь?";
};


func int Info_Saturas_XARDASWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHY_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01");	//Почему он покинул Старый Лагерь?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_02");	//Он начал изучать магию, позволявшую призывать магических существ... нежить.
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_03");	//Гомез был не единственным из тех, кто начал беспокоиться. Большинство других магов выступило против Ксардаса и его нечестивых экспериментов.
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_04");	//И что было потом?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_05");	//В отличие от мясника-Гомеза, Ксардас решил избежать конфликта и просто ушел.
};


instance Info_Saturas_XARDASWHERE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHERE_Condition;
	information = Info_Saturas_XARDASWHERE_Info;
	permanent = 0;
	important = 0;
	description = "Где этот маг теперь?";
};


func int Info_Saturas_XARDASWHERE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHERE_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHERE_15_01");	//Где этот маг теперь?
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_02");	//Он живет в уединении в своей башне посреди земель орков.
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_03");	//Она находится в самой южной части колонии.
};


instance Info_Saturas_XARDASHELP(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASHELP_Condition;
	information = Info_Saturas_XARDASHELP_Info;
	permanent = 0;
	important = 0;
	description = "Я отправлюсь к Ксардасу и попрошу его о помощи!";
};


func int Info_Saturas_XARDASHELP_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASWHO) && Npc_KnowsInfo(hero,Info_Saturas_XARDASWHY) && Npc_KnowsInfo(hero,Info_Saturas_XARDASWHERE))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASHELP_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_01");	//Я отправлюсь к Ксардасу и попрошу его о помощи!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_02");	//Он единственный, кто теперь может нам помочь.
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_03");	//Но если он не знает способа или не захочет помогать нам...
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_04");	//ЗАХОЧЕТ!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_05");	//Есть и другая проблема...
	B_Story_FindXardas();
};


instance Info_Saturas_XARDASPROBLEM(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASPROBLEM_Condition;
	information = Info_Saturas_XARDASPROBLEM_Info;
	permanent = 0;
	important = 0;
	description = "Проблема?";
};


func int Info_Saturas_XARDASPROBLEM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASHELP))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_01");	//Проблема?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_02");	//Да. За прошедшие годы мы несколько раз пытались связаться с Ксардасом.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_03");	//Похоже, он не хочет, чтобы его беспокоили.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_04");	//Что это значит?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_05");	//Никто из гонцов не вернулся из его башни.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_06");	//Тебе придется найти способ, как обмануть его созданий.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_07");	//Это должно быть забавно!
	B_LogEntry(CH4_FindXardas,"Сатурас предостерег меня о магических созданиях Ксардаса, некроманта. По поводу их сильных и слабых сторон в библиотеке магов воды имеются записи. Мне следует найти время и как следует их просмотреть.");
};


instance Info_Saturas_XARDASGO(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASGO_Condition;
	information = Info_Saturas_XARDASGO_Info;
	permanent = 0;
	important = 0;
	description = "Как пройти мимо этих тварей?";
};


func int Info_Saturas_XARDASGO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASPROBLEM))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASGO_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_01");	//Как пройти мимо этих тварей?
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_02");	//Если бы я знал, то непременно сказал бы тебе!
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_03");	//Советую тебе поискать ответ в нашей библиотеке.
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_04");	//Быть может, в старых книгах есть упоминания о сильных и слабых сторонах существ, порожденых магией.
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_05");	//Я перерою всю библиотеку. И не волнуйся...
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_06");	//Я вернусь!
	B_LogEntry(CH4_FindXardas,"По поводу сильных и слабых сторон этих созданий в библиотеке магов воды имеются записи. Мне следует найти время и как следует их просмотреть.");
};


instance KDW_600_Saturas_TIMESUP(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_TIMESUP_Condition;
	information = KDW_600_Saturas_TIMESUP_Info;
	important = 1;
	permanent = 0;
};


func int KDW_600_Saturas_TIMESUP_Condition()
{
	if((FindOrcShaman == LOG_RUNNING) || (FindOrcShaman == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_00");	//Ты говорил с Ксардасом?
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Да, он пока не знает, как взорвать гору...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Нет...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Все не так, как ты думаешь...",KDW_600_Saturas_TIMESUP_JA3);
};

func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP1_Info_15_00");	//Да, он пока не знает, как взорвать гору...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP1_Info_14_00");	//Не знает?! Мы не сможем взорвать руду без его помощи!
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP1_Info_15_01");	//Он работает над этом.
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP1_Info_15_02");	//Я скажу тебе, когда что-нибудь выяснится.
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP1_Info_14_01");	//Я очень на это надеюсь.
	B_GiveXP(500);
	B_Story_CancelFindXardas();
	Info_ClearChoices(KDW_600_Saturas_TIMESUP);
	AI_StopProcessInfos(self);
};

func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05");	//Нет...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_06");	//Но почему?
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_07");	//Я еще не добрался до башни...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_08");	//Ты должен найти его и спросить у него совета!
	B_GiveXP(500);
	B_Story_CancelFindXardas();
	Info_ClearChoices(KDW_600_Saturas_TIMESUP);
	AI_StopProcessInfos(self);
};

func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_09");	//Все не так, как ты думаешь...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_10");	//О чем это ты? Он должен знать, как взорвать железную гору!
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11");	//Железная гора... ох... ух-м... Она уже очень высокая!
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP1_Info_14_05");	//Я вижу, ты не хочешь говорить мне, что случилось.
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP1_Info_15_07");	//Я говорил с Ксардасом. Он уверен, что взрыв магической руды не уничтожит барьер.
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP1_Info_14_06");	//Но что нам делать?
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP1_Info_15_08");	//Ксардас изучал оркские пророчества.
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP1_Info_15_09");	//Я, кажется, знаю, как нам выбраться отсюда.
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP1_Info_14_07");	//Чтож, тогда тебе остается только помогать Ксардасу.
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP1_Info_14_08");	//Без него мы всеравно не сможем взорвать железную гору.
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP1_Info_15_10");	//Тогда, я пойду.
	AI_Output(self,other,"Info_Saturas_EXIT_14_01");	//Надеюсь, ты вернешься целым и невредимым!
	B_GiveXP(3000);
	Log_SetTopicStatus(CH4_FindXardas,LOG_SUCCESS);
	B_LogEntry(CH4_FindXardas,"Сатураса расстроила новость о том, что Ксардас не хочет участвовать во взрыве железной горы. Тем не менее, теперь он возлагает все свои надежды на план Ксардаса.");
	B_LogEntry(CH4_FindXardas,"Я должен помочь Ксардасу в его исследованиях. Тогда, возможно, мы выберемся из колонии.");
	Info_ClearChoices(KDW_600_Saturas_TIMESUP);
	AI_StopProcessInfos(self);
};


instance KDW_600_Saturas_HogeAUFNAHME(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 10;
	condition = KDW_600_Saturas_HogeAUFNAHME_Condition;
	information = KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent = 0;
	description = "Нефариус сказал, что я готов носить облачение Мага Воды.";
};


func int KDW_600_Saturas_HogeAUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,info_nefarius_ocnews_kdw) && Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_HogeAUFNAHME_15_00");	//Нефариус сказал, что я готов носить облачение Мага Воды.
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//Тогда добро пожаловать к нам!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//Означает ли это, что теперь я принадлежу к гильдии магов Воды?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//Пока еще нет. Прежде ты должен принести клятву Воде.
};


instance KDW_600_Saturas_HogeAUFNAHMETeil2(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 10;
	condition = KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information = KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent = 0;
	description = "Я готов принести клятву.";
};


func int KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//Я готов принести клятву.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//Повторяй за мной слова клятвы:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//Мощью богов я клянусь...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//Мощью богов я клянусь...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//... и силой священной Воды...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//... и силой священной Воды...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//... что знания мои и поступки мои с этого дня и вовеки веков будут едины с Водой...
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//... что знания мои и поступки мои с этого дня и вовеки веков будут едины с Водой...
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//... до тех пор, пока тело мое не вернется в чертоги Бельджара и не иссякнет источник моей жизни.
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//... до тех пор пока тело мое не вернется в чертоги Бельджара и не иссякнет источник моей жизни.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//Носи это облачение в знак связи со священной Водой и Аданосом.
	CreateInvItem(self,kdw_armor_l);
	B_GiveInvItems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	Mdl_RemoveOverlayMds(hero,"Humans_Militia.mds");
	Log_CreateTopic(CH4_SldToKdW,LOG_NOTE);
	B_LogEntry(CH4_SldToKdW,"Сатурас принял меня в круг магов воды.");
	AI_StopProcessInfos(self);
};


instance INFO_SATURAS_ABANDONEDMINE(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 1;
	condition = info_saturas_abandonedmine_condition;
	information = info_saturas_abandonedmine_info;
	permanent = 0;
	important = 0;
	description = "В Заброшенной шахте происходят ужасные вещи.";
};


func int info_saturas_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_abandonedmine_what))
	{
		return TRUE;
	};
};

func void info_saturas_abandonedmine_info()
{
	AI_Output(other,self,"Info_Saturas_ABANDONEDMINE_15_00");	//В Заброшенной шахте происходят ужасные вещи.
	AI_Output(other,self,"Info_Saturas_ABANDONEDMINE_15_01");	//В дальнем проходе послелился демон. И он напал на воров и намеников, обследовавших шахту.
	AI_Output(other,self,"Info_Saturas_ABANDONEDMINE_15_02");	//Многие погибли и превратились в нежить. А те, кто выжил, стали слугами этого демона.
	AI_Output(other,self,"Info_Saturas_ABANDONEDMINE_15_03");	//Блейду удалось сбежать, и мы вместе вернулись в шахту чтобы уничтожить демона.
	AI_Output(other,self,"Info_Saturas_ABANDONEDMINE_15_04");	//Но обычное оружие не причинает ему никакого урона.
	AI_Output(self,other,"Info_Saturas_ABANDONEDMINE_14_00");	//Я знаю заклинание, с помощью которого можно убить этого демона.
	AI_Output(self,other,"Info_Saturas_ABANDONEDMINE_14_01");	//Но мы займемся этой проблемой, когда обрушим магический барьер.
	AI_Output(self,other,"Info_Saturas_ABANDONEDMINE_14_02");	//А пока я пошлю двоих наемников, чтобы они охраняли вход в шахту.
	B_GiveXP(3500);
	Log_SetTopicStatus(CH4_ABANDONEDMINE,LOG_SUCCESS);
	B_LogEntry(CH4_ABANDONEDMINE,"Я рассказал Сатурасу о нежити в шахте. Он знает, как уничтожить демона, но маги воды займутся им, когда они обрушат магический барьер.");
	B_LogEntry(CH4_ABANDONEDMINE,"Сатурас послал двоих наемников охранять вход в шахту.");
	B_ExchangeRoutine(sld_9100_soeldner,"mine");
	B_ExchangeRoutine(sld_9200_soeldner,"mine");
};


instance INFO_SATURAS_QUENTIN(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 1;
	condition = info_saturas_quentin_condition;
	information = info_saturas_quentin_info;
	permanent = 0;
	important = 1;
};


func int info_saturas_quentin_condition()
{
	if((Kapitel == 4) && (QUENTIN_OK == TRUE))
	{
		return TRUE;
	};
};

func void info_saturas_quentin_info()
{
	AI_Output(self,other,"Info_Saturas_QUENTIN_14_00");	//Квентин каким-то образом добыл бумаги стражников Старого лагеря.
	AI_Output(self,other,"Info_Saturas_QUENTIN_14_01");	//И этот наглец хотел получить за них 20000 кусков руды.
	AI_Output(other,self,"Info_Saturas_QUENTIN_15_00");	//И?
	AI_Output(self,other,"Info_Saturas_QUENTIN_14_02");	//Наемники, которых мы послали на встречу с Квентином, конечно же отказались от его предложения.
	AI_Output(self,other,"Info_Saturas_QUENTIN_14_03");	//Но бандиты напали на них...
	AI_Output(other,self,"Info_Saturas_QUENTIN_15_01");	//Квентин погиб?
	AI_Output(self,other,"Info_Saturas_QUENTIN_14_04");	//Да, и остальные бандиты тоже.
	B_GiveXP(500);
	QUENTIN_OK = FALSE;
};

