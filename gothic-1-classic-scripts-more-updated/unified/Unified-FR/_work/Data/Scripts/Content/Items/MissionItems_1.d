//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

INSTANCE MordragsRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_MordragsRing;
	on_unequip				=	UnEquip_MordragsRing;

	description		= "Anneau de Mordrag";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_MordragsRing()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5 );
	};


	FUNC VOID UnEquip_MordragsRing()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-5 );
	};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE SpecialJoint(C_Item)
{
	name 				=	"Pr�paration de l'Appel du R�ve";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint3*10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			=	UseSpecialJoint;

	TEXT[0]		    	= "Herbe des Marais avec un plus gros";
	TEXT[1]             = "effet que l'Herbe normal.";
	TEXT[3]             = "Pour le Sage Baal-Tyon !";
	TEXT[5]				= NAME_Value;					COUNT[4]	= Value_Joint3*10;
};

func void UseSpecialJoint()
{
	AI_StartState	(self,ZS_MagicSleep,1,"");
};

INSTANCE ItAt_DamLurker_01 (C_Item)
{
	name 				=	"Griffe de Tapir de digue";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Lurkerklaue;

	visual 				=	"ItAt_Lurker_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Lurkerklaue*2;
};


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE ItWrOMMap(C_Item)
{	
	name 					=	"Carte";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	30;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOMmap;

	description				= "Carte de la vieille Mine";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseOMmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_OldMine.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};



/************************************************
**  Missionsitems f�r Introparcours in der VM  **
************************************************/

INSTANCE AltesSchwertVM (C_Item)
{	
	name 				=	"Vieille �p�e";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	12;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	10 ;
	damageTotal			= 	12;
	damagetype 			=	DAM_EDGE;		
	visual 				=	"ItMw_1H_Sword_Old_01.3DS";

	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]				= NAME_Damage;
	COUNT[2]			= damageTotal;
	TEXT[3] 			= NAME_Str_needed;
	COUNT[3]			= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};


INSTANCE AltesSchwert (C_Item)
{	
	name 				=	"Vieille �p�e";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	12;
	cond_atr[2]   		= ATR_STRENGTH;
	cond_value[2]  		= 10;
	damageTotal			= 	12;
	damagetype 			=	DAM_EDGE;		
	visual 				=	"ItMw_1H_Sword_Old_01.3DS";
	//description			= "";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]				= NAME_Damage;
	COUNT[2]			= damageTotal;
	TEXT[3] 			= NAME_Str_needed;
	COUNT[3]			= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/************************************************
**               Sit_1_OC_Dexter_SellSword     **
************************************************/

INSTANCE JackalsSword (C_Item)
{	
	name 				=	"�p�e de Jackal";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;
	owner				= 	GRD_201_Jackal;

	value 				=	27;
	cond_atr[2]   		= ATR_STRENGTH;
	cond_value[2]  		= 20;
	damageTotal			= 	3;
	damagetype 			=	DAM_EDGE;		
	visual 				=	"ItMw_1H_Sword_Short_05.3DS";

	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]				= NAME_Damage;
	COUNT[2]			= damageTotal;
	TEXT[3] 			= NAME_Str_needed;
	COUNT[3]			= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/****************************************************
**  			KdW-Botenamulett				   **
****************************************************/

instance  KdW_Amulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	100;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	//on_equip		=	Equip_Schutzamulett_Nek;
	//on_unequip	=	UnEquip_Schutzamulett_Nek;

	description		= "Amulette de messager des Magiciens de l'Eau";
	//TEXT[0]			= "";
	//TEXT[2]			= NAME_Prot_Edge;
	//COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

//************* Cronos Brief *****************

INSTANCE Cronos_Brief (C_Item)
{	
	name 				=	"Lettre";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseCronosBrief;
	scemeName			=	"MAP";
	description			= "Lettre de Cronos pour les Magiciens du Feu ";
};
func void UseCronosBrief ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0," ");
					Doc_PrintLine	( nDocID,  0,"V�n�rable Maitre Corristo,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0,"Saturas, grand ma�tre estim� des Magiciens du Cercle de l'Eau, t'implore de nous aider � assurer les relations entre le Vieux et le Nouveau Camp pour qu'elles restent un lien profitable aux deux parties. Depuis que tu es responsable de la s�curit� de l'exp�dition mensuelle de minerai pour le Roi, ce sera s�rement dans le meilleurs de tes int�r�ts de r�primer les activit�s des bandits du Nouveau Camp. En outre, il est de notre souhait que le Vieux Camp n'emp�che plus nos efforts de la r�ouverture de la Barri�re Magique qui nous emprisonne tous.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"J'attends avec ferveur ta plus h�tive r�ponse,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"            Cronos, Gardien du Minerai");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/****************************************************
**  	 SLY: LOST NEK (Neks Amulett)			   **
****************************************************/

