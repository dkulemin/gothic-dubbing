//���������� ������ �� �������, �������������� � ���� instanceName.
func instance Hlp_GetItem(var int instanceName);

//-------------------������� ������ � �����

//��������� ����� ������(����) �� �������� � world �� ����� point(����������� �������� ����� ������ � ��������)
func string Wld_ChangeLevel(var string world,var string point);

//����������� ������ ������ ������� Wld_PlayEffect, ������ ������������� ������ � ������ ����������� ������� � ����
func void Wld_PlayEffectVob(var string nameVfx, var string OriginVobName, var string TargetVobName, var int EffectLevel, var int Damage, var int DamageType, var int IsProjectile);

//-------------------������� ������ � ��������

//�������� ��������(FPS) �������� npc � ������ aniName
func void Mdl_SetAniFps(var c_npc npc,var string aniName,var float fps);

//��������/��������� ����������� ������ ���(1/0)
func void Mdl_ShowVisual(var c_npc npc,var int bShow);



//-------------------������� ������ � ���

// ����������� ��� npc ��������� � ID itemInstance.(�������� ���������, ��� �� ����� �������� ����, ��� � � �������� ����.
func void Ext_EquipItem(var c_npc npc,var int itemInstance);

//���������� ������ �� �� ���(���� �� ����) � ������ self
func instance GetFocusNpc(var c_npc self);

//���������� ���� �� ����� ������ ������
func string GetWalkModeString(var c_npc npc);

//���������� ��� ����������� ������� � ������
func string Npc_GetFocusVobName(var c_npc npc);

//�������� ��� npc �������
func void Npc_SetAsPlayer(var c_npc npc);

//���������� 1 ���� �������� aniName �������, 0 ���� ���
func void Npc_IsAnimationActive(var c_npc npc,var string aniName);


//-------------------������� ������ � ���������

//���������� ���������� �������� � ������ "����" ����� ������� mobName
func void Mob_GetNum(var string mobName);

//�������/������� ������ mobName (1/0)
func void Mob_SetLocked(var string mobName,var int bLock);

//���������� ��������� �����, ��� ����� mobName
func void Mob_SetKeyInstance(var string mobName,var string instanceString);

//���������� "���" ���� LRLR �� ����� mobName
func void Mob_SetPickLockStr(var string mobName,var string str);

//������� ������� instanceName �� ���������� mobName � ���������� amount
func void Mob_RemoveItem(var string,var int instanceName,var int amount);

//������� ���� (�������� tHitpoints: ) ������� ������� ���������� ��
//� ������ ���� ����� �������� ������ ��� ����� ���������� "��������" �������
//������ ����������� ���������� ���������� ������ PFX_MOBDESTROY, � ������������
//�������� �� visualDestroyed(��� �� �������� � ��������), � ������ ���� ��������
// ������, �� �� ���� ������� ��� ��������.
func void Mob_ApplyDamage(int);

//��������� ��������� ������� ��� ��� ��������� �����
//(���� ����� ������� ������� �� ������ NPC_TALENT_PICKPOCKET(����� ������ ������ ���� ������� � 12, �� 6)
func void OpenSteal();

//������ ������� PrintScreen(...), � ����� ���������� ����� ������ ���� ������
//���� �������� ����� �� 0 �� 40 (������ ������ ����� ������� �����) 
func int PrintText(var string text, var int x, var int y, var string font, var int timeSec, var int color); 

//��� npc ������� ���������� � ������� spellid
func int AI_CastSpell(var c_npc,var int spellid);

//���������� ������ ������ topicName
func int Log_GetTopicStatus(var string topicName);


string GetValue_str(string,int);
string SetValue_Str(string,string,int);
float SetValue_flt(string,float,int);
float GetValue_flt(string,int);
void Mdl_SetAniFpsAll(instance,float);
void Ext_PutInSlot(instance,string,int);
void Ext_RemoveFromSlot(instance,string);
void ActivateZSSlot(instance,string);




void Npc_Replace(instance,int);
void Npc_PutInSlot2(instance,instance,string);
void Npc_SetBloodTexture(instance,string);
void Npc_SetBloodEmiter(instance,string);
void Npc_SetBloodFlow(instance,int);
void Npc_SetBloodEnabled(instance,int);
void Npc_SetBloodDistance(instance,int);
void Npc_SetBloodAmount(instance,int);
void Npc_SetTurnSpeed(instance,int);
void Npc_SetFallDownDamage(instance,int);
void Npc_SetFallDownHeight(instance,int);
void CS_SetFakePlayer(instance,instance);
void CS_EnableNpc(instance);
void CS_SetCamTargetMode(instance,string);
void CS_DisableNpc(instance);
void CS_PrintDialog(int,string,string,int,int);
void Itm_UpdateEffect(instance);
void Mdl_UpdateVisual(instance);


void OpenCraftHud(int);
void CraftHudProcess();
void CloseCraftHud();


int SetValue_int(int,string,int,int);
int GetValue_int(int,string,int);
int Npc_ModifyBodyState(instance,int,int);
int Npc_HasBodyStateModifier(instance,int);

int Wld_GetTimeHour();
int Wld_GetTimeMin();
int Itm_TwoHanded(instance);
int Itm_OneHanded(instance);
int Hlp_GetHeroStatus();

int FilterArmor(int);
int GetTimerTick();
int NpcType(instance,string);
int StrCmp(string,string);
int Npc_ValidFocusNpc(instance);
float FAssign(float,float);
float FAdd(float,float);
float FSub(float,float);
float FMul(float,float);
float FDiv(float,float);	
float FAbs(float);
float FCmp(float,float);