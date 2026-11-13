# `flowgraph_nodes_ui_missionControlHint`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua` · VM : Game Engine (GE) · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/missionControlHint")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Mission Control Hints » (catégorie repeat_instant, auteur BeamNG, durée) : affiche des indications de commandes (passer vitesse, embrayage, klaxon, etc.) dans l'app HUD Mission Controls (ui_apps_missionControls). Entrée « reset » (impulsion qui efface tout). Pour chaque indication i (« Hint Count ») : « action_i » (action d'entrée avec modèles shiftUp, shiftDown, clutch, throttle, brake, parkingbrake, horn), « uiEvent_i » (événement de navigation UI, caché), « label_i » (texte ou clé de traduction).

## Remarques

- Sans action ni uiEvent, l'indication est effacée (catégorie flowgraph_<id>_<i>).

**Dépendances (chargées avant) :** `ui_apps_missionControls`

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Restaure count. | 92 |
| `C:_onSerialize(res)` | Sauvegarde count. | 88 |
| `C:drawCustomProperties()` | Champ « Hint Count ». | 71 |
| `C:init()` | count = 1. | 40 |
| `C:postInit()` | Crée les pins et charge l'extension ui_apps_missionControls. | 44 |
| `C:updatePins(old, new)` | Ajuste le nombre de trios de pins (action, uiEvent, label). | 49 |
| `C:work()` | Charge l'extension si besoin, efface si reset, sinon envoie ou efface chaque indication via setControl. | 97 |

**Charge les extensions :** `ui_apps_missionControls`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua`.*
