//--------------------- ������� ������ ������ ---------------------------------
func void PrintMortis(var string text); 
// ������� �� ����� ������ ������ text, ��� OutputUnits ����� (���������� ������ �� OU �����).
func void Print(var string text); 

// ������� ����� �� �����, ��������� ������ ���������� text1 - text5 � ���� ������.
func void PrintMulti(var string text1, var string text2, var string text3, var string text4, var string text5); 

// ������� �� ����� ������ ������ text (��� ������ � font)
// � ������������ x, y (�������� �� 0 �� 99% ������� ������, 
// -1 �������� ����� �� ������ ��������������� ��� ������) �� ����� timeSec (� ��������).
// ������������ �������� ������ = 0.
func int PrintScreen(var string text, var int x, var int y, var string font, var int timeSec); 
 
// ������� ����� ������ text ����� zSpy ��� � ���. ����, 
// �������� ������ � ���������� ������ (���������� (Alt+D))
func void PrintDebug(var string text); 
 
// ������� ����� ������ text ����� zSpy ��� � ���. ���� ��� ��������� self � ���������� ������.
func void PrintDebugInst(var string text);
 
// ������� ����� ������ text ����� zSpy ��� � ���. ���� ��� ��������� self ������ ch � ���������� ������
// (������ ���������� � ����� PrintDebug.d).
func void PrintDebugInstCh(var int ch, var string text); 
 
// ������� ����� ������ text ����� zSpy ��� � ���. ���� ��� ������ ch � ���������� ������
func void PrintDebugCh(var int ch, var string text); 
 
// �������� ���������� ������� PrintScreen, ������ ����� �������������� 
// � ���� ������� c ������� dialogNr (���������� � % ��������� ������ ���� �������).
func int PrintDialog(var int dialogNr, var string text, var int x, var int y, var string font, var int timeSec);

//--------------------- ������� �������������� ����� --------------------------

// ��������������� ����� ����� value � ������.
func string IntToString(var int value); 
 
// ��������������� ����� � ��������� ������ value � ������.
func string FloatToString(var float value); 
 
// ��������������� ����� � ��������� ������ value � ����� �����.
func int FloatToInt(var float value);
 
// ��������������� ����� ����� value � ����� � ��������� ������.
func float IntToFloat(var int value); 
 
// �������������� ������� �������� ����������� ���� ����� text1 � text2.
func string ConcatStrings(var string text1, var string text2); 

//--------------------- ������� ������ �� ������ ------------------------------

// ������������� �������� ������, ��� nameSFX ��� ����������� �� ������ C_SFX. 
func void Snd_Play(var string nameSFX); 
 
// ������������� �������� ������ ��� ��� npc, ��� nameSFX ��� ����������� �� ������ C_SFX. 
func void Snd_Play3D(var C_NPC npc, var string nameSFX); 
 
// ���������, �������� �� ��� npc ���������� ����� (return > 0) � ���������� ������ other �� ����� ���.
func int Snd_IsSourceNpc(var C_NPC npc); 
 
// ���������, �������� �� � ��� npc ������� ���������� ����� (return > 0) � ���������� ������ item �� ���� �������
func int Snd_IsSourceItem(var C_NPC npc); 
 
// ������ ���������� � ����������� �� ��������� ����� �� ��� npc.
func int Snd_GetDistToSource(var C_NPC npc); 

//--------------------- ��������������� ������� -------------------------------

// ������������� ��������� ����� ����� � ��������� �� 0 �� bound - 1.
func int Hlp_Random(var int bound); 
 
// ���������� ��� ������ text1 � text2, 
// ���������� TRUE ��� ��������� ����� ��� FALSE ��� �����������.
func int Hlp_StrCmp(var string text1, var string text2); 
 
// ���� ������ �� ��� npc ����������, �� ���������� TRUE, ����� � FALSE.
func int Hlp_IsValidNpc(var C_NPC npc); 
 
// ���� ������ �� ������� item ����������, �� ���������� TRUE, ����� � FALSE.
func int Hlp_IsValidItem(var C_ITEM item); 
 
// ��������� �������������� �������� item � ���������������� ���� instanceName, 
// ���������� TRUE ��� ������������, ����� � FALSE.
func int Hlp_IsItem(var C_ITEM item, var int instanceName); 
 
// ���������� ������ �� ���, �������������� � ���� instanceName.
func C_NPC Hlp_GetNpc(var int instanceName); 
 
// �������� ID ����� ��� ��� �������� �� ������ �� ��������������� ����� instanceName.
func int Hlp_GetInstanceID(var C_NPC or C_ITEM instanceName); 
 
//------ ������� ������ � ����������� (������, �����, �������, �����) ---------

// ������� ����� �������� � ���������� ����� ��� �����������.
func int Doc_Create();
 
// ������� ����� ����� � ���������� ����� � �����������.
func int Doc_CreateMap(); 
 
// ������������� ������� ���� worldZEN (������ ZEN) ��� ��������� handle.
// ������ ��� ���� ��� �������� �����.
func void Doc_SetLevel(var int handle, var string worldZEN); 
 
// ������ ���-�� ������������ ������� pages ��� ��������� handle.
func void Doc_SetPages(var int handle, var int pages); 
 
// ������������� ��������� �������� page 
// (���� �������� page = -1, �� ����������� �� ���� ���������) ��������� handle
// pageImage � ��� ����� ����������� �������� � ������� TGA, 
// scale = 0 - ��������� ���������������, 
// scale = 1 - �� ������������ ���������������� (����������� ��� ����).
func void Doc_SetPage(var int handle, var int page, var string pageImageTGA, var int scale); 
 
// ������ ����� ��� �������� page ��������� handle, ��� fontTGA � ��� ����� ������ � ������� TGA.
func void Doc_SetFont(var int handle, var int page, var string fontTGA); 
 
// ���������� ������� ������ ������ �� �������� page ��������� handle, 
// ��� left, top, right, bottom � �������������� �����, �������, ������ � ������ �������, 
// pixel � ���-�� �������� �� ������� �������.
func void Doc_SetMargins(var int handle, var int page, var int left, var int top, var int right, var int bottom, var int pixel); 
 
// ������� ������ ������ text �� �������� page ��������� handle.
func void Doc_PrintLine(var int handle, var int page, var string text); 
 
// ������� ����� text � ��������� ����� �� �������� page ��������� handle.
func void Doc_PrintLines(var int handle, var int page, var string text); 
 
// ������� ��������� �������� handle �� �����.
func void Doc_Show(var int handle); 
 
// ��������� �������� � ������ picName, ��� ������� �� ������ ����� 
func void Doc_Open(var string picName); 
 
// ������ ��� ��������� ����� font
func void Doc_Font(var string font); 
 
// ������� ����� text ��������� �� �����
func void Doc_Print(var string text); 
 
// �������������� ����� � ������ ������ levelName, 
// ��� gamex1, gamey1, gamex2, gamey2 � ���������� ����� �����, ��������������� ����������� ������
// pixelx1, pixely1, pixelx2, pixely2 � �������������� ��������� �������� ����� �����
func void Doc_MapCoordinates(var string levelName, var float leftLevel, var float topLevel, var float leftMap, var float topMap, var float rightLevel, var float bottomLevel, var float rightMap, var float bottomMap); 

//--------------------- ������� ������ � �������� ������� ---------------------

