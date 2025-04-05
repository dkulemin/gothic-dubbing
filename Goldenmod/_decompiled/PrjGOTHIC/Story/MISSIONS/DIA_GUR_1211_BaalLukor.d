
instance Info_BaalLukor_EXIT(C_Info)
{
	npc = GUR_1211_BaalLukor;
	nr = 999;
	condition = Info_BaalLukor_EXIT_Condition;
	information = Info_BaalLukor_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

func void Info_BaalLukor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_BaalLukor_MEET(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_MEET_Condition;
	information = Info_BaalLukor_MEET_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

func void Info_BaalLukor_MEET_Info()
{
	AI_Output(self,other,"Info_BaalLukor_MEET_13_01");	//Благодарю за помощь. Ты прибыл как раз вовремя.
	B_GiveXP(XP_SaveBaalLukor);
};


instance Info_BaalLukor_DEAD(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_DEAD_Condition;
	information = Info_BaalLukor_DEAD_Info;
	nr = 20;
	permanent = 0;
	important = 0;
	description = "По дороге сюда я видел мертвых Стражей. Что случилось?";
};


func int Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

func void Info_BaalLukor_DEAD_Info()
{
	AI_Output(other,self,"Info_BaalLukor_DEAD_15_01");	//По дороге сюда я видел нескольких мертвых Стражей. Что случилось?
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_02");	//Господин Кор Ангар отправил нас обследовать пещеры.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_03");	//Мы ожидали увидеть ряды могил и полуразложившиеся мумии.
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_04");	//Но внезапно тьма рассеялась, и орки были повсюду! Я не знаю, чего они искали здесь, но их появление было более чем неожиданным.
	AI_Output(other,self,"Info_BaalLukor_DEAD_15_05");	//А где остальные Стражи?
	AI_Output(self,other,"Info_BaalLukor_DEAD_13_06");	//Мертвы! Я невольно стал причиной их гибели. Надеюсь, Спящий простит меня за это.
	B_LogEntry(CH3_OrcGraveyard,"Я спас жизнь Гуру Идолу Люкору на орочьем кладбище, когда орки атаковали его. Все стражи Люкора были убиты этими существами.");
};


instance Info_BaalLukor_SUMMONING(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_SUMMONING_Condition;
	information = Info_BaalLukor_SUMMONING_Info;
	nr = 10;
	permanent = 0;
	important = 0;
	description = "Меня прислал Кор Ангар! ";
};


func int Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

func void Info_BaalLukor_SUMMONING_Info()
{
	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_01");	//Меня прислал Кор Ангар! Вы нашли что-нибудь?
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_02");	//Пока еще нет. Что с Ю'Берионом? Он пришел в себя?
	AI_Output(other,self,"Info_BaalLukor_SUMMONING_15_03");	//Нет, он все еще без сознания.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_04");	//Мы должны разгадать загадку этих пещер. После таких чудоищных потерь я не могу вернуться к братьям с пустыми руками.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_05");	//Но я не слишком силен в бою, а орки не так поддаются моей магии, как эти доверчивые глупцы из Старого Лагеря.
	AI_Output(self,other,"Info_BaalLukor_SUMMONING_13_06");	//Если ты служишь Братству, ты должен помочь мне исследовать эту гробницу.
};


instance Info_BaalLukor_HELP(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_HELP_Condition;
	information = Info_BaalLukor_HELP_Info;
	permanent = 0;
	important = 0;
	description = "Я помогу тебе.";
};


func int Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero,Info_BaalLukor_SUMMONING);
};

