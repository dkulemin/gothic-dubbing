//возвращает ссылку на Предмет, принадлежащему к типу instanceName.
func instance Hlp_GetItem(var int instanceName);

//-------------------Функции работы с миром

//Запускает смену уровня(мира) из текущего в world на точку point(аналогичная триггеру смены уровня в спейсере)
func string Wld_ChangeLevel(var string world,var string point);

//Практически полный аналог функции Wld_PlayEffect, только воспроизводит эффект с любого визуального объекта в мире
func void Wld_PlayEffectVob(var string nameVfx, var string OriginVobName, var string TargetVobName, var int EffectLevel, var int Damage, var int DamageType, var int IsProjectile);

//-------------------Функции работы с моделями

//Изменяет скорость(FPS) анимации npc с именем aniName
func void Mdl_SetAniFps(var c_npc npc,var string aniName,var float fps);

//Включить/выключить отображение модели нпс(1/0)
func void Mdl_ShowVisual(var c_npc npc,var int bShow);



//-------------------Функции работы с НПС

// экипировать НПС npc предметом с ID itemInstance.(работает корректно, как во время загрузки мира, так и в процессе игры.
func void Ext_EquipItem(var c_npc npc,var int itemInstance);

//возвращает ссылку на на НПС(если он есть) в фокусе self
func instance GetFocusNpc(var c_npc self);

//Возвращает одну из строк режима ходьбы
func string GetWalkModeString(var c_npc npc);

//Возвращает имя визуального объекта в фокусе
func string Npc_GetFocusVobName(var c_npc npc);

//Объявить НПС npc игроком
func void Npc_SetAsPlayer(var c_npc npc);

//Возвращает 1 если анимация aniName активна, 0 если нет
func void Npc_IsAnimationActive(var c_npc npc,var string aniName);


//-------------------Функции работы с объектами

//Возвращает количество символов в строке "кода" замка объекта mobName
func void Mob_GetNum(var string mobName);

//Закрыть/открыть объект mobName (1/0)
func void Mob_SetLocked(var string mobName,var int bLock);

//Установить инстанцию ключа, для замка mobName
func void Mob_SetKeyInstance(var string mobName,var string instanceString);

//Установить "код" вида LRLR на замок mobName
func void Mob_SetPickLockStr(var string mobName,var string str);

//Удалить предмет instanceName из контейнера mobName в количестве amount
func void Mob_RemoveItem(var string,var int instanceName,var int amount);

//Нанести урон (свойству tHitpoints: ) объекту который использует гг
//В случае если урона нанесено больше или равно количеству "хдоровья" объекта
//объект разрушается проигрывая визуальный эффект PFX_MOBDESTROY, и визуализация
//меняется на visualDestroyed(так же задается в спейсере), в случае если разрушен
// сундук, то из него выпадут все предметы.
func void Mob_ApplyDamage(int);

//Открывает инвертарь другого нпс для карманной кражи
//(шанс кражи обратно зависим от навыка NPC_TALENT_PICKPOCKET(номер навыка должен быть изменен с 12, на 6)
func void OpenSteal();

//Аналог функции PrintScreen(...), с одним изменением можно менять цвет текста
//цвет задается число от 0 до 40 (список цветов будет выложен позже) 
func int PrintText(var string text, var int x, var int y, var string font, var int timeSec, var int color); 

//НПС npc кастует заклинание с номером spellid
func int AI_CastSpell(var c_npc,var int spellid);

//Возвращает статус топика topicName
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