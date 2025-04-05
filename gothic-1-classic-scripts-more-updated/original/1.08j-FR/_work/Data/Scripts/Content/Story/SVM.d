// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese k�nnen	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner N�he gezaubert wird -> er fordert auf, damit aufzuh�ren!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	P�nten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Pa� auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuh�ren)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche k�mpfen und der Spieler die Waffe wegsteckt) oder als Reaction �ber das news-Ged�chtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn pl�tzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	M�rder -> kann ihn pl�tzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC fr�her noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC fr�her besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zur�ckzugeben, seine Waffe wegzustecken -> "Wer nicht h�ren will mu� f�hlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(T�r,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC tr�gt Waffe des NSCs -> NSC ist st�rker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schw�cheren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schw�chere) SC	etwas nimmt, da� ihm geh�rt	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schw�cheren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Sch�tzling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs get�tet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// T�dlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf	

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	sch�cher als sein Kontrahent
											// 2. SC zieht Waffe oder n�hert sich mit Waffe und NSC ist schw�cher als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "Schei�e, was ein H�llenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich St�rker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird gepl�ndert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC pl�ndert bewu�tlosen SC/aNSC. W�hrend er sich b�ckt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC pl�ndert bewu�tlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC �rgert sich dar�ber, da� er beim Durchsuchen eines bewu�tlosen/toten K�rpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, T�r) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schw�cheren	SC in seiner H�tte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zur�ckzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schw�cherer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer H�tte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zur�ckzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gem�se (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	dr�ben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	K�mpfer	schl�gt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist get�tet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der K�mpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC t�tet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schl�gerei" get�tet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, r�keln)

// Gr��e
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('F�r Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schl�fer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da dr�ben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung �ber 100
	var string	NoLearnYouAlreadyKnow	;	// Du mu�t erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im R�umen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gespr�ch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC r�ckt NSC zu dicht auf die Pelle -> "Kann ich was f�r Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schw�cherem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht st�rkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des st�rkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gek�mpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schw�cher...
	var string	LookAway;					// Eingesch�chterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC tr�gt	Waffe des sch�cheren NSCs -> NSCs verlangt die Waffe zur�ck	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zur�ckweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC tr�gt	eine Waffe,	die	dem	NSC	geh�rt -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC tr�gt Waffe des NSCs -> NSC ist schw�cher (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC tr�gt Waffe des schw�cheren NSCs ->	NSCs verlangt die Waffe	zur�ck ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	Schei�-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	st�rkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zur�ck

	VAR	STRING	TheyKilledMyFriend;			// NSC T�ter - NSC zu Opfer freundlich, zu T�ter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat geh�rt, da� der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Sch�tzling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/geh�rt hat, da� ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon geh�rt, da� Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann m�ssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde get�tet
	var	STRING	YouKilledEBr;				// Erzbaron get�tet
	VAR	STRING	YouKilledGur;				// Guru get�tet
	VAR	STRING	YouKilledMage;				// Guru get�tet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler get�tet.
	VAR	STRING	YouKilledNCfolk;			// S�ldner, Organisator, Sch�rfer oder Bauer get�tet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize get�tet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz sch�n	gepl�ttet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zuf�llig zu "Dialogen" zusammengew�rfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, da� das �rger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's f�r Dich, mu� nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte mu� wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man mu� eben aufpassen was man rumerz�hlt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man h�rt...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...fr�her w�re das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich h�r nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verla� Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, da� sich daran was �ndern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das w�re schon lange gekl�rt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...la� uns lieber �ber was anderes reden...
	VAR	STRING	Om;							// Ommm (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit R�cken zu dir)                                   
	var string	SC_HeyWaitASecond;			//SC: Warte mal! (Nsc im vorgeigehen anhalten)                                            
	var string DoesntWork;				
	var string PickBroke;				
	var string NeedKey;					
	var string NoMorePicks;				
	var string InvFull;					

};


instance SVM_0 (C_SVM)				// wird nur intern gebraucht...
{

};


