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

	description		= "������ ��������";
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
	name 				=	"���������� ��� �����";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint3*10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			=	UseSpecialJoint;

	TEXT[0]		    	= "���� �������� ���������";
	TEXT[1]             = "������� �������, ��� ������� '��� �����'.";
	TEXT[3]             = "�� ����������� ��� ���� ����� �����!";
	TEXT[5]				= NAME_Value;					COUNT[4]	= Value_Joint3*10;
};

func void UseSpecialJoint()
{
	AI_StartState	(self,ZS_MagicSleep,1,"");
};

INSTANCE ItAt_DamLurker_01 (C_Item)
{
	name 				=	"����� �����";

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
	name 					=	"�����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	30;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOMmap;

	description				= "����� ������ � ������ �����";
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
	name 				=	"������ ���";

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
	name 				=	"������ ���";

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
	name 				=	"��� ������";

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

	description		= "������ ���������� ����� ����";
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
	name 				=	"������";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseCronosBrief;
	scemeName			=	"MAP";
	description			= "������ ������� � ����� ����";
};
func void UseCronosBrief ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "������� ������ ��������,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "�������, ��������� ������ ����� ����� ����, ������ ��� �� �������� ��� � ���������. � �������� �������, ��� �� ���������� ���� ���������� ���������� ����������� ������������ ����� ������� ������� � ������ ������� � ���������� ������. ��� ��� �� ���������� � ��������� ����, �� ����� ���������� ������������ ����� ������ ������, �������� � ����� ���������. ������� ��� ��� � ��� ��� ����� �����, ���� ������ ������ �� ����� �������������� ������������� ������ �����."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "��� ������ ������� ������."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "������, ��������� ����.");
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

	description		= "������ ������� ���������"; //Nek's Amulett
	TEXT[1]			= "�� �������� ������� ������� ������ ��� '���'";
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
	name 					=	"�������� ��� ���������";
	
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
	name 					=	"�������� ����� ��� ��������";

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
	name 					=	"������";

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

	TEXT[0]					=	"��, ����� ������ �����, ����� � ���� ������";
	TEXT[1]					=	"��� ����������� ��� ������ ���������.";
};
func void UseTheList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "������"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "20 ������� ����� - �� ��������������!"					);
					Doc_PrintLine	( nDocID,  0, "25-30 �����"	);
					Doc_PrintLine	( nDocID,  0, "10 ������ ����"					);
					Doc_PrintLine	( nDocID,  0, "1 ������"					);
					Doc_PrintLine	( nDocID,  0, "1 �����"					);
					Doc_PrintLine	( nDocID,  0, "5 ����� + 3 �������"					);
					Doc_PrintLines	( nDocID,  0, "� ����� ��������� - ��� �� ������ ���� �� ���� �����!"					);
					Doc_PrintLine	( nDocID,  0, "���� ������ ���� ��������� �����������."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "��"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

INSTANCE TheListNC(C_Item)
{	
	name 					=	"������ (�����������)";

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

	TEXT[0]					=	"��, ����� ������ �����, ����� � ���� ������";
	TEXT[1]					=	"��� ����������� ��� ������ ���������.";
	TEXT[2]					=	"(���� ������� � ���� ��� ��������� �������.";
	TEXT[3]					=	"�������� �������� ��������!)";
};
func void UseTheListNC ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "������"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "20 ������� ����� - �� ��������������!"					);
					Doc_PrintLine	( nDocID,  0, "25-30 �����"	);
					Doc_PrintLine	( nDocID,  0, "10 ������ ����"					);
					Doc_PrintLine	( nDocID,  0, "1 ������"					);
					Doc_PrintLine	( nDocID,  0, "1 �����"					);
					Doc_PrintLine	( nDocID,  0, "5 ����� + 3 �������"					);
					Doc_PrintLines	( nDocID,  0, "� ����� ��������� - ��� �� ������ ���� �� ���� �����!"					);
					Doc_PrintLine	( nDocID,  0, "���� ������ ���� ��������� �����������."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "��"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "��, ���� ���-��� ���..."					);
					Doc_PrintLine	( nDocID,  0, "30 ������� ����"					);
					Doc_PrintLine	( nDocID,  0, "5 ������� ����"					);
					Doc_PrintLine	( nDocID,  0, "25 ������� ��������"					);
					Doc_PrintLine	( nDocID,  0, "��������� �����"					);
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
	description		= "������ �����";
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
	description				= "����� �������� �������";
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
		PrintDebugNpc 		(PD_ITEM_MOBSI, "� ����� �������� �����.");
	
};

/*********************************************
**   Missionsitems f�r Mordrag    **
*********************************************/

