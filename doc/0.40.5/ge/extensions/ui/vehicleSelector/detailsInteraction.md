# `ui_vehicleSelector_detailsInteraction`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua` · VM : Game Engine (GE) · 84 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_detailsInteraction` : `extensions.load("ui_vehicleSelector_detailsInteraction")`, puis la globale `ui_vehicleSelector_detailsInteraction`

Façade du panneau de détails du sélecteur de véhicules. Elle assemble les spécifications (ui_vehicleSelector_vehicleSpecifications) et les boutons d'action (ui_vehicleSelector_vehicleOperations) d'un élément, et expose quelques actions (ouvrir un dossier, aller à la page d'un mod). Un mode de boutons personnalisés permet à d'autres systèmes (mode défi) de remplacer les boutons de freeroam.

## Remarques

- Si customDetailsButtons n'est pas vide, les boutons standard sont remplacés : chaque bouton appelle button.callback(modelKey, configKey, additionalData). Sans données supplémentaires, les peintures par défaut (paint, paint2, paint3) de la config, ou à défaut du modèle, sont pré-remplies.
- Le champ managementButtonsEnabled de ce module n'est pas lu ici ; setManagementButtonsEnabled délègue à vehicleOperations.

**Dépendances (chargées avant) :** `ui_vehicleSelector_vehicleOperations`, `ui_vehicleSelector_vehicleSpecifications`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_detailsInteraction.executeButton(...)` | Délègue à ui_vehicleSelector_vehicleOperations.executeButton avec les mêmes arguments. | 79 |
| `ui_vehicleSelector_detailsInteraction.executeDoubleClick(...)` | Délègue à ui_vehicleSelector_vehicleOperations.executeDoubleClick avec les mêmes arguments. | 80 |
| `ui_vehicleSelector_detailsInteraction.exploreFolder(path)` | Ouvre un dossier dans l'explorateur de fichiers du système (Engine.Platform.exploreFolder). | 65 |
| `ui_vehicleSelector_detailsInteraction.getDetails(itemDetails)` | Renvoie les détails d'un élément (spécifications issues de vehicleSpecifications) complétés de `buttonInfo` : boutons personnalisés si définis, sinon boutons de lancement standard de vehicleOperations. | 13 |
| `ui_vehicleSelector_detailsInteraction.getManagementDetails()` | Renvoie les détails des boutons de gestion fournis par vehicleOperations.getManagementDetails(). | 55 |
| `ui_vehicleSelector_detailsInteraction.goToMod(modId)` | Navigue vers la page de détails d'un mod dans l'interface (route 'menu.mods.details'). | 70 |
| `ui_vehicleSelector_detailsInteraction.setCustomDetailsButtons(buttons)` | Définit la liste des boutons personnalisés qui remplacent les boutons standard dans getDetails. | 83 |
| `ui_vehicleSelector_detailsInteraction.setDetailsButtonForFreeroam(...)` | Délègue à ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam. | 82 |
| `ui_vehicleSelector_detailsInteraction.setExitCallback(callback)` | Définit la fonction appelée à la sortie ; nop si nil. | 59 |
| `ui_vehicleSelector_detailsInteraction.setManagementButtonsEnabled(...)` | Délègue à ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled. | 81 |

### Détail des paramètres

#### `ui_vehicleSelector_detailsInteraction.executeButton(...)`

Délègue à ui_vehicleSelector_vehicleOperations.executeButton avec les mêmes arguments.

- `...` (*any*) : Arguments transmis tels quels.
- **renvoie** : any Résultat de vehicleOperations.executeButton.

#### `ui_vehicleSelector_detailsInteraction.executeDoubleClick(...)`

Délègue à ui_vehicleSelector_vehicleOperations.executeDoubleClick avec les mêmes arguments.

- `...` (*any*) : Arguments transmis tels quels.
- **renvoie** : any Résultat de vehicleOperations.executeDoubleClick.

#### `ui_vehicleSelector_detailsInteraction.exploreFolder(path)`

Ouvre un dossier dans l'explorateur de fichiers du système (Engine.Platform.exploreFolder).

- `path` (*string*) : Chemin du dossier.

#### `ui_vehicleSelector_detailsInteraction.getDetails(itemDetails)`

Renvoie les détails d'un élément (spécifications issues de vehicleSpecifications) complétés de `buttonInfo` : boutons personnalisés si définis, sinon boutons de lancement standard de vehicleOperations.

- `itemDetails` (*table*) : Élément sélectionné (transmis à vehicleSpecifications.getDetails).
- **renvoie** : table Détails avec champ buttonInfo.

#### `ui_vehicleSelector_detailsInteraction.getManagementDetails()`

Renvoie les détails des boutons de gestion fournis par vehicleOperations.getManagementDetails().

- **renvoie** : table Informations de gestion (déduit du code).

#### `ui_vehicleSelector_detailsInteraction.goToMod(modId)`

Navigue vers la page de détails d'un mod dans l'interface (route 'menu.mods.details').

- `modId` (*string*) : Identifiant du mod.

#### `ui_vehicleSelector_detailsInteraction.setCustomDetailsButtons(buttons)`

Définit la liste des boutons personnalisés qui remplacent les boutons standard dans getDetails.

- `buttons` (*table*) : Liste d'objets {callback, meta}.

#### `ui_vehicleSelector_detailsInteraction.setDetailsButtonForFreeroam(...)`

Délègue à ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam.

- `...` (*any*) : Arguments transmis tels quels.

#### `ui_vehicleSelector_detailsInteraction.setExitCallback(callback)`

Définit la fonction appelée à la sortie ; nop si nil.

- `callback` (*function|nil*) : Callback de sortie.

#### `ui_vehicleSelector_detailsInteraction.setManagementButtonsEnabled(...)`

Délègue à ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled.

- `...` (*any*) : Arguments transmis tels quels.

## Champs

| Champ | Type | Description |
|---|---|---|
| `customDetailsButtons` | table | Boutons personnalisés ({callback, meta}) ; vide par défaut. |
| `dependencies` | string[] | ui_vehicleSelector_vehicleOperations, ui_vehicleSelector_vehicleSpecifications. |
| `exitCallback` | function | Callback de sortie, nop par défaut ; modifié par setExitCallback. |
| `managementButtonsEnabled` | boolean | Valeur initiale true (configuration). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua`.*
