// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Boite";
CONST STRING MOBNAME_CHEST			= "Coffre";
CONST STRING MOBNAME_BED			= "Lit";
CONST STRING MOBNAME_DOOR			= "Porte";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Enclume";
CONST STRING MOBNAME_BUCKET			= "Seau d'eau";
CONST STRING MOBNAME_FORGE			= "Forge";
CONST STRING MOBNAME_GRINDSTONE		= "Meule";
CONST STRING MOBNAME_WHEEL			= "Treuil";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Marmitte";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Casserole";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Narghil�";
CONST STRING MOBNAME_LADDER			= "�chelle";
CONST STRING MOBNAME_SWITCH			= "Interrupteur";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "P�pite min�rale";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Soufflet";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Momie";
CONST STRING MOBNAME_PILLAR			= "Colonne";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "n/a";
CONST STRING MOBNAME_HERB_PSI		= "Broyeur d'Herbe";
CONST STRING MOBNAME_IDOL			= "Figurine";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Cible";
CONST STRING MOBNAME_SHRINE			= "Sanctuaire du Coeur des Orcs";
CONST STRING MOBNAME_SWORDSTONE		= "�trange Sanctuaire";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(aucune)",
	"Baron du minerai",
	"Garde",
	"Ombre",
	"Magicien du Feu",
	"Mineur",
	"Magicien de l'Eau",
	"Mercenaire",
	"Crapule",
	"Paysan",
	"Grattoir",			// 10
	"Sage",
	"Disciple",
	"Templier",
	"N�cromancien",
	"Fille",
	"",
	"L�zard",			// 17
	"Dormeur",
	"Gobelin",
	"Troll",
	"Claque-Machoire",
	"Chenille des Mines",
	"Insecte",
	"Charognard",
	"D�mon",
	"Loup",
	"B�te de l'ombre",
	"Mouche de Sang",
	"Requin des Marais",			// 30
	"Zombi",
	"Orc Zombi",
	"Squelette",
	"Chien Orc",
	"Molerat",
	"Golem",
	"Charognard",
	"",				// 38
	"Shaman Orc",
	"Guerrier Orc",
	"�claireur Orc",
	"Esclave Orc"
};


// *****************************************************************************************
// Attribut-Beschreibungen
// *****************************************************************************************
/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
const string TXT_ATTRIBUTE_DESC	[ATR_INDEX_MAX]	= {

	"HitpointDesc",
	"",
	"ManaDesc",
	"",
	"StrengthDesc",
	"DexterityDesc",
	"",
	""
};

"TXT_ATTRIBUTE_DESC" - Beschreibung	der	Attribute f�r CharScreen.
"TXT_FIGHT_TALENTS"	- Namen	der	Kampftalente
"TXT_FIGHT_TALENTS_DESC" - Beschreibung	der	Kampftalente f�r CharScreen.
"TXT_TALENTS" -	Namen der sonstigen	Talente
"TXT_TALENTS_DESC" - Beschreibung der Talente f�r CharScreen
"TXT_SPELLS_DESC" -	Beschreibung der Spells	f�r	CharScreen

Die	Reihenfolge	der	jeweiligen Texte k�nnt ihr der Konstantenreihenfolge aus
der	"constants.d" entnehmen, die hier auch mit dranhaengt und fuer
fehlerfreies (Test-)parsen ben�tigt	wird.
*/

// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************