// ������� � ������� ���� � ������ topic � ������� section 
// (�������������� ��� ������� LOG_MISSION ��� LOG_NOTE).
func void Log_CreateTopic(var string topic, var int section); 
 
// ���������� ������ status ���� � ������ topic 
// (�������������� ��������� ������� - LOG_RUNNING, LOG_SUCCESS, LOG_FAILED, LOG_OBSOLETE).
func void Log_SetTopicStatus(var string topic, var int status); 
 
// �������� � ���� topic ����� �� ������ text.
func void Log_AddEntry(var string topic, var string text); 

//--------------------- ������� ������ � ���������� ---------------------------

// ������� � ��������� ��� npc ������� � ID itemInstance.
func void CreateInvItem(var C_NPC npc, var int itemInstance); 
 
// ������� � ��������� ��� npc �������� � ID itemInstance ����������� amount.
func void CreateInvItems(var C_NPC npc, var int itemInstance, var int amount); 
 
// ����������� ��� npc ��������� � ID itemInstance.
func void EquipItem(var C_NPC npc, var int itemInstance); 
 
// ������� � ���������� � ������ mobName (�������� ������) �������� � ID itemInstance � ����������� amount.
func void Mob_CreateItems(var string mobName, var int itemInstance, var int amount); 
 
// �������� ���������� ��������� � ID itemInstance, ����������� � ���������� � ������ mobName.
func int Mob_HasItems(var string mobName, var int itemInstance); 

//--------------------- ������� �������� --------------------------------------

// ��������� ���� �������� fileMDS � ����������� mds ��� ��� npc.
func void Mdl_ApplyOverlayMds(var C_NPC npc, var string fileMDS); 
 
// ��������� �� ��� npc ���� �������� fileMDS.
func void Mdl_RemoveOverlayMDS(var C_NPC npc, var string fileMDS); 
 
// ��������� ���� �������� fileMDS ��� ��� npc �� ����� time
func void Mdl_ApplyOverlayMDSTimed(var C_NPC npc, var string fileMDS, var int time); 
 
// ��������� ��������� �������� ani ��� ��� npc � ������������������ ������������ ��������� alias.
func void Mdl_ApplyRandomAni(var C_NPC npc, var string ani, var string alias); 
 
// ������������� ������� ������� freq ��������� ������������ ��������� ani ��� ��� npc.
func void Mdl_ApplyRandomAniFreq(var C_NPC npc, var string ani, var float freq); 
 
// ��������� �������� ani ���� ��� ��� npc � �������������� intensity � % (1 � 100%) 
// � �������� ��������� holdTime (1 � ���������).
func void Mdl_StartFaceAni(var C_NPC npc, var string ani, var float intensity, var float holdTime); 
 
// ��������� ��������� �������� ani ���� ��� ��� npc �� ���������� �����������:
// timeStart, timeStop � �������� ������� ��������������� �������� � ���, 
// timeStartVar, timeStopVar � ���������� �� �������� timeStart, timeStop � ���, 
// probably � ����������� ������������� ���������� (�� 0 �� 1) �� ������ �� ������� �������.
func void Mdl_ApplyRandomFaceAni(var C_NPC npc, var string ani, var float timeStart, var float timeStartVar, var float timeStop, var float timeStopVar, var float probably); 
 
// ������ ��� ��� npc ���� ����������� � ������ fileMDS (������ MDS)
func void Mdl_SetVisual(var C_NPC npc, var string fileMDS); 
 
// ���������� ��������� ����������� ��� npc, ��� : bodyMesh � ��� mesh ����� ����������� ����, 
// bodyTex � ����� �������� ����, skinColor � ����� ������� ����� ����, 
// headMMS � ��� MMS ����� ����������� ������, headTex � ����� �������� ������, 
// toothTex � ����� �������� �����, armor � ����� ������ ����� (- 1 � ����� ���).
func void Mdl_SetVisualBody(var C_NPC npc, var string bodyMesh, var int bodyTex, var int skinColor, var string headMMS, var int headTex, var int toothTex, var int armor); 
 
// ���������� ������� mesh ����������� ������ ��� npc �� ����������� x, y, z � % (1 -100%).
func void Mdl_SetModelScale(var C_NPC npc, var float x, var float y, var float z); 
 
// ���������� �������� mesh ����������� ������ ��� npc � % (1 - 100%).
func void Mdl_SetModelFatness(var C_NPC npc, var float fatness); 

//--------------------- ������� ���������� ��� --------------------------------

// ��� ��� npc �������� ������� ���������� ��� state, 
// ��� startHour � startMin � ����� � ����� � ������� ������ ���������� �������, 
// stopHour � stopMin � �������������� ����� ��������� �������, 
// waypoint � ��� �����, � ������� ����������� �������.
func void TA_Min(var C_NPC npc, var int startHour, var int startMin, var int stopHour, var int stopMin, var func state, var string waypoint); 
 
// ��������� ��� ��, ��� � ���������� �������, ������ ��� �������� � �������.
func void TA(var C_NPC npc, var int startHour, var int stopHour, var func state, var string waypoint); 
 
// �������, ����������� ��������� � ������ ������� ���������� ��� ��� ��� npc, 
// ��� csName � ��� ����� CS (Cutscene), 
// roleName � ���� ���, ������� ������ �����������.
func void TA_CS(var C_NPC npc, var string csName, var string roleName); 
 
// ������ ��������� ���������� ���������� ��� ��� ��� npc.
func void TA_BeginOverlay(var C_NPC npc); 
 
// ��������� ��������� ���������� ���������� ��� ��� ��� npc.
func void TA_EndOverlay(var C_NPC npc); 
 
// ������� ���������� ���������� ��� ��� ��� npc.
func void TA_RemoveOverlay(var C_NPC npc); 

//--------------------- ������� ������ � ��������� ----------------------------

// ����������, �������� �� ������ (���������� 0 �� ����� ������� � 1 ����� ��������� �������).
func int InfoManager_HasFinished(); 
 
// ��������� � ���� ������� menu ������ ������ �������� text, 
// action � �������, ������� ������������ ��� ������ ������� ������ ����.
func void Info_AddChoice(var C_INFO menu, var string text, var func action); 
 
// ������� ���� ������� menu.
func void Info_ClearChoices(var C_INFO menu);

//--------------------- ������� ���������� ���������� -------------------------

// ������ ��������� ����.
func void ExitGame(); 
 
// �������� ����� ���� videoBIK (c ����������� BIK), ���������� 1, ���� ����� ��������, 0 � � ������ ������.
func int PlayVideo(var string videoBIK); 
 
// ���������� ������� percBar ����������� ������� � ���� �������� (ProgressBar), �������� �� 0 �� 100.
func void SetPercentDone(var int percBar); 
 
// ������� �� ����� ���� ����� �����, ��� chapter � ����� �����, 
// text � �������� �����, fileTGA � ���� �������� ����� (������ TGA), 
// soundWAV � �������� ���� (������ WAV), time � ����� ������ ��������.
func void IntroduceChapter(var string chapter, var string text, var string fileTGA, var string soundWAV, var int time);
 
// �������������� �������� ������� value ��� ��������� tal 
// (��������, ���������� ��������� NPC_TALENT_PICKLOCK, NPC_TALENT_MAGE � �.�.).
func void Tal_Configure(var int tal, var int value); 
 