// ********************************
// 		Die SVM-Instanzen		(ToDo: News noch �berarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese m�ssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Sch�rfer)	N�rgler, Alkoholiker, schimpft �ber	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//Arr�te cette sorcellerie !
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Veux-tu te battre ? Arr�te �a !!!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Range cette arme !
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//�loigne cette arme !!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Abaisse ta garde !!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Si tu veux des ennuies, vise-moi juste encore une fois !
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Attention ! essaye encore et je te tranche la gorge.
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Oublions ce petit argument, d'accord ?
	Strange						=	"SVM_1_Strange"						;//Va t'en, sale m�cr�ant !
	DieMonster					=	"SVM_1_DieMonster"					;//Maudit fils de chienne !
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Maintenant tu es fais !
	NowWait						=	"SVM_1_NowWait"						;//Maintenant tu vas payer...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Il semble que tu vas souffrir !
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//C'est toi qui l'a cherch� !
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Maintenant je vais �tre s�r qu'ils vont te mettre en pi�ces.
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Je t'avais averti de rester loin de mes affaires !
	DirtyThief					=	"SVM_1_DirtyThief"					;//JE vais t'avoir, sale voleur !
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Personne ne se moque de mes hommes !
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Tu as mit KO un de nous. Je vais TE mettre KO !
	Dead						=	"SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_1_YesYes"						;//Ne panique pas ! Tu as gagn� !
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Merde ! Cours aussi vite que possible !
	Help						=	"SVM_1_Help"						;//Mal�diction !
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Nous nous retrouverons !
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Essaye encore et tu le regretteras.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Belle arme ! Donne la moi !
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Merci pour le minerai, h�ro !
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Pauvre d�bris, tu n'a m�me pas de minerai sur toi !
	HandsOff					=	"SVM_1_HandsOff"					;//H�, bas les pattes !
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Fais toi une balafre !
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//H� ! Comment es-tu arriv� ici ?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Tu me prends pour un demeur� ?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//H�, toi ! Qu'est-ce que tu fouines par l� ?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Sort de ma cabane ou j'appelle les gardes !
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Tu n'as rien � faire ici ! D�gage !
	WiseMove					=	"SVM_1_WiseMove"					;//Sage gar�on !
	Alarm						=	"SVM_1_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_1_BehindYou"					;//Derri�re toi !
	TheresAFight				=	"SVM_1_TheresAFight"				;//Ah, un combat !
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_1_CheerFight"					;//Tu combats comme une femme !
	CheerFriend					=	"SVM_1_CheerFriend"					;//Fini le !!
	Ooh							=	"SVM_1_Ooh"							;//Riposte !
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Montre-lui !
	RunCoward					=	"SVM_1_RunCoward"					;//Revient, mon grand !
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Il en a eu assez !
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Fait-lui voir !
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Pourquoi tu l'as tu� ? Toi aussi tu le m�rites !
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Beau combat !
	Awake						=	"SVM_1_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Bonjour
	ALGreetings					=	"SVM_1_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_1_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_1_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Il est l�.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Revient d�s que tu as plus d'exp�rience.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_1_HeyYou"						;//H�, toi !
	NotNow						=	"SVM_1_NotNow"						;//Pas maintenant !
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Je peux faire quelque chose pour toi ?!
	MakeWay						=	"SVM_1_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Hors de mon chemin, mon gars !
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Es-tu sourd ? BOUGE TOI !!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//De nouveau � la recherche d'ennuies ?
	LookAway					=	"SVM_1_LookAway"					;//Uhhhhh ! Je n'ai rien vu !
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//D'accord, d'accord ! Garde-le !
	WhatsThat					=	"SVM_1_WhatsThat"					;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Tu cours alentour avec MON arme !
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Donne moi �a !
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Alors garde-la ! Je n'en ai pas besoin de toute fa�on !
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Enfer, pourquoi me r�veilles-tu ?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Qu'est ce que tu fais ? Sers toi en bien !
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Tu as frapp� le Baron du minerai ! Tu l'a rendu fou !
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Tu as frapp� un Sage. Il semble que tu attires les probl�mes comme un aimant !
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//�tre victorieux contre un magicien est vraiment une id�e idiote !
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Tu ne peux pas juste te balader et taper les novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Laisse mes hommes tranquille !
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Tu as frapp� mon ami...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Ce que tu fais ne peut �tre tol�r� ici !
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Si tu frappes quelqu'un sous ma protection tu en subiras les cons�quences !
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Tu m'as vol�, ordure ! Ne recommence plus !
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Nous voulons nos affaires ! Rend les nous !
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Tu as vol� le Baron du minerai ! Pourquoi diable as-tu fais �a ?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Tu as vol� les Sages ? Quelle idiotie qu'il t'ont prit sur le faite.
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Tu as vol� les magiciens ! Quelle id�e vraiment stupide !
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Un de nous est mort et tu as a voir quelque chose la dedans ! Fait la moindre erreur et tu es fais !
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Tu as tu� un magicien ! Comment imagines-tu expliquer �a ?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononc� en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//Ce fut un combat �quitable ! Tu m'a vraiment flanqu� une racl�e !
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ... la pire merde ...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ... peut-�tre, mais qui s'en soucie ? ...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ... totalement idiot ...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ... pourquoi cela arrive t'il encore et encore ? ...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ... ne parle pas tant, ouais, ouais, ouais ...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ... tu ne devrais pas croire n'importe quoi ...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ... tu cherches la bagarre et tu la trouves, c'est logique ...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se pr�cipiter ...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_1_Om"							;//Ommm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einsch�chterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//Pas de sorcellerie !
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//H� ! J'ai dit pas de magie !
	WeaponDown					=	"SVM_2_WeaponDown"					;//Dis donc, range ce truc !
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Rengaine cette arme !
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Regarde ce que tu vises !
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Si tu continues � me viser, je vais le prendre personnellement !
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//H�, c'est pour quoi faire ??
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Oublions �a, d'accord ?
	Strange						=	"SVM_2_Strange"						;//�trange ! O� est-il parti ?!
	DieMonster					=	"SVM_2_DieMonster"					;//Un autre !
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//J'ai bien peur de devoir t'�liminer !
	NowWait						=	"SVM_2_NowWait"						;//C'est ta propre faute !
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Tu n'en as pas eu assez ?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Si c'est ce que tu veux vraiment !
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Tu sais que tu n'as rien � faire ici !
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Pourquoi joue-tu avec les choses qui ne sont pas les tiennes ?!
	DirtyThief					=	"SVM_2_DirtyThief"					;//Tu m'as vol� ! Je ne l'oublierai pas !
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Personne n'attaque mes hommes !
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Tu as tu� l'un d'eux ! Tu dois payer pour cela !
	Dead						=	"SVM_2_Dead"						;//Aaargl
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_2_YesYes"						;//Doucement, doucement, tu as gagn� !
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Je - ehm - juste un peu d'aide !
	Help						=	"SVM_2_Help"						;//Je n'ai pas le temps, j'ai des choses � faire !
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Je suis s�r que nous nous rencontrerons de nouveau !
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//N'essaye pas de nouveau !
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Je prendrai cette arme !
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//Tu n'as pas besoin de tout ce minerai de toute fa�on !
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Tu n'as pas de minerai ? Ce n'est pas ton jour de chance aujourd'hui !
	HandsOff					=	"SVM_2_HandsOff"					;//L�che �a !
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//H� ! Comment es-tu arriv� ici ?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Ce n'est pas tr�s intelligent de me prendre pour un imb�cile !
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Pourquoi fouines-tu par ici ?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Sort de ma cabane ou j'appelle les gardes !
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Sort de ces cabanes !
	WiseMove					=	"SVM_2_WiseMove"					;//Bonne d�cision !
	Alarm						=	"SVM_2_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//ALERTE !!
	BehindYou					=	"SVM_2_BehindYou"					;//Derri�re toi !
	TheresAFight				=	"SVM_2_TheresAFight"				;//Ah, un combat !
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//Est-ce tout !
	CheerFight					=	"SVM_2_CheerFight"					;//R�veille-toi, lambin !
	CheerFriend					=	"SVM_2_CheerFriend"					;//Bon Coup !
	Ooh							=	"SVM_2_Ooh"							;//�a doit faire mal !
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Il bouge toujours .
	RunCoward					=	"SVM_2_RunCoward"					;//Reste ici !
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Il en a eu assez !
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Il l'a m�rit� !
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Tu l'as tu� ! C'�tait n�cessaire ?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//C'�tait un bon combat, juste trop court !
	Awake						=	"SVM_2_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Bonjour.
	ALGreetings					=	"SVM_2_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_2_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_2_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Par ici.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_2_HeyYou"						;//H�, toi !
	NotNow						=	"SVM_2_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Puis-je faire quelque chose pour toi ?
	MakeWay						=	"SVM_2_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Fait toi rare ou je t'�crase !
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_2_LookAway"					;//Je n'ai RIEN vu ! AUCUN probl�me !
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//D'accord ! C'est � toi !
	WhatsThat					=	"SVM_2_WhatsThat"					;//H� ? Que ?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Cela ressemble � mon arme ce que tu portes !
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Aller, donne-la-moi !
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//Je n'en aurai pas besoin de toute fa�on !
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Quelqu'un a tu� l'un de nous.Si nous l'attrapons il es fait !
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Pourquoi m'as-tu r�veill� ?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Tu as �t� battu ! Je dois l'admettre, j'aime �a !
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Tu as battu le Baron du minerai !
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Battre un Sage ! Je ne sais pas si c'est courageux ou fou !
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois �tre brave !
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Je m'assure qu'il y a de l'ordre ici !
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Dans tous les cas ! Si tu frappes un mineur, tu auras des ennuis !
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Tu as frapp� un de mes amis !
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Laisse les novices tranquilles !
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Ne pas taper mes hommes ! Compris ?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Pourquoi m'as-tu vol� ?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Tu as pris quelque chose qui nous appartient. Nous voudrions le reprendre !
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Mec ! Tu as vol� le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Tu as vol� les Sages ! Tu as de la chance de pas t'�tre fait attraper !
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Les magiciens n'aiment pas les gens qui fouinent autour de leurs affaires !
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une autre petite erreur et c'est ton tour !
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Tu as tu� un magicien ! Comment imagines-tu expliquer �a ?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a �t� mentionn� en rapport � cette affaire...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//La Confr�rie compte un croyant de moins, et tu l'as sur la conscience !
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Sais-tu a quel point c'est difficile ?!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//D'accord, tu m'as battu. C'�tait un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ... je n'�coute plus toutes ces rumeurs ...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ... attends. Il ne faut pas se pr�cipiter ...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_2_Om"							;// Ommm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gem�se. "Ich schau noch�n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Arr�te cette magie !
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Arr�te cette magie maintenant.
	WeaponDown					=	"SVM_3_WeaponDown"					;//Range cette arme !
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Je vais me mettre de mauvaise humeur si tu continue � te balader avec cette arme !!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Pourquoi me vises-tu ?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Put the weapon down or I will get ugly!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//H����� ! C'est pour quoi faire ??
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Bon d'accord, consid�rons cet argument comme un malentendu.
	Strange						=	"SVM_3_Strange"						;//Il est parti, il a disparu ?!
	DieMonster					=	"SVM_3_DieMonster"					;//Sale chien. Tu ne me d�rangera pas plus longtemps !
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//tu va bient�t rejoindre les vers de terre !
	NowWait						=	"SVM_3_NowWait"						;//Il semble que je dois devenir plus clair !
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Apparemment tu n'en as pas eu assez !
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Tu l'a cherch� !
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Tu n'as rien a faire ici ! Maintenant je dois te corriger !
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Supposons que je dois te couper les doigts, c'est apparemment le seul langage que tu comprends !
	DirtyThief					=	"SVM_3_DirtyThief"					;//Tu m'as vol� ! J'y crois pas !
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Tu ne peux pas taper tous les gens que tu croises, ici !
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Tu as tu� un des n�tres ! C'est ta derni�re erreur !
	Dead						=	"SVM_3_Dead"						;//Aaargl
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_3_YesYes"						;//Tu as gagn� ! D'accord !
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Merde ! Cours aussi vite que possible !
	Help						=	"SVM_3_Help"						;//Je dois y aller !
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Nous nous retrouverons !
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Ne refais plus jamais �a !
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Merci pour l'arme !
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Je vais juste te prendre ton minerai !
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Pas de minerai ? C'est triste, mec, tr�s triste !
	HandsOff					=	"SVM_3_HandsOff"					;//L�che �a !
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//D�gage !
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//H� ! D'o� sors-tu ?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Je ne suis pas aussi stupide que tu le crois !
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Arr�te de fouiner par ici !
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Sort de ma cabane ou j'appelle les gardes !
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Que fais-tu ? Si je t'attrape, tu es fait !
	WiseMove					=	"SVM_3_WiseMove"					;//Bien, tu sais ce qui est bon pour toi !
	Alarm						=	"SVM_3_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ALERTE !!
	BehindYou					=	"SVM_3_BehindYou"					;//Attention !
	TheresAFight				=	"SVM_3_TheresAFight"				;//Un combat !
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Tape-le !
	CheerFight					=	"SVM_3_CheerFight"					;//Qu'essayes-tu de faire ?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Bon Coup !
	Ooh							=	"SVM_3_Ooh"							;//Ooooh !
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Oui ! Bien jou� !
	RunCoward					=	"SVM_3_RunCoward"					;//Il s'�chappe !
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//Il s'est �chapp� !
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//C'est ce que tu as m�rit� !
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Il ne bouge plus. Tu l'a tu�.
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Rien d'autre que se battre ...
	Awake						=	"SVM_3_Awake"						;//Un nouveau jour et rien n'a chang� ...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//H�, mec.
	ALGreetings					=	"SVM_3_ALGreetings"					;//Pour Gomez, ouais, ouais.
	MageGreetings				=	"SVM_3_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_3_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Il est l�.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Tu n'as pas assez d'exp�rience. Je ne peux pas t'enseigner �a !
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_3_HeyYou"						;//H�, toi !
	NotNow						=	"SVM_3_NotNow"						;//Pas maintenant !
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Tu veux quelque chose ?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Puis-je faire quelque chose pour toi ?
	MakeWay						=	"SVM_3_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Hors de mon chemin, mon gars !
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Combien de fois ? Laisse-moi passer !
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_3_LookAway"					;//Je n'ai RIEN vu ! Je ne suis m�me pas l� !
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//D'accord, d'accord, garde-la !
	WhatsThat					=	"SVM_3_WhatsThat"					;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Tu as mon arme !
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Quoique tu dises ! Je n'en ai plus besoin.
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Ils ont tu� un des n�tres. Personne ne sortira vivant d'ici...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Pourquoi m'as-tu tir� de mes r�ves ?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Tire des le�ons de tes d�faites !
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Tu as vaincu le Baron du minerai ! Tu es dans la merde !
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Tu as tu� un des Sages. Ils en tiendront compte contre toi !
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Vaincre un magicien signifie de gros ennuies !
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//La prochaine fois tu laissera les novices tranquilles !
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Si tu frappes un mineur, je devrais faire la m�me chose avec toi !
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Tu as tap� un de mes amis !
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Les novices sont sous ma protection ! Laisse-les tranquilles !
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Les mineurs me payent pour ne pas avoir d'ennuies ! Je ferais en sorte que �a reste comme �a !
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Tu m'as vol�, sale brigand !
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Mec ! Tu as vol� le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Tu as vol� les Sages ! C'est idiot qu'ils t'ont attrap�.
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Tu dois �tre plus rapide pour voler un magicien !
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Tu as tu� un magicien ! Comment expliques-tu �a ?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a �t� mentionn� en rapport � cette affaire ...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//Ce fut un bon combat ! Ce n'est pas grave si tu m'as battu !
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se pr�cipiter ...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_3_Om"							;// Ommm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Gr�nschn�beln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Arr�te cette magie !
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Tu ferais mieux de suivre mes conseils et d'arr�ter cette magie !
	WeaponDown					=	"SVM_4_WeaponDown"					;//Range ton arme si tu ne veux pas d'ennuies !
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Maintenant range cette arme !
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Tu devrais faire attention o� tu pointes cette arme !
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Si tu n'arr�te pas je vais te prendre ton jouet !
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//H� l�-bas! Je te surveille !
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Oublions notre querelle !
	Strange						=	"SVM_4_Strange"						;//Sort de l� ! Montre-toi !
	DieMonster					=	"SVM_4_DieMonster"					;//La quantit� que tu tue n'est pas importante, ils arrivent !
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//Tu ne vivras pas plus vieux !
	NowWait						=	"SVM_4_NowWait"						;//Je vais t'apprendre � m'ennuyer ...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Tu n'en as pas eu assez ?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Tu l'as cherch� !
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//C'est vraiment stupide de ta part d'�tre venu ici !!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Tu ne peux rester impunie !
	DirtyThief					=	"SVM_4_DirtyThief"					;//Tu as os� me voler !
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Nous chercher des noises ne va rien t'apporter de bon.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Tu as tu� un des notres ! Oeil pour oeil !
	Dead						=	"SVM_4_Dead"						;//Aaargl
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Tu vas le regretter !
	YesYes						=	"SVM_4_YesYes"						;//Du calme, tu as gagn� !
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Partons d'ici rapidement !
	Help						=	"SVM_4_Help"						;//Je deviens trop vieux pour �a !
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Je n'oublierais pas �a !
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Ne recommence plus �a !
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Je ferais mieux de prendre cette arme avec moi !
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Je prendrai plus soins de ton minerai que toi !
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//M�me pas la moindre petite p�pite de minerai.
	HandsOff					=	"SVM_4_HandsOff"					;//L�che �a !
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Fais toi une balafre !
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Tu n'as rien � faire ici !
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Je ne suis pas d'humeur � ces plaisanteries !
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//H�, toi ! Qu'est-ce que tu fouines ?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Sort de l� ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_4_WiseMove"					;//Tu as eu de la chance.
	Alarm						=	"SVM_4_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//UN INTRU !!!
	BehindYou					=	"SVM_4_BehindYou"					;//Derri�re toi !
	TheresAFight				=	"SVM_4_TheresAFight"				;//Encore un autre combat.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_4_CheerFight"					;//C'est tout ce que tu peux faire ?!
	CheerFriend					=	"SVM_4_CheerFriend"					;//Montre-lui !
	Ooh							=	"SVM_4_Ooh"							;//Contre attaque !
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Bien jou� !
	RunCoward					=	"SVM_4_RunCoward"					;//Ce l�che s'enfuit !
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Quand j'�tais jeune, les gens �taient costauds !
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//C'est notre propre faute !
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Tu l'as tu� ! Grossi�re erreur !
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//A l'�poque, les combats �taient meilleurs.
	Awake						=	"SVM_4_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Salutations.
	ALGreetings					=	"SVM_4_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_4_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_4_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Tu le trouveras par l� !
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Tu vaut mieux que �a !
	HeyYou						=	"SVM_4_HeyYou"						;//H� toi !
	NotNow						=	"SVM_4_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Tu veux quelque chose ?
	MakeWay						=	"SVM_4_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Hors de mon chemin ou tu vas le regretter !
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_4_LookAway"					;//Ne pas voir le d�mon, ne pas entendre le d�mon, ne pas parler au d�mon ...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Garde-la !
	WhatsThat					=	"SVM_4_WhatsThat"					;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Sois gentil et rend moi mon arme !
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Aller, donne-la-moi !
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Bon ! Je suis content de m'en �tre d�barrass�e !
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Si je trouve celui qui a tu� un des notres ...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Tu d�ranges mon repos !
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Tu es battu ! Tu ferais mieux de voir ailleurs si tu y es !
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Tu as battu le Baron du minerai !
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Tu as vaincu un des Sages. Je suis impressionn�. Mais ne recommence plus jamais �a.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois �tre brave !
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Tu dois �tre malade d'avoir frapp� un novice comme �a.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Que crois-tu faire, taper un mineur ?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Tu t'es embrouill� avec un de mes amis ! C'est risqu� !
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Tu es trop brave, touch� � un prot�g� peut �tre tr�s dangereux pour toi.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Laisse mes affaires tranquilles, compris ?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Tu as pris quelque chose � nous. Rend le nous !
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Mec ! Tu as vol� le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Tu as vol� les Sages ! Au moins tu ne t'es pas fait attrap� !
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Les magiciens n'aiment pas les gens qui fouinent autour de leurs affaires !
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Tu as tu� un magicien ! Comment imagines-tu expliquer �a ?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a �t� mentionn� en rapport � cette affaire ...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//Il y a une autre cabane de libre dans le Nouveau Camp, et il semble que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//La Confr�rie compte un croyant de moins, et tu l'as sur la conscience !
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Tu m'as donn� du fil � retordre. Ce fut un bon combat. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ... attends. Il ne faut pas se pr�cipiter ...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_4_Om"							;//Ommm
};


