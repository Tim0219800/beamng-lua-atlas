# `render_playerTags`

*Fichier : `lua/ge/extensions/render/playerTags.lua` · VM : Game Engine (GE) · 564 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_playerTags` : `extensions.load("render_playerTags")`, puis la globale `render_playerTags`

Étiquettes de nom flottantes au-dessus des véhicules des joueurs (multi-sièges et écran partagé). Utilise le système de billboards Skia (objet WorldBillboardRenderer enregistré « playerNameTags » dans MissionGroup) : chaque étiquette est une texture statique issue d'un modèle `.sktemplate.json`, teintée à la couleur du joueur, tournée vers la caméra, qui suit la voiture, grossit avec la distance (jusqu'à un plafond) et disparaît au-delà de 40 m. Piloté par core_multiseat (rebuild, updatePositions, reset…). Global : render_playerTags.

## Exemple

```lua
extensions.render_playerTags.rebuild({
  {player = 0, label = 'Alice', color = {1, 0.4, 0.2}, icon = 'user', perspectivePlayer = 0},
  {player = 1, label = 'Bob',   color = {0.2, 0.6, 1}},
}, 'multiseat')
-- puis chaque frame :
extensions.render_playerTags.updatePositions(dtReal)
```

## Remarques

- Modèles : 'default' = art/sktemplates/multiplayer-nametag.sktemplate.json ; 'multiseat' = art/sktemplates/multiseat-player-tag.sktemplate.json. Le nom de modèle inconnu retombe sur 'default'. Seul 'multiseat' ajoute une icône de persona (SVG de ui/ui-vue/src/assets/fonts/bngIcons/svg/<icon>.svg, remplie en blanc) ; le nom d'icône doit être alphanumérique (^%w+$).
- Couleurs : {r,g,b} entre 0 et 1, mélangées vers un gris anthracite (54,69,79) à 30 % (haut) et 60 % (bas du dégradé) ; tintAccent remplace la couleur des nœuds de rôle 'accent' par ce dégradé.
- Chaque entrée de rebuild : {player, label, color={r,g,b}, icon?, key?, perspectivePlayer?, hideInViews?}. L'état est indexé par `key` (défaut player), ce qui permet plusieurs étiquettes par joueur (une par vue en écran partagé). perspectivePlayer = joueur qui regarde : sa propre étiquette n'apparaît que 3 s (TAG_SHOW_TIME) après un changement d'occupation du véhicule ou de véhicule ; les étiquettes des autres s'empilent verticalement (0.33 m, 0.24 m avec icône) au-dessus du véhicule.
- Valeurs de réglage locales : échelle 0.36, distance max 40 m, échelle minimale atteinte à 3 m et maximale à 26,7 m, bascule vers la position du siège sous 7 m, lissage de position 10. En pause du jeu (simTimeAuthority.getPause) les étiquettes sont forcées visibles ; en mode photo (photoModeOpen) elles sont masquées.
- La position de base se calcule au-dessus de la boîte englobante orientée (OOBB) du véhicule, au niveau du nœud conducteur ; sinon 1,25 m au-dessus de la position du véhicule. En sièges multiples, gameplay_seatOccupants.getSeatExitData donne la position de chaque siège.
- Si l'objet C++ playerNameTags disparaît (rechargement), liveRenderer le détecte et vide l'état local ; reset() est aussi lié à onExtensionUnloaded.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_playerTags.clearHiddenPlayers()` | Réaffiche tous les joueurs masqués. | 286 |
| `render_playerTags.clearPlayerColorOverrides()` | Supprime les couleurs imposées et reconstruit. | 298 |
| `render_playerTags.destroy()` | Détruit toutes les étiquettes (billboards) en cours et vide l'état local, en laissant le renderer en place. | 186 |
| `render_playerTags.hasTags()` | Indique s'il existe au moins une étiquette. | 208 |
| `render_playerTags.isLive()` | Indique si le renderer de billboards existe dans la scène. | 204 |
| `render_playerTags.onExtensionUnloaded()` | Alias de reset appelé au déchargement de l'extension. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `render_playerTags.onVehicleSwitched(oldId, newId, player)` | Hook de changement de véhicule : met à jour le véhicule suivi des étiquettes du joueur ; l'étiquette du joueur qui regarde est affichée 3 s. *(interne)* *(hook)* | 304 |
| `render_playerTags.rebuild(tags, templateName)` | Reconstruit toutes les étiquettes : mémorise la demande (pour reload et surcharges de couleur), détruit les anciennes, crée le renderer au besoin puis un billboard par entrée en conservant l'état de lissage précédent. | 212 |
| `render_playerTags.reload()` | Vide les caches de modèles et de chemins d'icônes SVG puis reconstruit les dernières étiquettes demandées (utile pour mettre au point un .sktemplate.json). | 273 |
| `render_playerTags.reset()` | Détruit les étiquettes, oublie la référence au renderer et efface joueurs masqués et surcharges de couleur. À appeler avant un rechargement Lua/GE qui détruit l'objet C++ ; aussi onExtensionUnloaded. | 196 |
| `render_playerTags.setPlayerColorOverride(player, color)` | Impose une couleur à un joueur et reconstruit les étiquettes. | 291 |
| `render_playerTags.setPlayerHidden(player, hidden)` | Masque ou affiche l'étiquette d'un joueur. | 280 |
| `render_playerTags.updatePositions(dt)` | À appeler chaque frame : calcule position, échelle (lissée) et visibilité de chaque étiquette (regroupement par véhicule, empilement, distance à la caméra du joueur) et appelle WorldBillboardRenderer:update. | 473 |