CONST STRING TXT_SPELLS	[MAX_SPELL]	= {
	"Lumi�re",					// SPL_LIGHT		=	0;
	"Boule de Feu",				// SPL_FIREBALL		=	1;
	"n/a",						// SPL_TRANSFORM	=	2;
	"Terreur",					// SPL_FEAR			=	3;
	"Soin",					// SPL_HEAL			=	4;
	"n/a",						// SPL_LIGHTNING	=	5;
	"Invoqu� un D�mon",			// SPL_SUMMONDEMON	=	6;
	"Invoqu� des Squelettes",		// SPL_SUMMONSKELETON=	7;
	"n/a",						// SPL_FORGET		=	8;
	"Poing du Vent",				// SPL_WINDFIST		=	9;
	"T�l�kin�sie",				// SPL_TELEKINESIS	=	10;
	"Charme",					// SPL_CHARM		=	11;
	"Torpeur",					// SPL_SLEEP		=	12;
	"Pyrokin�sie",				// SPL_PYROKINESIS	=	13;
	"Anneau de la Mort",				// SPL_MASSDEATH	=	14;
	"Contr�le",				// SPL_CONTROL		=	15;
	"Bannissement des Mort-vivants",		// SPL_DESTROYUNDEAD=	16;
	"Projectile de Feu",				// SPL_FIREBOLT		=	17;
	"Temp�te de Feu",				// SPL_FIRESTORM	=	18;
	"Pluie de Feu",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"T�l�portation vers Magicien du Feu",		// SPL_TELEPORT1	=	21;
	"T�l�portation vers Magicien de l'Eau",	// SPL_TELEPORT2	=	22;
	"T�l�portation vers N�cromancien",	// SPL_TELEPORT3	=	23;
	"T�l�portation des Orcs",		// SPL_TELEPORT4	=	24;
	"T�l�portation vers Camp Mar�cageux",		// SPL_TELEPORT5	=	25;
	"Transformation en Mouche de Sang",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"Transformation en Chenille des Mines",	// SPL_TRF_CRAWLER	=	28;
	"Transformation en Charognard",		// SPL_TRF_LURKER	=	29;
	"Transformation en Insecte",	// SPL_TRF_MEATBUG	=	30;
	"Transformation en Molerat",		// SPL_TRF_MOLERAT	=	31;
	"Transformation en Chien Orc",		// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"Transformation en Charognard",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Transformation en B�te de l'ombre",	// SPL_TRF_SHADOWBEAST=	36;
	"Transformation en Claque-machoire",		// SPL_TRF_SNAPPER	=	37;
	"Transformation en L�zard",		// SPL_TRF_WARAN	=	38;
	"Transformation en Loup",			// SPL_TRF_WOLF		=	39;
	"Chaine d'�clair",					// SPL_CHAINLIGHTNING=	40;
	"Projectile de Glace",					// SPL_THUNDERBOLT	=	41;
	"Boule d'�clair",				// SPL_THUNDERBALL	=	42;
	"Bloc de Glace",					// SPL_ICECUBE		=	43;
	"Vague de Glace",					// SPL_ICEWAVE		=	44;
	"Invocation de Golem",			// SPL_SUMMONGOLEM	=	45;
	"Arm�e des T�n�bres",		// SPL_ARMYOFDARKNESS=	46;
	"Temp�te de coup",				// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Haleine de Mort",				// SPL_BREATHOFDEATH=	49;
	"R�duire Monstre",				// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Enrag�",					// SPL_BERZERK		=	53;
	"Col�re d'URIZIEL",			// SPL_NEW1			=	17;
	"New2",						// SPL_NEW2			=	18;
	"New3",						// SPL_NEW3			=	19;
	"New4",						// SPL_NEW4			=	20;
	"New5"						// SPL_NEW5			=	21;
 };