func void Info_BaalLukor_HELP_Info()
{
	AI_Output(other,self,"Info_BaalLukor_HELP_15_01");	//Я помогу тебе.
	AI_Output(self,other,"Info_BaalLukor_HELP_13_02");	//Хорошо. Отлично. От этого зала отходят три туннеля. Мы должны осмотреть их все.
	AI_Output(self,other,"Info_BaalLukor_HELP_13_03");	//Иди вперед. Я пойду следом!
	B_LogEntry(CH3_OrcGraveyard,"Идол Люкор присоединился ко мне. Вместе мы сможем раскрыть секрет этого древнего места!");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_FOUNDNONE(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_FOUNDNONE_Condition;
	information = Info_BaalLukor_FOUNDNONE_Info;
	permanent = 1;
	important = 0;
	description = "Я ничего не могу найти!";
};


func int Info_BaalLukor_FOUNDNONE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_HELP) && (BaalLukor_BringParchment == 0) && !Npc_HasItems(hero,OrkParchmentOne) && !Npc_HasItems(hero,OrkParchmentTwo))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_FOUNDNONE_Info()
{
	AI_Output(other,self,"Info_BaalLukor_FOUNDNONE_15_01");	//Я ничего не могу найти!
	AI_Output(self,other,"Info_BaalLukor_FOUNDNONE_13_02");	//Мы должны осмотреть все три туннеля.
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_FOUNDONE(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_FOUNDONE_Condition;
	information = Info_BaalLukor_FOUNDONE_Info;
	permanent = 1;
	important = 0;
	description = "Очевидно, второй половины свитка попросту не существует!";
};


func int Info_BaalLukor_FOUNDONE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_HELP) && (((BaalLukor_BringParchment == 1) && !Npc_HasItems(hero,OrkParchmentTwo)) || ((BaalLukor_BringParchment == 2) && !Npc_HasItems(hero,OrkParchmentOne))))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_FOUNDONE_Info()
{
	AI_Output(other,self,"Info_BaalLukor_FOUNDONE_15_01");	//Очевидно, второй половины свитка попросту не существует!
	AI_Output(self,other,"Info_BaalLukor_FOUNDONE_13_02");	//Должна быть вторая половина. Давай осмотрим все три туннеля!
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_FIRSTWAIT(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_FIRSTWAIT_Condition;
	information = Info_BaalLukor_FIRSTWAIT_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_FIRSTWAIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_HELP) && !Npc_KnowsInfo(hero,Info_BaalLukor_FIRSTSCROLL) && (Npc_GetDistToWP(self,"GRYD_040") < 500))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_FIRSTWAIT_13_01");	//Мы в тупике! Возможно, разгадка кроется в этих нишах.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInSideTunnelOne");
};


instance Info_BaalLukor_FIRSTSCROLL(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_FIRSTSCROLL_Condition;
	information = Info_BaalLukor_FIRSTSCROLL_Info;
	permanent = 0;
	important = 0;
	description = "Я нашел свиток!";
};


func int Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_HELP) && Npc_HasItems(hero,OrkParchmentOne))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_FIRSTSCROLL_Info()
{
	AI_Output(other,self,"Info_BaalLukor_FIRSTSCROLL_15_01");	//Я нашел свиток!
	B_GiveInvItems(hero,self,OrkParchmentOne,1);
	if(BaalLukor_BringParchment == 2)
	{
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_02");	//Очень хорошо! Это вторая половина магического заклинания орков.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_03");	//Это похоже на свиток с заклинанием орков, порванный на две части.
		AI_Output(self,other,"Info_BaalLukor_FIRSTSCROLL_13_04");	//Где-то должна быть вторая часть.
		AI_StopProcessInfos(self);
		BaalLukor_BringParchment = 1;
	};
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_SECONDWAIT(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_SECONDWAIT_Condition;
	information = Info_BaalLukor_SECONDWAIT_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_SECONDWAIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_HELP) && !Npc_KnowsInfo(hero,Info_BaalLukor_SECONDSCROLL) && (Npc_GetDistToWP(self,"GRYD_047") < 500))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_SECONDWAIT_13_01");	//Х-ммм... этот туннель заканчивается тупиком. Возможно, здесь ты найдешь что-то, что пригодится нам в дальнейшем.
	if(!Npc_HasItems(hero,OrkParchmentTwo))
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"WaitInSideTunnelTwo");
	};
};


instance Info_BaalLukor_SECONDSCROLL(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_SECONDSCROLL_Condition;
	information = Info_BaalLukor_SECONDSCROLL_Info;
	permanent = 0;
	description = "Здесь лежит обрывок свитка!";
};


func int Info_BaalLukor_SECONDSCROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_HELP) && Npc_HasItems(hero,OrkParchmentTwo))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(other,self,"Info_BaalLukor_SECONDSCROLL_15_01");	//Здесь лежит обрывок свитка!
	B_GiveInvItems(hero,self,OrkParchmentTwo,1);
	if(BaalLukor_BringParchment == 1)
	{
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_02");	//Очень хорошо! Это вторая половина магического заклинания орков.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_03");	//Это похоже на свиток с заклинанием орков, порванный на две части.
		AI_Output(self,other,"Info_BaalLukor_SECONDSCROLL_13_04");	//Где-то должна быть вторая часть.
		AI_StopProcessInfos(self);
		BaalLukor_BringParchment = 2;
	};
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_BOTHSCROLLS(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_BOTHSCROLLS_Condition;
	information = Info_BaalLukor_BOTHSCROLLS_Info;
	permanent = 0;
	important = 0;
	description = "Что мы будем делать с этими двумя частями?";
};