instance  Neks_Amulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	50;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Nek;
	on_unequip		=	UnEquip_Schutzamulett_Nek;

	description		= "Amulette du Garde Mort"; //Nek's Amulett
	TEXT[1]			= "Il est �crit NEK au revers.";
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Nek()
	{
		self.protection [PROT_EDGE] += 5;
		self.protection [PROT_BLUNT] += 5;
	};


	FUNC VOID UnEquip_Schutzamulett_Nek()
	{
		self.protection [PROT_EDGE] -= 5;
		self.protection [PROT_BLUNT] -= 5;
	};

/*************************************************
**	Missionsitems f�r Mis_1_Psi_RecruitBuddler  **
*************************************************/
INSTANCE RecruitJoint(C_Item)
{	
	name 					=	"Herbe des Marais pour Mineurs";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MULTI;	

	hp 				 		=	10;
	hp_max 					=	10;
	weight 					=	1;
	value 					=	1;

	visual 					=	"ItMiJoint.3ds";
	material 				=	MAT_WOOD;

	scemeName				=	"JOINT";
	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/**************************************************
**    Missionsitems f�r Mis_3_Psi_BringMedicine  **
**************************************************/

INSTANCE HealthWater(C_Item)
{
	name 					=	"Potion de soin pour Y'B�rion";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;

	//hp 					=	1;
	//hp_max 				=	1;
	//weight 				=	1;
	value 					=	10;	

	//change_atr[0]				=	ATR_HITPOINTS;
	//change_value[0] 			=	5;

	visual 					=	"ItFo_Potion_Health_01.3ds";
	material 				=	MAT_GLAS;
	//on_state[0]				=	UseAlcohol;
	//scemeName				=	"POTION";
	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/************************************************
**    Missionsitems f�r Mis_1_OC_BringList     **
************************************************/
INSTANCE TheList(C_Item)
{	
	name 					=	"Liste";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseTheList;
	description				=	name;

	TEXT[0]					=	"Ian, le Patron de la Vieille Mine, a";
	TEXT[1]					=	"list� leurs demandes.";
};
func void UseTheList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0,"Liste des demandes");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0,"20 morceaux de pain - pas ranci cette fois !");
					Doc_PrintLine	( nDocID,  0,"25 - 30  pommes");
					Doc_PrintLine	( nDocID,  0,"10 morceaux de fromage");
					Doc_PrintLine	( nDocID,  0,"1 louche");
					Doc_PrintLine	( nDocID,  0,"1 brosse");
					Doc_PrintLine	( nDocID,  0,"5 pioches + 3 marteaux");
					Doc_PrintLines	( nDocID,  0,"Et un g�n�reux tas d'Herbe - tu sais, premi�re exp�dition du mois ! ");
					Doc_PrintLine	( nDocID,  0,"Nous attendons la livraison pour apr�s-demain.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"IAN");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

INSTANCE TheListNC(C_Item)
{	
	name 					=	"Liste (rajout)";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseTheListNC;
	description				=	name;

	TEXT[0]					=	"Ian, le patron de la Vieille Mine, a list�";
	TEXT[1]					=	"leurs attentes.";
	TEXT[2]					=	"(Lares a rajout� quelques points. Une tr�s ";
	TEXT[3]					=	"bonne contrefa�on !)";
};
func void UseTheListNC ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0,"Liste des demandes");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0,"20 morceaux de pain - pas ranci cette fois !");
					Doc_PrintLine	( nDocID,  0,"25 - 30  pommes");
					Doc_PrintLine	( nDocID,  0,"10 morceaux de fromage");
					Doc_PrintLine	( nDocID,  0,"1 louche");
					Doc_PrintLine	( nDocID,  0,"1 brosse");
					Doc_PrintLine	( nDocID,  0,"5 pioches + 3 marteaux");
					Doc_PrintLines	( nDocID,  0,"Et un g�n�reux tas d'Herbe - tu sais, premi�re exp�dition du mois ! ");
					Doc_PrintLine	( nDocID,  0,"Nous attendons la livraison pour apr�s-demain.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"IAN");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"Je viens juste de me rappel�:");
					Doc_PrintLine	( nDocID,  0,"30 bouteilles de bi�re");
					Doc_PrintLine	( nDocID,  0,"5 bouteilles de vin");
					Doc_PrintLine	( nDocID,  0,"25 brochettes grill�s de charognard");
					Doc_PrintLine	( nDocID,  0,"Une demi-douzaine d'armes de remplacement");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};


