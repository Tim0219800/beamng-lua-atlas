# `gameplay_drag_dialPopup`

*Fichier : `lua/ge/extensions/gameplay/drag/dialPopup.lua` · VM : Game Engine (GE) · 178 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_dialPopup` : `extensions.load("gameplay_drag_dialPopup")`, puis la globale `gameplay_drag_dialPopup`

Fenêtre ImGui « Drag - Set Dial » pour le bracket racing : le joueur local saisit son dial (temps annoncé, en secondes) dans un champ décimal, de 0 à 999 (10 par défaut, ou la valeur mémorisée dans le carnet de dial du véhicule). À la confirmation, en solo le callback applique le dial ; en multijoueur la valeur est envoyée à l'hôte via drag.updateTimerValue(raceId, vehId, 'dial', val). Ne s'affiche que si la piste est de type bracketRace.

## Exemple

```lua
gameplay_drag_dialPopup.requestDial(be:getPlayerVehicleID(0), function(dial) gameplay_drag_core.setRacerDial(be:getPlayerVehicleID(0), dial) end)
```

## Remarques

- Un seul popup à la fois : requestDial est ignoré s'il est déjà ouvert ou si vehId est nil/-1.
- Le commentaire de tick() dit qu'il est appelé depuis core.lua, mais aucun fichier de lua/ ne référence dialPopup (ni core.lua ni dragBridge) : dans 0.40.5 cette extension semble inutilisée (le dial passe par dragBridge.showDialControl et l'UI).
- Une valeur saisie invalide ou hors [0, 999] est remplacée par 10 (DIAL_DEFAULT).
- La fenêtre se ferme toute seule si dragData est absent ou si dragType n'est pas bracketRace.
- Les textes de la fenêtre sont en anglais en dur (pas de traduction).

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_saveSystem`, `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_dialPopup.requestDial(vehId, callback)` | Ouvre la fenêtre de saisie du dial pour un véhicule. Pré-remplit avec le dial mémorisé (clé importantTimerId, sinon time_1_4) ou 10. | 59 |
| `gameplay_drag_dialPopup.tick(dtReal, dtSim, dtRaw)` | Dessine la fenêtre si elle est ouverte (une seule fois par frame). Prévu pour être appelé manuellement chaque frame, pas comme hook d'extension. *(interne)* | 173 |

### Détail des paramètres

#### `gameplay_drag_dialPopup.requestDial(vehId, callback)`

Ouvre la fenêtre de saisie du dial pour un véhicule. Pré-remplit avec le dial mémorisé (clé importantTimerId, sinon time_1_4) ou 10.

- `vehId` (*integer*) : ID du véhicule du joueur (ignoré si nil ou -1).
- `callback` (*function|nil*) : Appelé avec la valeur confirmée (number) après validation.

#### `gameplay_drag_dialPopup.tick(dtReal, dtSim, dtRaw)`

Dessine la fenêtre si elle est ouverte (une seule fois par frame). Prévu pour être appelé manuellement chaque frame, pas comme hook d'extension.

- `dtReal` (*number*) : Delta temps réel (s), non utilisé.
- `dtSim` (*number*) : Delta temps simulé (s), non utilisé.
- `dtRaw` (*number*) : Delta brut (s), non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_saveSystem, ui_imgui. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/dialPopup.lua`.*
