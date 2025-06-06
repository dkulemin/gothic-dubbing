// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Nyras_Exit (C_INFO)
{
	npc			=  Nov_1303_Nyras;
	nr			=  999;
	condition	=  DIA_Nyras_Exit_Condition;
	information	=  DIA_Nyras_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Nyras_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Nyras_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hi
// **************************************************

instance DIA_Nyras_Hallo (C_INFO)
{
	npc				= Nov_1303_Nyras;
	nr				= 1;
	condition		= DIA_Nyras_Hallo_Condition;
	information		= DIA_Nyras_Hallo_Info;
	permanent		= 0;
	description		= "Salut ! Je suis nouveau ici.";
};

FUNC int  DIA_Nyras_Hallo_Condition()
{
	if	(Kapitel <= 1)
	{
		return TRUE;
	};
};
func void  DIA_Nyras_Hallo_Info()
{
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Salut ! Je suis nouveau ici.
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Le Dormeur soit avec toi, �tranger !
};

// **************************************************
//						Ort
// **************************************************

instance DIA_Nyras_Ort (C_INFO)
{
	npc				= Nov_1303_Nyras;
	nr				= 1;
	condition		= DIA_Nyras_Ort_Condition;
	information		= DIA_Nyras_Ort_Info;
	permanent		= 0;
	description		= "Que peux-tu me dire � propos de cette place ?";
};

FUNC int  DIA_Nyras_Ort_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Nyras_Hallo))
	&&	(Kapitel <= 1)
	{
		return 1;
	};
};

func void  DIA_Nyras_Ort_Info()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Que peux-tu me dire � propos de cette place ?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Bon - les Sages sont les personnes les plus importantes ici. Ils r�pandent la parole du Dormeur et transmettent les visions de notre ma�tre aux novices.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //Naturellement il est trop fatigu� pour parler directement � tout le monde.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Mais quelques fois il nous parle dans la cour du temple et r�v�le la parole sacr�e du Dormeur.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Parle-moi des propos b�nis du grand Dormeur.",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"Et que dit-il alors ?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //Et que dit-il alors ?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //Le Dormeur nous montre le chemin. Mais un infid�le comme toi ne peux pas comprendre pas �a !
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Parle-moi des propos b�nis du grand Dormeur.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //IL nous dit ce que nous devons faire pour regagner notre libert�.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y'B�rion dit que le Dormeur nous montrera le chemin d�s que nous pourrons l'entendre.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Il pr�pare une grande invocation, au cours de laquelle il entrera en contact avec le Dormeur ainsi que les meilleurs novices.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalom le soutient. C'est un alchimiste qui m�lange les marchandises qui nous plongent dans un �tat proche du sommeil.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //tu peux recevoir les pens�es du Dormeur uniquement dans cet �tat - ou en dormant.
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

// ***************************************************
//						
// ***************************************************








///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
////////////////////		Bring Fokus 1		///////////////////////////
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

// ***************************** BEGR��UNG ****************************************//

instance Nov_1303_Nyras_GREET (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_GREET_Condition;
	information		= Nov_1303_Nyras_GREET_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Nov_1303_Nyras_GREET_Condition()
{
	if ( YBerion_BringFocus == LOG_RUNNING )
	{
		return 1;
	};
};
func void  Nov_1303_Nyras_GREET_Info()
{
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Fiche le camp ! Tu n'as rien � faire ici !
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je cherche la pierre focale."; 
};

FUNC int  Nov_1303_Nyras_LEAVE_Condition()
{	
	if ( Npc_KnowsInfo (hero,Nov_1303_Nyras_GREET))
	{
		return 1;
	};
};
FUNC void  Nov_1303_Nyras_LEAVE_Info()
{
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Je cherche la pierre focale.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Malheureusement tu es arriv� trop tard. Je l'ai d�j� trouv� !
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //Et je le garde pour moi !
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Le Dormeur m'a parl� la nuit derni�re et fait de moi son seul instrument !
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Maintenant je servirai seul le Dormeur. Plus de templiers ni de Sages !
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //SEULEMENT MOI TOUT SEUL !!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //MEURT !!!!!

	B_LogEntry		(CH2_Focus,"Nyras a perdu l'esprit. Il voulais garder la pierre pour lui et m'a attaqu�.");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