// ������������� ��������� �������� range ���������� ���������� percID � �����������.
func void Perc_SetRange(var int percID, var int range); 
 
// �������� ������� oldRoutine ���������� ��� ��� npc �� ����� ������� newRoutine. 
// (��� ������� ������ ���������� � RTN_ � ������������� ��������������� ��� �������).
func void Rtn_Exchange(var string oldRoutine, var string newRoutine); 
 
// �����������, �������� �� Cutscene � ������ csName (0 � ���, 1 � ��).
func int Hlp_CutscenePlayed(var string csName); 

//--------------------- ������� ������ � ����� ������ -------------------------

// ��� ������� �������������� ���������� ���������� �������� other, �������� �� ��� npc, 
// ��� instanceNpc � ����������� �� ������ C_NPC, ������� ������ ���� ������� � ������������������� (-1 � ����� �����������),
// guild � �������, ������ ������� ������ ���� ������� ��� (-1 � ����� �������), 
// aiState � ������� AI ���������, � ������� ������ ��������� ������� ��� (NOFUNC � ����� AI ���������).
// ������� ���������� 
// 1 - � ������ ��������� ���������� (other ��������������� ��������� ���), 
// 0 � ������� (other �� ���������).
func int Wld_DetectNpc(var C_NPC npc, var int instanceNpc, var func aiState, var int guild); 
 
// ��������� ��� ����, ��� � ���������� �������, 
// �������������� �������� detectPlayer ���������, ��������� �� ������ (��) �� ������ 
// (0 � ���������, 1 � ���).
func int Wld_DetectNpcEx(var C_NPC npc, var int instanceNpc, var func aiState, var int guild, var int detectPlayer); 
 
// ��� ������� �������������� ���������� ���������� �������� item ���������, 
// �������� ����������� � ��� npc � ������� ���� flagsItem, 
// ���������� 1 ��� �������� ������ � �������������, ����� � 0.
func int Wld_DetectItem(var C_NPC npc, var int flagsItem); 
 
// ���������� 1, ���� �� ���� ��� npc, ����� � 0.
func int Wld_DetectPlayer(var C_NPC npc); 
 
// ���������� ��������� ����� ���������, ��� 
// guild1, guild2 � �������, ����� �������� ��������������� ���������, 
// attitude � ��������� ����� ��������� 
// (���������� ��������� ATT_HOSTILE, ATT_FRIENDLY, ATT_NEUTRAL, ATT_ANGRY).
func void Wld_SetGuildAttitude(var int guild1, var int attitude, var int guild2); 
 
// �������� ��������� ����� ��������� guild1 � guild2.
func int Wld_GetGuildAttitude(var int guild1, var int guild2); 
 
// ���������, ���� �� MOB � ������ mobName � ����������� 10 ������ �� ��� npc, 
// ���������� TRUE, ���� MOB ���������� � ��������, ����� FALSE.
func int Wld_IsMobAvailable(var C_NPC npc, var string mobName); 
 
// ���������� ��������� MOB � ������ mobName ��� ��� npc, 
// ���������� ��������� ��� -1, ���� MOB �� ������.
func int Wld_GetMobState(var C_NPC npc, var string mobName); 
 
// ���������, ���� �� FP � ������ freepoint � ����������� 20 ������ �� ��� npc,
// ���������� TRUE, ���� FP ���������� � ��������, ����� FALSE.
func int Wld_IsFPAvailable(var C_NPC npc, var string freepoint); 
 
// �������� ���������� ���������� �������, �� ���������� ��������� �����, ���� freepoint �����������.
func int Wld_IsNextFPAvailable(var C_NPC npc, var string freepoint); 
 
// �������� ������� ����, ������ ���� ���� �� ��� ������ (Gamestart) = 0.
func int Wld_GetDay(); 
 
// ���������� 1, ���� ������� ����� ��������� ����� ��������� 
// (hourLow, minLow � ������ �������, hourHigh, minHigh � ������� ������� � ����� � �������), 
// ����� ���������� 0.
func int Wld_IsTime(var int hourLow, var int minLow, var int hourHigh, var int minHigh); 
 
// ���������� ������� ����� � ����� hour � ������� min.
func void Wld_SetTime(var int hour, var int min); 
 
// ���������� � ���� ������ ���, ��� instanceNpc � ������ �� ���, 
// spawnPoint � ��� ����� ���������� (����� ���� ��� WP, ��� � FP).
func void Wld_InsertNpc(var int instanceNpc, var string spawnPoint); 
 
// ����������� ���������� ���������� �������, 
// ������ ��� ����� ������ ����� ������� � �������� ����� ����� spawnDelay ������.
func void Wld_InsertNpcAndRespawn(var int instanceNpc, var string spawnPoint, var int spawnDelay); 
 
// ��� npc ����� ���� ������� ��� (������ �� ���� instanceNpc) ����������� number �� ����� ����� timeLife.
// ������������ � ����������� ������.
func void Wld_SpawnNpcRange(var C_NPC npc, var int instanceNpc, var int number, var float timeLife); 
 
// ������� �� ���� ��� (������ �� ���� instanceNpc).
func void Wld_RemoveNpc(var int instanceNpc); 
 
// ���������� � ���� ���� �������, ��� instanceItem � ������ �� �������, 
// insertPoint � ��� ����� ���������� (����� ���� ��� WP, ��� � FP),
// ���� ����� �� ������, �� ������� ����� �������� � ������������ ����� �������� ����
func void Wld_InsertItem(var int instanceItem, var string insertPoint); 
 
// ������� �� ���� ������� �� item ������ �� ����, 
// ���������� 1 � �������� ��������, ����� � 0.
func int Wld_RemoveItem(var C_ITEM item); 
 
// ���������� � ���� ���������� ������ objName � ����� � ������ point (����� ���� ��� WP, ��� � FP).
func void Wld_InsertObject(var string objName, var string point); 
 
// ������ � ������ objName (VOB ������) �������� � ��������� state 
// � ������ ������� hour, min (���� � ������).
func void Wld_SetObjectRoutine(var int hour, var int min, var string objName, var int state); 
 
// ����������� ��� � ���������� �������, ������ ��� MOB �������.
func void Wld_SetMobRoutine(var int hour, var int min, var string objName, var int state); 
 
// ������������ ������� VOB ������� � ������ vobName. 
// ������� ������������� � ���������� VOB ������� � ��������.
// ������������ ��� ����������� ��������� ����� �������.
func void Wld_SendTrigger(var string vobName); 
 
// �������������� ������� VOB ������� � ������ vobName.
func void Wld_SendUntrigger(var string vobName); 
 
// ���������� ��������������� ����� ���������, ��� tableName � ��� ������� �������� ���������.
func void Wld_ExchangeGuildAttitudes(var string tableName); 
 
// ������������� ������� guild ���������� ������������ room.
func void Wld_AssignRoomToGuild(var string room, var int guild); 
 
// ������������� ��� owner ���������� ������������ room.
func void Wld_AssignRoomToNpc(var string room, var C_NPC owner); 
 
// �������� ������ �� ���, �������� ����������� ���������, � ������� ������ ��������� ��
func C_NPC Wld_GetPlayerPortalOwner();
 
// �������� ����� �������, ������� ����������� ���������, � ������� ������ ��������� ��
func int Wld_GetPlayerPortalGuild();
 
