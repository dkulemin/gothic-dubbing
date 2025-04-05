// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Je suis nouveau ici. Qui es-tu ?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Je suis nouveau ici. Qui es-tu ?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Je suis Baal Taran de la Confr�rie du Dormeur.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Quelle est la Confr�rie du Dormeur ?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Quelle est la Confr�rie du Dormeur ?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Nous sommes une communaut� de croyants dans une nouvelle foi.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Notre camp est situ� dans l'est, dans le marais. Je suis venu pour pr�cher la parole du Dormeur aux �trangers comme toi.
};

// **************************************************
//					Wer ist der Schl�fer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Qui est le Dormeur ?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Qui est le Dormeur ?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Le Dormeur est notre r�dempteur. Il s'est r�v�l� il y a cinq ans gr�ce � Y'B�rion, notre ma�tre.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Depuis lors, nous avons tous renonc� aux trois dieux. Et tu devrais bien le faire aussi.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Les dieux ont juste attendu et observ� pendant que nous �tions exil�s dans cette prison. Mais le Dormeur nous m�nera � la libert�.
};

// **************************************************
//					Lehre des Schl�fers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Parle-moi des enseignements du Dormeur.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Parle-moi des enseignements du Dormeur.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Le Dormeur est un �tre puissant, peut-�tre bien plus puissant qu'Iinnos, dieu de la lumi�re.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Il est avec nous par l'esprit. Mais sa puissance est encore limit�e. Il a dormi pendant mille ans, mais maintenant l'instant de son r�veil est proche.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Il nous a choisis pour �tre des t�moins de son r�veil et pour r�pandre sa parole.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //�coute, tout ceux qui rejoignent le Dormeur auront des �mes immortelles, mais ceux qui sont contre lui seront punis.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Mais le Dormeur est compatissant et envoie la preuve de sa puissance � tous ceux qui doutent de lui.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "� quoi la voie de la libert� ressemblera-t-elle ?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //� quoi la voie de la libert� ressemblera-t-elle ?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Nous pr�parons une grande invocation du Dormeur, au cours de laquelle tous les novices cr�eront ensemble le contact.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //Durant cette invocation, le Dormeur r�v�lera le chemin de la libert�.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "Comment ton dieu prouve-t-il sa force ?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Comment ton dieu prouve-t-il sa force ?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Il nous parle au travers des visions. Celui qui entend sa voix ne doute plus de sa puissance.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Si tu utilises l'Herbe qui pousse dans le marais, tu te rapprocheras du Dormeur et tu seras capable de l'entendre. Certains arrivent m�me � voir des images.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Je vois.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "Comment aller au le camp de la Confr�rie ?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Comment aller au le camp de la Confr�rie ?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Je suis occup�. Mais Baal Parvez devrait �tre aussi quelque part dans ce camp.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Il est pr�s du march�, de l'autre c�t� du ch�teau. Je pense m�me qu'il est dans sa propre cabane.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Un novice appel� Baal Parvez peut me mener au Camp Mar�cageux de la Confr�rie. Il est � la place du march� derri�re le ch�teau du Vieux Camp .");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "Je dois entrer dans le ch�teau. Peux-tu m'aider ?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Je dois entrer dans le ch�teau. Peux-tu m'aider ?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //J'ai bien peur de ne pas pouvoir, mon fr�re. Les seuls parmi nous qui peuvent entrer au ch�teau sont ceux qui fournissent de l'Herbe � Gomez.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Nous r�coltons l'Herbe de marais et nous en faisons un commerce de d�tail dans le Vieux camp, en �change de marchandises venues du monde ext�rieur.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Si tu �tais l'un des messagers � la solde de Cor Kalom,  tu pourrais entrer au ch�teau. Mais pour �a, tu dois �tre l'un de nous.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //Et puis que veux-tu faire au ch�teau ?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Je veux rencontrer quelqu'un l�-bas.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"J'ai une lettre pour le Grand Magicien du Cercle du Feu.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Je veux rencontrer quelqu'un l�-bas.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Quoi ? Qui ? Et pourquoi tu n'attends pas juste le moment de sa sortie ?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Cela ne te regarde pas.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Il est un des magiciens.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //J'ai une lettre pour le Grand Magicien du Cercle du Feu.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Oh ? Et d'o� tiens-tu cela ? Les Mages te l'ont donn� avant qu'ils ne te jettent ci,  pas vrai ?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Tu es stupide de dire �a � quelqu'un. Mais ne t'inqui�te pas - je ne le r�p�terais pas.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Mais rends-toi service, ne parle de �a � personne. Les gens d'ici �gorgeraient n'importe qui pour une chose pareille !
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //La plupart des gens aimeraient bien toucher la r�compense que tu as re�u pour un message du monde ext�rieur.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //Il est un des magiciens.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Ah ! Et bien, ils ne quittent jamais le ch�teau. Tu dois vraiment entrer.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Et puis qu'attends-tu d'eux ?Des runes ? Des potions ?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Cela ne te regarde pas.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"C'est �a.",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //Cela ne te regarde pas.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Tr�s bien, l'ami Je voulais juste t'aider...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //C'est �a.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Je l'aurai pari� ! Qu'est-ce qu'un type comme toi veut faire encore avec les Mages.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Je peux te donner quelques bons conseils : Oublie les Mages. Ils prennent de loin trop de minerai pour leur marchandise.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Les runes et les potions sont bien meilleur march� dans notre camp.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
