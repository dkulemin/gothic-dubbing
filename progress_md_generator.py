from pathlib import Path
import json


AVAILABLE_MODS = [
    "GM",
]
MOD_INFO = {
    "GM": {
        "NPC_PATH": Path("Goldenmod/npcs.json"),
        "PROGRESS_MD_PATH": Path("Goldenmod/PROGRESS.md"),
        "MOD_DIALOGS_KEY": "gm_dialogs"
    }
}


def main():
    for mod_name in AVAILABLE_MODS:
        with open(MOD_INFO[mod_name]["NPC_PATH"], encoding="windows-1251") as npc_out:
            npcs = json.load(npc_out)
        if MOD_INFO[mod_name]["PROGRESS_MD_PATH"].is_file():
            print("`PROGRESS.md` exists for {} mod. Won't recreate file!".format(mod_name))
        else:
            with open(MOD_INFO[mod_name]["PROGRESS_MD_PATH"], "w") as progress_out:
                for npc_id, meta in npcs.items():
                    if meta[MOD_INFO[mod_name]["MOD_DIALOGS_KEY"]]:
                        progress_out.write("## ")
                        progress_out.write("{} ({})".format(meta["name"], npc_id))
                        progress_out.write("\n\n")
                        progress_out.write("|Dialog_id|Text|Audio file|Dubbed by|Comment|\n")
                        progress_out.write("|:---|:---|:---:|:---:|:---|\n")
                        for dialog_id, text in meta[MOD_INFO[mod_name]["MOD_DIALOGS_KEY"]].items():
                            progress_out.write("|{}|{}||||\n".format(dialog_id, text))
                        progress_out.write("\n\n")


if __name__ == "__main__":
    main()