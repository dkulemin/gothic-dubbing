from pathlib import Path
import json
import re

EARTH = '_'
SLASH = '/'
LEFTBRACKET = '['

AVAILABLE_MODS = [
    "GM",
]
MOD_INFO = {
    "GM": {
        "NPC_PATH": Path('Goldenmod/_decompiled/PrjGOTHIC/Story/NPC'),
        "OUT": Path('Goldenmod/npcs.json'),
        "DIALOGS_PATH": Path('Goldenmod/_decompiled/PrjGOTHIC/Story/MISSIONS'),
        "ORIG_DIALOGS_PATH": Path(
            'gothic-1-classic-scripts-more-updated/unified/Unified-RU-Russobit-M/_work/Data/Scripts/Content/Story/MISSIONS'
        ),
        "MOD_DIALOGS_KEY": "gm_dialogs"
    }
}


def find_original_dialog_path(mod_name, npc_id):
    *npc_id_parts, _ = npc_id.split("_")
    for path in MOD_INFO[mod_name]["ORIG_DIALOGS_PATH"].glob("*"):
        orig_npc_id = path.stem
        _, *orig_npc_id_parts, _ = orig_npc_id.split("_")
        if (
            ("DIA_" + npc_id).lower() == orig_npc_id.lower()
            or (
                len(npc_id_parts) > 1
                and "_".join(orig_npc_id_parts).lower() == "_".join(npc_id_parts).lower()
            )
        ):
            return path


def get_dialogs(mod_name, npc_id):
    gm_hero_replics = list()
    gm_npc_replics = list()
    orig_hero_replics = list()
    orig_npc_replics = list()
    dia_path = None
    orig_dia_path = None
    for dia_path in MOD_INFO[mod_name]["DIALOGS_PATH"].rglob('DIA_' + npc_id + '.d'):
        break
    orig_dia_path = find_original_dialog_path(mod_name, npc_id)
    
    if orig_dia_path:
        original_script = orig_dia_path.read_text(encoding='windows-1251')
        
        for line in re.findall(r'AI_Output.*', original_script):
            dia_name = re.findall(r'\"(\w+)', line)[0]
            replica = re.findall(r'//(.*)', line)[0]
            if dia_name.split('_')[-2] == "15":
                orig_hero_replics.append((dia_name, replica))
            else:
                orig_npc_replics.append((dia_name, replica))
    
    if dia_path:
        gm_script = dia_path.read_text(encoding='windows-1251')
                
        for line in re.findall(r'AI_Output.*', gm_script):
            dia_name = re.findall(r'\"(\w+)', line)[0]
            replica = re.findall(r'//(.*)', line)[0]
            if dia_name.split('_')[-2] == "15" and dia_name.lower() not in [rep[0].lower() for rep in orig_hero_replics]:
                gm_hero_replics.append((dia_name, replica))
            elif dia_name.split('_')[-2] != "15" and dia_name.lower() not in [rep[0].lower() for rep in orig_npc_replics]:
                gm_npc_replics.append((dia_name, replica))
    return orig_hero_replics, orig_npc_replics, gm_hero_replics, gm_npc_replics


def parse_npcs():
    for mod in AVAILABLE_MODS:
        npcs = dict()
        npcs.update({"PC_Hero": {
            MOD_INFO[mod]["MOD_DIALOGS_KEY"]: {},
            "orig_dialogs": {},
            "name": "Я",
            "voice": "15"
        }})
        for path in MOD_INFO[mod]["NPC_PATH"].glob('*'):
            text = path.read_text(encoding='windows-1251')
            npc_id = path.stem
            npc_name = text.split('\n')[3].split('=')[-1].strip(';').strip('"').strip()[1:]
            npc_voice_id = text.split('\n')[7].split('=')[-1].strip(';').strip().zfill(2)
            
            npcs.setdefault(
                npc_id,
                {
                    "name": "",
                    "voice": "",
                    "orig_dialogs": {},
                    MOD_INFO[mod]["MOD_DIALOGS_KEY"]: {}
                }
            )
            npcs[npc_id]["name"] = npc_name
            npcs[npc_id]["voice"] = npc_voice_id
            
            o_hero, o_npc, g_hero, g_npc = get_dialogs(mod, npc_id)
            for dia_name, dia_text in o_npc:
                npcs[npc_id]['orig_dialogs'][dia_name] = dia_text
            for dia_name, dia_text in o_hero:
                npcs["PC_Hero"]['orig_dialogs'][dia_name] = dia_text
            for dia_name, dia_text in g_npc:
                npcs[npc_id]['gm_dialogs'][dia_name] = dia_text
            for dia_name, dia_text in g_hero:
                if dia_name not in npcs["PC_Hero"]['orig_dialogs']:
                    npcs["PC_Hero"]['gm_dialogs'][dia_name] = dia_text
        with open(MOD_INFO[mod]["OUT"], 'w') as npc_out:
            json.dump(npcs, npc_out, ensure_ascii=False, indent=4, sort_keys=True)


if __name__ == "__main__":
    # print(GM_NPC_PATH)
    parse_npcs()
    #print(get_dialogs('STT_336_Cavalorn'))
    # print(SNOWBALL_DIALOGS_PATH)
    # for t in SNOWBALL_DIALOGS_PATH.rglob('DIA_' + 'stt_336_Cavalorn' + '.d'):
    #     print(t)
    #     break
    
    # print(get_dialogs('Nov_1331_BaalTaran'))
    # print(list(SNOWBALL_DIALOGS_PATH.rglob('DIA_' + 'Nov_1331_BaalTaran' + '.d')))

    # print(get_dialogs('PC_Psionic'))