# `gameplay_rally_recceSettings`

*Fichier : `lua/ge/extensions/gameplay/rally/recceSettings.lua` · VM : Game Engine (GE) · 145 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/recceSettings")` (fichier sous extensions/ mais pas une extension classique)

Préférences persistantes de la reconnaissance (recce) de rallye, enregistrées dans rallySettingsRoot/recce.json : dernier id de mission et dernier état de chargement par niveau, et nom du style d'annonce des virages. Charge aussi le fichier des angles de virage (corner angles) pour proposer les styles disponibles. Le module renvoie un constructeur.

## Exemple

```lua
local RecceSettings = require('/lua/ge/extensions/gameplay/rally/recceSettings')
local s = RecceSettings()
s:load()
s:setLastMissionId('west_coast_usa', 'rally/stage1')
```

## Remarques

- setLastMissionId, setLastLoadState et setCornerCallStyleName sauvegardent immédiatement le fichier.
- Bug potentiel : cornerCallStyleNames et getCornerCallStyle indexent self.corner_angles_data.pacenoteStyles sans vérifier que corner_angles_data n'est pas nil (erreur si loadCornerAngles a échoué ou si load n'a pas été appelé).
- Les valeurs par défaut sont partagées par référence (default_settings.last_mission_ids) : _reset réutilise les mêmes tables, donc une modification avant un rechargement peut polluer les défauts.

## Classe `C`

Objet de réglages renvoyé par le constructeur.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_recceSettings")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_reset()` | Remet last_mission_ids, last_load_states et corner_call_style_name aux valeurs par défaut. | 23 |
| `C:cornerCallStyleNames()` | Liste des noms de styles d'annonce de virage disponibles. | 90 |
| `C:defaultCornerCallStyleName()` | Nom du premier style de pacenoteStyles des angles de virage, ou la valeur par défaut (nil) si aucune donnée. | 79 |
| `C:getCornerCallStyle()` | Renvoie la table du style correspondant au nom actuel dans pacenoteStyles. | 128 |
| `C:getCornerCallStyleName()` | Nom du style d'annonce des virages actuel. | 125 |
| `C:getLastLoadState(level)` | Dernier état de chargement pour un niveau. | 117 |
| `C:getLastMissionId(level)` | Dernier id de mission pour un niveau. | 109 |
| `C:init()` | Définit le chemin du fichier (recce.json) et remet les valeurs par défaut. | 17 |
| `C:load()` | Remet à zéro, charge les angles de virage puis lit recce.json et le désérialise. | 38 |
| `C:loadCornerAngles()` | Charge les données d'angles de virage via rallyUtil.loadCornerAnglesFile ; corner_angles_data reste nil en cas d'échec. | 29 |
| `C:onDeserialized(data)` | Applique les données lues du fichier ; les champs absents prennent leur valeur par défaut (style : premier style disponible). | 98 |
| `C:onSerialize()` | Renvoie la table à sauvegarder (last_mission_ids, last_load_states, corner_call_style_name). | 69 |
| `C:save()` | Écrit les réglages sérialisés dans recce.json (jsonWriteFile, joli format). | 64 |
| `C:setCornerCallStyleName(style_name)` | Définit le style d'annonce des virages et sauvegarde. | 121 |
| `C:setLastLoadState(level, state)` | Mémorise le dernier état de chargement pour un niveau et sauvegarde. | 113 |
| `C:setLastMissionId(level, id)` | Mémorise l'id de la dernière mission pour un niveau et sauvegarde. | 105 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recceSettings.lua`.*