/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_SPELLS_DESC [MAX_SPELL] = {
// FIXME: wo werden die benutzt?
	"LichtDescr",						// SPL_LIGHT		=	0;
	"FeuerballDescr",					// SPL_FIREBALL		=	1;
	"VerwandelnDescr",					// SPL_TRANSFORM	=	2;
	"FearDescr",						// SPL_FEAR			=	3;
	"HeilenDescr",						// SPL_HEAL			=	4;
	"BlitzDescr",						// SPL_LIGHTNING	=	5;
	"D�mon beschw.Descr",				// SPL_SUMMONDEMON	=	6;
	"Skelette beschw.Descr",			// SPL_SUMMONSKELETON=	7;
	"VergessenDescr",					// SPL_FORGET		=	8;
	"WindfaustDescr",					// SPL_WINDFIST		=	9;
	"TelekineseDescr",					// SPL_TELEKINESIS	=	10;
	"CharmDescr",						// SPL_CHARM		=	11;
	"SleepDescr",						// SPL_SLEEP		=	12;
	"PyrokinesisDescr",					// SPL_PYROKINESIS	=	13;
	"MassdeathDescr",					// SPL_MASSDEATH	=	14;
	"KontrolleDescr",					// SPL_CONTROL		=	15;
	"Untote	bannenDescr",				// SPL_DESTROYUNDEAD=	16;
	"FireboltDescr",					// SPL_FIREBOLT		=	17;
	"FireStormDescr",				// SPL_FIRESTORM	=	18;
	"FireRainDescr",					// SPL_FIRERAIN		=	19;
	"SpeedDescr",					// SPL_SPEED		=	20;
	"Teleport1Descr",				// SPL_TELEPORT1	=	21;
	"Teleport2Descr",				// SPL_TELEPORT2	=	22;
	"Teleport3Descr",				// SPL_TELEPORT3	=	23;
	"Teleport4Descr",				// SPL_TELEPORT4	=	24;
	"Teleport5Descr",				// SPL_TELEPORT5	=	25;
	"Transform BloodflyDescr",		// SPL_TRF_BLOODFLY	=	26;
	"Transform BloodhoundDescr",		// SPL_TRF_BLOODHOUND=	27;
	"Transform CrawlerDescr",		// SPL_TRF_CRAWLER	=	28;
	"Transform LurkerDescr",			// SPL_TRF_LURKER	=	29;
	"Transform MeatbugDescr",		// SPL_TRF_MEATBUG	=	30;
	"Transform MoleratDescr",		// SPL_TRF_MOLERAT	=	31;
	"Transform OrcDogDescr",			// SPL_TRF_ORCDOG	=	32;
	"Transform RazorDescr",			// SPL_TRF_RAZOR	=	33;
	"Transform ScavengerDescr",		// SPL_TRF_SCAVENGER=	34;
	"Transform Scavenger2Descr",		// SPL_TRF_SCAVENGER2=	35;
	"Transform ShadowbeastDescr",		// SPL_TRF_SHADOWBEAST=	36;
	"Transform SnapperDescr",		// SPL_TRF_SNAPPER	=	37;
	"Transform WaranDescr",			// SPL_TRF_WARAN	=	38;
	"Transform WolfDescr",			// SPL_TRF_WOLF		=	39;
	"ChainlightningDescr",			// SPL_CHAINLIGHTNING=	40;
	"TunderboltDescr",				// SPL_THUNDERBOLT	=	41;
	"ThunderballDescr",				// SPL_THUNDERBALL	=	42;
	"Ice CubeDescr",					// SPL_ICECUBE		=	43;
	"Ice WaveDescr",					// SPL_ICEWAVE		=	44;
	"Summon	GolemDescr",				// SPL_SUMMONGOLEM	=	45;
	"Army of DarknessDescr",			// SPL_ARMYOFDARKNESS=	46;
	"StormFistDescr",					// SPL_STORMFIST	=	47;
	"n/a",								// SPL_TELEKINESIS2	=	48;
	"Breath	of DeathDescr",				// SPL_BREATHOFDEATH=	49;
	"ShrinkDescr",						// SPL_SHRINK		=	50;
	"n/a",								// SPL_UNDRESS		=	51;
	"n/a",								// SPL_DANCE		=	52;
	"BerzerkDescr",						// SPL_BERZERK		=	53;
	"New1Descr",						// SPL_NEW1			=	17;
	"New2Descr",						// SPL_NEW2			=	18;
	"New3Descr",						// SPL_NEW3			=	19;
	"New4Descr",						// SPL_NEW4			=	20;
	"New5Descr"							// SPL_NEW5			=	21;
};
*/

								
// *****************************************************************************************
// Kampf-Talente
// *****************************************************************************************