func int Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_HELP) && (BaalLukor_BringParchment == 3))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_BOTHSCROLLS_Info()
{
	AI_Output(other,self,"Info_BaalLukor_BOTHSCROLLS_15_01");	//Что мы будем делать с этими двумя частями?
	AI_Output(self,other,"Info_BaalLukor_BOTHSCROLLS_13_02");	//Обрывки свитка совпадают друг с другом. Но я не могу расшифровать эти оркские символы.
	B_LogEntry(CH3_OrcGraveyard,"Мы нашли две половинки орочьего свитка с заклинанием, но Люкор не может прочесть его. Продолжим свои поиски.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_RUNES(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_RUNES_Condition;
	information = Info_BaalLukor_RUNES_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_RUNES_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_BOTHSCROLLS) && ((Npc_GetDistToWP(hero,"GRYD_025") < 600) || (Npc_GetDistToWP(hero,"GRYD_048") < 600)))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_RUNES_Info()
{
	B_FullStop(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_01");	//Минутку! Это уже интересно...
	AI_Output(other,self,"Info_BaalLukor_RUNES_15_02");	//Ну, я не вижу здесь ничего интересного.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_03");	//Помолчи немного и присмотрись к рунам в этой пещере.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_04");	//Да, этого должно быть достаточно для того, чтобы перевести обе половины свитка.
	B_UseFakeScroll();
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_06");	//Получилось! Это Заклинание Портала. Похоже, оно срабатывает только в определенных местах.
	AI_Output(self,other,"Info_BaalLukor_RUNES_13_07");	//Странно!
	Npc_RemoveInvItems(self,OrkParchmentOne,1);
	Npc_RemoveInvItems(self,OrkParchmentTwo,1);
	B_LogEntry(CH3_OrcGraveyard,"Идол Люкор смог перевести свиток при помощи надписей на стенах в одном из залов. Похоже, это заклинание телепортации на очень короткую дистанцию.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_WHATNOW(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_WHATNOW_Condition;
	information = Info_BaalLukor_WHATNOW_Info;
	permanent = 1;
	important = 0;
	description = "В каких это 'определенных' местах?";
};


func int Info_BaalLukor_WHATNOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_RUNES) && Npc_KnowsInfo(hero,Info_BaalLukor_HALLWITHOUT) && !Npc_KnowsInfo(hero,Info_BaalLukor_HALLWITH))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_WHATNOW_Info()
{
	AI_Output(other,self,"Info_BaalLukor_WHATNOW_15_01");	//В каких это 'определенных' местах?
	AI_Output(self,other,"Info_BaalLukor_WHATNOW_13_02");	//Большой зал, через который мы проходили, показался мне очень... странным... местом. Вернемся туда!
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_HALLWITHOUT(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_HALLWITHOUT_Condition;
	information = Info_BaalLukor_HALLWITHOUT_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_HALLWITHOUT_Condition()
{
	if(!Npc_KnowsInfo(hero,Info_BaalLukor_RUNES) && (Npc_GetDistToWP(hero,"GRYD_055") < 500))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_01");	//Это место... Я не могу этого объяснить, но это место...
	AI_Output(self,other,"Info_BaalLukor_HALLWITHOUT_13_02");	//О, не обращай внимания. Должно быть, у меня разыгралось воображение.
	B_LogEntry(CH3_OrcGraveyard,"Как только мы вошли в большой прямоугольный зал, Гуру почувствовал что-то. Но точнее он пока сказать не может.");
	Npc_ExchangeRoutine(self,"Follow");
};


instance Info_BaalLukor_HALLWITH(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_HALLWITH_Condition;
	information = Info_BaalLukor_HALLWITH_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_HALLWITH_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_RUNES) && (Npc_GetDistToWP(hero,"GRYD_055") < 500))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_01");	//У этого места особая аура... Аура чего-то тайного.
	AI_Output(other,self,"Info_BaalLukor_HALLWITH_15_02");	//Этот зал напомнил мне образ из моего видения.
	AI_Output(self,other,"Info_BaalLukor_HALLWITH_13_03");	//Видение... Мы очень близки к цели...
	B_LogEntry(CH3_OrcGraveyard,"Идол Люкор, ведомый неведомой силой, подошел к одной из стен большого зала.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DOOR");
};


