// ************************ EXIT **************************

instance  VLK_583_Glen_Exit (C_INFO)
{
	npc			=  VLK_583_Glen;
	nr			= 999;
	condition	=  VLK_583_Glen_Exit_Condition;
	information	=  VLK_583_Glen_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_583_Glen_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance   VLK_583_Glen_INFO(C_INFO)
{
	npc				= VLK_583_Glen;
	condition		= VLK_583_Glen_INFO_Condition;
	information		= VLK_583_Glen_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "� ���� ��������� �����. ������ ���-������ ������������?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //� ���� ��������� �����. ������ ���-������ ������������?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //������� �������� �� ��������.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //��� ���� �� �����������, ��� ������ ����� ������ ���� ������. ������� ���������� �������!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //��� ������ �� ���� � ��������� ���� ������. �� �������, ��� �� ����� �������� ������, ����� ��� ����������� ��� ����� � �����. � �����, ��� ��� �������...
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //��� ������ � �����������. ���� ���� ������ �����, ����� ����� ������ ����, ���� ��� ���.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ������, � ���� ����� ������ �������.";
};                       

FUNC int  VLK_583_Glen_LOCKPICK_Condition()
{
	if ( Npc_KnowsInfo(hero, VLK_585_Aleph_GLEN) )
	{
		return 1;
	};
};

FUNC VOID  VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //� ������, � ���� ����� ������ �������.
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //��, �� ������ �������, ��� ��, ������ �� �������, �����? �� 10 ������ ���� �� �����.
	
	
};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(������ �������)";
	trade		= 1;
};                       

FUNC int  VLK_583_Glen_BUY_Condition()
{	
	if ( Npc_KnowsInfo (hero, VLK_583_Glen_LOCKPICK) )
	{
		return 1;
	};
};
FUNC VOID  VLK_583_Glen_BUY_Info()
{
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //� ���� ������ �������.
	
	
	
};
