// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Buena suerte.
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Lo mismo te deseo, muchacho, lo mismo te deseo.
	
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Llevas mucho tiempo aqu�?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //�Llevas mucho tiempo aqu�?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Ya llevo 10 a�os aqu�. Cr�eme si te digo que he aprendido muchas cosas y experimentado otras tantas.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Me he encontrado con muchos peligros y he conseguido salir con vida.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //En los viejos tiempos, cuando trabaj�bamos en la mina abandonada, la que ahora est� desierta, se vinieron abajo los puntales...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Pero eso es agua pasada...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tambi�n debes haber escuchado muchos planes de fuga."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Tambi�n debes haber escuchado m�s de un plan para escapar de aqu�.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Mira, muchacho. S� que quieres salir de aqu�, pero ser� mejor que te olvides de ello.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //Ser� mejor que te olvides de escapar. Yo vi las caras de aquellos que intentaron salir de la Barrera.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //No cometas el mismo error: la Barrera detiene a todo el mundo.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //�No quiero pasarme los pr�ximos 10 a�os de mi vida cavando en una mina!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //No lo har�s. Tal vez te conviertas en uno de los peces gordos; �qui�n sabe?
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Conseguir�s progresar, pero no importa lo lejos que llegues; al final, la Barrera te detendr�.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Una cara nueva. �Has trabajado alguna vez en la extracci�n de mineral, muchacho?
};  
