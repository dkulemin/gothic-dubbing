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
//���� �������� ����� �� 0 �� 40 (������ ������ � ����� AST_Constants.d) 
func int PrintText(var string text, var int x, var int y, var string font, var int timeSec, var int color); 

//��� npc ������� ���������� � ������� spellid
func int AI_CastSpell(var c_npc,var int spellid);

//���������� ������ ������ topicName
func int Log_GetTopicStatus(var string topicName);