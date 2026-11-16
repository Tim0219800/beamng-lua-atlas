# `editor_vehicleEditor_liveEditor_veAeroDebug`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua` · VM : Game Engine (GE) · 191 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veAeroDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veAeroDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veAeroDebug`

Fenêtre 'Vehicle Aero Debug' du Vehicle Editor live. Active l'extension véhicule `aeroDebug` (extensions.aeroDebug.enable()), lit getAeroData() et affiche la force et le moment aérodynamiques totaux (repère monde et repère véhicule), puis la déportance (downforce) des essieux avant/arrière. Permet d'associer les 4 roues (FL, FR, RL, RR) via des combos ; un remplissage automatique est tenté si les noms de roues sont FL/FR/RL/RR. Dépend de editor_veMain.

## Remarques

- Unités : forces en N, moments en N·m, pourcentages de déportance entre essieux.
- aeroDebug est désactivé côté véhicule au changement de véhicule (ancien véhicule) et à la désactivation de l'éditeur.
- Les valeurs de roues sont envoyées au véhicule via aeroDebug.setWheelNames(FL, FR, RL, RR) construit par concaténation de chaînes ; des noms contenant un guillemet casseraient la commande.

**Dépendances (chargées avant) :** `editor_veMain`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veAeroDebug.onDeserialized(data)` | Restaure l'état d'ouverture. *(interne)* *(hook)* | 175 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onEditorActivated()` | Appelé à l'entrée dans l'éditeur (ne fait rien). *(interne)* *(hook)* | 166 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onEditorDeactivated()` | Appelé à la sortie de l'éditeur : désactive aeroDebug sur le véhicule courant. *(interne)* *(hook)* | 160 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onSerialize()` | Renvoie {windowOpen}. *(interne)* *(hook)* | 169 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onUpdate(dt)` | Appelé chaque frame : active/interroge aeroDebug sur le véhicule et dessine les tableaux de forces et la configuration des essieux. *(interne)* *(hook)* | 61 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | Désactive aeroDebug sur l'ancien véhicule et remet à zéro les données aéro et l'initialisation des combos. *(interne)* *(hook)* | 150 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.open()` | Ouvre la fenêtre. | 145 |

### Détail des paramètres

#### `editor_vehicleEditor_liveEditor_veAeroDebug.onDeserialized(data)`

Restaure l'état d'ouverture.

- `data` (*table*) : Table de onSerialize.

#### `editor_vehicleEditor_liveEditor_veAeroDebug.onSerialize()`

Renvoie {windowOpen}.

- **renvoie** : table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veAeroDebug.onUpdate(dt)`

Appelé chaque frame : active/interroge aeroDebug sur le véhicule et dessine les tableaux de forces et la configuration des essieux.

- `dt` (*number*) : Delta temps.

#### `editor_vehicleEditor_liveEditor_veAeroDebug.onVehicleSwitched(oldVehicle, newVehicle, player)`

Désactive aeroDebug sur l'ancien véhicule et remet à zéro les données aéro et l'initialisation des combos.

- `oldVehicle` (*integer*) : ID de l'ancien véhicule.
- `newVehicle` (*integer*) : ID du nouveau véhicule.
- `player` (*integer*) : Index du joueur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'editor_veMain'}. |
| `menuEntry` | string | 'Aero Debug'. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua`.*