INSTANCE SpecialWater(C_Item)
{
	name 					=	"��������� ����";

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
	name 					=	"������ ������";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= name;
	TEXT[0]					= "������ ��������� �����";
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
				Doc_PrintLine	( nDocID,  0, "������ �� �����"					); 		
				Doc_PrintLine	( nDocID,  0, ""									); 			
				Doc_PrintLines	( nDocID,  0, "����� �� ��� ��� ��. ������ ��� ���� ����. ����� ��� ������.");
				
				//2.Seite

				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1, ""					);					
				Doc_PrintLines	( nDocID,  1, "������ �����, ��� ����� ��������� ��������.");
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1, "- �����"	);	
				
				
				
				
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
	name 					=	"����� �������";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmap;

	description				= name;
	TEXT[0]					= "� ���������, ����� �� ������� �������";
	TEXT[1]					= "�� ���-������.";
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
	name 					=	"�����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOCmap;

	description				= "����� ������� ������";
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
	name 					=	"�����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseNCmap;

	description				= "����� ������ ������";
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
	name 					=	"�����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePSImap;

	description				= "����� ��������� ������";
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
	name 					=	"��������";
	
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
	name 					=	"�������������";

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
	name 				=	"������������ ������";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFireletter;
	scemeName			=	"MAPSEALED";
	description			= "������ ����� ����";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	TEXT[1]				= "�� ���������!";
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
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "�������������� ������"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "���� ���������� ������ ������� ������������ ����� �����. �� �������������� � � ���� �������� �������� ��� � ����� �������. �������� ������������ ����� ������� ���������. ��� �������� ����� �������� � �������, �������� ������ ����������� � ����� �����. ��� ���������� ��������� � ��������� ������ �� ����� �����, ����� �� ��������, ����� ��� �������� �� ����� � ������ �������� ��� ��������. ����� ��� ������ ��������, �� ������� ������������������ � ���, ��� �� ������ �������� ����� ������� ���� ����, ������ �� ������. ���� ������ �������� ��� �������� �������������. �� ����������� �������� ��� ���, ��� ������ ������."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "�� ������� ��� �����!"					);
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
	name 				=	"�������� ������";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFireletter2;
	scemeName			=	"MAP";
	description			= "������ ����� ����";
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
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "�������������� ������ �������"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "���� ���������� ������ ������� ������������ ����� �����. �� �������������� � � ���� �������� �������� ��� � ����� �������. �������� ������������ ����� ������� ���������. ��� �������� ����� �������� � �������, �������� ������ ����������� � ����� �����. ��� ���������� ��������� � ��������� ������ �� ����� �����, ����� �� ��������, ����� ��� �������� �� ����� � ������ �������� ��� ��������. ����� ��� ������ ��������, �� ������� ������������������ � ���, ��� �� ������ �������� ����� ������� ���� ����, ������ �� ������. ���� ������ �������� ��� �������� �������������. �� ����������� �������� ��� ���, ��� ������ ������."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "�� ������� ��� �����!"					);
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
	name 					=	"���� ������";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "��� ���� �� ������� ������� ������.";
	////COUNT[0]			= ;
	TEXT[1]				= "�� ��������� ������ �������� � ����� �������.";
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
	name 				=	"���� �����";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"��������� ������ �����.";
};
/*********************************************************************************/
//SCHMIEDESCHL�SSEL ERZBARONE
INSTANCE ItKe_OB_Smith_01(C_Item)
{	
	name 					=	"�������� ����";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_02.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "�� ��������� ����� � �������.";
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
	name 					=	"����";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "��������� ������� �����";
	////COUNT[0]			= ;
	TEXT[1]				= "� �������� ����� �������.";
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
	name 				=	"���� �� �������";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "����� �������";
	TEXT[1]				= "������� �������� ��� ������";
	TEXT[2]				= "������ �����";
};
/********************************************************/
INSTANCE ItKe_OM_02(C_Item)
{	
	name 				=	"���� �� �������";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "��������� ������ ������";
	TEXT[1]				= "� ������ �����.";
};

/********************************************************/
INSTANCE ItKe_OM_03(C_Item)
{	
	name 				=	"���� �� �������";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "��������� �������";
	TEXT[1]             = "�� ������ � ������ �����.";
};

/********************************************************/
INSTANCE ItKe_OM_04(C_Item)
{	
	name 				=	"���� �� �������";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "����� ��������";
	TEXT[1]				= "������ �������� ������";
};

/********************************GESCHENK VON IAN *********************************************/
INSTANCE ItFo_OM_Beer_01(C_Item)
{
	name 					=	"������� ����";

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
	name 					=	"������ �����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "��������";
	
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
					Doc_PrintLine	( nDocID,  0, "��������"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "���, ��� ����� ���������� �� ���� ������ �������� � ��������� ������� ������, ������ ������, ��� ������ �������� ���� ����. ����� ���, �� ����� �������� ��������� ���, ��� ��������� ��� � ���� �����, � �������, ��� �� ����� ������� ������ ���������.");
					
				

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
					Doc_PrintLines	( nDocID,  1, "������ �������������� ���� ������� ����, ������ ��� ������ ���-�� �����.");
					Doc_Show		( nDocID );
				
					if (riddle1 == FALSE)
					{
						Log_CreateTopic		(theriddle_log,		LOG_MISSION);
						Log_SetTopicStatus	(theriddle_log,		LOG_RUNNING);
						B_LogEntry			(theriddle_log,		"� ���� � �������-���� � �������� ����� ���� ����� �������� �����. '��������'! ��� �������� ���������� ����. � ��� ��������, ��� ������������ ����� ������ ���� ���: ...������ �������������� ���� ������� ����, ������ ��� ������ ���-�� �����... ��... � ��� ������ �� �������, ��, ����� ����, ����� ���-������ ����������."); 
						Wld_InsertItem			(theriddle2,"CASTLE_TOWER_TOP");
					
						riddle1 = TRUE;
					
					};
	};