instance SVM_5 (C_SVM)				//Lebensk�nstler, offen, Fr�hlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewu�t, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//Tu ferais mieux arr�ter cette magie !
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Quand je dis 'arr�te cette magie', tu le fais !
	WeaponDown					=	"SVM_5_WeaponDown"					;//Que veux-tu faire avec cette arme, mec !
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Dis donc, range ce truc !
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Tu me vises, esp�ce de crapule !
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Si tu arr�te pas �a, je m'exercerai sur toi !
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//H�, t'es aveugle ou quoi ?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Oublions ce petit argument, d'accord ?
	Strange						=	"SVM_5_Strange"						;//Mais il �tait l� il y a un instant !? �trange !
	DieMonster					=	"SVM_5_DieMonster"					;//C'est ton tour maintenant, salopard !
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//C'est jour de paye !
	NowWait						=	"SVM_5_NowWait"						;//Tu as demand� une racl�e urgente !
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Tu n'en as pas eu assez ?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//D'accord, tu l'as cherch� !
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Ils vont te jeter dehors !
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Je t'ai pr�venu. Si tu touches � mes affaires, tu vas avoir des ennuis !
	DirtyThief					=	"SVM_5_DirtyThief"					;//Voleur ! Je vais t'apprendre les bonnes mani�res !
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Personne ne frappe mes hommes sans �tre d�sol� apr�s !
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Tu as tu� un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_5_Dead"					;//Aaargl
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_5_YesYes"						;//Tranquille ! Tu as gagn�.
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//Il est trop fort pour moi !
	Help						=	"SVM_5_Help"						;//Mal�diction !
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//La prochaine fois, ce sera diff�rent !
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//N'essaye pas de nouveau !
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//J'aime cette arme !
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Je ferais en sorte que ton minerai soit bien investi !
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Pas de chance ! Pas de minerai !
	HandsOff					=	"SVM_5_HandsOff"					;//L�che �a !
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//H� ! D'o� sors-tu ?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Bonne blague !
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Qu'est-ce que tu fouines ?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Hors d'ici ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Tu n'as rien a faire ici !
	WiseMove					=	"SVM_5_WiseMove"					;//Tu apprends vite !
	Alarm						=	"SVM_5_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ALERTE !!!!
	BehindYou					=	"SVM_5_BehindYou"					;//H�, L� !
	TheresAFight				=	"SVM_5_TheresAFight"				;//Un combat !
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Frappez-le !
	CheerFight					=	"SVM_5_CheerFight"					;//Bien !
	CheerFriend					=	"SVM_5_CheerFriend"					;//Frappez-le encore maintenant !
	Ooh							=	"SVM_5_Ooh"							;//Attention !
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//C'�tait juste !
	RunCoward					=	"SVM_5_RunCoward"					;//Ce gars se faufile !
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Bon gagnant, je dirai !
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Il l'a m�rit� !
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Tu tue les gens. Tu vas avoir des ennuis !
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Quel combat !
	Awake						=	"SVM_5_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Bonjour, ami !
	ALGreetings					=	"SVM_5_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_5_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_5_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Par ici.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Je ne peux t'apprendre rien du tout car tu es trop inexp�riment�.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_5_HeyYou"						;//H�, toi !
	NotNow						=	"SVM_5_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Puis-je t'aider ?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Qu'est-ce que tu veux ?
	MakeWay						=	"SVM_5_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Aller, je veux passer !
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Es-tu idiot ou cherches-tu les ennuis ?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_5_LookAway"					;//Je n'ai RIEN vu... Pourquoi, que c'est t'il pass� ?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//D'accord, garde-la !
	WhatsThat					=	"SVM_5_WhatsThat"					;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Je pr�f�rerai reprendre mon arme !
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Donne la moi !
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Hmm, ce n'est pas si mauvais ! J'en veux plus !
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//H�, c'est pour quoi faire ? Pourquoi me r�veilles-tu ?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//H� ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Tu as vaincu Baron du minerai. Il a �t� impressionn� !
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Tu as vaincu un des Sages. Je suis impressionn�. Mais ne recommence plus jamais �a.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois �tre brave !
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Tu dois �tre malade d'avoir frapp� un novice comme �a.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Que crois-tu faire, taper un mineur ?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Tu as frapp� mon ami, pourquoi faire ?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Tu es trop courageux, toucher � un de mes prot�g�s peut �tre tr�s dangereux.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Mec ! Tu as vol� le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Tu as vol� les Sages ! Au moins tu ne t'es pas fait attrap� !
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Les magiciens n'aiment pas les gens qui fouinent autour de leurs affaires !
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Tu as tu� un magicien ! Comment expliques-tu �a ?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononc� en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Tu m'as donn� du fil � retordre. Ce fut un bon combat. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ... ce n'est pas vraiment mon probl�me ...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se pr�cipiter ...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_5_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Gr�lt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//Arr�te cette sorcellerie !
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Arr�te cette magie ! De suite !!
	WeaponDown					=	"SVM_6_WeaponDown"					;//�loigne cette arme !
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Tu veux que je te corrige ? �loigne cette arme !!!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Abaisse cette chose ou tu auras des ennuis !
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Laisse cette arme point�e sur moi si tu veux que je mette une racl�e !
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//H�! Attention !
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//H�, mec ! Oublions cet incident d'accord ?
	Strange						=	"SVM_6_Strange"						;//Sort de l� ! Montre-toi !
	DieMonster					=	"SVM_6_DieMonster"					;//Je vais te transformer en viande hach�e, sale porc !
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Maintenant tu es fais !
	NowWait						=	"SVM_6_NowWait"						;//Maintenant tu vas payer...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Il semble que tu vas souffrir !
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Tu l'as cherch� !
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Maintenant je vais te d�couper !
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Je t'ai pr�venu. Si tu touches � mes affaires, tu vas avoir des ennuis !
	DirtyThief					=	"SVM_6_DirtyThief"					;//Voleur ! Je vais t'achever !
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Personne n'attaque mes hommes !
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Tu as tu� un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_6_Dead"						;//Aaargl
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_6_YesYes"						;//D'accord, d'accord ! Pas de panique ! Tu as gagn�.
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Enfer, Quel brute ! Sortez de l� !
	Help						=	"SVM_6_Help"						;//Mal�diction !
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Tu apprendras � me conna�tre !!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Essaye encore et tu le regretteras.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Cette arme a l'air commode !
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Merci pour le minerai, je boirai � ta sant� !
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Merde, il n'a pas de minerai sur lui...
	HandsOff					=	"SVM_6_HandsOff"					;//L�che �a !
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//H� ! D'o� sors-tu ?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Ouais, tu me crois stupide ?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//H� ! Que fouilles-tu ?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Sors ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_6_WiseMove"					;//C'est chanceux !
	Alarm						=	"SVM_6_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_6_BehindYou"					;//Derri�re toi !
	TheresAFight				=	"SVM_6_TheresAFight"				;//Ah, un combat !
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_6_CheerFight"					;//Tu combats comme une femme !
	CheerFriend					=	"SVM_6_CheerFriend"					;//Fini le !!
	Ooh							=	"SVM_6_Ooh"							;//Ne t'amuse pas avec lui ! Tranche lui la gorge !
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Maintenant ach�ve-le. Oui, il bouge encore !
	RunCoward					=	"SVM_6_RunCoward"					;//L�che, revient !
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Il en a eu assez !
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Fait-lui voir !
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Tu es aussi bien mort ! �a t'apprendra � tuer les gens.
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha  ha ! Tu lui as montr� !
	Awake						=	"SVM_6_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Bonjour.
	ALGreetings					=	"SVM_6_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_6_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_6_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Il est l�.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_6_HeyYou"						;//H�, toi !
	NotNow						=	"SVM_6_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Tu veux quelque chose ?
	MakeWay						=	"SVM_6_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Aller, bouge !
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Recule ! Ou souhaites-tu que je te tape la t�te ?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Tu cherches encore des ennuis ?
	LookAway					=	"SVM_6_LookAway"					;//Je n'ai rien vu ! vraiment !
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//D'accord d'accord, garde les affaires !
	WhatsThat					=	"SVM_6_WhatsThat"					;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Rend-moi juste mon arme, bouffon !
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Rend-moi la, mec !
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Pas grave ! Je n'en ai plus besoin de toute fa�on !
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Enfer, pourquoi me r�veilles-tu ?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Tu as aim� ta d�faite ? rappelles-toi en bien !
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Tu as frapp� le Baron du minerai ! Tu l'a rendu fou !
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Tu as frapp� un Sage. Il semble que tu attires les probl�mes comme un aimant !
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Etre victorieux contre un magicien est vraiment une id�e idiote !
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Tu ne peux pas juste te balader et taper les novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Laisse mes hommes tranquille !
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Tu as frapp� un de mes amis !
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Ce que tu fais ne peut �tre tol�r� ici !
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Si tu frappes quelqu'un sous ma protection tu en subiras les cons�quences !
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Salopard, tu m'as vol� ! Ne recommence plus !
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Nous voulons nos affaires ! Rend-les nous !
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Tu as vol� le Baron du minerai ! Pourquoi diable as-tu fais �a ?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Tu as vol� les Sages ? Quelle idiotie qu'il t'ont prit sur le faite.
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Tu as vol� des magiciens ! Une id�e idiote !
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Un de nos hommes est mort et tu es impliqu�. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Tu as tu� un magicien ! Comment expliques-tu �a ?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a �t� mentionn� en rapport � cette affaire ...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//D'accord, tu m'as battu. C'�tait un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ... n'�coute pas les rumeurs ...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ... attends. Il ne faut pas se pr�cipiter ...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_6_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//�loigne �a ! �loigne �a !!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//�loigne cette magie, �loigne la !!
	WeaponDown					=	"SVM_7_WeaponDown"					;//�loigne cette arme, �loigne la !
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Je suis s�rieux ! Va t'en avec �a !
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Me vises-tu ? Attention !
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Tu crois que tu peux m'intimider ? R�fl�chi encore !
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Je m'en souviendrai ! Attention !
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Oublions �a, d'accord ?
	Strange						=	"SVM_7_Strange"						;//O� est-il pass� ? �a ne se peut ! C'est impossible !!
	DieMonster					=	"SVM_7_DieMonster"					;//Je t'aurai, ordure !
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Et voil� ! C'est ton tour maintenant ! Pas de piti� !
	NowWait						=	"SVM_7_NowWait"						;//Finalement tu m'as donn� raison !
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Tu ne veux pas recommencer, n'est-ce pas ?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Du sang ! Ton sang !!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Je vais te d�couper en morceau !
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Je devrais t'arracher les doigts !
	DirtyThief					=	"SVM_7_DirtyThief"					;//Sale voleur ! Je veux te voir souffrir !
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Personne de frappe personne ici � part moi !
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Tu as tu� un des notres !
	Dead						=	"SVM_7_Dead"						;//Aaargl
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Tu n'aura pas assez de temps pour �tre d�sol� !
	YesYes						=	"SVM_7_YesYes"						;//D'accord, d'accord !
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Je n'ai pas la bonne arme. Nous nous rencontrerons � nouveau ...
	Help						=	"SVM_7_Help"						;//Mal�diction !
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Je te retrouverai !
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Plus jamais �a !
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Je garde cette arme !
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Je pr�f�rerai te tuer, mais le minerai n'est pas mal non plus !
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Pas de minerai ? Tu sers � rien mec !
	HandsOff					=	"SVM_7_HandsOff"					;//L�che �a !
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Arr�te ! Sors de l� !
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Comment es-tu venu ici ?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Tu aimes vraiment avoir un avantage sur moi, n'est-ce pas ?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//H�, toi ! Qu'est-ce que tu fouines par l� ?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Fait toi petit ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Tu n'as rien a faire ici !
	WiseMove					=	"SVM_7_WiseMove"					;//Tu as de la chance ! Mais j'aurai aimer te refaire le portrait !
	Alarm						=	"SVM_7_Alarm"						;//Gardes, par ici !
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ALERTE !!
	BehindYou					=	"SVM_7_BehindYou"					;//Derri�re toi !
	TheresAFight				=	"SVM_7_TheresAFight"				;//Un combat !
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_7_CheerFight"					;//Je veux voir du sang !
	CheerFriend					=	"SVM_7_CheerFriend"					;//�crasez-le !!
	Ooh							=	"SVM_7_Ooh"							;//Contre-attaquez, bande d'idiot !
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Yeaah !!!
	RunCoward					=	"SVM_7_RunCoward"					;//Rentre chez ta m�re !!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Il en a eu assez !
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//C'est notre propre faute !
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//C'est du suicide de tu� quelqu'un devant t�moin.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Beau combat !
	Awake						=	"SVM_7_Awake"						;//C'est l'heure de se lever de nouveau !
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Bonjour
	ALGreetings					=	"SVM_7_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_7_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_7_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Es-tu aveugle ? Par ici !
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_7_HeyYou"						;//H�, toi !
	NotNow						=	"SVM_7_NotNow"						;//Pas maintenant !
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Que veux-tu de moi ?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Je peux faire quelque chose pour toi ?!
	MakeWay						=	"SVM_7_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Tu cherches des ennuis ? Sors d'ici !
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_7_LookAway"					;//Je n'ai RIEN vu !
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//D'accord, d'accord ! Garde-le !
	WhatsThat					=	"SVM_7_WhatsThat"					;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Rend moi mon arme !
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//D'accord ! Garde-la ! Je trouverai une autre solution !
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Un des notres est mort ! Vengeance !
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Pourquoi m'as-tu r�veill� ?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Tire des le�ons de tes d�faites !
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Tu as frapp� le Baron du minerai ! Tu l'a rendu fou !
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Tu as frapp� un Sage. Tu attires les ennuis comme un aimant !
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Etre victorieux contre un magicien est vraiment une id�e idiote !
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Alors tu es celui qui a frapp� les novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Laisse mes hommes tranquille !
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Tu as tap� la mauvaise personne ! Nous allons souffrir ensemble !
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Ce que tu fais ne peut �tre tol�r� ici !
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Si tu frappes quelqu'un sous ma protection tu en subiras les cons�quences !
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Salopard, tu m'as vol�! Ne recommence plus �a !
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Nous voulons nos affaires ! Rend les nous !
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Tu as vol� le Baron du minerai ! Pourquoi diable as-tu fais �a ?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Tu as vol� les Sages ? Quelle idiotie qu'il t'ont prit sur le faite.
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Tu as vol� les magiciens ! Une id�e v�ritablement ignoble !
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Un de nos hommes est mort et tu es impliqu�. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Tu as tu� le Baron du minerai ! Mec, tu es compl�tement malade !
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Tu as tu� un magicien ! Comment imagines-tu expliquer �a ?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononc� en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//D'accord, tu m'as battu. C'�tait un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ... ce n'est pas vraiment mon probl�me ...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ... C'est normal qu'il trouve les ennuis ...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ... je n'�coute plus toutes ces rumeurs ...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ... h� bien, attends. Ne te pr�cipite pas ...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_7_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, n�chtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//n'essaie pas de sorcellerie sur moi !
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Arr�te, j'ai dit ! Une fois !
	WeaponDown					=	"SVM_8_WeaponDown"					;//Range cette arme !
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//�loigne �a de moi ou tu es fais !
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Range cette arme, idiot !
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Tu oses me viser ?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Attention !
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//D'accord, oublions cela.
	Strange						=	"SVM_8_Strange"						;//Sors de l� ! Je sais que tu m'entends !
	DieMonster					=	"SVM_8_DieMonster"					;//Maudites cr�atures !
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Maintenant tu vas mourir. Ne le prend pas personnellement !
	NowWait						=	"SVM_8_NowWait"						;//Sale vermine, tu m'attaques MOI ! Attend un peu ...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Je ne t'ai pas fait mordre la poussi�re une fois ? Alors reprend �a ...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Si tu n'�coutes pas, tu vas au moins sentir !
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Tu oses venir par ici ? Attend une seconde !
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Suppose que je doive briser tes doigts !
	DirtyThief					=	"SVM_8_DirtyThief"					;//Tu n'aurais pas d� voler �a !
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Personne ne frappe mes hommes sans �tre d�sol� apr�s !
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Tuer un des autres sera ta derni�re erreur !
	Dead						=	"SVM_8_Dead"						;//Aaargl
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Tu vas vraiment �tre d�sol� de �a !
	YesYes						=	"SVM_8_YesYes"						;//Doucement. Tout va bien !
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Je pr�f�rerai plut�t observer cette b�te � distance !
	Help						=	"SVM_8_Help"						;//Vite, dehors !
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Nous nous retrouverons !
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Recommence �a et tu es mort !
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//J'aime cette arme !
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Je crois que tu ne m'as pas encore payais de taxe de minerai !
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//�videmment, un perdant tel que toi ne vas pas avoir de minerai !
	HandsOff					=	"SVM_8_HandsOff"					;//L�che �a !
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//H�, comment es-tu entr� ici ?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Tu es vraiment un fut� petit salopard, n'est-ce pas ?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//H�, toi ! Qu'est-ce que tu fouines ?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Fait toi petit ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_8_WiseMove"					;//Tu as eu de la chance.
	Alarm						=	"SVM_8_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_8_BehindYou"					;//Derri�re toi !
	TheresAFight				=	"SVM_8_TheresAFight"				;//Allons voir qui se bat !
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_8_CheerFight"					;//Oui ! allez, viens !
	CheerFriend					=	"SVM_8_CheerFriend"					;//Bien ! Ne te rel�che pas !
	Ooh							=	"SVM_8_Ooh"							;//Te laisse pas faire ! Crache lui dessus !
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Oui, montre lui. Il bouge encore !
	RunCoward					=	"SVM_8_RunCoward"					;//Ne te remontre plus jamais ici !
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Quel combat ennuyeux !
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Fait-lui voir !
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//Ce n'�tait pas n�cessaire. Tu devras en subir les cons�quences.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//Ce fut un beau combat !
	Awake						=	"SVM_8_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Bonjour.
	ALGreetings					=	"SVM_8_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_8_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_8_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Il est l�.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_8_HeyYou"						;//H�, toi !
	NotNow						=	"SVM_8_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Puis-je faire quelque chose pour toi ?
	MakeWay						=	"SVM_8_MakeWay"						;//Je peux passer ?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//�carte toi !
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Tu veux que je te frappe la t�te ? Sors de l� !
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_8_LookAway"					;//Ahem ... Une tr�s belle vue !
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Bien ! C'est � toi.
	WhatsThat					=	"SVM_8_WhatsThat"					;//H� ? Qu'est ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Tu portes mon arme ...?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Rend la moi ! une fois !
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Garde-la, je n'en pas besoin.
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Ca va ?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//H� ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Tu as vaincu Baron du minerai. Il a �t� impressionn� !
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Tu as vaincu un des Sages. Je suis impressionn�. Mais ne recommence plus jamais �a.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois �tre brave !
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Tu sais que les novices sont sous ma protection. Et n�anmoins tu les as frapp� quand m�me ?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Si tu touches au mineurs, tu auras affaire � moi !
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Tu ne devrais pas chercher des histoires � mes amis.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Si tu attaques un de mes prot�g�s, �a peut te co�ter cher.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Mec ! Tu as vol� du minerai au Baron ! Ils vont �tre furieux !
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Tu as soulag� les Sages de plusieurs objets, n'est-ce pas ?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Tu as soulag� les magiciens de plusieurs objets, n'est-ce pas ?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Tu as tu� un magicien ! Comment expliques-tu �a ?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononc� en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//La Confr�rie compte un croyant de moins, et tu l'as sur la conscience !
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Tu m'as donn� du fil � retordre. Ce fut un bon combat. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ... il est clair qu'il allait avoir des ennuis ...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ... garde le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se pr�cipiter ...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ... Ah, je pensais que c'�tait r�gl� depuis longtemps ...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_8_Om"							;//Ommm
};