instance Info_BaalLukor_DOOR(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_DOOR_Condition;
	information = Info_BaalLukor_DOOR_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_DOOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_HALLWITH) && (Npc_GetDistToWP(hero,"GRYD_060") < 500))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_DOOR_Info()
{
	B_FullStop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_01");	//За этой стеной... Кажется, здесь!
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_02");	//Я пока не набрал достаточной магической силы.
	AI_Output(self,other,"Info_BaalLukor_DOOR_13_03");	//Используй Заклинание Портала здесь, перед этой стеной.
	CreateInvItem(self,ItArScrollTeleport4);
	B_GiveInvItems(self,hero,ItArScrollTeleport4,1);
	AI_StopProcessInfos(self);
};


instance Info_BaalLukor_TELEPORT(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_TELEPORT_Condition;
	information = Info_BaalLukor_TELEPORT_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_TELEPORT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_DOOR) && Npc_CanSeeNpcFreeLOS(self,hero) && (Npc_GetDistToWP(hero,"GRYD_072") < 550))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop(hero);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_01");	//Оно приведет тебя в какое-то тайное место. Моя интуиция еще никогда не подводила меня.
	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_02");	//Неужели мы действительно найдем здесь ответ на вопрос, как призвать Спящего???
	AI_Output(other,self,"Info_BaalLukor_TELEPORT_15_03");	//Это место больше похоже на похоронный зал.
	AI_Output(self,other,"Info_BaalLukor_TELEPORT_13_04");	//Идем дальше.
	AI_Output(self,other,"Info_BaalLukor_HELP_13_03");	//Иди вперед. Я пойду следом!
	B_LogEntry(CH3_OrcGraveyard,"При помощи заклинания телепортации я обнаружил туннель, ведущий прочь от большого зала.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TELEPORT");
};


instance Info_BaalLukor_ALTAR(C_Info)
{
	npc = GUR_1211_BaalLukor;
	condition = Info_BaalLukor_ALTAR_Condition;
	information = Info_BaalLukor_ALTAR_Info;
	permanent = 0;
	important = 1;
};


func int Info_BaalLukor_ALTAR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_BaalLukor_TELEPORT) && (Npc_GetDistToWP(hero,"GRYD_082") < 400) && Npc_CanSeeNpcFreeLOS(self,hero))
	{
		return TRUE;
	};
};

func void Info_BaalLukor_ALTAR_Info()
{
	B_FullStop(hero);
	AI_GotoWP(hero,"GRYD_081");
	AI_AlignToWP(hero);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_01");	//НЕТ! Этого не может быть! Здесь ничего нет... ничего, кроме костей... и пыли.
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"GRYD_082");
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_02");	//НЕТ!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_03");	//ГОСПОДИН, ОТВЕТЬ МНЕ!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_04");	//ЯВИ СЕБЯ, СПЯЩИЙ!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_05");	//НЕЕЕЕЕЕТ!!!
	AI_Output(hero,self,"Info_BaalLukor_ALTAR_15_06");	//Ну вот. Он окончательно сошел с ума!
	AI_Standup(self);
	B_WhirlAround(self,hero);
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_07");	//Это все твоя вина. Твое нечестивое присутствие разозлило всемогущего Спящего!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_08");	//И теперь я должен расплачиваться за твое святотатство!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_09");	//Я должен принести жертву своему господину. ЧЕЛОВЕЧЕСКУЮ ЖЕРТВУ!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_10");	//И тогда он точно просвятит меня и сделает меня своим слугой.
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_11");	//УМРИ, НЕВЕРНЫЙ!!!
	AI_Output(self,hero,"Info_BaalLukor_ALTAR_13_12");	//АЙЙЙЕЕЕЕХХХХХХ!!!!!!
	self.flags = 0;
	self.npcType = npctype_main;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	B_LogEntry(CH3_OrcGraveyard,"Идол Люкор просто сошел с ума, когда понял, что там внизу нет абсолютно ничего. В припадке ярости он даже напал на меня. Кор Ангар будет очень расстроен, услышав эту историю.");
	AI_StopProcessInfos(self);
	AI_StartState(self,ZS_Attack,1,"");
};