CONST STRING TXT_TALENTS [NPC_TALENT_MAX] =	
{
	"",	
	"�p�e � 1 main",
	"�p�e � 2 mains",
	"Arc",
	"Arbal�te",
	"Forcer Serrure",
	"Pickpocket",
	"Magie",
	"Discr�tion",
	"R�g�n�ration",
	"Maitre du Feu",
	"Acrobatie"
};

/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_TALENTS_DESC [NPC_TALENT_MAX] = 
// FIXME: wo werden die benutzt?
{
	"",	
	"NPC_TALENT_1H",
	"NPC_TALENT_2H",
	"NPC_TALENT_BOW",
	"NPC_TALENT_CROSSBOW",
	"NPC_TALENT_PICKLOCK",
	"NPC_TALENT_PICKPOCKET",
	"NPC_TALENT_MAGE",
	"NPC_TALENT_SNEAK",
	"NPC_TALENT_REGENERATE",
	"NPC_TALENT_FIREMASTER",
	"NPC_TALENT_ACROBAT"
};
*/

CONST STRING TXT_TALENTS_SKILLS [NPC_TALENT_MAX] = 
{
	"",	
	"Incomp�tent|Entrain�|Maitre",						//NPC_TALENT_1H          
	"Incomp�tent|Entrain�|Maitre",                       //NPC_TALENT_2H           
	"Incomp�tent|Entrain�|Maitre",                       //NPC_TALENT_BOW         
	"Incomp�tent|Entrain�|Maitre",                       //NPC_TALENT_CROSSBOW    
	"Incomp�tent|Entrain�|Maitre",                       //NPC_TALENT_PICKLOCK   
	"Incomp�tent|Entrain�|Maitre",                       //NPC_TALENT_PICKPOCKET
	"aucun|Cercle 1|Cercle 2|Cercle 3|Cercle 4|Cercle 5|Cercle 6", //NPC_TALENT_MAGE         
	"Non|Oui",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"Non|Oui"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
	"Armes",
	"Armure",
	"Magie",
	"Reliques",
	"Nourriture",
	"Potions",
	"�critures",
	"Divers"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Mineur";
CONST STRING NAME_Schatten		= "Ombre";
CONST STRING NAME_ConvoiTraeger	= "Porteur de convoie";
CONST STRING NAME_ConvoiWache	= "Garde de convoie";
CONST STRING NAME_Torwache		= "Garde d'entr�e";
CONST STRING NAME_Brueckenwache	= "Garde du pont";
CONST STRING NAME_Gardist		= "Garde";
CONST STRING NAME_Bauer			= "Paysan";
CONST STRING NAME_Schlaeger		= "Voyou";
CONST STRING NAME_Schuerfer		= "Gratteur";
CONST STRING NAME_Organisator	= "Crapule";
CONST STRING NAME_Soeldner		= "Mercenaire";
CONST STRING NAME_Novize		= "Disciple";
CONST STRING NAME_Templer		= "Templier";
CONST STRING NAME_Raeuber		= "Voyou";
CONST STRING NAME_Tuersteher	= "Videur";

const string NAME_MadNovice		=	"Disciple obs�d�";
const string NAME_MadTemplar	=	"Templier fanatique";
const string NAME_MadTemplar2	=	"Templier Apocalyptique";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "FIN";
CONST STRING DIALOG_BACK		= "RETOUR";
const string DIALOG_TRADE		= "(Troc)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Anneau";
const string NAME_Amulett		= "Amulette";
const string NAME_Trank			= "Potion";
const string NAME_Rune			= "Rune";
const string NAME_Spruchrolle	= "Parchemin Magique";


// *************************************************************
// TEXTE F�R ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Valeur:";

const string NAME_Mag_Circle	= "Cercle:";
const string NAME_Manakosten	= "Co�t de Mana:";
const string NAME_ManakostenMax	= "Co�t de Mana (max.):";
const string NAME_ManaPerSec	= "Mana par sec.";
const string NAME_Duration		= "Dur�e (minutes)";

const string NAME_Mana_needed	= "Mana requis:";
const string NAME_Str_needed	= "Force requise:";
const string NAME_Dex_needed	= "Dexterit� requise:";

const string NAME_Spell_Load	= "Sort imputable";
const string NAME_Spell_Invest	= "Sort charg�";

const string NAME_Dam_Edge		= "D�gat des armes";
const string NAME_Dam_Point		= "D�gat des Fl�ches";
const string NAME_Dam_Fire		= "D�gat de Feu";
const string NAME_Dam_Magic		= "D�gat Magique";
const string NAME_Dam_Fly		= "D�gat Temp�te";

const string NAME_Damage		= "Damage";
const string NAME_PerMana		= " (par mana)";
const string NAME_DamagePerSec	= "D�gat par sec.";

const string NAME_Prot_Edge		= "Protection contre les armes:";
const string NAME_Prot_Point	= "Protection contre les fl�ches:";
const string NAME_Prot_Fire		= "Protection contre le feu:";
const string NAME_Prot_Magic	= "Protection contre la magie:";

const string NAME_Bonus_HP		= "Bonus de Vie:";
const string NAME_Bonus_Mana	= "Bonus de Mana:";

const string NAME_Bonus_HpMax	= "Bonus de Vie maximum:";
const string NAME_Bonus_ManaMax	= "Bonus de Mana maximum:";

const string NAME_Bonus_Dex		= "Bonus de Dext�rit�:";
const string NAME_Bonus_Str		= "Bonus de Force:";

const string NAME_OneHanded		= "Arme � une main";
const string NAME_TwoHanded		= "Arme � deux mains";

//----------------- MH: zus�tzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Soin par Mana"; 

const string NAME_BuyAttributeSTR = "Force +";
const string NAME_BuyAttributeDEX = "Dext�rit� +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Exp�rience +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "Niveau Sup�rieur !";				// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nouvelle Entr�e dans le Journal";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Inconnu)-"								;

