from pathlib import Path
import json
import re

EARTH = '_'
SLASH = '/'
LEFTBRACKET = '['

GM_NPC_PATH = Path('Goldenmod/_decompiled/PrjGOTHIC/Story/NPC')
GM_DIALOGS_PATH = Path('Goldenmod/_decompiled/PrjGOTHIC/Story/MISSIONS')
NPC_PATH = Path('Goldenmod/npcs.json')


def get_dialogs(npc_id):
    hero_replics = list()
    npc_replics = list()
    dia_path = GM_DIALOGS_PATH / ('DIA_' + npc_id + '.d')
    if dia_path in GM_DIALOGS_PATH.glob('*'):
        for line in re.findall(r'AI_Output.*', dia_path.read_text()):
            dia_name = re.findall(r'\"(\w+)', line)[0]
            replica = re.findall(r'//(.*)', line)[0]
            if dia_name.split('_')[-2] == "15":
                hero_replics.append((dia_name, replica))
            else:
                npc_replics.append((dia_name, replica))
    return hero_replics, npc_replics


def parse_npcs():
    npcs = dict()
    npcs.update({"PC_Hero": {
        "dialogs": {},
        "name": "Я",
        "voice": "15"
    }})
    for path in GM_NPC_PATH.glob('*'):
        text = path.read_text()
        npc_id = path.stem
        npc_name = text.split('\n')[3].split('=')[-1].strip(';').strip('"').strip()[1:]
        npc_voice_id = text.split('\n')[7].split('=')[-1].strip(';').strip().zfill(2)
        
        npcs.setdefault(npc_id, dict(name='', voice='', dialogs=dict()))
        npcs[npc_id]['name'] = npc_name
        npcs[npc_id]['voice'] = npc_voice_id
        
        h, n = get_dialogs(npc_id)
        for dia_name, dia_text in n:
            npcs[npc_id]['dialogs'][dia_name] = dia_text
        for dia_name, dia_text in h:
            npcs["PC_Hero"]['dialogs'][dia_name] = dia_text
    with open(NPC_PATH, 'w') as npc_out:
        json.dump(npcs, npc_out, ensure_ascii=False, indent=4, sort_keys=True)


if __name__ == "__main__":
    print(GM_NPC_PATH)
    parse_npcs()
    #print(get_dialogs('STT_336_Cavalorn'))