/*********************************************
**   Missionsitems f�r Lares Find Ring    **
*********************************************/

INSTANCE Lares_Ring(C_Item)
{	
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING || ITEM_MISSION ;	

	value 					=	50;
	
	visual 					=	"ItMi_Ring_01.3ds";
	
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Lares_Ring;
	on_unequip				=	UnEquip_Lares_Ring;
	description		= "L'anneau de Lares";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= ""; 
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Lares_Ring()
	{

		Npc_ChangeAttribute(self,ATR_STRENGTH,3 );
	};

	
	FUNC VOID UnEquip_Lares_Ring()
	{

		Npc_ChangeAttribute(self,ATR_STRENGTH,-3 );
	};
/*********************************************
**   Missionsitems f�r Lares Get Potion   **
*********************************************/
INSTANCE  Heiltrank(C_Item)
{
	name 			        =	NAME_Trank;

	mainflag 				=	ITEM_KAT_POTIONS;
	flags 					=	ITEM_MULTI||ITEM_MISSION;

	value 					=	100;	

	visual 					=	"ItFo_Potion_Health_01.3ds";
	material 				=	MAT_GLAS;
	on_state[0]				=	UseHeiltrank;
	scemeName				=	"POTION";
	description				= "Une Potion de soin rapide";
	//TEXT[0]				= "";
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= 30;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	TEXT[5]					= NAME_Value; 
	COUNT[5]		= value;
};

FUNC VOID UseHeiltrank()
{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,ATR_HITPOINTS,30);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke meinen Heiltrank");
	
};

/*********************************************
**   Missionsitems f�r Mordrag    **
*********************************************/

INSTANCE SpecialWater(C_Item)
{
	name 					=	"Eau Magique";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MISSION;

	value 					=	10;	

	//change_atr[0]				=	ATR_HITPOINTS;
	//change_value[0] 			=	5;

	visual 					=	"ItFoFlaskHealth.3ds";
	material 				=	MAT_GLAS;
	//on_state[0]				=	UseSpecialWater;
	scemeName				=	"POTION";

	description				= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/*********************************************
**   Missionsitems f�r Dexter / Kalom	    **
*********************************************/
INSTANCE KalomsRecipe(C_Item)
{
	name 					=	"Recette de Kalom";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= name;
	TEXT[0]					= "La recette pour une potion de soin.";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			= Use_KalomsRecipe;
};
// ----------------------------------
func VOID Use_KalomsRecipe()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

				Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
				Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
				
				//1.Seite

				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
				Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
				Doc_PrintLine	( nDocID,  0, ""									);
				Doc_PrintLine	( nDocID,  0,"Lifrun ak Gharak"); 		
				Doc_PrintLine	( nDocID,  0, ""									); 			
				Doc_PrintLines	( nDocID,  0,"Gharak Or Nach bin thu. Lifrun mar Orag chtah. Shrunk esp Horinth.");
				
				//2.Seite

				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1, ""					);					
				Doc_PrintLines	( nDocID,  1,"Cela semble avoir un sens lu � l'envers.");
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1,"          - Kalom");	
				
				
				
				
				Doc_Show		( nDocID );
};


