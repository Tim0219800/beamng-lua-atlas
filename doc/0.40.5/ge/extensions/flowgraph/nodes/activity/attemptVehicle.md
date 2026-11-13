# `flowgraph_nodes_activity_attemptVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/attemptVehicle.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/attemptVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activity Attempt Vehicle » (catégorie once_instant, tag activity). Ajoute à une tentative les informations d'un véhicule (modèle jbeam, configuration partConfig, isConfigFile si .pc) sous la clé donnée par « vehKey » (« vehicle » par défaut). Entrées : vehKey (string), vehId (number, sinon véhicule du joueur 0), attempt (attemptData). Sortie : attempt. En carrière, ajoute originId/originKey (inventaire du joueur ou véhicule fourni par le module de mise en place).

## Remarques

- Si aucun véhicule n'est trouvé, le pin de sortie attempt n'est pas mis à jour.
- En carrière, le code lit self.mgr.activity.setupModules sans test : plante sans activité associée.
- originKey vaut 'careerInventory' (véhicule joueur) ou 'providedBySetupModule' (originId = _selectionIdx).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 23 |
| `C:workOnce()` | Cherche le véhicule (vehId ou joueur), construit {model, config, isConfigFile, originId, originKey} et l'écrit dans attempt[vehKey]. | 27 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/attemptVehicle.lua`.*
