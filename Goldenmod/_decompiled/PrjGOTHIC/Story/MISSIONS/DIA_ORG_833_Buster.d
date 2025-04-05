
instance DIA_ORG_833_Buster(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster_Condition;
	information = DIA_ORG_833_Buster_Info;
	important = 1;
	permanent = 0;
};


func int DIA_ORG_833_Buster_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01");	//Похоже, ты не слишком проворен. Я могу помочь тебе.
};


instance DIA_ORG_833_Buster_Exit(C_Info)
{
	npc = ORG_833_Buster;
	nr = 999;
	condition = DIA_ORG_833_Buster_Exit_Condition;
	information = DIA_ORG_833_Buster_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORG_833_Buster3(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster3_Condition;
	information = DIA_ORG_833_Buster3_Info;
	important = 0;
	permanent = 1;
	description = "Ты можешь мне помочь?";
};


func int DIA_ORG_833_Buster3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_ORG_833_Buster) && (Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == 0))
	{
		return 1;
	};
};

func void DIA_ORG_833_Buster3_Info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Я могу обучить тебя контролю над телом. Это искусство называется АКРОБАТИКА.
	Info_ClearChoices(DIA_ORG_833_Buster3);
	Info_AddChoice(DIA_ORG_833_Buster3,DIALOG_BACK,DIA_ORG_833_Buster_Back);
	Info_AddChoice(DIA_ORG_833_Buster3,B_BuildLearnString(NAME_LearnAcrobat,LPCOST_TALENT_ACROBAT,0),DIA_ORG_833_Buster_Train1);
	if(BUSTER_TEACH_OK == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Вор Крушитель обучает акробатике.");
		BUSTER_TEACH_OK = TRUE;
	};
};

func void DIA_ORG_833_Buster_Train1()
{
	Info_ClearChoices(DIA_ORG_833_Buster3);
	if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
	{
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения. Но не стоит забывать, что ты все-таки не бессмертный!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Акробатика также очень полезна в бою. Ты сможешь быстро менять дистанцию между собой и противником. Ну, с богом!
	};
};

func void DIA_ORG_833_Buster_Back()
{
	Info_ClearChoices(DIA_ORG_833_Buster3);
};

