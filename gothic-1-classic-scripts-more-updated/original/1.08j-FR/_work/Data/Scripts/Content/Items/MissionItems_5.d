//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
// Skizze des Orctempels
//---------------------------------------------------------------------

INSTANCE ItWrTemplemap(C_Item)
{
	name 				=	"Carte";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	30;

	visual 				=	"ItWr_Map_01.3DS";
	material 			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	UseTemplemap;

	description			= "Dessin du Temple";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

	FUNC VOID UseTemplemap()
	{
		var int nDocID;

		nDocID = 	Doc_CreateMap	()			  ;							// DocManager
//					Doc_SetLevel	( nDocID,	"ORCTEMPEL.ZEN" );		// Positionsanzeige funzt nicht!
					Doc_SetPages	( nDocID, 1 );
					Doc_SetPage 	( nDocID, 0, "Map_Temple.tga", 1	);  //  1 -> DO NOT SCALE
					Doc_Show		( nDocID 	);
	};


//---------------------------------------------------------------------
//	Alarmhorn der Orks
//---------------------------------------------------------------------
INSTANCE ItMiAlarmhorn (C_Item)
{
	name 				=	"Corne";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MISSION;

	value 				=	9;

	visual 				=	"ItMi_Alarmhorn_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"HORN";

	description			= name;
	//TEXT[0]			= "";
	////COUNT[0]		= ;
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Statuette f�r T�r zum Alten Tempel
//---------------------------------------------------------------------
INSTANCE ItMi_Stuff_Idol_Sleeper_01 (C_Item)
{
	name 				=	"Figurine";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Stuff_Idol_Sleeper_01.3DS";
	material 			=	MAT_CLAY;

	description			=	name;
	TEXT[0]				= "Cette image est un �tre";
	TEXT[1]				= "d�form� avec un masque.";
	TEXT[2]				= "Le masque est entour� par six gros dards.";
};

//---------------------------------------------------------------------
//	Schl�ferschwert 1
//---------------------------------------------------------------------
INSTANCE Weltenspalter (C_Item) 
{	
	name 				=	"D�voreur des Mondes";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Ceci �tait l'�p�e du pr�tre ";
	TEXT[1]				=	"Orc mort-vivant Varrag-Hashor.";
	TEXT[2]				=	"L'arme est devenue inutile avec";
	TEXT[3]				=	"le temps !";
	TEXT[4]				=	"Peut-�tre que l'�p�e peut �tre utilis�e";
	TEXT[5]				=	"d'une autre mani�re.";
};

//---------------------------------------------------------------------
//	Schl�ferschwert 2
//---------------------------------------------------------------------
INSTANCE Lichtbringer (C_Item) 
{	
	name 				=	"Lame de Lumi�re";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Ceci �tait l'�p�e du pr�tre ";
	TEXT[1]				=	"Pr�tre Orc Varrag-Kasorg.";
	TEXT[2]				=	"L'arme est devenue inutile avec";
	TEXT[3]				=	"le temps !";
	TEXT[4]				=	"Peut-�tre que l'�p�e peut �tre utilis�e";
	TEXT[5]				=	"d'une autre mani�re.";
};

//---------------------------------------------------------------------
//	Schl�ferschwert 3
//---------------------------------------------------------------------
INSTANCE Zeitenklinge (C_Item) 
{	
	name 				=	"Lame du Temps";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Ceci �tait l'�p�e du pr�tre ";
	TEXT[1]				=	"Pr�tre Orc Varrag-Unhilqt.";
	TEXT[2]				=	"L'arme est devenue inutile avec";
	TEXT[3]				=	"le temps !";
	TEXT[4]				=	"Peut-�tre que l'�p�e peut �tre utilis�e";
	TEXT[5]				=	"d'une autre mani�re.";
};

//---------------------------------------------------------------------
//	Schl�ferschwert 4
//---------------------------------------------------------------------
INSTANCE Daemonenstreich (C_Item) 
{	
	name 				=	"Frappe de D�mon";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Ceci �tait l'�p�e du pr�tre ";
	TEXT[1]				=	"Pr�tre Orc Varrag-Ruuushk.";
	TEXT[2]				=	"L'arme est devenue inutile avec";
	TEXT[3]				=	"le temps !";
	TEXT[4]				=	"Peut-�tre que l'�p�e peut �tre utilis�e";
	TEXT[5]				=	"d'une autre mani�re.";
};

//---------------------------------------------------------------------
//	Schl�ferschwert 5
//---------------------------------------------------------------------
INSTANCE Bannklinge (C_Item) 
{	
	name 				=	"Lame de Bannissement";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Ceci �tait l'�p�e du pr�tre ";
	TEXT[1]				=	"Grand Pr�tre Orc Grash-Varrag-Arushat.";
	TEXT[2]				=	"L'arme est devenue inutile avec";
	TEXT[3]				=	"le temps !";
	TEXT[4]				=	"Peut-�tre que l'�p�e peut �tre utilis�e";
	TEXT[5]				=	"d'une autre mani�re.";
};

//---------------------------------------------------------------------
//	Schwert f�r den Untoten Ork-Hohepriester (unidentifiziert)
//---------------------------------------------------------------------
INSTANCE Mythrilklinge (C_Item) 
{	
	name 				=	"�trange �p�e";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	10;
	damagetype			=	DAM_EDGE;
	range    			=  	160;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Une merveilleuse fabrication d'�p�e.";
	TEXT[1]				=	"D'anciennes runes ont �t� grav� dans la lame.";
	TEXT[2]				=	"Peut-�tre que Xardas peut d�chiffrer ces runes !";
	TEXT[3]				=	"Je ne devrais pas l'utiliser avant qu'il l'ait identifi�.";
//	TEXT[4]				=	"lege ich es besser nicht an.";
};

//---------------------------------------------------------------------
//	Schwert f�r den Untoten Ork-Hohepriester (identifiziert)
//---------------------------------------------------------------------
instance Mythrilklinge01 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Xardas a dit que l'�p�e s'appelle URIZIEL, elle est";
	TEXT[1]				=	"suppos�e �tre ancienne. Elle avait de tr�s puissants";
	TEXT[2]				=	"pouvoirs avant, mais elle a perdu sa magie.";

	TEXT[3]				=	NAME_Damage;				COUNT[3] =	damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[4] =	cond_value[2];
	TEXT[5]				=	NAME_Value;					COUNT[5] =	value;
};

//---------------------------------------------------------------------
//	Schwert f�r den Untoten Ork-Hohepriester (aufgeladen)
//---------------------------------------------------------------------
instance Mythrilklinge02 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	10000;

//	damageType				=	DAM_EDGE|DAM_FIRE|DAM_MAGIC;//Templer sollten sofort tot sein
	damageType				=	DAM_FIRE|DAM_MAGIC;
//	damageType				=	DAM_MAGIC;
//	damage[DAM_INDEX_EDGE]	=	  1;						//Templer sollten sofort tot sein
	damage[DAM_INDEX_FIRE]	=	 30;
	damage[DAM_INDEX_MAGIC]	=	120;
	//damage[DAM_INDEX_MAGIC]	=	150;

	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_02.3DS";
	description			= 	name;
	TEXT[0]				=	"Voici l'�p�e Uriziel.";
	TEXT[1]				= 	"Uriziel est magiquement charg�e.";
	TEXT[2]				=	NAME_Dam_Magic;			COUNT[2]	=	damage[DAM_INDEX_MAGIC];
	TEXT[3]				=	NAME_Dam_Fire;			COUNT[3]	=	damage[DAM_INDEX_FIRE];
	TEXT[4] 			=	NAME_Str_needed;		COUNT[4]	=	cond_value[2];
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};

