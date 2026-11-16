# `editor_missionEditor_prefabs`

*Fichier : `lua/ge/extensions/editor/missionEditor/prefabs.lua` · VM : Game Engine (GE) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/prefabs")` (fichier sous extensions/ mais pas une extension classique)

Panneau « Prefabs » de l'éditeur de missions. Il édite la liste mission.prefabs (chemins de fichiers .prefab / .prefab.json) et le booléen prefabsRequireCollisionReload. Chaque ligne a un champ de chemin, un sélecteur de fichier, un indicateur d'existence (FS:fileExists) et un bouton « Spawn » qui instancie le prefab dans MissionGroup. Le module renvoie un constructeur : require(...)(missionEditor).

## Remarques

- Spawn : spawnPrefab(nom unique, fichier, "0 0 0", "0 0 1 0", "1 1 1"), loadMode = 0, ajouté à scenetree.MissionGroup puis sélectionné dans l'éditeur.
- Un nouveau prefab ajouté par « Add » vaut « / » tant qu'il n'est pas édité.
- Le bouton de suppression utilise originalPrefabName dans son identifiant imgui ; la liste self.filenames est parallèle à mission.prefabs.

## Classe `C`

Instance du panneau. Champs : missionEditor, mission, filenames (tampons imgui), prefabsRequireCollisionReload.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_prefabs")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine la liste des prefabs (suppression, chemin, sélecteur, état, spawn), le bouton « Add » et la case « Requires collision reload ». | 22 |
| `C:init(missionEditor)` | Constructeur. | 7 |
| `C:setMission(mission)` | Définit la mission et recrée les tampons de texte depuis mission.prefabs. | 13 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `getUniqueName`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/prefabs.lua`.*