instance SVM_9 (C_SVM)				// brummig		   gem�tlicher H�ne, Besonnen, Brummiger B�r, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Je ne veux pas de magie chez moi !
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Arr�te, j'ai dit ! Une fois !
	WeaponDown					=	"SVM_9_WeaponDown"					;//Envisages-tu de m'attaquer ?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Tu veux que je te casse la figure ou tu vas ranger �a ?
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Regarde ce que tu vises !
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//�loigne �a !
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//H�! Attention !
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//�a ne me g�nera pas d'oublier ceci ...
	Strange						=	"SVM_9_Strange"						;//Montre toi. Je sais que tu peux m'entendre !
	DieMonster					=	"SVM_9_DieMonster"					;//Ces b�tes sont vraiment r�pugnantes !
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Maintenant tu es fais !
	NowWait						=	"SVM_9_NowWait"						;//Maintenant tu vas me conna�tre !
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Tu insistes !
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Si tu n'�coutes pas, tu vas au moins sentir !
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Maintenant je te tiens, intrus !
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Je t'ai pr�venu. Toucher � mes affaires signifie des ennuis !
	DirtyThief					=	"SVM_9_DirtyThief"					;//Voleur ! Je vais t'achever !
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Personne n'attaque mes hommes !
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Tu as tu� un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_9_Dead"						;//Aargh, aargh
	Aargh_1						=	"SVM_9_Aargh_1"						;//Oaargh, aargh, oorgh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh, oorgh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Oorgh, aargh
	Berzerk						=	"SVM_9_Berzerk"						;//AAARRGGGHHH !!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Tu es d�j� mort, mais tu ne le sais pas encore.
	YesYes						=	"SVM_9_YesYes"						;//Doucement. Tout va bien !
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Merde, quelle bestiole !
	Help						=	"SVM_9_Help"						;//Vite, dehors !
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//On se retrouvera.
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//La prochaine fois je te tuerai !
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Cette arme est maintenant � moi !
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Du minerai ! H� bien, c'est mieux que rien !
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Il n'a m�me pas du minerai sur lui !
	HandsOff					=	"SVM_9_HandsOff"					;//Bat les pattes, mec !
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Que fais-tu ici ?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Tu me prends pour un abruti ?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//H�, toi ! Qu'est-ce que tu fouines par l� ?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Sors ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_9_WiseMove"					;//Petit fut� pourri !
	Alarm						=	"SVM_9_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_9_BehindYou"					;//Derri�re toi !
	TheresAFight				=	"SVM_9_TheresAFight"				;//Voyons s'ils sont bons ...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Attention !
	CheerFight					=	"SVM_9_CheerFight"					;//Oui ! allez, viens !
	CheerFriend					=	"SVM_9_CheerFriend"					;//Bien !
	Ooh							=	"SVM_9_Ooh"							;//Oh, bien jou� !
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Merveilleux contr�le, mon gars !
	RunCoward					=	"SVM_9_RunCoward"					;//Ne te remontre plus jamais ici !
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//Le combat a �t� r�solu.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//C'est notre propre faute !
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//Ce n'�tait pas n�cessaire. Tu devras en subir les cons�quences.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//Ce fut un beau combat !
	Awake						=	"SVM_9_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Bonjour.
	ALGreetings					=	"SVM_9_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_9_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_9_SectGreetings"				;//�veille-toi !
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Es-tu aveugle ? Par ici !
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_9_HeyYou"						;//H�, toi !
	NotNow						=	"SVM_9_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Puis-je t'aider ?
	MakeWay						=	"SVM_9_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//�carte toi !
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Allez, hors de mon chemin !
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Encore des ennuis ? Pourquoi toujours moi ?
	LookAway					=	"SVM_9_LookAway"					;//Oh ouais ! Beau temps aujourd'hui !
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Bien ! C'est � toi.
	WhatsThat					=	"SVM_9_WhatsThat"					;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Je compte jusqu'� trois, apr�s je viens chercher mon arme.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Rend la moi ! une fois !
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Garde-la, je n'en pas besoin.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Ca va ?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//H� ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Tu as vaincu Baron du minerai. Il a �t� impressionn� !
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Tu as vaincu un des Sages. Je suis impressionn�. Mais ne recommence plus jamais �a.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois �tre brave !
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Tu dois �tre malade pour frapper un novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Que crois-tu faire, taper un mineur ?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Tu a tap� mon ami, pourquoi ?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Tu es trop courageux, toucher � un de mes prot�g�s peut �tre tr�s dangereux.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Voler nos gens est la pire erreur � faire ! Tu vas �tre d�sol� !
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Mec ! Tu as vol� le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Tu as soulag� les Sages de plusieurs objets, n'est-ce pas ?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Tu as soulag� les magiciens de plusieurs objets, n'est-ce pas ?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Tu as tu� un magicien ! Comment imagines-tu expliquer �a ?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononc� en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//La Confr�rie compte un croyant de moins, et tu l'as sur la conscience !
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Un bon combat. Ton entra�nement a �t� utile.
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ... oui, si tu le crois ...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ... Je n'�coute plus ces rumeurs ...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ... ouais, tu as probablement raison ...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se pr�cipiter ...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_9_Om"							;// Ommm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//Arr�te cette sorcellerie !
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Arr�te une fois pour toute !!!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Range cette arme !
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Que crois-tu faire ? Tu me cherches ?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Range cette arme ou tu vas �tre d�sol� !
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Si tu veux des ennuis, continue de me viser !
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//H� ! Attention ! Une de plus et tu es fais !
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//H�, mec ! Oublions �a, d'accord ?
	Strange						=	"SVM_10_Strange"						;//Sort de l� ! Montre-toi !
	DieMonster					=	"SVM_10_DieMonster"						;//Sales b�tes !
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Maintenant tu es fais !
	NowWait						=	"SVM_10_NowWait"						;//C'est jour de paye !
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//On dirait que tu veux �tre frapp� !
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//C'est toi qui l'a cherch� !
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Maintenant je te tiens, intrus !
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Je t'ai pr�venu. Si tu touches � mes affaires, tu vas avoir des ennuis !
	DirtyThief					=	"SVM_10_DirtyThief"						;//Voleur ! Je vais t'achever !
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Personne n'attaque mes hommes !
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Tu as tu� un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_10_Dead"							;//Aaargl
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Tu vas le sentir passer ! Salopard !
	YesYes						=	"SVM_10_YesYes"							;//Ouais, ouais ! Ne panique pas ! Tu as gagn�.
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Quel monstre, court aussi vite que possible !
	Help						=	"SVM_10_Help"							;//Retraite !
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Tu apprendras � me conna�tre !!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Essaye encore et tu le regretteras.
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Cette arme est maintenant � moi !
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Je vais juste prendre un peu de ton minerai !
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Pas de minerai, enfer !
	HandsOff					=	"SVM_10_HandsOff"						;//Sale rat ! Enl�ve tes mains !
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//H� ! D'o� sors-tu ?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Tu dois vraiment penser que je suis stupide !
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//H�, toi ! Qu'est-ce que tu fouines par l� ?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Sors ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_10_WiseMove"						;//Tu as eu de la chance.
	Alarm						=	"SVM_10_Alarm"							;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_10_BehindYou"						;//Derri�re toi !
	TheresAFight				=	"SVM_10_TheresAFight"					;//Ah, un combat !
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Plus fort !
	CheerFight					=	"SVM_10_CheerFight"						;//Pas de piti� !
	CheerFriend					=	"SVM_10_CheerFriend"					;//Fini le !!
	Ooh							=	"SVM_10_Ooh"							;//Ne me cherche pas !
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Frappe le � la figure !
	RunCoward					=	"SVM_10_RunCoward"						;//L�che, revient !
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Une petite brise et il tombera tout seul.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Fait-lui voir !
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Tu es aussi bien mort ! �a t'apprendra � tuer les gens.
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Tu lui a donn� une bonne le�on !
	Awake						=	"SVM_10_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Bonjour.
	ALGreetings					=	"SVM_10_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_10_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_10_SectGreetings"					;//�veille-toi !
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Il est l�.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_10_HeyYou"							;//H�, toi !
	NotNow						=	"SVM_10_NotNow"							;//Pas maintenant.
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Puis-je t'aider ?
	MakeWay						=	"SVM_10_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Tu veux que je te frappe la t�te ? Sors de l� !
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_10_LookAway"						;//Je ne suis pas vraiment ici ...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Garde les !
	WhatsThat					=	"SVM_10_WhatsThat"						;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Rend moi mon arme !
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Prend la. Je n'en ai pas besoin.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Ils ont eu un de nos hommes. �a me rend tr�s en col�re !
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Pourquoi m'as-tu r�veill� ?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//H� ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Tu as frapp� un Baron du minerai !
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Tu as vaincu un des Sages.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Gagner contre un magicien ...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Tu devrais te renseigner sur les personnes que tu attaques, avant de frapper des novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//J'ai besoin de maintenir l'ordre ici ! Laisse mes gens tranquilles !
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Tu as tabass� mon ami.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Toucher � un de mes prot�g�s va te co�ter cher.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//N'essaye plus �a, voleur !
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Mec ! Tu as vol� le minerai des Barons ! Ils seront furieux !
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Tu as soulag� les Sages de plusieurs choses. Ce n'est pas tr�s malin de se faire attraper en faisant cela !
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Tu as soulag� les magiciens de plusieurs objets, n'est-ce pas ?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Tu as un de nos hommes sur la conscience. Une autre petite erreur et c'est ton tour !
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Tu as tu� un magicien ! Comment expliques-tu �a ?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a �t� mentionn� en rapport � cette affaire ...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//F�licitations ! Tu as gagn�. Ce fut un bon combat.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ... mais garde le pour toi, les gens n'ont pas besoin de savoir.
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ... tu devrais faire attention � qui tu parles ...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ... je n'�coute plus tes sornettes d�sormais ...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se pr�cipiter ...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_10_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vern�nftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//n'essaie pas de sorcellerie sur moi !
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Arr�te, j'ai dit ! Une fois !
	WeaponDown					=	"SVM_11_WeaponDown"						;//Si tu cherches les ennuis tu n'as qu'� venir !
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//�loigne �a de moi ou tu es fais !
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Pose ce truc !
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Alors tu me cherches ? Tu es s�r ?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Qu'est-ce que tu fais ! Arr�te �a !
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//D'accord, oublions cela.
	Strange						=	"SVM_11_Strange"						;//Mmh ! Enfer ! O� est-il pass� ?
	DieMonster					=	"SVM_11_DieMonster"						;//Ils mourront s'ils restent sur mon chemin !
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Si tu te fais des ennemis tu dois �tre capable de les maintenir. Meurt.
	NowWait						=	"SVM_11_NowWait"						;//Tu n'aurais pas d� faire �a !
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Je ne t'ai pas fait mordre la poussi�re une fois ? Alors reprend �a ...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Si tu n'�coutes pas, tu vas le regretter !
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//H� intrus. Maintenant tu vas avoir ta le�on !
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Suppose que je doive briser tes doigts !
	DirtyThief					=	"SVM_11_DirtyThief"						;//Vol� n'est pas louable !
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Tu causes des soucis dans ma zone ! Maintenant je vais en finir !
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Tuer un des autres sera ta derni�re erreur !
	Dead						=	"SVM_11_Dead"							;//Aaargl
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Tu n'aurais pas d� faire �a !
	YesYes						=	"SVM_11_YesYes"							;//D'accord, d'accord ! Tu as gagn� !
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//Il est trop fort pour moi !
	Help						=	"SVM_11_Help"							;//Retraite !
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Voil� les cons�quences, mon gars !
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//N'essaye pas de nouveau !
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Je prendrai plus soins de ton arme que toi !
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//C'est gentil de me laisser un peu de minerai !
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Rien, pas de minerai !
	HandsOff					=	"SVM_11_HandsOff"						;//Enl�ve tes sales pattes !
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Hors d'ici ou je vais te faire courir !
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//H�, comment es-tu entr� ici ?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Pas avec moi, mon gars !
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Qu'est ce que c'est suppos� �tre ?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//C'est ma cabane. Dehors ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Que fais-tu l� ? Ouste avant que je m'�nerve !
	WiseMove					=	"SVM_11_WiseMove"						;//Bien ! Ne recommence plus !
	Alarm						=	"SVM_11_Alarm"							;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_11_BehindYou"						;//Derri�re toi !
	TheresAFight				=	"SVM_11_TheresAFight"					;//Voyons qui va gagner cette fois !
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Allez, vas-y !
	CheerFight					=	"SVM_11_CheerFight"						;//Arr�te de jouer !
	CheerFriend					=	"SVM_11_CheerFriend"					;//Oh allez, tu peux le battre, non ?
	Ooh							=	"SVM_11_Ooh"							;//Ouh ! Pas si bien que �a !
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Mmh ! Pas mal.
	RunCoward					=	"SVM_11_RunCoward"						;//Ne te remontre plus jamais ici !
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Joli coup !
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//�a ne fait rien ! Il en est digne !
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Tu l'a tu� ! �a signifie de gros probl�mes !
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Bien jou� ! Une belle performance !
	Awake						=	"SVM_11_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Bonjour.
	ALGreetings					=	"SVM_11_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_11_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_11_SectGreetings"					;//�veille-toi !
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Es-tu aveugle ? Par ici !
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Tu vaut mieux que �a !
	HeyYou						=	"SVM_11_HeyYou"							;//H�, toi !
	NotNow						=	"SVM_11_NotNow"							;//Pas maintenant.
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Puis-je faire quelque chose pour toi ?
	MakeWay						=	"SVM_11_MakeWay"						;//Je peux passer ?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//�carte toi !
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Tu veux que je te frappe la t�te ? Sors de l� !
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_11_LookAway"						;//Je ne veux pas �tre m�l� � �a !
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Bien ! C'est � toi.
	WhatsThat					=	"SVM_11_WhatsThat"						;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Tu portes mon arme ... ?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Aller, donne-la-moi !
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Garde-la, je n'en pas besoin.
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Qu'est-ce qui se passe, de toute fa�on ?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Qu'est ce que tu fais ? Sers toi en bien !
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Tu as battu un des Barons du minerai. C'�tait impressionnant, mais stupide. tr�s stupide en fait.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Tu as vaincu un des Sages.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Gagner contre un magicien ... n'est pas exactement malin !
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Je prot�ge les gens ici, tu en as frapp� un ...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Si tu touches au mineurs, tu auras affaire � moi !
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Quiconque frappe mes hommes me frappe moi.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Attaqu� mes prot�g�s peux-te co�ter ta t�te.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Tu as des affaires qui nous appartienne. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Mec ! Tu as vol� du minerai au Baron ! Ils vont �tre furieux !
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Tu as soulag� les Sages de plusieurs objets, n'est-ce pas ?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Tu as soulag� les magiciens de plusieurs objets, n'est-ce pas ?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Tu as viol� les r�gles num�ro 1 ! Pas de meurtre !
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Tu as tu� un magicien ! Comment expliques-tu �a ?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a �t� mentionn� en rapport � cette affaire ...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//C'�tait un beau combat. Je sentirai la douleur pendant plusieurs jours. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ... il doit y avoir du vrai dans cette histoire apr�s tout...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� �Je
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ... je ne voudrais pas �tre � sa place car il
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ... c'est la m�me histoire tout le temps �Je
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ... H� bien, autrefois �a ne se serait pas pass� comme �a ...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se pr�cipiter ...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_11_Om"								;//Ommm
};


