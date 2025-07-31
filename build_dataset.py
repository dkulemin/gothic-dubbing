from pathlib import Path
from typing import List, Tuple
import json


AVAILABLE_MODS = [
    "GM",
]
MOD_INFO = {
    "GM": {
        "NPC_PATH": Path("Goldenmod/npcs.json"),
        "ORIG_SPEECH_PATH": Path(
            "/Users/d.kulemin/Library/CloudStorage/GoogleDrive-blablamaildk@gmail.com/Мой диск/GOTHIC/orig/_WORK/DATA/SOUND/SPEECH/"
        ),
    }
}


def get_data(npcs_path: Path, speech_path: Path) -> List[Tuple[str, str, str]]:
    npcs_json = json.loads(Path("Goldenmod/npcs.json").read_text())
    available_audios = {
        audio.stem.lower(): audio
        for audio in list(speech_path.glob("**/*"))
    }
    result = list()
    for npc_id, npc_data in npcs_json.items():
        for dialog_id, text in npc_data["orig_dialogs"].items():
            audio_path = available_audios.get(dialog_id.lower())
            if audio_path:
                result.append((npc_id, text, audio_path.as_posix()))
    return result


if __name__ == "__main__":
    print(get_data(MOD_INFO["GM"]["NPC_PATH"], MOD_INFO["GM"]["ORIG_SPEECH_PATH"]))