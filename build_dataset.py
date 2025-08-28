from pathlib import Path
import re
import shutil
import sys

from datasets import Dataset, Audio


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


SPEECH_PATH = Path("/Users/d.kulemin/Library/CloudStorage/GoogleDrive-blablamaildk@gmail.com/Мой диск/GOTHIC/orig/_WORK/DATA/SOUND/SPEECH/")
ORIG_PATH = Path("gothic-1-classic-scripts-more-updated/unified/Unified-RU-Snowball/_work/Data/Scripts/Content/Story")


def get_data() -> Dataset:
    data = []
    available_audios = {audio.stem.lower(): audio for audio in SPEECH_PATH.glob("*")}
    missions_path = ORIG_PATH / "Missions"
    npc_path = ORIG_PATH / "NPC"
    npc_ids_and_paths = {path.stem.lower(): path for path in npc_path.glob("*")}

    for mission_path in missions_path.glob("*"):
        mission = mission_path.read_text(encoding="windows-1251")
        npc_id = re.search(r"npc\s*=\s*(\w+)", mission, flags=re.IGNORECASE)
        npc_id = npc_id.group(1).lower() if npc_id else "-"
        if npc_id in npc_ids_and_paths:
            npc = npc_ids_and_paths[npc_id].read_text(encoding="windows-1251")
            npc_voice_id = re.search(r"voice\s*=\s*(\d+)", npc, flags=re.IGNORECASE)
            npc_voice_id = npc_voice_id.group(1).zfill(2) if npc_voice_id else "00"
        else:
            npc_voice_id = "00"

        npc_dialogs = re.findall(
            r'AI_Output\s*\(self,\s*.*,\s*\"(\w+)\"\);\s*//(.*)',
            mission,
            flags=re.IGNORECASE
        )
        pc_hero_dialogs = re.findall(
            r'AI_Output\s*\(.*,\s*self,\s*\"(\w+)\"\);\s*//(.*)',
            mission,
            flags=re.IGNORECASE
        )

        for dialogs, vid in [(npc_dialogs, npc_voice_id), (pc_hero_dialogs, "15")]:
            for dialog_id, text in dialogs:
                if dialog_id.lower() in available_audios:
                    _vid = vid
                    if _vid == "00":
                        _vid = dialog_id.split("_")[-2]
                    data.append(
                        {
                            "source": _vid,
                            "text": text.strip(),
                            "audio": available_audios[dialog_id.lower()].as_posix()
                        }
                    )
                else:
                    print("`%s`: `%s` is not found!" % (dialog_id, text.strip()))
    return Dataset.from_list(data).cast_column("audio", Audio())


def build_ljspeech_dataset():
    available_audios = {audio.stem.lower(): audio for audio in SPEECH_PATH.glob("*")}
    missions_path = ORIG_PATH / "Missions"
    npc_path = ORIG_PATH / "NPC"
    npc_ids_and_paths = {path.stem.lower(): path for path in npc_path.glob("*")}

    for mission_path in missions_path.glob("*"):
        mission = mission_path.read_text(encoding="windows-1251")
        npc_id = re.search(r"npc\s*=\s*(\w+)", mission, flags=re.IGNORECASE)
        npc_id = npc_id.group(1).lower() if npc_id else "-"
        if npc_id in npc_ids_and_paths:
            npc = npc_ids_and_paths[npc_id].read_text(encoding="windows-1251")
            npc_voice_id = re.search(r"voice\s*=\s*(\d+)", npc, flags=re.IGNORECASE)
            npc_voice_id = npc_voice_id.group(1).zfill(2) if npc_voice_id else "00"
        else:
            npc_voice_id = "00"

        npc_dialogs = re.findall(
            r'AI_Output\s*\(self,\s*.*,\s*\"(\w+)\"\);\s*//(.*)',
            mission,
            flags=re.IGNORECASE
        )
        pc_hero_dialogs = re.findall(
            r'AI_Output\s*\(.*,\s*self,\s*\"(\w+)\"\);\s*//(.*)',
            mission,
            flags=re.IGNORECASE
        )
        
        for dialogs, vid in [(npc_dialogs, npc_voice_id), (pc_hero_dialogs, "15")]:
            for dialog_id, text in dialogs:
                if dialog_id.lower() in available_audios:
                    _vid = vid
                    if _vid == "00":
                        _vid = dialog_id.split("_")[-2]
                    Path(f"data/ljspeech_gothic/{_vid}/wavs").mkdir(parents=True, exist_ok=True)
                    audio_file = available_audios[dialog_id.lower()]
                    shutil.copy(audio_file, f"data/ljspeech_gothic/{_vid}/wavs/{audio_file.name}")
                    with open(f"data/ljspeech_gothic/{_vid}/metadata.txt", "a") as fout:
                        print("%s|%s|%s" % (
                            available_audios[dialog_id.lower()].stem, text.strip(), text.strip()
                        ), file=fout)
                else:
                    print("`%s`: `%s` is not found!" % (dialog_id, text.strip()))


if __name__ == "__main__":
    ## export DYLD_LIBRARY_PATH="/usr/local/lib:$DYLD_LIBRARY_PATH"

    assert len(sys.argv) > 1, "Dataset type not passed"

    if sys.argv[1].lower() == "ljspeech":
        print(sys.argv[1])
        build_ljspeech_dataset()
    else:
        ds = get_data()
        print(ds[0])

        ds.save_to_disk("data/gothic_orig_ru_dialogues")
        ds.push_to_hub("gothic_orig_ru_dialogues")
