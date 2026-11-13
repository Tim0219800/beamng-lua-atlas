# `ui_appLayouts`

*Fichier : `lua/ge/extensions/ui/appLayouts.lua` · VM : Game Engine (GE) · 721 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appLayouts` : `extensions.load("ui_appLayouts")`, puis la globale `ui_appLayouts`

Gère les dispositions (layouts) des apps de l'interface : lecture, création, copie, renommage, suppression et réinitialisation des fichiers `*.uilayout.json`, ainsi que l'ajout, le retrait et le déplacement des apps dans un layout. Les layouts d'origine sont dans `/settings/ui_apps/originalLayouts/`, ceux de l'utilisateur dans `/settings/ui_apps/layouts/`. Une table type de layout vers fichier est mémorisée dans `/temp/ui-layout-map.json`. Sert aux moddeurs qui veulent changer les apps affichées par code ; l'éditeur Vue s'appuie sur les mêmes fonctions.

## Exemple

```lua
local layouts = ui_appLayouts.getAvailableLayouts()
for _, l in ipairs(layouts) do print(l.filename, l.type, l.title) end
ui_appLayouts.setUsedLayout('freeroam')
```

## Remarques

- Les apps officielles supprimées du jeu (engineDebug, gravityApp, radioTest, simpleRpmDebug, replayAppV2) sont filtrées de tous les layouts, y compris les layouts personnalisés ; la liste `removedApps` d'un layout d'origine est aussi utilisée comme liste d'obsolescence.
- Les indices d'app sont 0-based côté JS : removeApp, applyPlacementPatch et applySettingsPatch convertissent en indice Lua 1-based. Une chaîne de la forme "appName-<idx>" est aussi acceptée (idx 0-based).
- getAvailableLayouts met à jour les fichiers utilisateur : si la `version` du layout d'origine est plus récente, le layout utilisateur est remplacé ; sinon les apps dont `appVersion` est plus récent sont remplacées ou ajoutées. Le fichier est alors réécrit sur disque.
- Chaque layout renvoyé reçoit les champs `filename`, `resettable`, `userFileExists` et éventuellement `default` (si le chemin contient "default").
- addApp, removeApp et les patchs écrivent sur disque sans notification (écriture silencieuse) ; saveLayout, createLayout, renameLayout, duplicateLayout, deleteLayout, resetLayout et setCurrentLayout notifient `ui_apps.notifyLayoutsChanged`.
- Le hook onCameraChanged envoie `PlayerCameraModeChanged` à l'UI ; un joueur qui marche est rapporté comme caméra "unicycle".

**Dépendances (chargées avant) :** `ui_apps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appLayouts.addApp(layoutId, appName, placement)` | Ajoute une app à la fin d'un layout, avec un placement facultatif. Refuse les apps obsolètes. | 528 |
| `ui_appLayouts.applyPlacementPatch(layoutId, appInstanceIdOrIndex, placement)` | Remplace le placement d'une app d'un layout et écrit le fichier. | 573 |
| `ui_appLayouts.applySettingsPatch(layoutId, appInstanceIdOrIndex, settings)` | Remplace les réglages d'une app d'un layout et écrit le fichier. | 600 |
| `ui_appLayouts.clearLayoutForType(layoutType)` | Efface la préférence de layout d'un type. | 678 |
| `ui_appLayouts.createLayout(data)` | Crée un nouveau layout. Sans `filename`, un nom libre est déduit du titre dans le dossier utilisateur. Titre par défaut "My Layout", type par défaut "custom". | 455 |
| `ui_appLayouts.deleteLayout(filenameToDelete)` | Supprime le fichier d'un layout, sauf s'il fait partie du contenu officiel (un message est loggé et rien n'est supprimé). | 267 |
| `ui_appLayouts.duplicateLayout(filename, newTitle)` | Copie un layout dans un nouveau fichier (titre « <titre> copy » par défaut) en retirant le drapeau `default`. | 497 |
| `ui_appLayouts.getAvailableLayouts()` | Liste tous les layouts disponibles (originaux sans copie utilisateur + fichiers utilisateur), après mise à jour des fichiers utilisateur depuis les originaux et filtrage des apps supprimées. | 101 |
| `ui_appLayouts.getCurrentLayout()` | Renvoie le layout actuellement actif (après filtrage des apps obsolètes), ou nil. | 355 |
| `ui_appLayouts.getLayoutForType(layoutType)` | Renvoie le fichier de layout mémorisé pour un type. | 687 |
| `ui_appLayouts.getPlayerCameraModes()` | Renvoie le mode de caméra de chaque joueur (multi-siège) ; "unicycle" si le joueur marche. | 643 |
| `ui_appLayouts.getTypeLayoutMap()` | Renvoie une copie de la table type de layout vers fichier. | 692 |
| `ui_appLayouts.isEditing()` | Indique si le mode édition est actif. | 634 |
| `ui_appLayouts.onCameraChanged(player, camName)` | Hook appelé quand la caméra d'un joueur change. Envoie `PlayerCameraModeChanged` à l'UI avec `{player, name}`. *(interne)* *(hook)* | 657 |
| `ui_appLayouts.removeApp(layoutId, appInstanceIdOrIndex)` | Retire une app d'un layout par indice (0-based) ou par identifiant "nom-indice". | 548 |
| `ui_appLayouts.renameLayout(filename, title)` | Change le titre d'un layout. Refuse les layouts du contenu officiel. | 482 |
| `ui_appLayouts.resetLayout(filenameToReset, layoutType)` | Réinitialise un layout utilisateur en supprimant son fichier, ce qui fait réapparaître l'original. Refuse les fichiers hors du dossier utilisateur. | 299 |
| `ui_appLayouts.resetUsedLayout()` | Recharge le layout mémorisé par setUsedLayout comme layout courant. Renvoie le layout courant tel quel si aucun n'a été choisi. | 443 |
| `ui_appLayouts.saveLayout(data)` | Enregistre un layout sur disque (champ `filename` obligatoire) puis notifie les consommateurs. | 261 |
| `ui_appLayouts.setCurrentLayout(layoutOrFilename)` | Définit le layout courant à partir d'un nom de fichier ou d'une table de layout, puis notifie le changement. Renvoie nil si le fichier est introuvable. | 360 |
| `ui_appLayouts.setEditing(enabled)` | Active ou désactive le mode édition des layouts. | 629 |
| `ui_appLayouts.setLayoutForType(layoutType, filename)` | Mémorise le layout à utiliser pour un type de layout. | 665 |
| `ui_appLayouts.setUsedLayout(idOrType)` | Choisit le layout à utiliser à partir d'un nom de fichier ou d'un type. Un choix explicite par fichier est mémorisé comme préférence du type, sauf s'il s'agit du layout par défaut du type (la préférence est alors effacée). | 415 |

### Détail des paramètres

#### `ui_appLayouts.addApp(layoutId, appName, placement)`

Ajoute une app à la fin d'un layout, avec un placement facultatif. Refuse les apps obsolètes.

- `layoutId` (*string*) : Fichier du layout.
- `appName` (*string*) : Nom de l'app.
- `placement` (*table|nil*) : Position et taille de l'app.
- **renvoie** : boolean true si ajoutée.

#### `ui_appLayouts.applyPlacementPatch(layoutId, appInstanceIdOrIndex, placement)`

Remplace le placement d'une app d'un layout et écrit le fichier.

- `layoutId` (*string*) : Fichier du layout.
- `appInstanceIdOrIndex` (*integer|string*) : Indice 0-based ou "appName-<idx>".
- `placement` (*table*) : Nouveau placement.
- **renvoie** : boolean true si appliqué.

#### `ui_appLayouts.applySettingsPatch(layoutId, appInstanceIdOrIndex, settings)`

Remplace les réglages d'une app d'un layout et écrit le fichier.

- `layoutId` (*string*) : Fichier du layout.
- `appInstanceIdOrIndex` (*integer|string*) : Indice 0-based ou "appName-<idx>".
- `settings` (*table*) : Nouveaux réglages de l'app.
- **renvoie** : boolean true si appliqué.

#### `ui_appLayouts.clearLayoutForType(layoutType)`

Efface la préférence de layout d'un type.

- `layoutType` (*string*) : Type de layout.
- **renvoie** : boolean true si une préférence existait.

#### `ui_appLayouts.createLayout(data)`

Crée un nouveau layout. Sans `filename`, un nom libre est déduit du titre dans le dossier utilisateur. Titre par défaut "My Layout", type par défaut "custom".

- `data` (*table|nil*) : Champs facultatifs : title, type, apps, description, devonly, version, filename.
- **renvoie** : string|nil Nom de fichier créé, nil si aucun nom n'est disponible.

#### `ui_appLayouts.deleteLayout(filenameToDelete)`

Supprime le fichier d'un layout, sauf s'il fait partie du contenu officiel (un message est loggé et rien n'est supprimé).

- `filenameToDelete` (*string*) : Fichier à supprimer.
- **renvoie** : boolean true si le layout a été trouvé (même si la suppression a été refusée), false sinon.

#### `ui_appLayouts.duplicateLayout(filename, newTitle)`

Copie un layout dans un nouveau fichier (titre « <titre> copy » par défaut) en retirant le drapeau `default`.

- `filename` (*string*) : Fichier du layout source.
- `newTitle` (*string|nil*) : Titre de la copie.
- **renvoie** : string|nil Nom du fichier de la copie, nil en cas d'échec.

#### `ui_appLayouts.getAvailableLayouts()`

Liste tous les layouts disponibles (originaux sans copie utilisateur + fichiers utilisateur), après mise à jour des fichiers utilisateur depuis les originaux et filtrage des apps supprimées.

- **renvoie** : table<integer, table> Layouts avec `apps`, `title`, `type`, `filename`, `resettable`, `userFileExists`, `default`.

#### `ui_appLayouts.getCurrentLayout()`

Renvoie le layout actuellement actif (après filtrage des apps obsolètes), ou nil.

- **renvoie** : table|nil Layout courant.

#### `ui_appLayouts.getLayoutForType(layoutType)`

Renvoie le fichier de layout mémorisé pour un type.

- `layoutType` (*string*) : Type de layout.
- **renvoie** : string|nil Nom du fichier, ou nil.

#### `ui_appLayouts.getPlayerCameraModes()`

Renvoie le mode de caméra de chaque joueur (multi-siège) ; "unicycle" si le joueur marche.

- **renvoie** : table<integer, table> Liste de `{player, name}`.

#### `ui_appLayouts.getTypeLayoutMap()`

Renvoie une copie de la table type de layout vers fichier.

- **renvoie** : table<string, string> Préférences par type.

#### `ui_appLayouts.isEditing()`

Indique si le mode édition est actif.

- **renvoie** : boolean État du mode édition.

#### `ui_appLayouts.onCameraChanged(player, camName)`

Hook appelé quand la caméra d'un joueur change. Envoie `PlayerCameraModeChanged` à l'UI avec `{player, name}`.

- `player` (*integer|nil*) : Indice du joueur (0 par défaut).
- `camName` (*string|nil*) : Nom du mode de caméra.

#### `ui_appLayouts.removeApp(layoutId, appInstanceIdOrIndex)`

Retire une app d'un layout par indice (0-based) ou par identifiant "nom-indice".

- `layoutId` (*string*) : Fichier du layout.
- `appInstanceIdOrIndex` (*integer|string*) : Indice 0-based ou "appName-<idx>".
- **renvoie** : boolean true si retirée.

#### `ui_appLayouts.renameLayout(filename, title)`

Change le titre d'un layout. Refuse les layouts du contenu officiel.

- `filename` (*string*) : Fichier du layout.
- `title` (*string*) : Nouveau titre.
- **renvoie** : boolean true si renommé.

#### `ui_appLayouts.resetLayout(filenameToReset, layoutType)`

Réinitialise un layout utilisateur en supprimant son fichier, ce qui fait réapparaître l'original. Refuse les fichiers hors du dossier utilisateur.

- `filenameToReset` (*string|nil*) : Fichier utilisateur à réinitialiser.
- `layoutType` (*string|nil*) : Type utilisé pour retrouver l'original si le fichier n'en a pas.
- **renvoie** : string|boolean Nom de fichier du layout réinitialisé, ou false en cas d'échec.

#### `ui_appLayouts.resetUsedLayout()`

Recharge le layout mémorisé par setUsedLayout comme layout courant. Renvoie le layout courant tel quel si aucun n'a été choisi.

- **renvoie** : table|nil Layout courant.

#### `ui_appLayouts.saveLayout(data)`

Enregistre un layout sur disque (champ `filename` obligatoire) puis notifie les consommateurs.

- `data` (*table*) : Layout à écrire, avec `filename`.

#### `ui_appLayouts.setCurrentLayout(layoutOrFilename)`

Définit le layout courant à partir d'un nom de fichier ou d'une table de layout, puis notifie le changement. Renvoie nil si le fichier est introuvable.

- `layoutOrFilename` (*string|table*) : Chemin du fichier du layout ou table de layout.
- **renvoie** : table|nil Le layout courant.

#### `ui_appLayouts.setEditing(enabled)`

Active ou désactive le mode édition des layouts.

- `enabled` (*boolean*) : Nouvel état.
- **renvoie** : boolean État enregistré.

#### `ui_appLayouts.setLayoutForType(layoutType, filename)`

Mémorise le layout à utiliser pour un type de layout.

- `layoutType` (*string*) : Type de layout.
- `filename` (*string*) : Fichier du layout (doit exister).
- **renvoie** : boolean true si enregistré.

#### `ui_appLayouts.setUsedLayout(idOrType)`

Choisit le layout à utiliser à partir d'un nom de fichier ou d'un type. Un choix explicite par fichier est mémorisé comme préférence du type, sauf s'il s'agit du layout par défaut du type (la préférence est alors effacée).

- `idOrType` (*string*) : Nom de fichier du layout ou type de layout.
- **renvoie** : table|nil Layout activé, nil s'il est introuvable.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : `{'ui_apps'}`. |

**Évènements UI (guihooks.trigger) :** `PlayerCameraModeChanged`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appLayouts.lua`.*
