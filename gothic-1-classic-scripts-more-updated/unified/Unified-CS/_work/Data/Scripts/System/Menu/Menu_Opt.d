// *********************************************************************
// options menu
// *********************************************************************

INSTANCE MENU_OPTIONS(C_MENU_DEF) 
{
	backpic		= MENU_BACK_PIC;
 
	items[0]	= "MENUITEM_OPT_HEADING";	

	items[1]	= "MENUITEM_OPT_GAME";	
	items[2]	= "MENUITEM_OPT_GRAPHICS";	
	items[3]	= "MENUITEM_OPT_VIDEO";
	items[4]	= "MENUITEM_OPT_AUDIO";	
	items[5]	= "MENUITEM_OPT_CONTROLS";				

	items[6]	= "MENUITEM_PERF";
	items[7]	= "MENUITEM_PERF_CHOICE";
		
	items[8]	= "MENUITEM_OPT_BACK";	
		
	defaultOutGame	= 0;	// PERFORMANCE-SETTINGS
	defaultInGame	= 0;	// PERFORMANCE-SETTINGS	
	
	flags = flags | MENU_SHOW_INFO;
};


const int MENU_OPT_DY 		=  600;
const int MENU_OPT_START_Y	= 2200;

INSTANCE MENUITEM_OPT_HEADING(C_MENU_ITEM_DEF) 
{
	text[0]		=	"NASTAVEN�";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8192;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_OPT_GAME(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Hra";
	text[1]		= "Upravit nastaven� hry.";  // Kommentar
	
	// Position und Dimension	
	posx		= 0;		posy		= MENU_OPT_START_Y + MENU_OPT_DY*0;
	dimx		= 8192;		dimy		= 750;
	
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPT_GAME";	
	// Weitere Eigenschaften	
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_OPT_GRAPHICS(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Grafika";
	text[1]		= "Viditelnost v hrac�m okn�, detaily a efekty.";  // Kommentar
	
	// Position und Dimension	
	posx		= 0;		posy		= MENU_OPT_START_Y + MENU_OPT_DY*1;
	dimx		= 8192;		dimy		= 750;
	
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPT_GRAPHICS";	
	// Weitere Eigenschaften	
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_OPT_VIDEO(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		=	"Video";
	text[1]		=	"Grafick� adapt�r, rozli�en� a ostrost obrazu.";  // Kommentar
	
	// Position und Dimension	
	posx		= 0;		posy		= MENU_OPT_START_Y + MENU_OPT_DY*2;
	dimx		= 8192;		dimy		= 750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPT_VIDEO";	
	// Weitere Eigenschaften	
	flags = flags | IT_TXT_CENTER;
};


INSTANCE MENUITEM_OPT_AUDIO(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Zvuk";
	text[1]		= "Hudba, jazyk a zvukov� efekty.";  // Kommentar
	
	// Position und Dimension
	posx		= 0;		posy		= MENU_OPT_START_Y + MENU_OPT_DY*3;
	dimx		= 8192;		dimy		= 750;
	
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPT_AUDIO";	
	// Weitere Eigenschaften	
	flags = flags | IT_TXT_CENTER;
};


INSTANCE MENUITEM_OPT_CONTROLS(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Kl�vesnice";
	text[1]		= "Nastaven� kl�vesnice.";  // Kommentar
	
	// Position und Dimension	
	posx		= 0;		posy		= MENU_OPT_START_Y + MENU_OPT_DY*4;
	dimx		= 8192;		dimy		= 750;
	
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPT_CONTROLS";
	// Weitere Eigenschaften	
	flags = flags | IT_TXT_CENTER;
};



INSTANCE MENUITEM_PERF(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "V�kon/kvalita";
	text[1]		= "Optimalizovat v�kon a kvalitu.";  // Kommentar
	
	// Position und Dimension	
	posx		= 0;		posy		= MENU_OPT_START_Y + MENU_OPT_DY*5;
	dimx		= 8192;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onEventAction[EVENT_EXECUTE]= Update_PerfOptions;
	// Weitere Eigenschaften		
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

instance MENUITEM_PERF_CHOICE(C_MENU_ITEM_DEF)
{
	backpic		= MENU_CHOICE_BACK_PIC;
	text[0]		= "u�ivatelsk� nastaven�#vysok� v�kon|st�edn� kvalita|vysok� kvalita";	// # trennt die UnDef-Option von der auswaehlbaren Optionen
	type		= MENU_ITEM_CHOICEBOX;
	fontName	= MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 4100-2000;		posy		= MENU_OPT_START_Y + MENU_OPT_DY*5+650;
	dimx		= 4000;
	dimy		= 350;
	// Actions
	onChgSetOption			= "perfQualityIndex";
	onChgSetOptionSection 	= "INTERNAL";	
	// Weitere Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_OPT_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Zp�t";
	// Position und Dimension	
	posx		=	1000;			posy		=	MENU_BACK_Y;
	dimx		=	6192;		dimy		=	MENU_OPT_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};


func int Update_PerfOptions()
{
	Apply_Options_Performance();
	return 0;
};