const string _STR_ATTRIBUTE_HITPOINTS		= "Vie"									;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Vie Maximum"							;
const string _STR_ATTRIBUTE_MANA			= "Mana"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "Mana Maximum"							;
const string _STR_ATTRIBUTE_STRENGTH		= "Force"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "Dext�rit�"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Parchemin Magique"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, f�r die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Il te manque "						;
const string _STR_CANNOTUSE_POINTS			= " points"									;
const string _STR_CANNOTUSE_LEVELS		    = " niveaux"									;
const string _STR_CANNOTUSE_POST			= " pour utiliser cet objet."						;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, f�r das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") sont manquants "									;

// Bidschrimausgabe zum Thema Schlo� �ffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "Pas de passe ou de cl�.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "Cela � l'air bon.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "La serrure est ouverte.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Merde... faut tout refaire.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Le passe s'est cass�.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "Le levier ne bouge pas du tout."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "La statuette bouge le levier."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Le treuil est bloqu�."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " Objet donn� !"							;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEM_TAKEN		= " Objet re�u !"							;
const string _STR_MESSAGE_ITEMS_GIVEN		= " Objets donn�s !"							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " Objets re�us !"						;
const string _STR_MESSAGE_ORE_GIVEN			= " Minerai donn� !"								;
const string _STR_MESSAGE_ORE_TAKEN			= " Minerai re�u !"							;

// Bidschrimausgabe f�rs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "La valeur de tes biens n'est pas assez �lev�e"	;

