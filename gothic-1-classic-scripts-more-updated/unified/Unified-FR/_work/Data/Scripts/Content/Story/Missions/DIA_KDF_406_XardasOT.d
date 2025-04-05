//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
instance  Info_Xardas_OT (C_INFO)
{
	npc				= Kdf_406_OTXardas;
	condition		= Info_Xardas_OT_Condition;
	information		= Info_Xardas_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_Xardas_OT_Condition()
{	
	if (Npc_GetDistToWP(self, "TPL_331") < 1000)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OT_Info()
{
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Nous n'avons pas beaucoup de temps, alors �coute soigneusement !
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Comment as-tu fait....
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Le Dormeur n'est pas si loin. J'ai d� utiliser tous mes pouvoirs pour en arriver l�..
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //J'ai traduit les proph�ties des Orcs et j'ai d�couvert de quoi il en retournait au sujet des cinq coeurs.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Les coeurs des cinq pr�tres que tu as d�faits ont �t� plac�s dans cinq tombeaux.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Ces tombeaux peuvent �tre ouverts, mais seules les lames ancestrales port�es par les pr�tres peuvent endommager les coeurs.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //A pr�sent tu dois percer les coeurs avec les cinq lames. Ainsi par ta volont� sera amen� le Dormeur de ce monde.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //J'ai compris !
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //D�p�ches-toi, le r�veil du d�mon de l'Archimonde est imminent, et ce fou de Cor Kalom et ses faux disciples sont ici.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Ils sont rassembl�s dans la grande salle du Dormeur.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //J'ai suffisamment souffert. Personne ne peut plus m'arr�ter maintenant !
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //La puissance du Dormeur devient de plus en plus grande, je ne peux pas...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Quel est ton probl�me ?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Je... dois..

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Le temps est venu. Je dois �tre tout pr�s du lieu de repos du Dormeur. Xardas a soudainement apparu et m'a donn� des instructions pour le combattre. Les cinq coeurs des chamans Orc non morts sont dans des lieux saints, je dois les percer avec les cinq lames que j'ai sur moi. C'est la seule fa�on de d�truire le Dormeur. Cela � l'air simple...");
	
	AI_StopProcessInfos	(self);
};		