// �������� ������ �� ���, �������� ����������� ���������, ������� ������ ��� ������� ��
func C_NPC Wld_GetFormerPlayerPortalOwner();
 
// �������� ����� �������, ������� ����������� ���������, ������� ������ ��� ������� ��
func int Wld_GetFormerPlayerPortalGuild(); 
 
// ��������� ���������� ������
// nameVfx - ��� ������� (�� ����� Scripts\System\VisualFX\VisualFxInst.d)
// instOrigin - ��������� ��������� ��� ��������, �� �������� ������� ������
// instTarget - ��������� ��������� ��� ��������, �� ������� ������������� ������
// EffectLevel - ������� �������
// Damage - ��������� �����������
// DamageType - ��� �����������
// IsProjectile - ��������� �������� �������
func void Wld_PlayEffect(var string nameVfx, var C_NPC instOrigin, var C_NPC instTarget, var int EffectLevel, var int Damage, var int DamageType, var int IsProjectile);

//--------------------- ������� ������ � NPC  ---------------------------------

// ���������� ����� �������, � ������� ����������� ��� npc.
func int Npc_GetTrueGuild(var C_NPC npc); 
 
// ���������� �������������� ��� npc � ������� guild.
func int Npc_SetTrueGuild(var C_NPC npc, var int guild); 
 
// ���������� ���������� ��������� attitude ��� npc �� ���� ��������� ���.
func void Npc_SetAttitude(var C_NPC npc, var int attitude); 
 
// ���������� ��������� ��������� attitude ��� npc �� ���� ��������� ���.
func void Npc_SetTempAttitude(var C_NPC npc, var int attitude); 
 
// �������� ������� ��������� ��� npc � ��� other.
func int Npc_GetAttitude(var C_NPC npc, var C_NPC other); 
 
// �������� ���������� ��������� ��� npc � ��� other.
func int Npc_GetPermAttitude(var C_NPC npc, var C_NPC other); 
 
// �������� ��������� ��� npc � ��� other, ��� ��������� ����� ���������, � �� ����������.
func int Npc_GetGuildAttitude(var C_NPC npc, var C_NPC other); 
 
// ��� ������� ������, ��� ��� npc ������ � ��� player (��).
func void Npc_SetKnowsPlayer(var C_NPC npc, var C_NPC player) ; 
 
// ���������, ������ �� ��� npc � ��� player, ���������� TRUE, ���� ������, ����� FALSE.
func int Npc_KnowsPlayer(var C_NPC npc, var C_NPC player); 
 
// ���������, ����������� �� ������� item npc, ���������� 1, ���� �����������, ����� - 0.
func int Npc_OwnedByNpc(var C_ITEM item, var C_NPC npc); 
 
// ���������, ����������� �� ������� item ������� guild, ���������� 1, ���� �����������, ����� - 0.
func int Npc_OwnedByGuild(var C_ITEM item, var int guild); 
 
// ���������� �������� WP, � ������� ���������� ��� npc.
func string Npc_GetNearestWP(var C_NPC npc); 
 
// ���������� �������� �������� ����� WP, ����� � ������� ���������� ��� npc.
func string Npc_GetNextWP(var C_NPC npc); 
 
// ���������� 1, ���� ���� ��� npc ���������� ������������, ����� � 0.
func int Npc_IsWayBlocked(var C_NPC npc); 
 
// ���������, ��������� �� ��� npc � ����� FP � ������ freepoint, ���������� 1 � ��, ����� � 0.
func int Npc_IsOnFP(var C_NPC npc, var string freepoint); 
 
// ���������� 1, ���� ��� npc �����, ����� � 0.
func int Npc_IsDead(var C_NPC npc); 
 
// ���������� TRUE, ���� ��� npc ��� ������� ���������� instanceInfo, ����� FALSE.
func int Npc_KnowsInfo(var C_NPC npc, var int instanceInfo); 
 
// ���������, ����� �� ��� npc �������������� ���������� ��� ������, 
// � ���� ������ ������������ 1 � ���������� ������, ����� 0, 
// ��� important � �������� ���������� (1 � ������, 0 � �������).
func int Npc_CheckInfo(var C_NPC npc, var int important); 
 
// �������� ���������� ���������� �������
func int Npc_GiveInfo(var C_NPC npc, var int important); 
 
// ���������, ����� �� npc ������ � ��������� missionState (AVAILABLE, RUNNING) 
// � ��������� important, ���������� 1, ���� �����, ����� � 0.
func int Npc_CheckAvailableMission(var C_NPC npc, var int missionState, var int important); 
 
// �������� ���������� ���������� �������, ������ ����������� ������ � ��������� �������� ����������.
func int Npc_CheckRunningMission(var C_NPC npc, var int important); 
 
// �������� ���������� ���������� �������, ������ ����������� ������ 
// � ������� ��� npc ����� ���-�� ���������� ������.
func int Npc_CheckOfferMission(var C_NPC npc, var int important); 
 
// ���������� ���-�� ������, ������� ��� npc ��������� � ������� ���������, �������� � "Loop" �����.
func int Npc_GetStateTime(var C_NPC npc); 
 
// ���������� ���-�� ������ seconds, ��� ����� ��� npc ����� ��������� � ���� ���������.
func void Npc_SetStateTime(var C_NPC npc, var int seconds); 
 
// ���������� ���������, � ������� ��������� ��� npc (BS_���������).
func int Npc_GetBodyState(var C_NPC npc); 
 
// ���������, ���������� �� � ��� npc ���� ��������� bodyFlag, ���������� 1, ���� ����������, ����� � 0.
func int Npc_HasBodyFlag(var C_NPC npc, var int bodyFlag); 
 
