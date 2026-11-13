# `jbeam_interaction`

*Fichier : `lua/common/jbeam/interaction.lua` · VM : Commun (GE + véhicule) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/interaction")`

Étape de post-traitement jbeam qui charge les fichiers *.interaction.json (dossier /vehicles/common/ puis dossier du véhicule) et en fusionne les groupes d'interaction, catégories d'actions et actions. Produit vehicle.interactionGroups, vehicle.actionCategories et vehicle.inputActions, utilisés ensuite par le système d'actions d'entrée (lua/ge/extensions/core/input/actions.lua d'après le commentaire du code).

## Remarques

- Seuls les fichiers dont fileversion vaut 2 sont acceptés ; les autres sont ignorés avec une erreur dans le journal.
- Chaque action reçoit un champ source = nom du fichier qui la définit.
- La fusion se fait par tableMerge : le fichier du véhicule, lu en dernier, surcharge les définitions communes.
- vehicle.components.actionIconOverrides (table nomAction -> icône) remplace l'icône des actions existantes.
- Le module n'est exécuté que là où FS (système de fichiers) est disponible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_interaction.process(vehicle)` | Lit les fichiers d'interaction, applique les surcharges d'icônes et stocke les résultats dans vehicle.interactionGroups, vehicle.actionCategories et vehicle.inputActions. *(interne)* | 26 |

### Détail des paramètres

#### `jbeam_interaction.process(vehicle)`

Lit les fichiers d'interaction, applique les surcharges d'icônes et stocke les résultats dans vehicle.interactionGroups, vehicle.actionCategories et vehicle.inputActions.

- `vehicle` (*table*) : Données du véhicule (vehicleDirectory requis ; modifiées en place).

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/interaction.lua`.*