### Détail des paramètres

#### `render_playerTags.hasTags()`

Indique s'il existe au moins une étiquette.

- **renvoie** : boolean true si des étiquettes sont actives.

#### `render_playerTags.isLive()`

Indique si le renderer de billboards existe dans la scène.

- **renvoie** : boolean true si l'objet playerNameTags existe.

#### `render_playerTags.onVehicleSwitched(oldId, newId, player)`

Hook de changement de véhicule : met à jour le véhicule suivi des étiquettes du joueur ; l'étiquette du joueur qui regarde est affichée 3 s.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.
- `player` (*integer*) : Joueur.

#### `render_playerTags.rebuild(tags, templateName)`

Reconstruit toutes les étiquettes : mémorise la demande (pour reload et surcharges de couleur), détruit les anciennes, crée le renderer au besoin puis un billboard par entrée en conservant l'état de lissage précédent.

- `tags` (*table[]*) : Liste d'entrées {player, label, color, icon?, key?, perspectivePlayer?, hideInViews?}.
- `templateName` (*string|nil*) : 'default' ou 'multiseat'.
- **renvoie** : boolean false si tags n'est pas une table ou si le renderer n'a pas pu être créé.

#### `render_playerTags.reload()`

Vide les caches de modèles et de chemins d'icônes SVG puis reconstruit les dernières étiquettes demandées (utile pour mettre au point un .sktemplate.json).

- **renvoie** : boolean false s'il n'y a rien à reconstruire.

#### `render_playerTags.setPlayerColorOverride(player, color)`

Impose une couleur à un joueur et reconstruit les étiquettes.

- `player` (*integer*) : Joueur.
- `color` (*table*) : {r,g,b} entre 0 et 1.

#### `render_playerTags.setPlayerHidden(player, hidden)`

Masque ou affiche l'étiquette d'un joueur.

- `player` (*integer*) : Joueur.
- `hidden` (*boolean*) : true pour masquer.

#### `render_playerTags.updatePositions(dt)`

À appeler chaque frame : calcule position, échelle (lissée) et visibilité de chaque étiquette (regroupement par véhicule, empilement, distance à la caméra du joueur) et appelle WorldBillboardRenderer:update.

- `dt` (*number*) : Durée de la frame (s).

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `getObjectOOBBAxisNormalizedXYZ`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getObjectOOBBIsInitialized`

**Charge les extensions :** `core_skiaTemplate`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/playerTags.lua`.*
