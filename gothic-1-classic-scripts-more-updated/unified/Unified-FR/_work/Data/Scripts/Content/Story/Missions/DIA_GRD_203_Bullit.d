//******************************************
//					EXIT	
//******************************************

instance  DIA_Bullit_Exit (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 999;
	condition	= DIA_Bullit_Exit_Condition;
	information	= DIA_Bullit_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Bullit_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					First	
//******************************************

instance  DIA_Bullit_First (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 1;
	condition	= DIA_Bullit_First_Condition;
	information	= DIA_Bullit_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int  DIA_Bullit_First_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_First_Info()
{
	AI_Output (self, other,"DIA_Bullit_First_06_00"); //Qui avons-nous ici ? Ce n'est pas toi le gars que j'ai baptis� plus t�t ? Que veux-tu ? Tu reviens pour autre chose ?
};

//******************************************
//				Aufs Maul
//******************************************

instance  DIA_Bullit_AufsMAul (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 1;
	condition	= DIA_Bullit_AufsMAul_Condition;
	information	= DIA_Bullit_AufsMAul_Info;
	permanent	= 0;
	description = "Je suis venu pour fermer ta grande gueule.";
};                       

FUNC int  DIA_Bullit_AufsMAul_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_AufsMAul_Info()
{
	AI_Output (other, self,"DIA_Bullit_AufsMAul_15_00"); //Je suis venu pour fermer ta grande gueule.
	AI_Output (self, other,"DIA_Bullit_AufsMAul_06_01"); //Et bien,  viens ici et fait un essai, fiston !
	
	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other); 
	AI_StartState (self, ZS_Attack, 1, "");
};

// *****************************************************
// 				Wartet auf den SC
// *****************************************************

instance  DIA_GRD_203_Bullit_Wait4SC (C_INFO)
{
	npc				= GRD_203_Bullit;
	condition		= DIA_GRD_203_Bullit_Wait4SC_Condition;
	information		= DIA_GRD_203_Bullit_Wait4SC_Info;
	important		= 1;	
	permanent		= 0;
};

FUNC int  DIA_GRD_203_Bullit_Wait4SC_Condition()
{	
	if( Npc_KnowsInfo (hero, Info_Xardas_LOADSWORD02 ) )
	{
		return 1;
	};
};

func void  DIA_GRD_203_Bullit_Wait4SC_Info()
{
	AI_Output (self, other,"DIA_GRD_203_Bullit_Wait4SC_06_01"); //Encore toi? ! J'aurai d� te noyer dans le lac le jour ou je t'ai vu!
	AI_Output (other, self,"DIA_GRD_203_Bullit_Wait4SC_15_02"); //Je n'ai pas eu de chance jusqu'ici - maintenant les r�les sont invers�s.
	AI_Output (self, other,"DIA_GRD_203_Bullit_Wait4SC_06_03"); //Esp�ce de vermisseau ! J'esp�re que tu ne le feras pas aussi facilement pour moi que tu ne l'as fait la premi�re fois !
		
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_GRD;
	Npc_SetTrueGuild	( self, GIL_GRD );	

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );
	
	Npc_SetTarget 	( self, other ); 
	AI_StartState 	( self, ZS_Attack, 1, "");
}; 