// ���������� 1, ���� ����������� ��� npc �������� ��.
func int Npc_IsPlayer(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ��������� (�����, ������ � �.�.) ��� other, ����� � 0.
func int Npc_HasDetectedNpc(var C_NPC npc, var C_NPC other); 
 
// ������ �� ������� ��������� ������ ��� npc, ��� state � ������� ��������� ������, 
// ���������� TRUE, ���� ��� ��������� � ���� ���������, ����� � FALSE.
func int Npc_IsInState(var C_NPC npc, var func state); 
 
// ���������� ���������� �������, ������ ������ �� ���������� ��������� ������ ���.
func int Npc_WasInState(var C_NPC npc, var func state); 
 
// ���������, ��������� �� ��� npc � ������� state, ���������� TRUE ���� ���������, ����� � FALSE.
func int Npc_IsInRoutine(var C_NPC npc, var func state); 
 
// �������� � ��� npc ���������� ��� routine.
func void Npc_ExchangeRoutine(var C_NPC npc, var string routine); 
 
// ���������� 1, ���� ��� npc ��������� �� ����� ������������ Cutscene, ����� � 0.
func int Npc_IsInCutscene(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc �������������, ����� � 0.
func int Npc_IsVoiceActive(var C_NPC npc); 
 
// ������� ��� ������� ��� ��� npc �� ������� AI_Queue.
func void Npc_ClearAIQueue(var C_NPC npc); 
 
// ������������� �������� ani ��� ��� npc.
func void Npc_PlayAni(var C_NPC npc, var string ani); 
 
// ���������� ������� ������ �� ������� ��� ��� npc �� timeSec ������.
func void Npc_SetRefuseTalk(var C_NPC npc, var int timeSec); 
 
// ���������, ����� �� ������� ������ �� ������� ��� ��� npc, 
// ���������� TRUE, ���� ������� �� �����, ����� � FALSE.
func int Npc_RefuseTalk(var C_NPC npc); 
 
// ���������� 1, ���� ��� other ��������� �� ���������� �� ����� 3 ������ �� ��� npc, ����� � 0.
func int Npc_IsNear(var C_NPC npc, var C_NPC other); 
 
// ���������� ���������� � ��. ����� ��� npc � other.
func int Npc_GetDistToNpc (var C_NPC npc, var C_NPC other); 
 
// ���������� ���������� � ��. ����� ��� npc � WP waypoint.
func int Npc_GetDistToWP(var C_NPC npc, var string waypoint); 
 
// ���������� ���������� � ��. ����� ��� npc � ��������� item.
func int Npc_GetDistToItem(var C_NPC npc, var C_ITEM item); 
 
// ���������� ���������� � ��. ����� ��� npc � ��.
func int Npc_GetDistToPlayer(var C_NPC npc); 
 
// ������ ������� ���������� ��� ��� npc �������, 
// ��� source � �������� �������� (���������� ��� ���������: 
// NEWS_SOURCE_WITNESS � ���� ��������� �������������, 
// NEWS_SOURCE_GOSSIP � �������), 
// newsID � ������������� ������� (���������� �������: 
// NEWS_MURDER - ��������, NEWS_ATTACK � �����, NEWS_THEFT � ���������, NEWS_DEFEAT � ���������, 
// NEWS_NERVE � �����������, NEWS_INTERFERE � �������������, NEWS_HASDEFEATED � ������), 
// offender � ��� ����������, victim � ��� ������.
func void Npc_MemoryEntry(var C_NPC npc, var int source, var C_NPC offender, var int newsID, var C_NPC victim); 
 
// �������� ���������� ���������� �������, ������ ������� �������� ��� �������.
func void Npc_MemoryEntryGuild(var C_NPC npc, var int source, var C_NPC offender, var int newsID, var C_NPC victimguild); 
 
// ��� ������� ���������, ����� �� ��� npc ������� � ��������������� newsID 
// � ������ victim � ����������� offender, 
// ���������� 1, ���� �����, ����� � 0. 
// (������ �������� ���������� ����� �������� 0).
func int Npc_HasNews(var C_NPC npc, var int newsID, var C_NPC offender, var C_NPC victim); 
 
// ���������� 1, ���� ������� ��� ��� npc �������� ��������, ����� � 0.
func int Npc_IsNewsGossip(var C_NPC npc, var int newsID); 
 
// ���������� ������ �� ��������� � ������� newsID ��� ��� npc.
func C_NPC Npc_GetNewsWitness(var C_NPC npc, var int newsID); 
 
// ���������� ������ �� ������ � ������� newsID ��� ��� npc.
func C_NPC Npc_GetNewsVictim(var C_NPC npc, var int newsID); 
 
// ���������� ������ �� ����������� � ������� newsID ��� ��� npc.
func C_NPC Npc_GetNewsOffender(var C_NPC npc, var int newsID); 
 
// ������� ������� newsID ��� ��� npc, ���������� 1, ���� �������� �������, ����� � 0.
func int Npc_DeleteNews(var C_NPC npc, var int newsID); 
 
// �������� �������� �������� attribute �� ���-�� ������ value ��� ��� npc.
func void Npc_ChangeAttribute(var C_NPC npc, var int attribute, var int value); 
 
// ��� npc ������� ���������� spell, ��� ���������� ��������, �� ��� �� �����������.
func void Npc_CreateSpell(var C_NPC npc, var int spell); 
 
// ��� npc ������ ���������� spell � ����� ��� ������������.
func void Npc_LearnSpell(var C_NPC npc, var int spell); 
 
// ���������� ����� ����������, ������� ����� �������� ��� npc, ����� - -1.
func int Npc_GetActiveSpell(var C_NPC npc); 
 
// ���������� ����� ��������� ��������� ���������� � ��� npc. 
// ���������� ��� ��������� ����������: SPELL_GOOD, SPELL_NEUTRAL, SPELL_BAD.
func int Npc_GetActiveSpellCat(var C_NPC npc); 
 
// ������ ����� �������� value ��� ��������� ���������� � ��� npc, 
// ��� �������� ����� �������������� � ��������, �������� �� ���� �� ���������. 
// ������������ �������� ����������.
func int Npc_SetActiveSpellInfo(var C_NPC npc, var int value); 
 
// ���������� ������� ��������� ���������� � ��� npc.
func int Npc_GetActiveSpellLevel(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ����� ������������ ���������� spell, ����� � 0.
func int Npc_HasSpell(var C_NPC npc, var int spell); 
 
// ������� ��������� ���������� perc � ��� npc, ��� action � ������� ��������� ����������.
func void Npc_PercEnable(var C_NPC npc, var int perc, var func action); 
 
// ������� ����������� ���������� perc � ��� npc.
func void Npc_PercDisable(var C_NPC npc, var int perc); 
 
// ��������� ������� ������� � �������� seconds ��� npc �� ������� ��� ��������� ����������.
func void Npc_SetPercTime(var C_NPC npc, var float seconds); 
 
// ������� ������� ���������� ���������� perc �� npc, ��� victim � ������, offender � ����������.
func void Npc_SendPassivePerc(var C_NPC npc, var int perc, var C_NPC victim, var C_NPC offender); 
 
// ������� ������� ���������� perc �� ��� npc � ��� target.
func void Npc_SendSinglePerc(var C_NPC npc, var C_NPC target, var int perc); 
 
// ��������� ��� npc ������������ ��� ������� � ���� �������� ����������, 
// ����� ����� ������������ ������� Wld_DetectNpc � Wld_DetectItem.
func void Npc_PerceiveAll(var C_NPC npc); 
 
// ���������� ��� MOB (Move Object) �������, ������� ��������� ��� npc. 
// ��������: ���� ��� MOB ������� " DOOR_OCR _135", �� ������� ��������� " DOOR ".
func string Npc_GetDetectedMob(var C_NPC npc); 
 
// ���������� TRUE, ���� npc ����� ������ ��� other, ����� � FALSE.
func int Npc_CanSeeNpc(var C_NPC npc, var C_NPC other); 
 
// ���������� TRUE, ���� ��� npc ����� ������ ��� other �� ������, ��� ����� ���� ������, ����� � FALSE.
func int Npc_CanSeeNpcFreeLOS(var C_NPC npc, var C_NPC other); 
 
// ���������� TRUE, ���� npc ����� ������ ������� item, ����� � FALSE.
func int Npc_CanSeeItem(var C_NPC npc, var C_ITEM item); 
 
// ���������� TRUE, ���� ��� npc ����� ������ �������� �����, ����� � FALSE.
func int Npc_CanSeeSource(var C_NPC npc); 
 
// ���������� TRUE, ���� �� ��������� � ��������� ��� npc ��� � ��������� ��� �������, ����� � FALSE.
func int Npc_IsPlayerInMyRoom(var C_NPC npc); 
 
// ���������� TRUE, ���� �� ����� ��������� � ��������� ��� npc ��� � ��������� ��� �������, ����� � FALSE.
func int Npc_WasPlayerInMyRoom(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ����� ������, ����� � 0.
func int Npc_GetComrades(var C_NPC npc); 
 
// ���������� �������� > 0, ���� ��� owner �������� ���������� MOB�, ������� ���������� ��� npc.
func int Npc_IsDetectedMobOwnedByNpc(var C_NPC npc, var C_NPC owner); 
 
// ���������� �������� > 0, ���� ������� ownerGuild �������� ���������� MOB�, ������� ���������� ��� npc.
func int Npc_IsDetectedMobOwnedByGuild(var C_NPC npc, var int ownerGuild); 
 
// ��� npc �������� ������� item �� ��� other.
func void Npc_GiveItem(var C_NPC npc, var C_ITEM item, var C_NPC other); 
 
// ��������� ��� ������ ItemReact ������� �� ������� item, ���������� ��� npc �� ��� other, 
// ��������� ��������������� ������� Reaction � ���������� TRUE, ���� ������� ������, ����� � FALSE.
func int Npc_StartItemReactModules(var C_NPC npc, var C_NPC other, var C_ITEM item); 
 
// ���������, ����� �� ��� other ������� instanceItem ��� �������� ��� npc, 
// ���������� TRUE, ���� ������� �������, ����� � FALSE.
func int Npc_HasOffered(var C_NPC npc, var C_NPC other, var int instanceItem); 
 
// �������� ������ �� �������, ������� ����� ��� npc � ������� instanceItem.
func C_ITEM Npc_GetInvItem(var C_NPC npc, var int instanceItem); 
 
// ���������� ��������� ��������� instanceItem � ��� n0.
func int Npc_HasItems(var C_NPC npc, var int instanceItem); 
 
// ���������� ���- �� ���������, ������� ��������� � ��� npc, 
// ��� category � ��������� ��������� 
// (INV_WEAPON, INV_ARMOR, INV_RUNE, INV_MAGIC, INV_FOOD, INV_POTION, INV_DOC, INV_MISC) 
// slot � ����� ����� ��������.
func int Npc_GetInvItemBySlot(var C_NPC npc, var int category, var int slot); 
 
// ������� instanceItem ��������� �� ��������� ��� npc � �� ����.
func void Npc_RemoveInvItem(var C_NPC npc, var int instanceItem); 
 
// ��������� ���-�� amount ��������� instanceItem ��������� �� ��������� ��� npc � �� ����.
func void Npc_RemoveInvItems(var C_NPC npc, var int instanceItem, var int amount); 
 
// ���������� ������ �������� ������� ���������, ������� ���������� ��� npc.
func C_ITEM Npc_GetEquippedMeleeWeapon(var C_NPC npc); 
 
// ���������� ������ �������� ������� ���������, ������� ���������� ��� npc.
func C_ITEM Npc_GetEquippedRangedWeapon(var C_NPC npc); 
 
// ���������� �������, �������� ���������� ��� npc.
func C_ITEM Npc_GetEquippedArmor(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ���������� �������, ����� - 0.
func int Npc_HasEquippedWeapon(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ���������� ������� �������� ������� ���������, ����� - 0.
func int Npc_HasEquippedMeleeWeapon(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ���������� ������� �������� ������� ���������, ����� - 0.
func int Npc_HasEquippedRangedWeapon(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ���������� ���������, ����� - 0.
func int Npc_HasEquippedArmor(var C_NPC npc); 
 
// ������ ��� npc � ����� ��������� ���.
func void Npc_SetToFistMode(var C_NPC npc); 
 
// ������ ��� npc � ����� ��� � ��������������� ������� weapon.
func void Npc_SetToFightMode(var C_NPC npc, var int weapon); 
 
// ���������� 1, ���� ��� npc ��������� � ������ ������ fightMode, ����� - 0. 
// ������ ��������� ������ ������: 
// FMODE_NONE � �������� �����, 
// FMODE_FIST � ����� ��������� ���, 
// FMODE_MELEE � ������ ����� � ������� �������� ������� ���������, 
// FMODE_FAR - ������ ����� � ������� �������� ������� ���������, 
// FMODE_MAGIC � ������ ����� � ������.
func int Npc_IsInFightMode(var C_NPC npc, var int fightMode); 
 
// ���������� ������ �� ������, ������� ��� npc ������ � ����.
func C_ITEM Npc_GetReadiedWeapon(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ������ ����� ������ � ����, ����� - 0.
func int Npc_HasReadiedWeapon(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ������ � ���� ������ �������� ������� ���������, ����� - 0.
func int Npc_HasReadiedMeleeWeapon(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ������ � ���� ������ �������� ������� ���������, ����� - 0.
func int Npc_HasReadiedRangedWeapon(var C_NPC npc); 
 
// ���������� 1, ���� ��� npc ������ � ���� ��� ����� � ��������� ������ 
// �������� ������� ��������� � ������������, ����� - 0.
func int Npc_HasRangedWeaponWithAmmo(var C_NPC npc); 
 
// ���������� TRUE, ���� ��� npc ����� ���� ��� ��������� 
// (� �������� ���� ��������� ���������� ���������� other), ����� � FALSE.
func int Npc_GetTarget(var C_NPC npc); 
 
// ����������� �������� ����� ���� ��� ��� npc. 
// ���� ���� ���������, �� ��� ���������� ���������� ����� � ������������ � ���������� ���������� other, 
// ���� ���� �� �������, �� ���������� ���� ��������� � other ���������� ����������������. 
// �������� ������ ���� - � �������� ���� �������� ���������� ���������, 
// ������� �� ����� ��� ��������� �� � ��������������� ���������. 
// ���������� TRUE, ���� ���� �������, ����� � FALSE. 
// ��������: ����� ������������ �� �������� ���������� ��� npc, �������, 
// ���� �������� ���������� �� �����������, �� ������� ������� ��������� ������� Npc_PerceiveAll(). 
func int Npc_GetNextTarget(var C_NPC npc); 
 
// �������� ���������� ���������� �������, ������ �� ���������� ����, �� ���������� other �� ����������������.
func int Npc_IsNextTargetAvailable(var C_NPC npc); 
 
// ������������� ��� ��� npc � �������� ���������� ���� ��� ��������� ��� other.
func void Npc_SetTarget(var C_NPC npc, var C_NPC other); 
 
// �������� ����� �������� ��� ����� npc � other �� ���������� ���������: 
// ���� ����� ������� ���� ��� (����� � ��������), ������� ��������� � npc � ���������� � other, 
// ����� ��� � ��� ���� ��������� ����� ������� ���� ��� (����� � ��������), 
// ������� ���������� � npc � ��������� � other, 
// �� other ������ � ������������ FALSE, 
// ����� ������� npc � ������������ TRUE. 
// ���������: 
// 1. ���, ������� ��������� � �����, �� �����������. 
// 2. ���, ������� ��������� � ������ � ���������� � �������, ����� ����������� � �������� ��� ����.
func int Npc_AreWeStronger(var C_NPC npc, var C_NPC other); 
 
// ���������� 1, ���� ��� other ������� � ��� npc �� ������ �������� ������� ��������� ��� ������, ����� � 0.
func int Npc_IsAiming(var C_NPC npc, var C_NPC other); 
 
// ���������� ������� ������ talent, ������� ����� ��� npc.
// ���������� ��������� �����������: 
// NPC_TALENT _1 H � �������� ������������, 
// NPC_TALENT _2 H � �������� �����������, 
// NPC_TALENT_BOW � �������� �����, 
// NPC_TALENT_CROSSBOW � �������� ���������, 
// NPC_TALENT_PICKLOCK � ������ ��������� �����, 
// NPC_TALENT_PICKPOCKET � ��������� �����, 
// NPC_TALENT_MAGE � �������� ������, 
// NPC_TALENT_SNEAK � ������ ��������������, 
// NPC_TALENT_REGENERATE � ����������� ��������������� ��������, 
// NPC_TALENT_FIREMASTER � ����������� ��������� ���������� � �����, 
// NPC_TALENT_ACROBAT � ����������.
func int Npc_GetTalentSkill(var C_NPC npc, var int talent); 
 
// ���������� ���-�� ������ ������ talent, ������� ����� ��� npc.
func int Npc_GetTalentValue(var C_NPC npc, var int talent); 
 
// ���������� ������� level ������ talent, ������� ������� ��� npc.
func void Npc_SetTalentSkill(var C_NPC npc, var int talent, var int level); 
 
// ���������� ���-�� ������ value ������ talent, ������� ������� ��� npc.
func void Npc_SetTalentValue(var C_NPC npc, var int talent, var int value); 

//----------- ������� �������������� ���������� (AI_ �������)   ---------------

// ��� npc ����������� �� sec ������ � ��������� ��������, 
// � ���� ��������� �� �� ������ ������, �� ��������� ����� �������������� � �������� ��������� ����������.
func void AI_Wait(var C_NPC npc, var float sec); 
 
// ��� ��� npc ������������� �������� ani (ani ����������� ������� ���������� �������).
func void AI_PlayAni(var C_NPC npc, var string ani); 
 
// ���� ��� npc ��������� � ��������� ��������, �� ������������� ��������������� ��������, 
// ���� ��� npc ��������� �� MOBSI ������� (����, ������� � �.�.), �� �� ������.
func void AI_StandUp(var C_NPC npc); 
 
// � ������� �� ���������� ������� ������� �������� �� �������������, 
// ��� npc ����� ����������� � ������� ���������.
func void AI_StandUpQuick(var C_NPC npc); 
 
// ��� npc ������ ������� ������ �� ��� other. ����������� ������ �������� ������� � ������� 2 ������.
func void AI_QuickLook(var C_NPC npc, var C_NPC other); 
 
// ��� npc ������� �� ������������ ����� �� ��������� ��� �� ������, 
// ��� point � ��� ����� ��������� ��� ��� VOB �������.
func void AI_LookAt(var C_NPC npc, var string point); 
 
// ��� npc ������� �� ��� other.
func void AI_LookAtNpc(var C_NPC npc, var C_NPC other); 
 
// ��� npc ����� ������� ����� ����� �����.
func void AI_StopLookAt(var C_NPC npc); 
 
// ��� npc ��������� �� ������������ ����� �� ��������� ��� �� ������, 
// ��� point � ��� ����� ��������� ��� ��� VOB �������.
func void AI_PointAt(var C_NPC npc, var string point); 
 
// ��� npc ��������� �� ��� other.
func void AI_PointAtNpc(var C_NPC npc, var C_NPC other); 
 
// ��� npc ���������� ��������� �� ���-������ ��� ����-������.
func void AI_StopPointAt(var C_NPC npc); 
 
// ��� npc ����� (���������) ������� item.
func void AI_TakeItem(var C_NPC npc, var C_ITEM item); 
 
// ��� npc ����������� �� ����� ��� �� ��� ������� instanceItem.
func void AI_DropItem(var C_NPC npc, var int instanceItem); 
 
// ��� npc ���������� ������� instanceItem.
func void AI_UseItem(var C_NPC npc, var int instanceItem); 
 
// ��� npc ���������� ������� instanceItem �� ���������� ��������� state (-1 � ������������ ���������).
func void AI_UseItemToState(var C_NPC npc, var int instanceItem, var int state); 
 
// ��� npc ����� (���������) MOB (������, ������� � �.�.) � ������ mobName.
func void AI_TakeMob(var C_NPC npc, var string mobName); 
 
// ��� npc ����������� �� ����� ��� �� ��� ��������� MOB.
func void AI_DropMob(var C_NPC npc); 
 
// ��� npc ���������� MOB � ������ mobName �� ���������� ��������� state. 
// ���� ��������� ��������� � MOB� ��� �������, ��� npc ������������ � ����, �� ������ �� ������.
func int AI_UseMob(var C_NPC npc, var string mobName, var int state); 
 
// ��� npc ����������� �� msec ����������� � ��������� ��������, 
// � ���� ��������� �� �� ������ ������, �� ��������� ����� �������������� � �������� ��������� ����������.
func void AI_Waitms(var C_NPC npc, var int msec); 
 
// ��� npc ����� ������� ��� other, ��� see � �����-�� ������� (�������� �� �����)
func void AI_CanSeeNpc(var C_NPC npc, var C_NPC other, var func see); 
 
// ���������� ����� ������������ moveMode ��� ��� npc. 
// ���������� ��������� ������: 
// NPC_RUN � ���, 
// NPC_WALK � ������ �����, 
// NPC_SNEAK � �������������, 
// NPC_RUN_WEAPON � ��� � �������, 
// NPC_WALK_WEAPON � ������ � �������, 
// NPC_SNEAK_WEAPON � ������������� � �������.
func void AI_SetWalkmode(var C_NPC npc, var int moveMode); 
 
// ��� npc ������������ � ��������� WP waypoint.
func void AI_GotoWP(var C_NPC npc, var string waypoint); 
 
// ��� npc ������������ � ��������� FP freepoint, ������������� � �������� 20 ������. 
// �������� ������ FP ���������� ������������� � ������� Wld_IsFPAvailable.
func void AI_GotoFP(var C_NPC npc, var string freepoint); 
 
// �������� ���������� ���������� �������, 
// ������ �������� ������ FP ���������� ������������� � ������� Wld_IsNextFPAvailable.
func void AI_GotoNextFP(var C_NPC npc, var string freepoint); 
 
// ��� npc ������������ � ��� other.
func void AI_GotoNpc(var C_NPC npc, var C_NPC other); 
 
// ��� npc ������������ � �������� item.
func void AI_GotoItem(var C_NPC npc, var C_ITEM item); 
 
// ��� npc ������������ � ��������� �����.
func void AI_GotoSound(var C_NPC npc); 
 
// ������������� ��� npc � ����� ������� waypoint.
func void AI_Teleport(var C_NPC npc, var string waypoint); 
 
// ��� npc �������������� � ��� other �����.
func void AI_TurnToNpc(var C_NPC npc, var C_NPC other); 
 
// ��� npc �������������� � ��� other ������.
func void AI_TurnAway(var C_NPC npc, var C_NPC other); 
 
// ��� npc ������ �������������� � ��� other �����. (������ ������).
func void AI_WhirlAround(var C_NPC npc, var C_NPC other); 
 
// ��� npc ������ �������������� ����� � ������-�� ���������.
func void AI_WhirlAroundToSource(var C_NPC npc); 
 
// ��� npc �������������� ����� � ��������� �����.
func void AI_TurnToSound(var C_NPC npc); 
 
// ��� npc ������������� � WP ����� �� ����������� �������, �������� � Spacer.
func void AI_AlignToWP(var C_NPC npc); 
 
// ��� npc ������������� � FP ����� �� ����������� �������, �������� � Spacer.
func void AI_AlignToFP(var C_NPC npc); 
 
// ��� npc ����������� �����. (������ ������ ��� ����� ����������).
func void AI_Dodge(var C_NPC npc); 
 
// ��� ��� npc ������������� �������� ani ��� ������������� ��������� ���� state. 
func void AI_PlayAniBS(var C_NPC npc, var string ani, var int state); 
 
// ��� ��� npc ������������� Cutscene � ������ csName, �������� � ��������.
func void AI_PlayCutscene(var C_NPC npc, var string csName); 
 
// ��� npc ����������� ������, ������� ����������.
func void AI_DrawWeapon(var C_NPC npc); 
 
// ��� npc ������ ������.
func void AI_RemoveWeapon(var C_NPC npc); 
 
// ��� npc ������� ������ �������� ������� ��������� � ���.
func void AI_ReadyMeleeWeapon(var C_NPC npc); 
 
// ��� npc ������� ������ �������� ������� ��������� � ���.
func void AI_ReadyRangedWeapon(var C_NPC npc); 
 
// ��� npc �������� �������� (��� ������� ������ ���������� ������ ZS_Attack_Loop). 
// ��������� ���������� ����, ������� ���� ������ �������� Npc_SetTarget ��� Npc_GetNextTarget.
func void AI_Attack(var C_NPC npc); 
 
// ��� npc ������� ��� other (����������� �������� �����).
func void AI_FinishingMove(var C_NPC npc, var C_NPC other); 
 
// ��� npc �������� ���� ���������� (����������). ����������� ������ �� ����� ����� ����������.
func void AI_Defend(var C_NPC npc); 
 
// ��� npc ������� �� ���������� (��� ������� ������ ���������� ������ ZS_Loop). 
// �������������� �������� Npc_SetTarget ������ ���� ����������� ���������� ����, 
// �� ������� ��� npc ������ �������.
func void AI_Flee(var C_NPC npc); 
 
// ��� npc ������� �� ������ �������� ������� ��������� � ��� target.
func void AI_AimAt(var C_NPC npc, var C_NPC target); 
 
// ��� npc ���������� �������� �� ������ �������� ������� ���������.
func void AI_StopAim(var C_NPC npc); 
 
// ��� npc �������� �� ������ �������� ������� ��������� � ��� target.
func void AI_ShootAt(var C_NPC npc, var C_NPC target); 
 
// ������� ��� npc �� ����������� �� ����� ���.
func void AI_CombatReactToDamage(var C_NPC npc); 
 
// ������� ���������� ������������ ������� instanceItem, ������� ������� � ��� npc. 
func void AI_LookForItem(var C_NPC npc, var int instanceItem); 
 
// � ��������� ��� npc ������ ����� ������ ������ �������� ������� ��������� � �������� �� ���� ��� �����.
func void AI_EquipBestMeleeWeapon(var C_NPC npc); 
 
// � ��������� ��� npc ������ ����� ������ ������ �������� ������� ��������� � �������� �� �����.
func void AI_EquipBestRangedWeapon(var C_NPC npc); 
 
// � ��������� ��� npc ������ � ��������� ����� ������ �������.
func void AI_EquipBestArmor(var C_NPC npc); 
 
// ��� ������������� ������ ��� npc ��������� � ���������.
func void AI_UnequipWeapons(var C_NPC npc); 
 
// ������ ������� ��� npc ��������� � ���������.
func void AI_UnequipArmor(var C_NPC npc); 
 
// ��� npc ������� ������� instanceItem, ������� ������ ���������� � ��� ���������.
func void AI_EquipArmor(var C_NPC npc, var int instanceItem); 
 
// ��� npc ����� � ���� ���������� spell � ���-��� ��������������� ���� investMana.
func void AI_ReadySpell(var C_NPC npc, var int spell, var int investMana); 
 
// ��� npc ������ � ��������� ����������, ������� ����� � ����.
func void AI_UnreadySpell(var C_NPC npc); 
 
// ������ ������� ��������� ������, 
// ��� npc ������� ����� nameWAV (��� .wav �����) ��� ��� target. 
// ����� ����� ������ ������������� � �������� � ���� ����������� � �������. 
// (��������: AI_Output() //����� �����).
func void AI_Output(var C_NPC npc, var C_NPC target, var string nameWAV); 
 
// ������ ������� ��������� SVM (Standart Voice Module) ������, 
// ��� npc ������� ����� nameSVM ��� ��� target. 
// ����� ����� ������ ������������� � �������� � ����� svm.d (� ����� �� ��������������� SVM_ �������) 
// � ���� ����������� � ������ � ������ nameSVM. (��������: StopMagic = nameSVM; //����� �����).
func void AI_OutputSVM(var C_NPC npc, var C_NPC target, var string nameSVM); 
 
// ����������� ���������� ���������� �������, ����� �������� ������, 
// ��� �������� ��� ��������� ��������� AI_ �������. 
// ������������ ��� ������������ ����� ��������� � �� ����� ��������.
func void AI_OutputSVM_Overlay(var C_NPC npc, var C_NPC target, var string nameSVM); 
 
// ��� npc ���� �� ��� other ������ �� ���� �����. 
// (�� ����������� ����� �������� AI_OutputSVM_Overlay).
func void AI_WaitTillEnd(var C_NPC npc, var C_NPC other); 
 
// ����������, ��� ��� npc ����� �������� �� ��������� �����, 
// ��� ������ ������ ��� - ����������� ������� answerYes, ����� � ������� answerNo. 
// ��� ������� ������ ���� ������� �������.
func void AI_Ask(var C_NPC npc, var func answerYes, var func answerNo); 
 
// �������� ���������� ���������� �������, 
// ������ ��� ��������� ������� (����� �������) ����� ���� ������ ����� ������� textYes, textNo.
func void AI_AskText(var C_NPC npc, var func answerYes, var func answerNo, var string textYes, var string textNo); 
 
// ��� npc ���� ������ ��� ������� � ������� 20 ������, 
// ���� � ��� ����� �� ���������, �� ����������� ������� action.
func void AI_WaitForQuestion(var C_NPC npc, var func action); 
 
// ��� ������� ��������� ������ ��� ��� npc � ������������ ������ ��������� �������/��������.
func void AI_ProcessInfos(var C_NPC npc); 
 
// ����� ������� ��� npc, ������� ���������� ��������, �������������.
func void AI_StopProcessInfos(var C_NPC npc); 
 
// ��������� ��� npc � ��������������� ���������, ��������� �������� state, 
// ��� behaviour = 0 � ������� � ����� ��������� �������������� ����������, 
// 1 � ������� � ����� ��������� �������������� ����� ������� ���������� �������� ���������, 
// waypoint � ��� WP ����� ����� ��������� (���� "", �� ��������� ���������� �� ����� ������������ ���).
func void AI_StartState(var C_NPC npc, var func state, var int behaviour, var string waypoint); 
 
// ��������� ���� ���, ����������� �� ��� npc �� ���������� radius �����������, 
// � ��������������� ���������, ��������� �������� state.
func void AI_SetNpcsToState(var C_NPC npc, var func state, var int radius); 
 
// ���������� ���������� ���������� ��� ��� npc.
func void AI_ContinueRoutine(var C_NPC npc); 