instance SVM_12	(C_SVM)		//Bazaar-H�ndler		Nach au�en freundlich,jovial,Innen hinterh�ltig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Arr�te cette magie !
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Quand je dis 'arr�te cette magie', tu le fais !
	WeaponDown					=	"SVM_12_WeaponDown"						;//Que veux-tu faire avec cette arme, mec !
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Pose ce truc !
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Tu es en train de me viser !
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Si tu te t'arr�tes pas tu vas avoir des ennuis !
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//H�, t'es aveugle ou quoi ?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Oublions ce petit argument, d'accord ?
	Strange						=	"SVM_12_Strange"						;//Mais il �tait juste ici � l'instant !? �trange !
	DieMonster					=	"SVM_12_DieMonster"						;//Ton heure est venue, salopard !!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//C'est jour de paye !
	NowWait						=	"SVM_12_NowWait"						;//Tu veux vraiment te battre !
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Tu n'en as pas eu assez ?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//D'accord, tu l'a cherch� !
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Ils vont te jeter dehors !
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Je t'ai pr�venu. Si tu touches � mes affaires, tu vas avoir des ennuis !
	DirtyThief					=	"SVM_12_DirtyThief"						;//Voleur ! Je vais t'apprendre les bonnes mani�res !
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Personne ne frappe mes hommes sans �tre d�sol� apr�s !
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Tu as tu� un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_12_Dead"							;//Aaargl
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_12_YesYes"							;//Tranquille ! Tu as gagn�.
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//C'est trop pour moi, j'arr�te !
	Help						=	"SVM_12_Help"							;//Mal�diction !
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//La prochaine fois, ce sera diff�rent !
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//N'essaye pas de nouveau !
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//J'aime cette arme !
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Je ferais en sorte que ton minerai soit bien investi !
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Enfer ! Pas de minerai !
	HandsOff					=	"SVM_12_HandsOff"						;//L�che �a !
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//H� ! D'o� sors-tu ?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Tu me crois stupide ?!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//O� te faufiles-tu comme �a ?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Hors d'ici ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Tu n'as rien a faire ici !
	WiseMove					=	"SVM_12_WiseMove"						;//Tu apprends vite !
	Alarm						=	"SVM_12_Alarm"							;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ALERTE !!!!
	BehindYou					=	"SVM_12_BehindYou"						;//H� la !
	TheresAFight				=	"SVM_12_TheresAFight"					;//Un combat !
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Frappez-le !
	CheerFight					=	"SVM_12_CheerFight"						;//Bien !
	CheerFriend					=	"SVM_12_CheerFriend"					;//Frappez-le encore maintenant !
	Ooh							=	"SVM_12_Ooh"							;//Attention !
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//C'�tait juste !
	RunCoward					=	"SVM_12_RunCoward"						;//Ce gars se faufile !
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Bon gagnant, je dirai !
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Il l'a m�rit� !
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Tu tue les gens. Tu vas avoir des ennuis !
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Quel combat !
	Awake						=	"SVM_12_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Bonjour, ami !
	ALGreetings					=	"SVM_12_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_12_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_12_SectGreetings"					;//�veille-toi !
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Par ici.
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Je ne peux t'apprendre rien du tout car tu es trop inexp�riment�.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_12_HeyYou"							;//H�, toi !
	NotNow						=	"SVM_12_NotNow"							;//Pas maintenant.
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Puis-je t'aider ?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Qu'est-ce que tu veux ?
	MakeWay						=	"SVM_12_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Allez, laisse-moi passer !
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Es-tu idiot ou cherches-tu les ennuis ?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_12_LookAway"						;//Quelque chose est arriv� ? Je n'ai RIEN vu ...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//D'accord, garde-la !
	WhatsThat					=	"SVM_12_WhatsThat"						;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//J'aimerai vraiment avoir mon arme !
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Donne la moi !
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Hmm, ce n'est pas si mauvais ! J'en veux plus !
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hm, quoi ? Pourquoi me r�veilles-tu ?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//H� ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Tu as vaincu Baron du minerai. Il a �t� impressionn� !
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Tu as vaincu un des Sages. Je suis impressionn�. Mais ne recommence plus jamais �a.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Gagner contre un magicien... Tu dois �tre brave !
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Tu dois �tre malade d'avoir frapp� un novice comme �a.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Que crois-tu faire, taper un mineur ?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Tu a tap� mon ami, pourquoi ?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Tu es trop courageux, toucher � un de mes prot�g�s peut �tre tr�s dangereux.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Mec ! Tu as vol� le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Tu as vol� les Sages ? Tu ne t'es pas fait attrap� au moins !
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Les magiciens n'aiment pas les gens qui fouinent autour de leurs affaires !
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Tu as un de nos hommes sur la conscience. Une autre petite erreur et c'est ton tour !
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Tu as tu� un Baron du minerai ? Mec, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Tu as tu� un Sage ? Mon gars, Je le crois pas !
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Tu as tu� un magicien ! Comment expliques-tu �a ?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononc� en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//D'accord, tu m'as battu. C'�tait un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ... c'�tait �vident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ... il fut un temps o� les choses se seraient pass�es autrement ...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ... attends. Il ne faut pas se pr�cipiter ...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_12_Om"							;//Ommm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, �bereifrig, �hnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y�berion blind,	Mitl�ufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Arr�te ta sorcellerie !
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//�loigne-toi, �loigne-TOI !!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Range cette arme !
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Rengaine cette arme !
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Me vises-tu ? Attention !
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Tu es en train de signer ton arr�t de mort. Tu ferais mieux de viser autre chose !
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//En quoi �a aide ?!
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Oublions cet argument, d'accord ?
	Strange						=	"SVM_13_Strange"						;//O� est-il pass� ? �a ne se peut !
	DieMonster					=	"SVM_13_DieMonster"						;//Cette nuit nous allons avoir de la viande !
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//C'est ton tour maintenant ! Pas de piti� !
	NowWait						=	"SVM_13_NowWait"						;//C'est une bonne cachette ...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Tu ne veux plus essayer, n'est-ce pas ?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Tu l'as cherch� !
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Maintenant tu es fait, intrus !
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Je devrais t'arracher les doigts !
	DirtyThief					=	"SVM_13_DirtyThief"						;//Sale voleur ! Je vais te couper les mains ...
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Ici il n'y a que moi qui tape sur les autres !
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Tu as tu� un des notres !
	Dead						=	"SVM_13_Dead"							;//Aaargl
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Tu n'aura pas assez de temps pour �tre d�sol� !
	YesYes						=	"SVM_13_YesYes"							;//Pas de probl�me, il n'y a pas de probl�me !
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Je n'ai pas la bonne arme. Nous nous rencontrerons � nouveau ...
	Help						=	"SVM_13_Help"							;//Woooooaaahhh ! D�campons !
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//On se retrouvera !
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//La prochaine fois je te tuerai !
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Belle arme ! C'est la tienne ? Non ? D'accord !
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Je suppose que tu n'as rien contre le fait que je garde un peu de minerai.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Tu n'as m�me pas de minerai dans tes poches !
	HandsOff					=	"SVM_13_HandsOff"						;//Sale rat ! Bat les pattes ! Je vais te la donner !
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Arr�te ! Sors de l� !
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Bref, Que fais-tu ici ?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Tu essayes vraiment de me mettre hors de moi !
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//H�, toi ! Qu'est-ce que tu fouines par l� ?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Que fais-tu ici ? Ouste, ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Tu n'as rien a faire ici !
	WiseMove					=	"SVM_13_WiseMove"						;//Tu as de la chance ! Mais j'aurai aimer te refaire le portrait !
	Alarm						=	"SVM_13_Alarm"							;//Gardes, par ici !
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ALERTE !!
	BehindYou					=	"SVM_13_BehindYou"						;//Derri�re toi !
	TheresAFight				=	"SVM_13_TheresAFight"					;//Voyons qui va mordre la poussi�re.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Ouais, encore !
	CheerFight					=	"SVM_13_CheerFight"						;//Je vaux voir du sang !
	CheerFriend					=	"SVM_13_CheerFriend"					;//�crasez-le !!
	Ooh							=	"SVM_13_Ooh"							;//Contre-attaquez, bande d'idiot !
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Yeaah !!!
	RunCoward					=	"SVM_13_RunCoward"						;//Ouais, la ferme !
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Triste performance ! Une petite brise et il s'�croule.
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Pah, montre-lui !
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//C'est du suicide de tu� quelqu'un devant t�moin.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Beau combat !
	Awake						=	"SVM_13_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Tout va bien ?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_13_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_13_SectGreetings"					;//�veille-toi !
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Es-tu aveugle ? Par ici !
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Tu as besoin de devenir un sp�cialiste avant de devenir un ma�tre !
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_13_HeyYou"							;//H�, toi !
	NotNow						=	"SVM_13_NotNow"							;//Pas maintenant !
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Que veux-tu de moi ?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Je peux faire quelque chose pour toi ?!
	MakeWay						=	"SVM_13_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Tu cherches les ennuis ? Hors d'ici !
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_13_LookAway"						;//Je n'ai RIEN vu !
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Doucement. C'est � toi.
	WhatsThat					=	"SVM_13_WhatsThat"						;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Rend moi mon arme !
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//D'accord ! Garde-la ! Je trouverai une autre solution !
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Un des notres est mort ! Vengeance !
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Pourquoi m'as-tu r�veill� ?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Tire des le�ons de tes d�faites !
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Tu as frapp� le Baron du minerai ! Tu l'a rendu fou !
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Tu as frapp� un Sage. Il semble que tu attires les probl�mes comme un aimant !
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//�tre victorieux contre un magicien est vraiment une id�e idiote !
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Alors tu es celui qui a frapp� les novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Laisse mes hommes tranquille !
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Ce n'est pas une bonne id�e de venir ici.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Ce que tu fais ne peut �tre tol�r� ici !
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Si tu frappes quelqu'un sous ma protection tu en subiras les cons�quences !
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Tu m'as vol� ! Ne recommence plus !
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Nous voulons nos affaires ! Rend les nous !
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Tu as vol� le Baron du minerai ! Pourquoi diable as-tu fais �a ?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Tu as vol� les Sages ? Quelle idiotie qu'il t'ont prit sur le faite.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Tu as vol� des magiciens ! Une id�e idiote !
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//L'un d'entre nous est mort et tu es impliqu� ! Encore une petite erreur et tu es fais !
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Tu as tu� un magicien ! Comment imagines-tu expliquer �a ?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononc� en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Tu m'as donn� du fil � retordre. Ce fut un bon combat. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ... il est �vident que �a ne pouvait que mal tourn� ...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ... il fut un temps o� �a se serait pass� diff�remment ...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se pr�cipiter ...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ... je pensais que c'�tait de l'histoire ancienne ...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_13_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erz�hler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Arr�te cette magie !
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Tu m'as entendu : Arr�te ta sorcellerie !
	WeaponDown					=	"SVM_14_WeaponDown"						;//Qu'est-ce que tu veux avec cette arme ?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Range cette arme !
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Tu es en train de me viser !
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Veux-tu arr�ter de me viser ?!
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Attention !
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Oublions nos divergences d'opinion !
	Strange						=	"SVM_14_Strange"						;//Un bon tour, il vient juste de dispara�tre !
	DieMonster					=	"SVM_14_DieMonster"						;//Les dommage d'une cr�ature.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Je dois te tuer ... Rien de personnel, tu comprends !
	NowWait						=	"SVM_14_NowWait"						;//Assez pour l'instant !
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Tu ne veux pas d'ennuis � nouveau, n'est-ce pas ?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Tu l'as cherch� !
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Tu n'as pas �t� invit� !
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//Mes affaires ne sont pas � toi !
	DirtyThief					=	"SVM_14_DirtyThief"						;//Tu m'as pris quelque chose ! Maintenant tu vas payer pour �a !
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Tu as besoin d'apprendre les r�gles !
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Tu as tu� quelqu'un !
	Dead						=	"SVM_14_Dead"							;//Aaargl
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Tu vas le regretter !
	YesYes						=	"SVM_14_YesYes"							;//D'accord, d'accord !
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Je ne veux pas relever ce d�fi maintenant !
	Help						=	"SVM_14_Help"							;//J'ai besoin de retourner � mes affaires !
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Je suis s�r que nous nous rencontrerons de nouveau !
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//tu ferais mieux de ne plus faire �a !
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Je prendrai cette arme !
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Le minerai est tr�s utile, c'est s�r !
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Tu n'as pas de minerai !
	HandsOff					=	"SVM_14_HandsOff"						;//L�che �a !
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Comment es-tu venu ici ?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Tu dois plaisanter !
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Qu'est-ce que tu fouines ?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Pars avant que j'appelle les gardes !
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Tu n'as rien � faire ici ! Compris ?
	WiseMove					=	"SVM_14_WiseMove"						;//Sage d�cision !
	Alarm						=	"SVM_14_Alarm"							;//Gardes, par ici, l� !
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//UN INTRU !!!
	BehindYou					=	"SVM_14_BehindYou"						;//Derri�re toi !
	TheresAFight				=	"SVM_14_TheresAFight"					;//Un combat !
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hmm.
	CheerFight					=	"SVM_14_CheerFight"						;//Inefficace !
	CheerFriend					=	"SVM_14_CheerFriend"					;//Quel acharnement !
	Ooh							=	"SVM_14_Ooh"							;//C'�tait douloureux !
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//C'est une mani�re de faire ...
	RunCoward					=	"SVM_14_RunCoward"						;//Il a appris quelque chose !
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//C'est fait.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Fait-lui voir !
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Ce n'�tait pas n�cessaire de le tuer, tu vas avoir de ennuis maintenant !
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Ces combats m'ennuient !
	Awake						=	"SVM_14_Awake"							;//Je dormais ?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Salutations.
	ALGreetings					=	"SVM_14_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_14_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_14_SectGreetings"					;//�veille-toi !
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Il est l�.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'exp�rience.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Tu es � la limite de tes possibilit�s. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Tu dois devenir exp�riment� avant de devenir Ma�tre !
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Tu es d�j� meilleur maintenant !
	HeyYou						=	"SVM_14_HeyYou"							;//H�, toi !
	NotNow						=	"SVM_14_NotNow"							;//Pas maintenant.
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Qu'est-ce que je peux faire pour toi ?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Puis-je t'aider ?
	MakeWay						=	"SVM_14_MakeWay"						;//�carte toi !
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Laisse moi passer.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Maintenant fais-toi une balafre !
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_14_LookAway"						;//Je ne suis pas int�ress� !
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Garde-la !
	WhatsThat					=	"SVM_14_WhatsThat"						;//Qu'est-ce que c'�tait ?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Rend moi mon arme !
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//D'accord. Je n'en veux plus !
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Un des notres � �t� tu�. Nous trouverons le coupable ...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Tu d�ranges mon �tude !
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Tu as des probl�mes, j'ai entendu dire !
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Tu as vaincu Baron du minerai. Il a �t� impressionn� !
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Tu as battu un des Sages. Je suis impressionn�.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Gagner contre un magicien ...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Tu sais que les novices sont sous ma protection. Et n�anmoins tu les as frapp� quand m�me ?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Si tu touches au mineurs, tu auras affaire � moi !
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Tu ne devrais pas chercher des histoires � mes amis.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Si tu attaques un de mes prot�g�s, �a peut te co�ter cher.
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Comment oses-tu revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Tu as pris des affaires qui nous appartienne. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Mec ! Tu as vol� le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Tu as soulag� les Sages de plusieurs choses.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Tu as soulag� les magiciens de plusieurs choses.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Tu as tu� un des notres. Encore une autre petite erreur et ton compte est bon !
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Tu as tu� le Baron du Minerai ! M�cr�ant, es-tu compl�tement fou !?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Tu as tu� un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Tu as tu� un magicien ! Comment imagines-tu expliquer �a ?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononc� en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il appara�t que tu es impliqu� !
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//La Confr�rie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//�a ne fut pas facile de sortir de l� !
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//D'accord, tu m'as battu. C'�tait un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ... peut-�tre ...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ... ce n'�tait pas tr�s malin ...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ... ce n'est vraiment pas mon probl�me ...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ... il est �vident que �a ne pouvait que mal tourn� ...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ... il doit y avoir quelque chose derri�re cette histoire apr�s tout ...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ... tu dois faire attention � ce que tu dis ...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqu� ...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ... je n'aimerais pas �tre dans ses bottes ...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ... toujours la vieille m�me histoire ...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ... il fut un temps o� �a se serait pass� diff�remment ...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ... je n'�coute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ... je doute que �a change un jour ...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ... attends. Il ne faut pas se pr�cipiter ...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ... je croyais que c'�tait fini ...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_14_Om"							;//Ommm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//H�, toi !
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Attend !

	SectGreetings			=	"SVM_15_SectGreetings"				;//�veille-toi !
	ALGreetings				=	"SVM_15_ALGreetings"				;//Pour Gomez !
	MageGreetings			=	"SVM_15_MageGreetings"				;//Salutations !
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Salut !
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//B�illement !
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Ne marche pas.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hmm, cass�.
	NeedKey					= 	"SVM_15_NeedKey"					;// J'ai besoin d'une cl� pour �a ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Plus de cl� squelette ...
	InvFull					= 	"SVM_15_InvFull"					;// Je ne peux porter plus.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Part ! Tu n'es pas suppos� me parler !
	Help						=	"SVM_16_Help"			;	//Hurlement !
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aaargl
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverst�ndlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//�ber Stimme 17, sind aber in halbwegsverst�ndlichem orkisch-deutsch
												//Das hier �berall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen erg�nzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	ISaidStopMagic				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WeaponDown					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
