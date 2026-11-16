# `editor_sitesEditor`

*Fichier : `lua/ge/extensions/editor/sitesEditor.lua` · VM : Game Engine (GE) · 404 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_sitesEditor` : `extensions.load("editor_sitesEditor")`, puis la globale `editor_sitesEditor`

Éditeur des fichiers de 'sites' (*.sites.json) : lieux (locations), zones et places de parking (parkingSpots), avec leurs tags. Il ouvre la fenêtre 'Sites: Locations and Zones Editor' avec un menu File (New, Load, Save, Save as, Sites in Manager) et un menu Tools (tri par nom, numérotation des places, nommage par zone), et un onglet par sous-éditeur (editor/sitesEditor/*). Il crée le mode d'édition 'Edit Sites'. Un moddeur de cartes s'en sert pour placer des lieux et des places de parking.

## Remarques

- Fichiers par défaut : dossier de la mission courante ou /gameplay/sites/, nom newSite.sites.json.
- Menu Tools : 'Enumerate Parking Spots' suffixe les noms en doublon par un compteur (1 à 4 chiffres selon le nombre) ; 'Parkingspot Names by Zone Containment' renomme chaque place avec le nom de la dernière zone qui la contient (peut être long).
- BUG : M.onExtensionLoaded = onExtensionLoaded référence une variable locale jamais définie, donc M.onExtensionLoaded vaut nil.
- Fenêtres internes : Locations, Zones, Parking Spots, Location Tags, Zone Tags, Parking Spot Tags.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_sitesEditor.allowGizmo()` | Indique si le mode d'édition actif est 'Edit Sites' (donc si les gizmos et clics sont permis). | 387 |
| `editor_sitesEditor.getCurrentLocation()` | Renvoie le lieu sélectionné dans l'onglet Locations. | 389 |
| `editor_sitesEditor.getCurrentParkingSpot()` | Renvoie la place de parking sélectionnée dans l'onglet Parking Spots. | 391 |
| `editor_sitesEditor.getCurrentSites()` | Renvoie l'objet sites en cours d'édition. | 388 |
| `editor_sitesEditor.getCurrentZone()` | Renvoie la zone sélectionnée dans l'onglet Zones. | 390 |
| `editor_sitesEditor.loadSites(loadPath)` | Charge un fichier de sites via gameplay_sites_sitesManager.loadSites, le rend courant, le transmet à tous les sous-éditeurs et réinitialise leur sélection. | 30 |
| `editor_sitesEditor.managerSites()` | Dessine le sous-menu 'Sites in Manager...' : liste des sites par niveau et ceux de /gameplay, avec Refresh, et charge celui choisi. | 216 |
| `editor_sitesEditor.onDeserialized(data)` | Hook de restauration après rechargement Lua : réinjecte data.path dans les sites courants. *(interne)* *(hook)* | 364 |
| `editor_sitesEditor.onEditorGui()` | Hook appelé chaque frame de l'UI de l'éditeur : dessine la fenêtre, les menus, les onglets, met à jour les infos souris (rayon caméra) et dessine les sites en debug. *(interne)* *(hook)* | 79 |
| `editor_sitesEditor.onEditorInitialized()` | Hook d'initialisation de l'éditeur : enregistre la fenêtre, le mode d'édition sitesEditMode, l'entrée de menu (groupe Gameplay) et crée les six sous-éditeurs. *(interne)* *(hook)* | 307 |
| `editor_sitesEditor.onEditorToolWindowGotFocus(windowName)` | Hook : si la fenêtre de l'outil prend le focus, active le mode d'édition sitesEditMode. *(interne)* *(hook)* | 378 |
| `editor_sitesEditor.onEditorToolWindowHide(windowName)` | Hook : si la fenêtre de l'outil est masquée, revient au mode objectSelect. *(interne)* *(hook)* | 372 |
| `editor_sitesEditor.onSerialize()` | Hook de sérialisation (rechargement Lua) : renvoie {path = sérialisation des sites courants}. *(interne)* *(hook)* | 357 |
| `editor_sitesEditor.saveSites(sites, savePath)` | Sérialise un objet sites et l'écrit en JSON au chemin donné ; met à jour sites.dir et sites.name et mémorise le dossier comme dernier chemin. | 21 |
| `editor_sitesEditor.selectZone(elem, mode)` | Sélectionne une zone dans l'onglet Zones (utilisé par le clic dans le monde). | 392 |
| `editor_sitesEditor.show()` | Efface la sélection d'objets, affiche la fenêtre de l'outil et active le mode d'édition sitesEditMode. | 284 |

### Détail des paramètres

#### `editor_sitesEditor.allowGizmo()`

Indique si le mode d'édition actif est 'Edit Sites' (donc si les gizmos et clics sont permis).

- **renvoie** : boolean true si le mode Edit Sites est actif.

#### `editor_sitesEditor.getCurrentLocation()`

Renvoie le lieu sélectionné dans l'onglet Locations.

- **renvoie** : table|nil Lieu sélectionné ou nil.

#### `editor_sitesEditor.getCurrentParkingSpot()`

Renvoie la place de parking sélectionnée dans l'onglet Parking Spots.

- **renvoie** : table|nil Place sélectionnée ou nil.

#### `editor_sitesEditor.getCurrentSites()`

Renvoie l'objet sites en cours d'édition.

- **renvoie** : table Sites courants.

#### `editor_sitesEditor.getCurrentZone()`

Renvoie la zone sélectionnée dans l'onglet Zones.

- **renvoie** : table|nil Zone sélectionnée ou nil.

#### `editor_sitesEditor.loadSites(loadPath)`

Charge un fichier de sites via gameplay_sites_sitesManager.loadSites, le rend courant, le transmet à tous les sous-éditeurs et réinitialise leur sélection.

- `loadPath` (*string*) : Chemin du fichier .sites.json.
- **renvoie** : table Les sites courants (l'ancien objet si le chargement a échoué).

#### `editor_sitesEditor.onDeserialized(data)`

Hook de restauration après rechargement Lua : réinjecte data.path dans les sites courants.

- `data` (*table*) : Données renvoyées par onSerialize.

#### `editor_sitesEditor.onEditorToolWindowGotFocus(windowName)`

Hook : si la fenêtre de l'outil prend le focus, active le mode d'édition sitesEditMode.

- `windowName` (*string*) : Nom de la fenêtre.

#### `editor_sitesEditor.onEditorToolWindowHide(windowName)`

Hook : si la fenêtre de l'outil est masquée, revient au mode objectSelect.

- `windowName` (*string*) : Nom de la fenêtre masquée.

#### `editor_sitesEditor.onSerialize()`

Hook de sérialisation (rechargement Lua) : renvoie {path = sérialisation des sites courants}.

- **renvoie** : table Données à restaurer.

#### `editor_sitesEditor.saveSites(sites, savePath)`

Sérialise un objet sites et l'écrit en JSON au chemin donné ; met à jour sites.dir et sites.name et mémorise le dossier comme dernier chemin.

- `sites` (*table*) : Objet sites (gameplay/sites/sites).
- `savePath` (*string*) : Chemin complet du fichier .sites.json.

#### `editor_sitesEditor.selectZone(elem, mode)`

Sélectionne une zone dans l'onglet Zones (utilisé par le clic dans le monde).

- `elem` (*integer*) : Id de la zone (déduit du code).
- `mode` (*string|nil*) : 'toggle' pour basculer, nil pour remplacer la sélection.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Champ exporté mais toujours nil (variable locale non définie dans le fichier). ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor.lua`.*