INSTANCE theriddle2(C_Item)
{	
	name 					=	"������ �����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "�������� 2";
	
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
					Doc_PrintLine	( nDocID,  0, "��������"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "� ���������� ������� �������� ��������� ����������� ������ ���� �������. �� ���� � ���� � ����� ��� ������ ���, �� � ����� ���� �� ����. ��� �������� ���� �� ������� ����.");
					
				

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
					Doc_PrintLines	( nDocID,  1, "��� ���� ���������, ����� ������ ������, ���� ���������� ������ �������.");
					Doc_Show		( nDocID );
					
					if (riddle2 == FALSE)
					{					
						B_GiveXP (300);
						B_LogEntry			(theriddle_log,		"� ����� ������ �����, �� ������� ����� ����� '��������'. ��� ��������� �� ����� ����������... ��� ���� ���������, ����� ������ ������, ���� ���������� ������ �������..."); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
					
						riddle2  =  TRUE;
					
					};
	
	};
INSTANCE theriddle3(C_Item)
{	
	name 					=	"������ �����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "�������� 3";
	
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
					Doc_PrintLine	( nDocID,  0, "��������"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "�, ���� ������� ������. �������� ��, ����� ����� �������, ��� �, �����������, ������� ��� ����. ��� ����� ����� �������� ���, ������� �������� ����� ��������.");
					
				

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
					Doc_PrintLines	( nDocID,  1, "����� ����� ��������� ����� ����� � �� ������ ������ ����.");
					Doc_Show		( nDocID );



					if (riddle3 == FALSE)
					{		
						B_GiveXP (500);
						B_LogEntry			(theriddle_log,		"� ����� ������ �����. �������, � ������� ��������, ��� ����� ������� �� �����... ����� ����� ��������� ����� ����� � �� ������ ������ ����..."); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
						
						riddle3   =  TRUE;
					
					};
					
					
	};
				
				
INSTANCE theriddle4(C_Item)
{	
	name 					=	"������ �����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "�������� 4";
	
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
					Doc_PrintLine	( nDocID,  0, "��������"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "� ���� �� ���� ��������� �����-������ ������ �������� ��������. ������ ��� ������� � ������ ����. ������ ����� ��� ������ ������� ����������, � ����� ����� � ��� ������.");
					
				

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
					Doc_PrintLines	( nDocID,  1, "������ ���� ���, ��� ��� �����-�� �� �����.");
					Doc_Show		( nDocID );
					

					if (riddle4 == FALSE)
					{					
						B_GiveXP (700);
						B_LogEntry			(theriddle_log,		"����� ���������. � ����� ������ � �������� ���� ������� �������� ��� ������... ������ ���� ���, ��� ��� �����-�� �� �����..."); 
						Snd_Play 		("FoundRiddlersBook");					
						Wld_InsertItem			(theriddle5,"LOCATION_25_01");
					
					
						riddle4 = TRUE;
					
					};
					
					
					
	};
								
INSTANCE theriddle5(C_Item)
{	
	name 					=	"������ �����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "�������� 5";
	
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
					Doc_PrintLine	( nDocID,  0, "��������"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "�� � �� ���� �������� �� ���� ���� ����. � ������ ���� ��������� ����, �������� �� ���, � ���������, ������� ������ ����. �������, ��� �������� �� ��������� �������...");
					
				

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
					Doc_PrintLines	( nDocID,  1, "�� ������� ���� ���, ��� ��� ��������.");
					Doc_Show		( nDocID );




					if (riddle5 == FALSE)
					{
						B_GiveXP (850);
						B_LogEntry			(theriddle_log,		"�������, ��� ��������� �����. ���������, � ��� ��� ��������� �����������... �� ������� ���� ���, ��� ��� ��������."); 
						Snd_Play 		("FoundRiddlersBook");				
						Wld_InsertNpc				(Bau_940_Riddler,"");
						var C_NPC riddler; riddler = Hlp_GetNpc(Bau_940_Riddler);
						Npc_ChangeAttribute	(riddler, ATR_HITPOINTS, -riddler.attribute[ATR_HITPOINTS_MAX]);

						riddle5  =  TRUE;
					
					};
	};

INSTANCE theriddle6(C_Item)
{	
	name 					=	"������ �����";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "�������� 6";
	
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
					Doc_PrintLine	( nDocID,  0, "��������"			);
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
						B_LogEntry			(theriddle_log,		"������������ ����� �����. ��� ����� �����-�� ������. ��� ��������� ��� � ����� ������������ ���. ����� �� ������� �� �������� �� � ��� ������� ������ �����. �� �� �������� �� ���� ���� �����, ��� ������ ������ � ���."); 
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
															