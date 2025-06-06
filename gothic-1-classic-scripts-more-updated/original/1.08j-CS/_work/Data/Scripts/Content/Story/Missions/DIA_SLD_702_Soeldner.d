// ********************************
// 				EXIT
// ********************************

instance DIA_Sld_702_EXIT (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 999;
	condition	= DIA_Sld_702_EXIT_Condition;
	information	= DIA_Sld_702_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Sld_702_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Sld_702_First (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_First_Condition;
	information	= DIA_Sld_702_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Sld_702_First_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Sld_702_First_Info()
{
	AI_Output (self, other,"DIA_Sld_702_First_04_00"); //V�, kam jde�?
	AI_Output (other, self,"DIA_Sld_702_First_15_01"); //Kam?
	AI_Output (self, other,"DIA_Sld_702_First_04_02"); //Jde� p��mo k Leeovi, na�emu v�dci.
};

// ********************************
// 				PERM
// ********************************

instance DIA_Sld_702_PERM (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_PERM_Condition;
	information	= DIA_Sld_702_PERM_Info;
	permanent	= 1;
	description = "Co mus�m ud�lat, abys m� pustil k Leeovi?";
};                       

FUNC int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_PERM_Info()
{
	AI_Output (other, self,"DIA_Sld_702_PERM_15_00"); //Co mus�m ud�lat, abys m� pustil k Leeovi?
	AI_Output (self, other,"DIA_Sld_702_PERM_04_01"); //Nic!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_02"); //Tohle nen� Star� t�bor a Lee nen� Gomez!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_03"); //Nepot�ebuje ��dnou arm�du lokaj�, za kter� by se schov�val. Dok�e se ubr�nit s�m!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_04"); //MY jsme tady jen pro p��pad, kdyby n�s pot�eboval.
};