/*
	ISaidWeaponDown				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WatchYourAim				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WatchYourAimAngry			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatAreYouDoing				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LetsForgetOurLittleFight	=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Strange						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DieMonster					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	DieMortalEnemy				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWait						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouStillNotHaveEnough		=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAskedForIt				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWaitIntruder				= 	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DirtyThief					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAttackedMyCharge			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledOneOfUs			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Dead						=	"SVM_17_Dead"				;//Aaaarglll....
	Aargh_1						=	"SVM_17_Aargh_1"			;//Aargh!
	Aargh_2						=	"SVM_17_Aargh_2"			;//Aargh!
	Aargh_3						=	"SVM_17_Aargh_3"			;//Aargh!
	Berzerk						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YoullBeSorryForThis			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ShitWhatAMonster			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Help						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WeWillMeetAgain				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NeverTryThatAgain			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ITakeYourWeapon				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ITookYourOre				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	ShitNoOre					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	HandsOff					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	GetOutOfHere				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouViolatedForbiddenTerritory=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatsThisSupposedToBe		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhyAreYouInHere				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatDidYouInThere			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WiseMove					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Alarm						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	IntruderAlert				= 	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	BehindYou					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFight					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFriend					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Ooh							=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeDefeatedHim				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeKilledHim					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Awake						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	FriendlyGreetings			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	HeyYou						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NotNow						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhatDoYouWant				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ISaidWhatDoYouWant			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	MakeWay						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	OutOfMyWay					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouDeafOrWhat				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LookingForTroubleAgain		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	GiveItToMe					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouDisturbedMySlumber		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouStoleFromMe				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouStoleFromUs				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledMyFriend			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
*/

};



// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	18;




