# `gameplay_drift_bounds`

*Fichier : `lua/ge/extensions/gameplay/drift/bounds.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_bounds` : `extensions.load("gameplay_drift_bounds")`, puis la globale `gameplay_drift_bounds`

Limites de zone du mode drift. Charge un fichier de sites (zones) avec setBounds, puis, à chaque frame, regarde pour chaque véhicule suivi par gameplay_drift_drift s'il est dans au moins une zone ; sinon il est « hors limites ». Un moddeur de mission de drift lit getIsOutOfBounds(vehId) pour pénaliser le joueur. Contient aussi une fenêtre ImGui de debug et un profileur.

## Remarques

- setBounds : le paramètre drawBounds_ est mal géré : seul le cas nil met drawBounds à true ; une valeur true/false fournie n'est jamais copiée. De plus drawZones() (dessin des zones, clignotant rouge hors limites) est commenté dans onUpdate, donc rien n'est dessiné.
- Dépend de gameplay_drift_drift (getTrackedVehicles, getVehPos) et de gameplay_drift_general (debug) ; les véhicules non suivis sont retirés de l'état.
- getIsOutOfBounds sans argument renvoie true si n'importe quel véhicule suivi est hors limites (compatibilité).
- Une position hors de toutes les zones du fichier de sites (sites:getZonesForPosition renvoie 0 zone) est considérée hors limites.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_bounds.getDriftDebugInfo()` | Table de configuration du debug de l'extension : {default = false, canBeChanged = true}. | 115 |
| `gameplay_drift_bounds.getGC()` | Garbage Lua produit par la dernière frame mesurée par le profileur (0 si le debug général est coupé). | 119 |
| `gameplay_drift_bounds.getIsOutOfBounds(vehId)` | Indique si un véhicule est hors des zones de limites. | 103 |
| `gameplay_drift_bounds.onUpdate()` | Hook par frame : met à jour l'état hors-limites de chaque véhicule suivi, la fenêtre de debug et le profileur. *(interne)* *(hook)* | 88 |
| `gameplay_drift_bounds.setBounds(filePath, drawBounds_)` | Charge le fichier de sites qui définit les zones autorisées (gameplay_sites_sitesManager.loadSites puis finalizeSites) et vide l'état des véhicules. | 24 |

### Détail des paramètres

#### `gameplay_drift_bounds.getDriftDebugInfo()`

Table de configuration du debug de l'extension : {default = false, canBeChanged = true}.

- **renvoie** : table Infos de debug.

#### `gameplay_drift_bounds.getGC()`

Garbage Lua produit par la dernière frame mesurée par le profileur (0 si le debug général est coupé).

- **renvoie** : number Quantité de garbage mesurée.

#### `gameplay_drift_bounds.getIsOutOfBounds(vehId)`

Indique si un véhicule est hors des zones de limites.

- `vehId` (*integer|nil*) : ID du véhicule ; nil = vrai si un véhicule suivi quelconque est hors limites.
- **renvoie** : boolean true si hors limites.

#### `gameplay_drift_bounds.setBounds(filePath, drawBounds_)`

Charge le fichier de sites qui définit les zones autorisées (gameplay_sites_sitesManager.loadSites puis finalizeSites) et vide l'état des véhicules.

- `filePath` (*string*) : Chemin du fichier de sites contenant les zones.
- `drawBounds_` (*boolean|nil*) : Dessin des zones (nil = actif) ; voir notes, la valeur fournie est ignorée.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/bounds.lua`.*
