# Procédure : passer l'atlas à une nouvelle version du jeu (prévue pour la 0.41)

Exemple avec `0.40.5` → `0.41.0`. Remplacer par le vrai numéro (celui affiché par le jeu, sans le dernier `.0` : `0.41.0.0` → `0.41.0`).
Toutes les commandes se lancent depuis la racine du dépôt.

## 0. Avant la mise à jour du jeu

Rien d'obligatoire : les données de 0.40.5 sont dans la release (`donnees-0.40.5.zip`).
Vérifier seulement que `donnees/0.40.5/statique.json` et `runtime_*.json` sont présents en local (sinon décompresser le zip).

## 1. Extraction statique de la nouvelle version

```
python -I outils/extraire.py "D:/SteamLibrary/steamapps/common/BeamNG.drive" donnees/0.41.0/statique.json
```

Contrôle rapide : `python -I outils/voir.py donnees/0.41.0/statique.json` (nombre de modules, erreurs d'analyse).
Si `errors` n'est pas vide, un nouveau motif de code a échappé au tokenizer : corriger `extraire.py` avant d'aller plus loin.

## 2. Relevé en jeu des liaisons C++

1. Copier `outils/mod_releve/` dans `%LOCALAPPDATA%/BeamNG/BeamNG.drive/current/mods/unpacked/tim19_atlas/`.
2. Lancer le jeu, charger une carte avec une voiture, attendre 5 s (ou `tim19Atlas_dump.run()` dans la console GE).
3. Quitter, retirer le mod, puis : `python -I outils/importer_releve.py 0.41.0`

## 3. Diff d'API

```
python -I outils/comparer.py 0.40.5 0.41.0
```

Produit `donnees/0.41.0/diff-0.40.5.json` (lu par le vérificateur de mods) et `doc/0.41.0/changements.md`.
Relire le résumé affiché : un très grand nombre de modules retirés + ajoutés signale un changement d'arborescence
(les déplacements ne sont reconnus que si le nom d'accès est identique).

## 4. Report des descriptions

```
python -I outils/reporter_descriptions.py 0.40.5 0.41.0
```

- copie les descriptions, suit les modules déplacés, retire les fonctions disparues ;
- marque `"aVerifier"` les fonctions dont les paramètres ont changé (affichées « ⚠ À revérifier » dans la doc) ;
- écrit `donnees/0.41.0/lots_nouveaux.json` : modules nouveaux ou modifiés, en lots de 30.

## 5. Rédaction des nouveautés

Pour chaque lot de `lots_nouveaux.json`, faire rédiger selon `CONSIGNES_DESCRIPTIONS.md` en remplaçant `0.40.5` par `0.41.0`, avec deux règles en plus :
- si le fichier de description existe déjà : **le compléter** (fonctions ajoutées) au lieu de le sauter ;
- pour chaque fonction marquée `aVerifier` : relire le code, corriger la description et les paramètres, puis **supprimer** le champ `aVerifier`.

Contrôle : `grep -rl aVerifier descriptions/0.41.0` doit finir vide.

## 6. Génération

```
python -I outils/generer.py 0.41.0
```

Recrée `stubs/0.41.0/` et `doc/0.41.0/` (avec `changements.md`, lié depuis l'index).

## 7. Site, README, changelog

- `mkdocs.yml`, section `nav` : ajouter en tête
  ```yaml
    - 0.41.0:
        - Index: 0.41.0/index.md
        - Changements depuis 0.40.5: 0.41.0/changements.md
        - Hooks: 0.41.0/hooks.md
        - C++ objects: 0.41.0/cpp.md
  ```
  Garder 0.40.5 dans la nav : les moddeurs qui n'ont pas mis à jour en ont encore besoin.
- `README.md` / `README.fr.md` : version couverte, chemins `stubs/0.41.0/...` dans l'exemple `.luarc.json`, tableau de couverture.
- `CHANGELOG.md` : nouvelle entrée `0.41.0-1` avec le résumé du diff (nombre de ruptures, nouveaux modules notables).
- `doc/index.md` : lien vers la nouvelle version et vers la page des changements.

## 8. Vérifier les mods installés

```
python -I outils/verifier_mod.py --mods-actifs --version 0.41.0
```

Les `[RETIRÉ]` sont des appels qui casseront avec certitude ; les `[INCONNU]` sont à regarder un par un.
Si un mod pose problème en jeu sans qu'on sache lequel : `python -I outils/bissecter.py debut` (jeu fermé).

## 9. Publication

```
python -I outils/empaqueter.py 0.41.0
git add -A && git commit -m "Atlas 0.41.0"
git push
gh release create v0.41.0-1 dist/stubs-0.41.0.zip dist/donnees-0.41.0.zip --title "0.41.0-1" --notes-file <notes>
```

Le site se redéploie tout seul (workflow `Pages`).
