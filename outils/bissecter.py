# -*- coding: utf-8 -*-
"""Bissection des mods BeamNG.drive : trouver le mod qui cause un problème en ~log2(n) lancements du jeu.

LE JEU DOIT ÊTRE FERMÉ pendant chaque commande (il réécrit mods/db.json en quittant).

  python -I outils/bissecter.py debut [--dossier <mods>]   sauvegarde db.json, n'active que la 1re moitié des mods actifs
  python -I outils/bissecter.py mauvais                    le problème est toujours là
  python -I outils/bissecter.py bon                        le problème a disparu
  python -I outils/bissecter.py etat                       où en est la bissection
  python -I outils/bissecter.py fin                        restaure db.json tel qu'au début

Seul le champ "active" des mods qui étaient actifs au départ est modifié ; une copie de db.json est gardée
dans db.json.bak_bissection. Par défaut <mods> = %LOCALAPPDATA%/BeamNG/BeamNG.drive/current/mods.
"""
import json, os, shutil, sys

DEFAULT = os.path.join(os.environ.get("LOCALAPPDATA", ""), "BeamNG", "BeamNG.drive", "current", "mods")
ETAT = "bissection_tim19Atlas.json"


def lire(p):
    with open(p, encoding="utf-8") as fh:
        return json.load(fh)


def ecrire(p, d):
    tmp = p + ".tmp"
    with open(tmp, "w", encoding="utf-8") as fh:
        json.dump(d, fh, indent=2, ensure_ascii=False)
    os.replace(tmp, p)


def appliquer(dossier, actifs, tous):
    db = lire(os.path.join(dossier, "db.json"))
    for k in tous:
        if k in db["mods"]:
            db["mods"][k]["active"] = k in actifs
    ecrire(os.path.join(dossier, "db.json"), db)


def etape(dossier, st):
    c = st["candidats"]
    if len(c) == 1:
        print(f"\nCoupable trouvé : {c[0]}")
        print("Lancer `bissecter.py fin` pour restaurer la configuration de départ.")
        st["fini"] = True
        return
    moitie = c[: len(c) // 2]
    st["testes"] = moitie
    appliquer(dossier, set(moitie), st["tous"])
    print(f"{len(c)} suspects. Mods actifs pour ce test ({len(moitie)}) : " + ", ".join(moitie))
    print("Lancer le jeu, reproduire le problème, quitter le jeu, puis : `bissecter.py bon` ou `bissecter.py mauvais`.")


def main():
    sys.stdout.reconfigure(encoding="utf-8")
    args = sys.argv[1:]
    if not args or args[0] not in ("debut", "bon", "mauvais", "etat", "fin"):
        sys.exit(__doc__)
    dossier = args[args.index("--dossier") + 1] if "--dossier" in args else DEFAULT
    db_path = os.path.join(dossier, "db.json")
    etat_path = os.path.join(dossier, ETAT)
    cmd = args[0]
    if cmd == "debut":
        if os.path.exists(etat_path):
            sys.exit("Une bissection est déjà en cours (`etat` pour la voir, `fin` pour l'arrêter).")
        db = lire(db_path)
        tous = sorted(k for k, m in db["mods"].items() if m.get("active"))
        if len(tous) < 2:
            sys.exit(f"{len(tous)} mod actif : rien à bissecter.")
        shutil.copyfile(db_path, db_path + ".bak_bissection")
        st = {"dossier": dossier, "tous": tous, "candidats": tous, "testes": [], "historique": [], "fini": False}
        print(f"Sauvegarde : {db_path}.bak_bissection. {len(tous)} mods actifs au départ.")
        etape(dossier, st)
        ecrire(etat_path, st)
        return
    if not os.path.exists(etat_path):
        sys.exit("Pas de bissection en cours : commencer par `bissecter.py debut`.")
    st = lire(etat_path)
    dossier = st["dossier"]
    if cmd == "etat":
        print(f"Suspects ({len(st['candidats'])}) : " + ", ".join(st["candidats"]))
        print(f"En test : " + ", ".join(st["testes"]))
        for h in st["historique"]:
            print(f"  - {h['resultat']} avec {len(h['testes'])} mods actifs")
        return
    if cmd == "fin":
        shutil.copyfile(db_path + ".bak_bissection", db_path)
        os.remove(etat_path)
        print("db.json restauré tel qu'au début de la bissection.")
        return
    if st.get("fini"):
        sys.exit(f"Bissection terminée : coupable {st['candidats'][0]}. Lancer `fin`.")
    testes = st["testes"]
    st["historique"].append({"resultat": cmd, "testes": testes})
    if cmd == "mauvais":
        st["candidats"] = testes
    else:
        st["candidats"] = [c for c in st["candidats"] if c not in testes]
    etape(dossier, st)
    ecrire(etat_path, st)
    if not st.get("fini"):
        print("Note : si le problème vient d'une combinaison de deux mods, la bissection peut désigner un seul des deux.")


if __name__ == "__main__":
    main()
