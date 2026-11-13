# `editor_ezObjectSelect_stats`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/stats.lua` · VM : Game Engine (GE) · 145 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_stats` : `extensions.load("editor_ezObjectSelect_stats")`, puis la globale `editor_ezObjectSelect_stats`

Statistiques d'usage affichées dans le panneau de l'outil Easy Object Select : nombre de sélections, distance transformée, nombre de translations/rotations/mises à l'échelle, répartition opérations monde/local et rotations par touche R/molette, plus le volume cumulé (m^3) de la sélection. draw() les affiche en ImGui avec un bouton « Reset Stats ».

## Remarques

- Les compteurs sont locaux au module et remis à zéro uniquement par le bouton Reset Stats.
- Le volume de la sélection est mis en cache et recalculé quand la sélection change, quand un objet disparaît ou quand la sélection contient un BeamNGVehicle.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_stats.activate(isLocal)` | Initialise le mode de coordonnées et invalide le cache de volume. | 63 |
| `editor_ezObjectSelect_stats.draw(selectedIds)` | Affiche le bloc « Stats » en ImGui (volume sélectionné, compteurs, barres de progression World/Local et R/Wheel, bouton Reset Stats). | 108 |
| `editor_ezObjectSelect_stats.invalidateVolume()` | Force le recalcul du volume de sélection au prochain draw. | 99 |
| `editor_ezObjectSelect_stats.recordOperation(operation, source, distance)` | Enregistre une opération de transformation : incrémente le compteur monde/local, puis transforms (et la distance cumulée), rotates (avec source « r » ou « wheel ») ou scales. | 77 |
| `editor_ezObjectSelect_stats.recordSelection()` | Incrémente le compteur de sélections et invalide le volume. | 72 |
| `editor_ezObjectSelect_stats.setCoordinateMode(isLocal)` | Change le mode de coordonnées utilisé pour classer les opérations (monde ou local). | 68 |

### Détail des paramètres

#### `editor_ezObjectSelect_stats.activate(isLocal)`

Initialise le mode de coordonnées et invalide le cache de volume.

- `isLocal` (*boolean*) : true si l'espace de coordonnées est local.

#### `editor_ezObjectSelect_stats.draw(selectedIds)`

Affiche le bloc « Stats » en ImGui (volume sélectionné, compteurs, barres de progression World/Local et R/Wheel, bouton Reset Stats).

- `selectedIds` (*integer[]|nil*) : IDs des objets sélectionnés, pour le calcul du volume.

#### `editor_ezObjectSelect_stats.recordOperation(operation, source, distance)`

Enregistre une opération de transformation : incrémente le compteur monde/local, puis transforms (et la distance cumulée), rotates (avec source « r » ou « wheel ») ou scales.

- `operation` (*string*) : "transform", "rotate" ou "scale".
- `source` (*string|nil*) : Pour une rotation : "r" (touche R) ou "wheel" (molette).
- `distance` (*number|nil*) : Distance parcourue (m), comptée pour "transform".

#### `editor_ezObjectSelect_stats.setCoordinateMode(isLocal)`

Change le mode de coordonnées utilisé pour classer les opérations (monde ou local).

- `isLocal` (*boolean*) : true pour local.

## Appels vers le moteur (C++)

- `obj:` `isSubClassOf`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/stats.lua`.*
