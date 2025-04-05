var int Diego_After_Gamestart;

// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Je m'appelle Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Je m'appelle...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Je ne suis pas int�ress� par qui tu es. Tu viens juste d'arriver. Je surveille les nouveaux arrivants. C'est tout pour le moment.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Si tu souhaites rester en vie pendant un moment, tu devrais me parler. Mais bien s�r je ne t'emp�cherai pas de choisir ta propre destruction. H� bien, qu'en penses-tu ?
	
	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Merci pour ton aide.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //C'est toi qui d�cide. Content de t'avoir connu.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Nous nous rencontrerons au Vieux Camp.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Allons-y.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Salut.
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "J'ai une lettre pour le Grand Magicien du Cercle du Feu.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //J'ai une lettre pour le Grand Magicien du Cercle du Feu.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Vraiment...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Elle m'a �t� donn� par un Mage juste avant qu'ils me balancent ici.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Tu as de la chance que je ne puisse plus me permettre de montrer ma face devant les Mages. N'importe qui d'autre te couperait la gorge pour cette lettre.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //Tout �a parce que les Mages payent tr�s bien leurs messagers et la plupart des gens ici n'ont rien.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Si j'�tais toi je la fermerai jusqu'� ce que je rencontre un des Mages. Cependant, dans ta situation, cela ne risque pas d'arriver.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Pourquoi pas ?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Les Mages sont dans le ch�teau au Vieux Camp. Seul les gens de Gomez sont autoris�s � entrer dans le ch�teau.
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "Pourquoi m'aiderais-tu ?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Pourquoi m'aiderais-tu ?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Parce que tu as besoin d'aide, sinon Bullit et ses hommes pourront te tuer.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //Et je ne peux pas juste rester l� et regarder. Bref j'en viens � faire une suggestion.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Une suggestion...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Oui. apr�s ce petit incident avec Bullit et ses hommes, tu dois �tre conscient maintenant que tu as besoin de protection.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Tous ceux qui arrivent ici ont un choix. Il y a trois camps dans la colonie, et tu devras rejoindre l'un d'eux. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Je suis ici pour montrer aux nouveaux que le Vieux Camp est la meilleure place pour eux.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "O� est Bullit maintenant ?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //O� est Bullit maintenant ?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //Lui et les autres ram�nent les marchandises du monde ext�rieur dans le Camp. Tu le trouvera l�-bas.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Mais si tu souhaites le combattre, fait attention. C'est un guerrier exp�riment�.
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "D'accord, qu'est-ce que j'ai besoin de savoir sur cet endroit ?";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //D'accord, qu'est-ce que j'ai besoin de savoir sur cet endroit ?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Nous l'appelons la colonie. Tu sais d�j� que nous produisons le minerai pour le Roi. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Enfin, au moins nous - dans le Vieux Camp.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Il y a trois camps � l'int�rieur de la Barri�re. Le Vieux Camp est le plus gros, et ce fut le premier.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "Dit-moi en plus sur la Barri�re.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Dit-moi en plus sur la Barri�re.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Il n'y a pas grand chose � dire. Elle est imp�n�trable.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //Que ce passe t'il si je me dirige vers elle ?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Le dernier qui a essay� d'atteindre l'autre cot� est mort. Cette maudite Barri�re te laisse dedans, mais jamais dehors.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //S'il y a une sortie, je la trouverai.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Tu veux d�j� partir ? Mais tu viens juste d'arriver !
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "Et ce qui concerne les deux autres camps ?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //Et ce qui concerne les deux autres camps ?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Les deux autres camps sont divis�s pour poursuivre leurs plans d'�vasion.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //Il y a le Nouveau camp �  l'ouest de la colonie, o� les Mages pensent qu'ils peuvent juste faire sauter la Barri�re d�s qu'ils rassembleront assez de minerai.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //Et alors il y a la secte des farfelus � l'est. Leur camp est au milieu du marais, et ils prient � leur idole pour les rendre libres.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Il n'a pas r�pondu jusqu'ici.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Si j'�tais toi, je ne perdrais pas mon temps avec ces cingl�s.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "Dit-moi quelque chose � propos du Vieux Camp.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Dit-moi quelque chose � propos du Vieux Camp.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //C'est le plus grand et le plus puissant des trois camps. Gomez et sa bande contr�lent le camp et de ce fait tiennent tout le commerce de minerai.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Une fois par mois, le Roi nous envoie tout ce dont nous avons besoin. Nous tenons le vieux bonhomme dans nos mains, tu comprends ?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Il nous envoie vin, pain, viande, armes... tout.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Tu peux toi aussi obtenir quelque chose de lui. Tout ce que tu dois faire, c'est faire partie des hommes de Gomez.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "Qui est Gomez ?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Qui est Gomez ?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez est le plus puissant Baron du Minerai. C'est le chef du Vieux Camp - l'homme le plus puissant de la colonie.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "Imaginons que je souhaite faire parti de ses gens, qu'ai-je besoin de faire ?";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Imaginons que je souhaite faire parti de ses gens, qu'ai-je besoin de faire ?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Aux portes du ch�teau tu trouveras un ami nomm� Thorus. Dis-lui que Diego t'envoie.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Pour �tre autoris� � rejoindre les gens de Gomez au Vieux Camp, j'ai besoin de voir Thorus.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "Comment puis-je arriver au Vieux Camp ?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Comment puis-je arriver au Vieux Camp ?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Suis juste ce chemin. Le Vieux Camp est le prochain endroit raisonnablement s�curis� que tu traverseras.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Il y a beaucoup de b�tes sauvages entre les camps. Ce serait une folie de te promener sans une arme.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "O� puis-je obtenir une arme ?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //O� puis-je obtenir une arme ?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Quand tu arriveras � la vieille Mine, jette un oeil alentour. Je suis s�r que tu trouveras quelque chose d'utile.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //La mine est facile � trouver, c'est juste � quelques m�tres dans le canyon. 
};

// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "J'ai parl� � Thorus.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //J'ai parl� � Thorus.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //Et qu'a t'il dit ?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Il a dit que je peux rejoindre le Vieux Camp si TU penses que je suis assez bon.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //C'est comme si j'avais moi-m�me un nouveau travail.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Commen�ons-nous de suite ?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //D'abord il y a certaines choses que tu devrais savoir.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "que dois-je savoir pour �tre accept� dans le Vieux Camp ?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //que dois-je savoir pour �tre accept� dans le Vieux Camp ?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Si tu veux rejoindre le camp tu devras gagner de l'estime.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //Il y a quelques personnes influentes dans l'anneau externe. La plupart d'entre elles sont des Ombres. Si tu parviens � les impressionner, tu monteras dans leur estime.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Alors tu devras r�ussir l'�preuve de la foi.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Sans compter qu'il y a beaucoup de comp�tences que chaque nouvel arrivant doit apprendre. Plus que tu apprends, plus tu nous seras utile.
	
	B_LogEntry( CH1_JoinOC,"Pour �tre accept�, j'ai besoin d'impressionner des gens importants dans le cercle ext�rieur et de r�soudre une �preuve de confiance avec Diego.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "O� puis-je trouver des gens importants ?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //O� puis-je trouver des gens importants ?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //H� bien, tu parles � l'un d'entre eux. Et puis il y a Thorus... que tu connais d�j�.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Quant aux autres... Tu devras le d�couvrir toi-m�me. De toute fa�on, si tu ne parviens pas � le faire, tu ne n'appartiendras jamais au camp.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Passe par l'anneau externe et parle aux gens, alors tu d�couvriras qui est important.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "Qui peut m'enseigner ?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Qui peut m'enseigner ?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Commence par Fingers. C'est le plus habile parmi nous.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Si tu gardes les yeux bien ouverts, tu trouveras d'autres personnes qui peuvent t'enseigner.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //O� puis-je trouver Fingers ?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Sa cabane est en quelque sorte cach�e. Elle est � c�t� d'un mur du ch�teau. A partir d'ici, dirige toi vers le ch�teau.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Quand tu es � la porte du ch�teau, descend vers la gauche et continue jusqu'� arriv� devant sa cabane.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Finger peut apprendre le VOL � LA TIRE et comment OUVRIR LES SERRURES. Il vit dans une cabane pr�s de l'ar�ne, l�g�rement isol�e, par les murs du ch�teau.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "Peux-tu m'apprendre quelque chose ?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Diego peut m'aider � devenir PLUS FORT et plus ADROIT.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Peux-tu m'apprendre quelque chose ?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Oui. Je peux t'enseigner � am�liorer ta dext�rit� ou ta force.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Ta force a beaucoup augment�.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Tes comp�tences utilis�es pour l'arc et l'arbal�te se sont am�lior�es.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Reviens bient�t - il y a encore beaucoup de choses que tu dois apprendre !
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************

VAR INT Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "Quelle est l'�preuve de la Foi ?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //Quelle est l'�preuve de la Foi ?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Tu dois aller � la vieille mine. L� tu rencontreras un type appel� Ian. Il te donnera une liste.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //Cette liste est importante. Elle contient tous les objets que les gens dans la mine ont besoin.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Ils auront la marchandise avec le prochain convoi !
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //Aucun probl�me !
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //Oui, il y a un probl�me ! Le Nouveau camp ne doit pas avoir cette liste !
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Comme je le disais : Cette liste est importante. Si tu t'en sort bien, tu iras beaucoup plus loin.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego m'a envoy� � la vielle mine. Il faut que j'obtienne une liste d'un gars appel� Ian. La liste ne doit pas tomber dans les mains du Nouveau Camp.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "Si la liste est si importante, pourquoi Ian doit me la donner ?";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Si la liste est si importante, pourquoi Ian devrait me la donner ?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Parce que tu vas lui dire que c'est Diego qui t'as envoy�.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Je le lui dirai.
	
	B_LogEntry    (CH1_BringList,"Ian me donnera la liste si je lui dis que Diego m'a envoy�.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "O� puis-je trouver la vieille mine ?";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //O� puis-je trouver la vieille mine ?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Va voir Graham. C'est un cartographe. Dis lui que je t'ai envoy� et que tu as besoin d'une carte. Elle t'indiquera le chemin vers la mine.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Il vit � gauche de la porte nord.
	
	B_LogEntry    (CH1_BringList,"Graham me donnera une carte. Je peux le trouver � gauche de la porte Nord.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "J'ai la liste de Ian.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //J'ai la liste de Ian.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego �tait tr�s heureux quand je lui ai donn� la liste de Ian.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego �tait tr�s content quand je lui ai donn� la liste de Ian. Mais il n'a pas remarqu� que Lares l'a contrefaite, ou ai-je vu juste un reflet dans ses yeux ?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Bien jou� ! Cela te rapporteras un peu d'estime !

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "Et en ce qui concerne mon estime dans le Camp ?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Et en ce qui concerne mon estime dans le Camp ?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //J'ai parl� � quelques personnes...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //Et?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty m'a dis que tu as vaincu Kirgo.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty m'a indiqu� que tu as laiss� Kirgo te vaincre. Il n'a pas sembl� �tre tr�s enthousiaste.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty m'a indiqu� qu'il est impatient de voir comment tu vas te battre contre Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Mais il a �t� impressionn� par ton courage pour lutter contre Kharim, quoique tu aies �t� vaincu.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Mais il a �t� tr�s impressionn� par ta victoire contre Kharim - il n'arr�te pas de parler de toi � tout le monde. 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //Et il est impatient de voir si tu vas d�fier Kharim.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler m'a racont� l'histoire de Fisk... Et bien, si j'�tais toi j'aurais pris le minerai et je serais parti loin. Mais de toute fa�on - il pense que tu as tr�s bien fait.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //J'ai parl� � Whistler. Tu as pris son minerai, esp�ce de b�tard intelligent ! Je dois admettre que tu es vraiment courageux !
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler attend son �p�e. Tu devras te d�cider de la lui apporter ou pas, sinon il pensera que tu t'es enfui avec son minerai !
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly m'a dit que tu as rencontr� Nek. Il a sembl� �tre vraiment content.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Je crois que Sly a tord � propos de Nek. C'est une vraie plaie, c'est vrai, mais je ne pense pas qu'il soit all� au Nouveau camp.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Je t'ai d�j� envoy� � Fingers - il peut vraiment t'apprendre quelque chose !
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers m'a dit que tu avais commenc� � apprendre, mais il pense que tu peux encore am�liorer tes comp�tences.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Je dois parler � Dexter. Il se sert de toi pour ses propres affaires.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Mais il n'y a pas de r�gle pour l'essai. Si tu le passes, tu auras fait une grande �tape.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Tu es parvenu � obtenir la recette de Kalom. Dexter est tr�s impressionn�, et moi aussi.
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Les affaires avec Mordrag sont un vrai travail. Ce n'est pas un mauvais guerrier. Tu devrais t'entra�ner si tu veux vraiment le battre.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus me dis que nous pourrions nous servir de toi - ce qui bien pour toi.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus �tait fou de rage - comment oses-tu bousiller ce travail COMME CA ?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk m'a dit que tu l'as �tonn�. De toute fa�on il sera de ton c�t�.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk en a vraiment marre de toi. Si j'�tais toi je rechercherais quelqu'un pour remplacer Mordrag.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Tu as trouv� assez de personnes pour parler en ta faveur.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Tu as �galement pass� l'�preuve de la foi. Aller � Thorus. Je lui ai d�j� dit tout. Il te laissera partir pour voir Gomez.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego m'a obtenu une audience avec Gomez. Maintenant je peux devenir un homme de Gomez et entrer au ch�teau. Je dois, d'abord, voir Thorus.");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Mais tu dois encore passer l'�preuve de la foi.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //Finalement, ce n'est trop mal pour un nouveau venu.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //D�brouille-toi avec �a! Il te reste beaucoup de choses � accomplir si tu veux devenir quelqu'un dans ce camp.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "Que dois-je faire lorsque je vais rencontrer Gomez ?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Que dois-je faire lorsque je vais rencontrer Gomez ?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Les d�cisions de Gomez des sont prises au culot. En regardera simplement ta tasse il peut d�cider que tu le rejoignes.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Dor�navant tu devras te d�brouiller tout seul - fait pour le mieux ! Bonne chance.
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //Est-ce que je peux avoir une armure comme la tienne ?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //As-tu assez de minerai ?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text f�r die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Trouve le minerai, et tu auras une armure.
	};
};  





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //H�, j'ai pens� que tu �tais mort.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //C'est aussi parfois ce que j'ai pens�.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Beaucoup de choses se sont produites depuis que notre derni�re entrevue. J'ai entendu que tu as beaucoup contribu� � l'invocation finale.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //�videmment tu es bien inform�.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Mieux que tu ne le penses... Maintenant tu es � la recherche des pierres focales ?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Oui. Elles doivent �tre quelque part par l�.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Je sais o� en trouver une. Il y a juste un probl�me.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Je vois. Que veux-tu ?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Tu as vraiment appris ta le�on, mais ce n'est pas que j'ai voulu dire je.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Non ? Quel est le probl�me alors ?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //C'est un probl�me de trois tonnes.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Allons-y. Tu vas comprendre bient�t.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"Quand je me suis approch� de la pierre focale de la place du nord, je me suis heurt� � Diego. Il m'a averti que quelque chose m'attendait � la fin du canyon.");
	B_LogEntry		(CH3_TrollCanyon,"D'une fa�on ou d'une autre il connaissait mes activit�s dans le Camp Mar�cageux aussi bien que ma recherche des pierres focales. Nous continuerons maintenant ensemble.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Du c�t� gauche de cette gorge se trouve l'entr�e d'une caverne qui conduit � la pierre focale.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Bien. Mais il faut d'abord nous d�barrasser de ce monstre l�-bas.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Essaye de trouver un point faible ou une autre astuce pour vaincre ce troll.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Je vais attirer son attention.

	B_LogEntry		(CH3_TrollCanyon,"Nous avons rencontr� par hasard un �norme Troll bloquant notre chemin. Diego veut le d�tourner, tandis que je dois trouver une fa�on de le terrasser.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //C'�tait fantastique. Tu es vraiment bon. Et maintenant, va prendre la pierre.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Je m'assurerai qu'il n'y ai pas d'autre surprise malencontreuse.

	B_LogEntry		(CH3_TrollCanyon,"Le Troll a �t� d�fait. Maintenant je peux m'occuper du treuil qui d�place la grille de la plate-forme de la pierre focale.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Le treuil semble �tre bloqu�.
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Laisse-moi voir, je peux peut-�tre l'arranger !

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //Bon, il doit fonctionner maintenant.
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,"Diego a r�par� le treuil. Maintenant il n'y a rien sur le chemin.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Prends la pierre, je t'attend ici !

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //H�, tu as trouv� la pierre. Excellent..
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Je pense qu'il est temps encore pour moi de m'arr�ter pr�s du Vieux camp. Bonne chance.
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Essaye de rester en vie !
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Nous nous reverrons.

	B_LogEntry		(CH3_TrollCanyon,"La pierre focale est mienne. Mais je dois encore convaincre quelques harpies de me la laisser.");
	B_LogEntry		(CH3_TrollCanyon,"Diego retourne au Vieux Camp . Je suis tout � fait s�r que nous nous rencontrerons de nouveau.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
};  











//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //H�... Shhh... Silence !
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Bonjour, Diego, j'ai d�j� parl� � Milten de l'autre c�t� du camp !
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //D'accord, ainsi tu sais d�j� ce qui s'est pass�.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //Mais as-tu aussi entendu parler de l'incursion pr�vue dans la mine Libre ?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Bonjour, Diego, qu'est-ce que signifie cette partie de cache-cache ?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //As-tu entendu ?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //Entendu quoi ?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //La vieille mine s'est effondr�e, les Mages du Feu ont �t� assassin�s et il y a des projets de pillage de la mine Libre.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //QUOI ? ? ? ? De quoi est-ce que tu parles ?
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Comment est la caverne dans la vielle mine ?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Comment est la caverne dans la vielle mine ?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Un des mineurs qui a surv�cu nous a racont� ce qu'ils creusaient, ils sont arriv�s � un fleuve souterrain au niveau inf�rieur.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Quand l'eau a jailli dans la mine, un des �tais s'est cass� et la section sup�rieure enti�re s'est effondr�e.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Seule une poign�e de personnes est parvenue � s'�chapper de la mine.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "Pourquoi les Mages de feu sont-ils morts ?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Pourquoi les Mages de feu sont-ils morts ?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //C'est une longue histoire.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "Un assaut sur la mine lib�r�e ?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Un assaut sur la mine lib�r�e ?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //C'est une longue histoire.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "Dit-le moi !";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Raconte ! Ce ne sera pas la premi�re longue histoire que j'ai entendu !
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //Et bien, heureusement, j'�tais dans la maison des Barons du minerai quand ils ont su que la mine s'�tait effondr�e.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Gomez sautait comme un fou quand il a entendu parler de l'accident, il avait peur que sa position soit remise en jeu.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Naturellement. Qui contr�le le minerai contr�le aussi la colonie !
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //C'est exact. Puisqu'il n'a plus d�sormais de source de revenu, aucune marchandises du monde ext�rieur n'entrera non plus.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Personne ne travaillera pour lui s'il ne trouve pas d'autre source de revenu rapidement.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //Et c'est la raison de l'incursion dans la mine Libre ?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Honn�tement, c'est la seule chance de Gomez de se maintenir au pouvoir.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Il y a deux heures deux douzaines de gardes sont partis pour  la mine Libre.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "C'est fou ! Je dois avertir le Nouveau Camp.";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //C'est fou ! Je dois avertir le Nouveau Camp.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //Alors tu dois te d�p�cher ! Ils doivent �tre tout pr�s de la mine Libre.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Mais ils ne pourront jamais passer par les fortifications du Nouveau camp.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Ils n'ont pas besoin de passer par l�. Il y a quelques mois, ils ont trouv� un chemin qui passe par le sommet des montagnes et conduit directement � la mine Libre - et personne ne le conna�t
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "J'ai vu les gardes devant les portes ferm�es.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //J'ai vu les gardes devant les portes ferm�es.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Ne t'approche pas d'eux. Ils attaqueront quiconque approchera le camp.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Ils ont peur que quelqu'un se venge du raid sur la mine Libre.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "Mais qu'est-il arriv� aux Mages de feu ?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Mais qu'est-il arriv� aux Mages de feu ?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo et les autres Mages �taient les seules personnes dans le camp � rester raisonnable.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Ils ont condamn� l'incursion et ont exig� un r�glement avec les deux autres camps
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //Ils ONT INTERDIT � Gomez de piller la mine Libre ?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //Et bien oui, Corristo et les autres n'auraient pas d� avoir autant d'assurance. Gomez les a faits assassiner en tra�tre.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "Que vas-tu faire maintenant avec Milten ?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //Que vas-tu faire maintenant avec Milten ?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Nous resterons encore ici un moment pour mettre en garde encore plus d'amis afin qu'ils n'aillent pas se jeter directement dans les gardes.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Mais tu pourrais nous rendre un service.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "Consid�re que c'est fait. Dit-moi ce que tu veux !";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Consid�re que c'est fait. Dit-moi ce que tu veux !
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Va chercher Lester et Gorn. Ils doivent savoir ce qu'il s'est produit ici.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Dis leur que quatre d'entre nous se r�uniront � l'endroit habituel.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Si je les vois avant toi, je les avertirai et les enverrai au point de rendez-vous.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Merci, mon ami. Tu es vraiment un type bien. Allons-y maintenant, nous devons encore nous r�unir.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Les Mages de feu sont morts et la situation est hors de contr�le. Diego a voulu que je dise � Lester et Gorn d'avoir une r�union avec lui et Milten � la place secr�te. Ce n'est pas la premi�re fois qu'ils font cela !"); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter �berfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schl�gerei mit Folgen         (+3 St�rke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung f�r mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des K�nigs Gardisten. dummerweise hat der K�nig viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("St�rke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich sa� in der Kneipe und habe meine Meinung �ber K�nig, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu sp�t daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du M�nner die so ziemlich jedes m�gliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("St�rke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