// GILDENAUFNAHMEBEDINGUNG (f�r die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Condition pour l'admission: Niveau "; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Ne peut pas y �tre vol�.";

// ***************************************************************************************
// Relative Y-Koordinaten f�r die Bildschirmausgabe (in % der aktuellen Bildh�he)
// ***************************************************************************************
const int	_YPOS_MESSAGE_GIVEN				=	37;
const int	_YPOS_MESSAGE_TAKEN				=	40;
const int	_YPOS_MESSAGE_LOGENTRY			=	45;
const int	_YPOS_MESSAGE_XPGAINED			=	50;
const int	_YPOS_MESSAGE_LEVELUP			=	55;
const int 	_YPOS_MESSAGE_Joincamp			=	50;
const int	_YPOS_MESSAGE_PICKLOCK_SUCCESS	=	6;
const int	_YPOS_MESSAGE_PICKLOCK_UNLOCK	=	9;
const int	_YPOS_MESSAGE_PICKLOCK_FAILURE	=	12;
const int 	_YPOS_MESSAGE_PICKLOCK_BROKEN	=	15;
const int	_YPOS_MESSAGE_CANNOTSTEAL		=	6;


// ***************************************************************************************
// Zeitdauer der Bildschirmausgabe (in Sekunden)
// ***************************************************************************************
const int	_TIME_MESSAGE_GIVEN				=	4;
const int	_TIME_MESSAGE_TAKEN				=	4;
const int	_TIME_MESSAGE_LOGENTRY			=	4;
const int	_TIME_MESSAGE_XPGAINED			=	3;
const int	_TIME_MESSAGE_LEVELUP			=	5;
const int	_TIME_MESSAGE_RAISEATTRIBUTE	=	4;
const int	_TIME_MESSAGE_Joincamp			=	5;
const int	_TIME_MESSAGE_PICKLOCK			=	3;
const int	_TIME_MESSAGE_CANNOTSTEAL		=	2;


// ***************************************************************************************
// Zusammenbauen von Info_AddChoice()-Strings beim Kaufen/Lernen
// ***************************************************************************************
const string NAME_BuyArmorPrefix	=	" (";	
const string NAME_BuyArmorPostfix	=	" minerai)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" minerai, ";
const string NAME_LearnPostfixS		=	"point de comp�tence)";	
const string NAME_LearnPostfixP		=	"points de comp�tence)";	

const string NAME_LearnStrength_1	=	"Force +1";
const string NAME_LearnStrength_5	=	"Force +5";
const string NAME_LearnStrength_10	=	"Force +10";
const string NAME_LearnStrength_20	=	"Force +20";

const string NAME_LearnDexterity_1	=	"Dext�rit� +1";
const string NAME_LearnDexterity_5	=	"Dext�rit� +5";
const string NAME_LearnDexterity_10	=	"Dext�rit� +10";
const string NAME_LearnDexterity_20	=	"Dext�rit� +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"�p�e � 1 main Niveau 1";
const string NAME_Learn1h_2			=	"�p�e � 1 main Niveau 2";
const string NAME_Learn2h_1			=	"�p�e � 2 mains Niveau 1";
const string NAME_Learn2h_2			=	"�p�e � 2 mains Niveau 2";

const string NAME_LearnBow_1		=	"Arc Niveau 1";
const string NAME_LearnBow_2		=	"Arc Niveau 2";
const string NAME_LearnCrossbow_1	=	"Arbal�te Niveau 1";
const string NAME_LearnCrossbow_2	=	"Arbal�te Niveau 2";

const string NAME_LearnMage_1		=	"1er Cercle de Magie";
const string NAME_LearnMage_2		=	"2nd Cercle de Magie";
const string NAME_LearnMage_3		=	"3eme Cercle de Magie";
const string NAME_LearnMage_4		=	"4eme Cercle de Magie";
const string NAME_LearnMage_5		=	"5eme Cercle de Magie";
const string NAME_LearnMage_6		=	"6eme Cercle de Magie";

