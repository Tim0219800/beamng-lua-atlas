# `editor_vehicleEditor_liveEditor_veTCSDebug`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua` · VM : Game Engine (GE) · 238 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veTCSDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veTCSDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veTCSDebug`

Fenêtre 'TCS Debug' du Vehicle Editor live : trace en temps réel (600 points d'historique) les données de contrôle de traction du premier contrôleur de type 'esc' du véhicule (debugData.tcs) : facteurs de freinage par roue, glissement par roue avec seuil, facteurs d'accélérateur et glissement global. Trois graphes PlotMultiLines.

## Remarques

- Si le véhicule n'a pas de contrôleur esc, vEditor.tcsData est nil et rien n'est tracé.
- Les historiques sont initialisés une seule fois (didInit) avec les clés vues à la première réception ; un changement de véhicule ne les réinitialise pas.
- Au plus 4 couleurs de roues (5 pour le graphe 2) sont définies ; au-delà, la couleur est nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veTCSDebug.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 222 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.onExtensionLoaded()` | Appelé au chargement de l'extension : remplit l'historique slipThresholds de 600 zéros. *(interne)* *(hook)* | 206 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.onExtensionUnloaded()` | Appelé au déchargement (ne fait rien). *(interne)* *(hook)* | 213 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 216 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.onUpdate(dt)` | Appelé chaque frame : demande les données TCS au véhicule, met à jour les historiques et dessine les graphes. *(interne)* *(hook)* | 35 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.open()` | Ouvre la fenêtre. | 201 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veTCSDebug.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veTCSDebug.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veTCSDebug.onUpdate(dt)`

Appelé chaque frame : demande les données TCS au véhicule, met à jour les historiques et dessine les graphes.

- `dt` (*number*) : Delta temps.

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string | 'TCS'. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua`.*
