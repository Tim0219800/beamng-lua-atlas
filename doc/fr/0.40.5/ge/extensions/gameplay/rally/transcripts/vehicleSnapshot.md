# `gameplay_rally_transcripts_vehicleSnapshot`

*Fichier : `lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/transcripts/vehicleSnapshot")` (fichier sous extensions/ mais pas une extension classique)

Classe squelette représentant un instantané de véhicule (position, orientation, braquage, horodatage) rattaché à un chemin de transcriptions du rallye. Elle se comporte comme un élément de `sortedList` (champs id, name, sortOrder). Le module renvoie un constructeur : `require(...)(path, name, forceId)`. Dans cette version, la plupart des champs restent à nil et la désérialisation est vide.

## Remarques

- onSerialize lit self.text, qui n'est jamais initialisé dans init : le champ sérialisé `text` vaudra toujours nil.
- onDeserialized ne fait rien (tout le corps est commenté) : le code semble être une copie inachevée de transcripts/entry.lua.
- sortOrder est fixé à 999999.

## Classe `C`

Instantané de véhicule. Champs initialisés : path, id, name, sortOrder, pos, quat, steering, timestamp, cornerCall (les cinq derniers à nil).

Le module renvoie un constructeur : `local obj = require("gameplay_rally_transcripts_vehicleSnapshot")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(path, name, forceId)` | Constructeur appelé par la fonction retournée par le module. Mémorise le chemin parent, prend l'id fourni ou un nouvel id via path:getNextUniqueIdentifier(), et nomme l'objet `t_<id>` par défaut. | 7 |
| `C:onDeserialized(data, oldIdMap)` | Restauration depuis les données sauvegardées. Ne fait rien dans cette version. | 33 |
| `C:onSerialize()` | Renvoie une table {oldId, name, text} pour la sauvegarde. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua`.*