const string NAME_LearnPickpocket_1	=	"Pickpock Niveau 1";
const string NAME_LearnPickpocket_2	=	"Pickpock Niveau 2";
const string NAME_LearnPicklock_1	=	"Crochetage Niveau 1";
const string NAME_LearnPicklock_2	=	"Crochetage Niveau 2";

const string NAME_LearnAcrobat		=	"Acrobatie";
const string NAME_LearnSneak		=	"Discr�tion";

const string NAME_RaiseStrength		=	"Force +";
const string NAME_RaiseDexterity	=	"Dext�rit� +";
const string NAME_RaiseStrDex		=	"Force et Dext�rit� +";
const string NAME_RaiseManaMax		=	"Mana Maximum +";
const string NAME_RaiseHealthMax	=	"Vie Maximum +";

//---------------- MH: f�r B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Maitre, j'aimerai porter la Grande Robe de Feu.";
const string NAME_SaturasHighRobe	= 	"Grande Robe";
const string NAME_DiegoHeavyShadows	=	"Armure lourde d'Ombre. Protection: Armes 40, Fl�ches 5, Feu 20";
const string NAME_StoneHeavyGuards	= 	"Armure lourde de Garde. Protection: Armes 70, Fl�ches 10, Feu 35";
const string NAME_StoneGuards		= 	"Armure de Garde. Protection: Armes 55, Fl�ches 10, Feu 25";
const string NAME_WolfBandits		= 	"Armure de Bandit. Protection: Armes  35, Fl�ches 5, Feu 15"; 
const string NAME_WolfHeavyBandits	= 	"Armure lourde de Bandit. Protection: Armes 40, Fl�ches 5, Feu 20";
const string NAME_LeeMercs			= 	"Armure de Mercenaire. Protection: Armes 55, Fl�ches 10, Feu 25";
const string NAME_LeeHeavyMercs		= 	"Armure lourde de Mercenaire. Protection: Armes 70, Fl�ches 10, Feu 35";
const string NAME_FiskLightDiggers	= 	"V�tement l�ger de Mineur. Protection: Armes 10, Feu 5";
const string NAME_FiskDiggers		= 	"V�tement de Mineur. Protection: Armes 15, Feu 5";
const string NAME_GorNaTothHeavyTpl = 	"Armure lourde de Templier. Protection: Armes 70, Fl�ches 10, Feu 35";
const string NAME_GorNaTothTpl 		=	"Armure de Templier. Protection: Armes 55, Fl�ches 10, Feu 25";
const string NAME_TorwachenPsiRock	=	"Habit de rein. Protection: Armes 15, Feu 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Certains r�ajustements ne prendrons effet qu'apr�s un relancement du jeu.";

//
//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Accepter"			;
const string STR_INFO_TRADE_RESET						= "Refuser"			;
const string STR_INFO_TRADE_EXIT						= "RETOUR"			;

const string STR_BADENIXE = "Femme qui lave";

// ****************
// B_Kapitelwechsel
// ****************

const string KapWechsel_1			= "Chapitre 1"					;
const string KapWechsel_1_Text		= "Bienvenue � la Colonie"		;
const string KapWechsel_2			= "Chapitre 2"					;
const string KapWechsel_2_Text		= "Le Nid des Chenilles des Mines"		;
const string KapWechsel_3			= "Chapitre 3"					;
const string KapWechsel_3_Text		= "Les Reliques du Pouvoir Ancien"	;
const string KapWechsel_4			= "Chapitre 4"					;
const string KapWechsel_4_Text		= "Xardas"						;
const string KapWechsel_5			= "Chapitre 5"					;
const string KapWechsel_5_Text		= "Les Gardiens du Portail"		;
const string KapWechsel_6			= "Chapitre 6"					;
const string KapWechsel_6_Text		= "Le Temple du Dormeur"	;
