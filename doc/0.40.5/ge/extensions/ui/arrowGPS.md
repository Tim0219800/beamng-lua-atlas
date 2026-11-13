# `ui_arrowGPS`

*Fichier : `lua/ge/extensions/ui/arrowGPS.lua` · VM : Game Engine (GE) · 196 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_arrowGPS` : `extensions.load("ui_arrowGPS")`, puis la globale `ui_arrowGPS`

Affiche une flèche GPS 3D (TSStatic art/shapes/interface/s_mm_arrow_floating.dae) flottant devant la caméra, à l'emplacement de l'app d'interface arrowGPS, et orientée vers une cible du monde. Plusieurs sources peuvent enregistrer une cible avec une priorité (setTarget) ; la plus prioritaire (nombre le plus petit) est suivie. La flèche est créée à la demande, cachée si aucune cible ou aucun véhicule joueur, et supprimée au déchargement.

## Exemple

```lua
ui_arrowGPS.setTarget('maMission', 10, {pos = vec3(100, 200, 50), color = {1, 0.4, 0.2}})
ui_arrowGPS.removeTarget('maMission')
```

## Remarques

- Priorité : la plus petite valeur gagne (comparaison « reg.priority < bestPriority »).
- setTarget accepte pos sous forme vec3, {x,y,z} ou {1,2,3}. Une inscription sans pos est ignorée pour le choix de la cible active. color = {r,g,b} avec valeurs de 0 à 1, par défaut {1, 0.4, 0.2}.
- La position écran de l'app (0 à 1) est fixée côté Vue par setAppScreenPos ; la flèche est placée à arrowDepth (0,15 m par défaut) devant la caméra en tenant compte du FOV et du ratio d'écran.
- Échelle par défaut 0.04. La flèche reste cachée si le joueur n'a pas de véhicule (getPlayerVehicle(0)) ou si la cible est à moins de 0,1 m.

**Dépendances (chargées avant) :** `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_arrowGPS.onExtensionUnloaded()` | Hook de déchargement : supprime l'objet flèche et vide toutes les inscriptions. *(interne)* *(hook)* | 179 |
| `ui_arrowGPS.onPreRender(dt)` | Hook appelé avant chaque rendu : crée la flèche si besoin, calcule sa position écran-vers-monde, l'oriente vers la cible active (quatFromDir) et l'affiche ; la cache si aucune cible ou aucun véhicule joueur. *(interne)* *(hook)* | 144 |
| `ui_arrowGPS.removeTarget(key)` | Retire la cible d'une source et recalcule la cible active (la flèche se cache s'il n'en reste aucune). | 68 |
| `ui_arrowGPS.setAppScreenPos(sx, sy)` | Fixe la position écran de l'app (fractions de 0 à 1) où la flèche est dessinée ; appelé côté interface. | 128 |
| `ui_arrowGPS.setDepth(depth)` | Change la distance devant la caméra à laquelle la flèche est placée (0.15 par défaut). | 140 |
| `ui_arrowGPS.setScale(scale)` | Change l'échelle de la flèche (0.04 par défaut). | 133 |
| `ui_arrowGPS.setTarget(key, priority, data)` | Enregistre ou remplace la cible d'une source (clé) avec sa priorité, puis recalcule la cible active et la couleur de la flèche. | 54 |

### Détail des paramètres

#### `ui_arrowGPS.onPreRender(dt)`

Hook appelé avant chaque rendu : crée la flèche si besoin, calcule sa position écran-vers-monde, l'oriente vers la cible active (quatFromDir) et l'affiche ; la cache si aucune cible ou aucun véhicule joueur.

- `dt` (*number*) : Temps écoulé (non utilisé).

#### `ui_arrowGPS.removeTarget(key)`

Retire la cible d'une source et recalcule la cible active (la flèche se cache s'il n'en reste aucune).

- `key` (*string*) : Identifiant de la source.

#### `ui_arrowGPS.setAppScreenPos(sx, sy)`

Fixe la position écran de l'app (fractions de 0 à 1) où la flèche est dessinée ; appelé côté interface.

- `sx` (*number*) : Position horizontale, 0 gauche, 1 droite.
- `sy` (*number*) : Position verticale, 0 haut, 1 bas.

#### `ui_arrowGPS.setDepth(depth)`

Change la distance devant la caméra à laquelle la flèche est placée (0.15 par défaut).

- `depth` (*number*) : Distance en mètres.

#### `ui_arrowGPS.setScale(scale)`

Change l'échelle de la flèche (0.04 par défaut).

- `scale` (*number*) : Facteur d'échelle uniforme.

#### `ui_arrowGPS.setTarget(key, priority, data)`

Enregistre ou remplace la cible d'une source (clé) avec sa priorité, puis recalcule la cible active et la couleur de la flèche.

- `key` (*string*) : Identifiant de la source.
- `priority` (*number*) : Priorité ; la plus petite valeur l'emporte.
- `data` (*table|nil*) : {pos=vec3|{x,y,z}, color={r,g,b}|nil}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | { "core_camera" } : chargé avant ce module. |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/arrowGPS.lua`.*
