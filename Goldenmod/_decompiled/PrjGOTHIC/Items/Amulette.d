
instance ItMi_Amulet_Psi_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 5;
	visual = "ItMi_Amulet_Psi_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Знак Братства";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Schutzamulett_Feuer(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Feuer;
	on_unequip = UnEquip_Schutzamulett_Feuer;
	description = "Амулет пламени";
	text[2] = NAME_Prot_Fire;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Feuer()
{
	self.protection[PROT_FIRE] += 10;
};

func void UnEquip_Schutzamulett_Feuer()
{
	self.protection[PROT_FIRE] -= 10;
};


instance Schutzamulett_Waffen(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Waffen;
	on_unequip = UnEquip_Schutzamulett_Waffen;
	description = "Амулет брони";
	text[2] = NAME_Prot_Edge;
	count[2] = 15;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Waffen()
{
	self.protection[PROT_EDGE] += 15;
	self.protection[PROT_BLUNT] += 15;
};

func void UnEquip_Schutzamulett_Waffen()
{
	self.protection[PROT_EDGE] -= 15;
	self.protection[PROT_BLUNT] -= 15;
};


instance Schutzamulett_Geschosse(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Geschosse;
	on_unequip = UnEquip_Schutzamulett_Geschosse;
	description = "Амулет древесной кожи";
	text[2] = NAME_Prot_Point;
	count[2] = 15;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Geschosse()
{
	self.protection[PROT_POINT] += 15;
};

func void UnEquip_Schutzamulett_Geschosse()
{
	self.protection[PROT_POINT] -= 15;
};


instance Schutzamulett_Magie(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Magie;
	on_unequip = UnEquip_Schutzamulett_Magie;
	description = "Амулет духовной силы";
	text[2] = NAME_Prot_Magic;
	count[2] = 8;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Magie()
{
	self.protection[PROT_MAGIC] += 8;
};

func void UnEquip_Schutzamulett_Magie()
{
	self.protection[PROT_MAGIC] -= 8;
};


instance Schutzamulett_Magie_Feuer(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Magie_Feuer;
	on_unequip = UnEquip_Schutzamulett_Magie_Feuer;
	description = "Амулет очищения";
	text[2] = NAME_Prot_Fire;
	count[2] = 10;
	text[3] = NAME_Prot_Magic;
	count[3] = 8;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Magie_Feuer()
{
	self.protection[PROT_MAGIC] += 8;
	self.protection[PROT_FIRE] += 10;
};

func void UnEquip_Schutzamulett_Magie_Feuer()
{
	self.protection[PROT_MAGIC] -= 8;
	self.protection[PROT_FIRE] -= 10;
};


instance Schutzamulett_Waffen_Geschosse(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Waffen_Geschosse;
	on_unequip = UnEquip_Schutzamulett_Waffen_Geschosse;
	description = "Амулет каменной кожи";
	text[2] = NAME_Prot_Edge;
	count[2] = 15;
	text[3] = NAME_Prot_Point;
	count[3] = 15;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Waffen_Geschosse()
{
	self.protection[PROT_EDGE] += 15;
	self.protection[PROT_BLUNT] += 15;
	self.protection[PROT_POINT] += 15;
};

func void UnEquip_Schutzamulett_Waffen_Geschosse()
{
	self.protection[PROT_EDGE] -= 15;
	self.protection[PROT_BLUNT] -= 15;
	self.protection[PROT_POINT] -= 15;
};


instance Schutzamulett_Total(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1600;
	visual = "ItMi_Amulet_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Total;
	on_unequip = UnEquip_Schutzamulett_Total;
	description = "Амулет железной кожи";
	text[1] = NAME_Prot_Fire;
	count[1] = 10;
	text[2] = NAME_Prot_Magic;
	count[2] = 8;
	text[3] = NAME_Prot_Point;
	count[3] = 15;
	text[4] = NAME_Prot_Edge;
	count[4] = 15;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Total()
{
	self.protection[PROT_EDGE] += 15;
	self.protection[PROT_BLUNT] += 15;
	self.protection[PROT_POINT] += 15;
	self.protection[PROT_FIRE] += 10;
	self.protection[PROT_MAGIC] += 8;
};

func void UnEquip_Schutzamulett_Total()
{
	self.protection[PROT_EDGE] -= 15;
	self.protection[PROT_BLUNT] -= 15;
	self.protection[PROT_POINT] -= 15;
	self.protection[PROT_FIRE] -= 10;
	self.protection[PROT_MAGIC] -= 8;
};


instance Gewandtheitsamulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 320;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Gewandtheitsamulett;
	on_unequip = UnEquip_Gewandtheitsamulett;
	description = "Амулет проворства";
	text[2] = NAME_Bonus_Dex;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Gewandtheitsamulett()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void UnEquip_Gewandtheitsamulett()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};


instance Gewandtheitsamulett2(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 480;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Gewandtheitsamulett2;
	on_unequip = UnEquip_Gewandtheitsamulett2;
	description = "Амулет ловкости";
	text[2] = NAME_Bonus_Dex;
	count[2] = 20;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Gewandtheitsamulett2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,20);
};

func void UnEquip_Gewandtheitsamulett2()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-20);
};


instance Staerkeamulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 320;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Staerkeamulett;
	on_unequip = UnEquip_Staerkeamulett;
	description = "Амулет могущества";
	text[2] = NAME_Bonus_Str;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Staerkeamulett()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,10);
};

func void UnEquip_Staerkeamulett()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
};