/*********************************************
** Missionsitems f�r Mis_1_PSI_DrugMonopol  **
*********************************************/
/*
INSTANCE SalmAmulett (C_Item)
{	
	name 					=	"Salms Amulett";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	hp 				 		=	1;
	hp_max 					=	1;
	weight 					=	1;
	value 					=	1;
	
	visual 					=	"ItKeKey1.3ds"; //Dummie Objekt
	material 				=	MAT_METAL;

	//scemeName				=	"HORN";
};
*/


/*********************************************
**   Karte der Kolonie (ohne Orc-Gebiet)	**
*********************************************/

INSTANCE ItWrWorldmap(C_Item)
{	
	name 					=	"Carte de la Colonie";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmap;

	description				= name;
	TEXT[0]					= "Malheureusement, un gros territoire dans le";
	TEXT[1]					= "sud-ouest est manquant.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World.tga", 	1	);  //  1 -> DO NOT SCALE 

/*  				Doc_SetFont 	( nDocID, 0, "font_15_book.TGA"		); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, 0, 120, 80, 10, 10, 	1	);  //  0 -> Textrahmen (von den R�nder des TGAs aus, links-oben,rechts-unten)
					Doc_PrintLine	( nDocID, 0, "Karte der"	);
					Doc_PrintLine	( nDocID, 0, "Kolonie"	);

// FIXME: mehrere Texte an verschiedenen Stellen f�r Location-Beschriftung funzen nicht.
 					Doc_SetFont 	( nDocID, 0, "font_10_book.TGA"			); 
					Doc_SetMargins	( nDocID, 0, 110, 300, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Neues Lager");

					Doc_SetMargins	( nDocID, 0, 350, 200, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Altes Lager");

					Doc_SetMargins	( nDocID, 0, 200, 420, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "D�monenbeschw�rer");
					
					Doc_SetMargins	( nDocID, 0, 510, 340, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Sekten-Lager");
*/

					Doc_Show		( nDocID 	);
	};

/*********************************************
**   Karte Altes Lager						**
*********************************************/