//---------------------------------------------------------------------
//	URIZIEL, mit entferntem Stein
//---------------------------------------------------------------------
instance Mythrilklinge03 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"La gemme magique a �t� retir� de la ";
	TEXT[1]				=	"lame. C'est toujours une arme excellente, mais elle a";
	TEXT[2]				=	"perdu ses pouvoirs magiques.";
	TEXT[3]				=	NAME_Damage;				COUNT[3] =	damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[4] =	cond_value[2];
	TEXT[5]				=	NAME_Value;					COUNT[5] =	value;
};

//---------------------------------------------------------------------
//	Schriftrolle, um Schwert f�r den untoten Ork-Hohepriester zu laden
//---------------------------------------------------------------------
INSTANCE Scroll4Milten (C_Item)
{	
	name 				=	"Transfert de Pouvoir";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	15;

	visual 				=	"ItWrScroll.3DS";
	material 			=	MAT_LEATHER;

//	scemeName			=	"MAP";
	description			= name;
	TEXT[0]				= "Sortil�ge pour transf�rer les pouvoirs";
	TEXT[1]				= "magiques � Uriziel.";
 	TEXT[2]				= "Je ne peux pas l'utiliser.";
};

//---------------------------------------------------------------------
//	Schl�ssel zum Versunkenen Turm
//---------------------------------------------------------------------
INSTANCE ItKe_SunkenTower(C_Item)
{
	name 				=	"Cl�";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[0]				=	"Ouvre la porte dans la";
	TEXT[1]				=	"tour submerg�e.";
};

//---------------------------------------------------------------------
//	Kerkerschl�ssel
//---------------------------------------------------------------------
INSTANCE DungeonKey(C_Item)
{
	name 				=	"Cl� de Donjon";

	mainflag 				=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;

	description			= name;
	TEXT[0]				= "Ouvre les donjons ";
	TEXT[0]				= "du Vieux Camp.";
};


//---------------------------------------------------------------------
//	Destroyer Rune (geladen)
//---------------------------------------------------------------------
INSTANCE UrizielRune (C_Item)
{
	name 				=	"Vague de Mort de URIZIEL";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	10000;

	visual				=	"ItAr_Rune_14.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MASSDEATH;
	mag_circle 			=	6;

	description			=	name;
	TEXT	[0]			=	"Cette puissante rune magique contient";
	TEXT	[1]			=	"les anciens pouvoirs de l'�p�e URIZIEL.";
	TEXT	[2]			=	NAME_Mag_Circle;			COUNT	[2]		=	mag_circle;
	TEXT	[3]			=	NAME_Manakosten;			COUNT	[3]		=	SPL_SENDCAST_MASSDEATH;
	TEXT	[4]			=	NAME_Dam_Magic;				COUNT	[4]		=	SPL_DAMAGE_MASSDEATH;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};