instance Staerkeamulett2(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 480;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Staerkeamulett2;
	on_unequip = UnEquip_Staerkeamulett2;
	description = "Амулет силы";
	text[2] = NAME_Bonus_Str;
	count[2] = 20;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Staerkeamulett2()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,20);
};

func void UnEquip_Staerkeamulett2()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-20);
};


instance Lebensamulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 720;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Lebensamulett;
	on_unequip = UnEquip_Lebensamulett;
	description = "Амулет жизненной силы";
	text[2] = NAME_Bonus_HP;
	count[2] = 30;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Lebensamulett()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 30;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 30;
};

func void UnEquip_Lebensamulett()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 30;
	if(self.attribute[ATR_HITPOINTS] > 31)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 30;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance Amulett_der_Magie(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 400;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Amulett_der_Magie;
	on_unequip = UnEquip_Amulett_der_Magie;
	description = "Амулет магии";
	text[2] = NAME_Bonus_Mana;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Amulett_der_Magie()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
};

func void UnEquip_Amulett_der_Magie()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
};


instance Amulett_der_Macht(C_Item)
{
	name = "Амулет мощи";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 600;
	visual = "ItMi_Amulet_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Amulett_der_Macht;
	on_unequip = UnEquip_Amulett_der_Macht;
	description = "Амулет мощи";
	text[2] = NAME_Bonus_Dex;
	count[2] = 7;
	text[3] = NAME_Bonus_Str;
	count[3] = 7;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Amulett_der_Macht()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,7);
	Npc_ChangeAttribute(self,ATR_STRENGTH,7);
};

func void UnEquip_Amulett_der_Macht()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-7);
	Npc_ChangeAttribute(self,ATR_STRENGTH,-7);
};


instance Amulett_der_Erleuchtung(C_Item)
{
	name = "Амулет озарения";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItMi_Amulet_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Amulett_der_Erleuchtung;
	on_unequip = UnEquip_Amulett_der_Erleuchtung;
	description = "Амулет озарения";
	text[2] = NAME_Bonus_HP;
	count[2] = 25;
	text[3] = NAME_Bonus_Mana;
	count[3] = 25;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Amulett_der_Erleuchtung()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 25;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 25;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 25;
};

func void UnEquip_Amulett_der_Erleuchtung()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 25;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
	if(self.attribute[ATR_HITPOINTS] > 26)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

