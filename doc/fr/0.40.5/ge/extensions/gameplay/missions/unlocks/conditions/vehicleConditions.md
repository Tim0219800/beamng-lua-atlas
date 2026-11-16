# `gameplay_missions_unlocks_conditions_vehicleConditions`

*Fichier : `lua/ge/extensions/gameplay/missions/unlocks/conditions/vehicleConditions.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_unlocks_conditions_vehicleConditions` : `extensions.load("gameplay_missions_unlocks_conditions_vehicleConditions")`, puis la globale `gameplay_missions_unlocks_conditions_vehicleConditions`

Type de condition de déblocage de missions lié au véhicule : vehicleDriven. Chargé par gameplay_missions_unlocks.

## Remarques

- vehicleDriven annonce « le joueur doit être dans un véhicule » mais conditionMet renvoie toujours true sans rien vérifier.
- busDriven est commenté dans le code (inactif).

## Champs

| Champ | Type | Description |
|---|---|---|
| `vehicleDriven` | table | Condition {type='vehicleDriven'} : label 'Driving a vehicle', conditionMet renvoie toujours true, {}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/unlocks/conditions/vehicleConditions.lua`.*
