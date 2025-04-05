
instance SLD_9100_SOELDNER_EXIT(C_Info)
{
	npc = sld_9100_soeldner;
	nr = 999;
	condition = sld_9100_soeldner_exit_condition;
	information = sld_9100_soeldner_exit_info;
	important = 0;
	permanent = 1;
	description = "���������";
};


func int sld_9100_soeldner_exit_condition()
{
	return TRUE;
};

func void sld_9100_soeldner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_9100_SOELDNER_ABANDONEDMINE(C_Info)
{
	npc = sld_9100_soeldner;
	nr = 1;
	condition = sld_9100_soeldner_abandonedmine_condition;
	information = sld_9100_soeldner_abandonedmine_info;
	permanent = 1;
	important = 0;
	description = "��� ��������?";
};


func int sld_9100_soeldner_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,info_saturas_abandonedmine))
	{
		return TRUE;
	};
};

func void sld_9100_soeldner_abandonedmine_info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00");	//��� � �������?
	AI_Output(self,other,"SLD_9100_Soeldner_ABANDONEDMINE_12_00");	//��, ��� ����.
};


instance SLD_9100_SOELDNER_PRE_ABANDONEDMINE(C_Info)
{
	npc = sld_9100_soeldner;
	nr = 1;
	condition = sld_9100_soeldner_pre_abandonedmine_condition;
	information = sld_9100_soeldner_pre_abandonedmine_info;
	permanent = 1;
	important = 0;
	description = "��� ����?";
};


func int sld_9100_soeldner_pre_abandonedmine_condition()
{
	if(!Npc_KnowsInfo(hero,info_saturas_abandonedmine))
	{
		return TRUE;
	};
};

func void sld_9100_soeldner_pre_abandonedmine_info()
{
	AI_Output(other,self,"Info_Gorn_GUARDNCRUNNING_15_01");	//��� ����?
	AI_Output(self,other,"SLD_9100_Soeldner_Pre_ABANDONEDMINE_12_00");	//� ������ ������ ����� � ������� �� ���, ����� ���������� �� �������� �� ��������.
};