INSTANCE ItWrOCmap(C_Item)
{	
	name 					=	"Carte";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOCmap;

	description				= "Plan du Vieux Camp";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseOCmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger m�glich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_OldCamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/*********************************************
**   Karte Neues Lager						**
*********************************************/

INSTANCE ItWrNCmap(C_Item)
{	
	name 					=	"Carte";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseNCmap;

	description				= "Plan du Nouveau Camp";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseNCmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger m�glich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_NewCamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/*********************************************
**   Karte PSI-Lager						**
*********************************************/

INSTANCE ItWrPSImap(C_Item)
{	
	name 					=	"Carte";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePSImap;

	description				= "Plan du Camp Mar�cageux";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UsePSImap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger m�glich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_PSICamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/*********************************************
**   PinUp Zeichnung						**
*********************************************/

INSTANCE ItWrPinup(C_Item)
{	
	name 					=	"Esquisse";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	60;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePinUp;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UsePinUp()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger m�glich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_PinUp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/********************************************************************************/
INSTANCE ItWrDieVerurteilten (C_Item)
{	
	name 					=	"Les prisonniers";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWrBook.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};


/********************************************************************************/
//				BRIEF AN FEUERMAGIER
/*********************************************************************************/
INSTANCE ItWr_Fire_Letter_01 (C_Item)
{	
	name 				=	"Lettre scell�e";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFireletter;
	scemeName			=	"MAPSEALED";
	description			= "Lettre pour les Magiciens du Feu ";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	TEXT[1]				= "Le scell� ne doit pas �tre bris� !";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};
func void Usefireletter ()
{   
		
		CreateInvItem     (hero,ItWr_Fire_Letter_02);
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0," ");
					Doc_PrintLine	( nDocID,  0,"V�n�rable Maitre,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Ta derni�re missive a �t� re�u avec grande anxi�t�. Nous avons r�fl�chi � l'affaire et avons r�pondu dans cette lettre. La Confr�rie est dangereuse. Elle met en danger nos arrangements de troc, met en danger le Roi, le royaume entier et ta propre vie. Par cons�quent, tu dois envoyer des espions pour d�terminer de quels dieux et de quels savoirs leurs pouvoirs magique sont d�riv�s. Une fois ceci d�couvert, nous informerons les pr�tres de nos d�couvertes, dans l'espoir de mettre fin � toute cette affaire en combinant nos efforts. Pour le moment, les scribes �tudient les anciens livres. Nous te reporterons nos trouvailles une fois faite, utilisant le moyen de communication habituel."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"Que Innos nous prot�ge tous");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
					//Doc_PrintLine	( nDocID,  0, "Rigaldo Marschall des K�nigs"					);
					Doc_Show		( nDocID );
		
		
	};
/********************************************************************************/
INSTANCE ItWr_Fire_Letter_02 (C_Item)
{	
	name 				=	"Lettre Ouverte";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFireletter2;
	scemeName			=	"MAP";
	description			= "Lettre pour les Magiciens du Feu ";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void Usefireletter2 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0," ");
					Doc_PrintLine	( nDocID,  0,"V�n�rable Maitre Xardas,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Ta derni�re missive a �t� re�u avec grande anxi�t�. Nous avons r�fl�chi � l'affaire et avons r�pondu dans cette lettre. La Confr�rie est dangereuse. Elle met en danger nos arrangements de troc, et met en danger le Roi, le royaume entier et ta propre vie. Par cons�quent, tu dois envoyer des espions pour d�terminer de quels dieux et de quels savoirs leurs pouvoirs magique sont d�riv�s. Il est de notre devoir de d�manteler la secte et acqu�rir leur savoir pour pr�venir toute personne de l'utiliser pour des actes mal�fiques. Une fois ceci fait, nous informerons les pr�tres d'Innos de tes d�couvertes. Pour le moment, les scribes �tudient les anciens livres. Nous te reporterons nos trouvailles une fois faite, utilisant le moyen de communication habituel."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"Que Innos nous prot�ge tous");
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des K�nigs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/********************************************************************************/
//SCHL�SSEL 
/*********************************************************************************/
//GOMEZ SCHL�SSEL
INSTANCE ItKe_Gomez_01(C_Item)
{	
	name 					=	"Bol de Gomez";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Coffres de Gomez ouverts.";
	////COUNT[0]			= ;
	TEXT[1]				= "Ouvre les r�serves dans le cellier du Baron du minerai.";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/*********************************************************************************/
//RICELORDS SCHL�SSEL
INSTANCE ItKey_RB_01(C_Item)
{	
	name 				=	"Bol du Seigneur du Riz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Coffre ouvert du Seigneur du Riz.";
};
/*********************************************************************************/
//SCHMIEDESCHL�SSEL ERZBARONE
INSTANCE ItKe_OB_Smith_01(C_Item)
{	
	name 					=	"Cl� en Fer";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_02.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Ouvre la porte de la r�serve de la forge.";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};
/*********************************************************************************/
// 
INSTANCE ItKe_Storage_01(C_Item)
{	
	name 					=	"Cl� de la r�serve";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Ouvre la porte principale de la r�serve";
	////COUNT[0]			= ;
	TEXT[1]				= "Dans le cellier du Baron du minerai.";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/********************************************************/
//			SCHL�SSEL IN DER ALTEN MINE
/********************************************************/

/********************************************************/
INSTANCE ItKe_OM_01(C_Item)
{	
	name 				=	"Cl� de coffre";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "La r�serve de Santino.";
	TEXT[1]				= "Endroit de change sup�rieur.";
	TEXT[2]				= "Vieille Mine";
};
/********************************************************/
INSTANCE ItKe_OM_02(C_Item)
{	
	name 				=	"Cl� de coffre";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Ouvre le coffre de Aaron";
	TEXT[1]				= "dans la Vieille Mine.";
};

/********************************************************/
INSTANCE ItKe_OM_03(C_Item)
{	
	name 				=	"Cl� de coffre";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Ouvre les coffres dans";
	TEXT[1]             = "la remise de la r�serve de la Vieille Mine.";
};

/********************************************************/
INSTANCE ItKe_OM_04(C_Item)
{	
	name 				=	"Cl� de coffre";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "La r�serve de Alberto.";
	TEXT[1]				= "Endroit de change inf�rieur.";
};

/********************************GESCHENK VON IAN *********************************************/
INSTANCE ItFo_OM_Beer_01(C_Item)
{
	name 					=	"Bi�re forte";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;
	
	value 					=	30;	

	visual 					=	"ItFo_Beer_01.3ds";
	material 				=	MAT_GLAS;
	on_state[0]				=	UseStarkBeer;
	scemeName				=	"POTION";
	description			= name;
	TEXT[0]				= NAME_Bonus_HP;
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "Bonus";
	COUNT[0]			= 6;
	TEXT[3] 			= "";
	//COUNT[3]			= ;
	TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

	FUNC VOID UseStarkBeer()
	{
		Npc_ChangeAttribute	(self,ATR_HITPOINTS,6);
	};




//***********************************************************************************************************
//**								Das R�tsel des Nebelturms			Bj�rn							   **
//***********************************************************************************************************

//*******Effekt nur beim ersten benutzen des Buches

var int riddle1;
var int riddle2;
var int riddle3;
var int riddle4;
var int riddle5;
var int riddle6;

INSTANCE theriddle1(C_Item)
{	
	name 					=	"Vieux Livre";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle1;
};

	FUNC VOID Usetheriddle1()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Celui qui veut renoncer � toute d�pravation et cherche le chemin de la Justice, saura o� la source de mon pouvoir est cach�e. Il pourra alors l'utiliser pour briser les cha�nes de ce monde et prouvera sa valeur pour recevoir le Chromanin.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Le sage cherche � avoir une vue d'ensemble avant de se d�dier � sa prochaine mission.");
					Doc_Show		( nDocID );
				
					if (riddle1 == FALSE)
					{
						Log_CreateTopic		(theriddle_log,		LOG_MISSION);
						Log_SetTopicStatus	(theriddle_log,		LOG_RUNNING);
						B_LogEntry			(theriddle_log,		"J'ai pris un tr�s �trange tome du Mage Squelette dans la Tour Embrum�e. Le Chromanin ! Cela semble �tre une �nigme, un myst�rieux �tranger arrive dans ce monde : ... Le sage cherche � avoir une vue d'ensemble avant de se d�dier � sa prochaine mission... Mmmh ! Je ne comprend pas encore, mais peut-�tre qu'avec le temps..."); 
						Wld_InsertItem			(theriddle2,"CASTLE_TOWER_TOP");
					
						riddle1 = TRUE;
					
					};
	};

INSTANCE theriddle2(C_Item)
{	
	name 					=	"Vieux Livre";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 2";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle2;
};

	FUNC VOID Usetheriddle2()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Port�es par les brumes du temps, les visions du Chromanin ont ouvert mes yeux. Aucun prix ne peut �tre assez �lev� pour m'y faire � jamais renoncer, car elles ont touch� mon coeur trop sensiblement.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Ceux qui �tait divis� sera r�uni, apr�s avoir �t� intens�ment s�par� pendant une courte p�riode.");
					Doc_Show		( nDocID );
					
					if (riddle2 == FALSE)
					{					
						B_GiveXP (300);
						B_LogEntry			(theriddle_log,		"J'ai trouv� un second livre nomm� Chromanin. C'est encore une �nigme pour moi... Ceux qui �tait divis� sera r�uni, apr�s avoir �t� intens�ment s�par� pendant une courte p�riode... "); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
					
						riddle2  =  TRUE;
					
					};
	
	};
INSTANCE theriddle3(C_Item)
{	
	name 					=	"Vieux Livre";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 3";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle3;
};

	FUNC VOID Usetheriddle3()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Oh, Dieux Anciens. Comment un homme tel que moi, simple et indigne, peut recevoir un tel h�ritage. Je ressens une immense peur de tout perdre � nouveau par une fr�le h�sitation dans mes mots ou mes actes.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Le sage p�cheur essaye occasionnellement de tenter sa chance de l'autre c�t� du lac.");
					Doc_Show		( nDocID );



					if (riddle3 == FALSE)
					{		
						B_GiveXP (500);
						B_LogEntry			(theriddle_log,		"J'ai trouv� le troisi�me livre. Je crois que je commence � comprendre son fonctionnement ! ...Le sage p�cheur essaye occasionnellement de tenter sa chance de l'autre c�t� du lac..."); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
						
						riddle3   =  TRUE;
					
					};
					
					
	};
				
				
INSTANCE theriddle4(C_Item)
{	
	name 					=	"Vieux Livre";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 4";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle4;
};

	FUNC VOID Usetheriddle4()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Je n'ose esp�rer �tre en pr�sence de Chromanin un jour. disparu est le jour du gaspillage et de la lamentation. Trop facile est l'ach�vement de l'absolue perfection. Je n'en suis pas loin !");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Longtemps oubli�s sont les actes de ceux qui �taient � bord, une fois.");
					Doc_Show		( nDocID );
					

					if (riddle4 == FALSE)
					{					
						B_GiveXP (700);
						B_LogEntry			(theriddle_log,		"Num�ro quatre. Je commence � me demander si ce gars ne se fiche pas de moi ! ...Longtemps oubli�s sont les actes de ceux qui �taient � bord, une fois..."); 
						Snd_Play 		("FoundRiddlersBook");					
						Wld_InsertItem			(theriddle5,"LOCATION_25_01");
					
					
						riddle4 = TRUE;
					
					};
					
					
					
	};
								
INSTANCE theriddle5(C_Item)
{	
	name 					=	"Vieux Livre";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 5";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle5;
};

	FUNC VOID Usetheriddle5()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Mais je dois emprunter ce chemin seul. Cet honneur est mien. Je dois accepter de partager le pouvoir � l'int�rieur de moi avec ceux qui viennent me trouver. J'esp�re qu'ils viendront bient�t...");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Tu me trouvera o� tout a commenc�.");
					Doc_Show		( nDocID );




					if (riddle5 == FALSE)
					{
						B_GiveXP (850);
						B_LogEntry			(theriddle_log,		"Celui-ci semble �tre le dernier. Je suis impatient de trouver qui ou quoi je vais rencontrer... Tu me trouvera o� tout a commenc�..."); 
						Snd_Play 		("FoundRiddlersBook");				
						Wld_InsertNpc				(Bau_940_Riddler,"");
						var C_NPC riddler; riddler = Hlp_GetNpc(Bau_940_Riddler);
						Npc_ChangeAttribute	(riddler, ATR_HITPOINTS, -riddler.attribute[ATR_HITPOINTS_MAX]);

						riddle5  =  TRUE;
					
					};
	};

INSTANCE theriddle6(C_Item)
{	
	name 					=	"Vieux Livre";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 6";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle6;
};

	FUNC VOID Usetheriddle6()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");
				
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );

					if (riddle6 == FALSE)
					{

						B_GiveXP (1000);
						B_LogEntry			(theriddle_log,		"Le myst�rieux �tranger est mort. Ces d�mons l'ont tu�. Il semble y avoir un esp�ce de lien entre lui et ces cr�atures de l'enfer. Autrement, il ne serait pas revenu � cet endroit. Il a emport� le secret qu'il voulait apparemment partager dans sa tombe."); 
						Log_SetTopicStatus	(theriddle_log,		LOG_SUCCESS);
						Snd_Play 		("FoundRiddler");					
						Wld_InsertNpc	(SkeletonMage,		"OW_FOGDUNGEON_36_MOVEMENT");
						Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_36_MOVEMENT"); 
						Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_36_MOVEMENT"); 
						Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_36_MOVEMENT2"); 
						Wld_InsertNpc	(SkeletonScout,		"OW_FOGDUNGEON_36_MOVEMENT2");
						Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_37"); 
						Wld_InsertNpc	(SkeletonMage,		"OW_FOGDUNGEON_37");
						
						riddle6 = TRUE;
					
					};
	};
															
