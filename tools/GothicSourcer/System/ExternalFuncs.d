instance Hlp_GetItem(int);
instance Hlp_GetSlotItem(instance,string);
instance GetFocusNpc(instance);
string GetValue_str(string,int);
string SetValue_Str(string,string,int);
string Wld_ChangeLevel(string,string);
string GetWalkModeString(instance);
string Npc_GetFocusVobName(instance);
float SetValue_flt(string,float,int);
float GetValue_flt(string,int);
void Mdl_SetAniFpsAll(instance,float);
void Mdl_SetAniFps(instance,string,float);
void Npc_EquipItem(instance,int);
void Npc_UnEquipItem(instance,instance);
void Ext_PutInSlot(instance,string,int);
void Ext_RemoveFromSlot(instance,string);
void ActivateZSSlot(instance,string);
void Wld_PlayEffectVob(string,string,string,int,int,int,int);
void Npc_SetAsPlayer(instance);
void Npc_IsAnimationActive(instance,string);
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
void Mdl_ShowVisual(instance,int);
void Mdl_ClearSlot(instance,string);
void Mob_GetNum(string,int);
void Mob_SetLocked(string,int);
void Mob_SetKeyInstance(string,string);
void Mob_SetPickLockStr(string,string);
void Mob_RemoveItem(string,int,int);
void Mob_ApplyDamage(int);
void Mob_ScrambleContainers();
void OpenCraftHud(int);
void CraftHudProcess();
void CloseCraftHud();
void OpenSteal();
void Prs_SetStackPos(int);
void OpenPocket(instance,int);
void Vob_SetVisual(instance,instance,string);
int Prs_GetStackPos();
void Prs_InitStack();
int Mdl_HasOverlayMds(instance,string);
int KeyPressed(int);
int PrintText(string,int,int,string,int,int);
int SetValue_int(int,string,int,int);
int GetValue_int(int,string,int);
int Npc_ModifyBodyState(instance,int,int);
int Npc_HasBodyStateModifier(instance,int);
int AI_CastSpell(instance,int);
int Wld_GetTimeHour();
int Wld_GetTimeMin();
int Itm_TwoHanded(instance);
int Itm_OneHanded(instance);
int Hlp_GetHeroStatus();
int Hlp_HasInSlot(instance,string);
int Log_GetTopicStatus(string);
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
void Hlp_MessageBox(string,string,int);
string Hlp_GetObjectName(instance);