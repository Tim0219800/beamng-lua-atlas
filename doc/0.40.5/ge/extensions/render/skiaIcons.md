# `render_skiaIcons`

*Fichier : `lua/ge/extensions/render/skiaIcons.lua` · VM : Game Engine (GE) · 617 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_skiaIcons` : `extensions.load("render_skiaIcons")`, puis la globale `render_skiaIcons`

Icônes 3D (billboards Skia tournés vers la caméra) pour marquer des positions du monde : missions, stations, marqueurs de course. Chaque icône est dessinée avec la police bngIcons en quatre couches (contour de la forme, remplissage, liseré du motif, motif). Les icônes de même apparence partagent un pool de billboards : en libérer une la range pour la prochaine du même style au lieu de refaire une texture. Un moddeur appelle getIcon, puis update à chaque image, et release à la fin.

## Exemple

```lua
local icon = render_skiaIcons.getIcon('mission', pos)  -- preset d'un fichier *.skiaIcon.json
local icon2 = render_skiaIcons.getIcon({shape = 'circle', motive = 'fuelPump', color = 'blue'})
icon2:setVisible(true)
-- à chaque image (onPreRender) :
icon2:update(pos, render_skiaIcons.screenBoundedScale(pos, 0.8, 0.03, 0.12), dt)
-- à la fin :
icon2:release()
```

## Remarques

- Spec d'icône (tous champs facultatifs) : shape, motive, text (court libellé comme '3' ou '9+' qui remplace le motif), motiveScale, motiveOffset, outline (en unités de police par 24 ; défaut 1.5), color, borderColor, motiveColor, et preset (nom d'une entrée des fichiers /art/skiaIcons/*.skiaIcon.json, clé 'presets'). Les noms de couleur sont résolus par la table de iconMarkerConfig.json, sinon la valeur est prise telle quelle.
- Le module lit au chargement ui/ui-vue/src/assets/fonts/bngIcons/iconMarkerConfig.json et bngIcons.js ; si la config est illisible, le chargement de l'extension échoue (error).
- Le moteur n'offre pas d'alpha sur les billboards : le fondu est simulé en réduisant la taille jusqu'à zéro (sous 0.005 m l'icône est cachée). La taille est une hauteur en mètres.
- Le pool garde au plus 192 billboards libérés ; au-delà ils sont détruits.
- Un billboard n'est construit qu'au premier update visible, ce qui évite de coûter une texture aux marqueurs jamais vus.
- Après release() l'icône est 'morte' : demander une nouvelle icône avec getIcon.
- Le renderer est un objet du scenetree nommé 'skiaIconBillboards' ; il disparaît avec la scène (onClientEndMission invalide tous les identifiants).
- Le code de Icon:update a pour signature réelle (pos, scale, dt) ; la page extraite affiche par erreur (scale, dt) car la méthode est déclarée avec ':'.
- Charge l'extension core_skiaTemplate à la demande.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_skiaIcons.exploreFolder(which)` | Ouvre un de ces dossiers dans l'explorateur de fichiers du système (confort de développement). | 568 |
| `render_skiaIcons.getColors()` | Renvoie la table des couleurs nommées de la config d'icônes. | 604 |
| `render_skiaIcons.getFolders()` | Dossiers lus par le système : presets (/art/skiaIcons) et font. | 562 |
| `render_skiaIcons.getIcon(spec, pos)` | Renvoie une icône pour un nom de preset, une table de spec, ou un preset avec surcharges (spec.preset plus champs). Si le style ne peut pas être construit, renvoie une icône déjà morte (isLive faux). | 476 |
| `render_skiaIcons.getMotives()` | Liste triée de tous les noms de motifs (glyphes de bngIcons). | 553 |
| `render_skiaIcons.getPresets()` | Renvoie la table des presets (nom -> spec) chargée depuis /art/skiaIcons/*.skiaIcon.json (champ 'presets'). | 174 |
| `render_skiaIcons.getShapes()` | Liste triée des noms de formes disponibles. | 605 |
| `render_skiaIcons.getStats()` | Statistiques du pool pour le débogage. | 575 |
| `render_skiaIcons.onClientEndMission()` | Hook de fin de mission : la scène et son renderer sont perdus, tous les identifiants de billboards sont invalidés et les pools vidés. *(interne)* *(hook)* | 544 |
| `render_skiaIcons.onExtensionLoaded()` | Hook appelé au chargement de l'extension : supprime un renderer 'skiaIconBillboards' laissé par une VM Lua précédente. *(interne)* *(hook)* | 589 |
| `render_skiaIcons.onExtensionUnloaded()` | Hook appelé au déchargement : identique à reload(). *(interne)* *(hook)* | 525 |
| `render_skiaIcons.reload()` | Relit la config partagée, la table de glyphes et les presets depuis le disque. Supprime le renderer (toutes les textures) ; les icônes vivantes se reconstruisent à leur prochain update. | 525 |
| `render_skiaIcons.reloadPresets()` | Oublie les presets chargés pour que le prochain getIcon relise les fichiers *.skiaIcon.json. Plus léger que reload : les textures déjà construites sont conservées. | 539 |
| `render_skiaIcons.screenBoundedScale(pos, worldSize, minScreen, maxScreen)` | Calcule la hauteur monde d'une icône qui se comporte comme un objet réel en distance moyenne mais reste bornée à l'écran : jamais sous minScreen (lisible de loin), jamais au-dessus de maxScreen (n'envahit pas la vue de près). Bornes exprimées en fraction de la hauteur de l'écran ; des bornes égales donnent une taille constante à l'écran. Utilise la caméra core_camera ; sans caméra, renvoie worldSize. | 508 |

### Détail des paramètres

#### `render_skiaIcons.exploreFolder(which)`

Ouvre un de ces dossiers dans l'explorateur de fichiers du système (confort de développement).

- `which` (*string*) : 'presets', 'font', ou un chemin.
- **renvoie** : string|nil Chemin ouvert, ou nil si la plateforme ne sait pas l'ouvrir.

#### `render_skiaIcons.getColors()`

Renvoie la table des couleurs nommées de la config d'icônes.

- **renvoie** : table<string, string> Nom de couleur vers valeur (format de la config).

#### `render_skiaIcons.getFolders()`

Dossiers lus par le système : presets (/art/skiaIcons) et font.

- **renvoie** : table<string, string> {presets = ..., font = ...}.

#### `render_skiaIcons.getIcon(spec, pos)`

Renvoie une icône pour un nom de preset, une table de spec, ou un preset avec surcharges (spec.preset plus champs). Si le style ne peut pas être construit, renvoie une icône déjà morte (isLive faux).

- `spec` (*string|table*) : Nom de preset ou table de spec (voir notes).
- `pos` (*vec3|nil*) : Position monde. Si fournie, l'icône est construite et placée tout de suite ; sinon au premier update.
- **renvoie** : Icon Objet icône avec update, setPos, setScale, setVisible, visibility, isLive, release.

#### `render_skiaIcons.getMotives()`

Liste triée de tous les noms de motifs (glyphes de bngIcons).

- **renvoie** : string[] Noms de motifs utilisables dans spec.motive.

#### `render_skiaIcons.getPresets()`

Renvoie la table des presets (nom -> spec) chargée depuis /art/skiaIcons/*.skiaIcon.json (champ 'presets').

- **renvoie** : table<string, table> Presets.

#### `render_skiaIcons.getShapes()`

Liste triée des noms de formes disponibles.

- **renvoie** : string[] Noms de formes utilisables dans spec.shape.

#### `render_skiaIcons.getStats()`

Statistiques du pool pour le débogage.

- **renvoie** : table {live, looks, pooled, created, reused, destroyed, hasRenderer}.

#### `render_skiaIcons.reload()`

Relit la config partagée, la table de glyphes et les presets depuis le disque. Supprime le renderer (toutes les textures) ; les icônes vivantes se reconstruisent à leur prochain update.

- **renvoie** : boolean true si la config a pu être relue.

#### `render_skiaIcons.screenBoundedScale(pos, worldSize, minScreen, maxScreen)`

Calcule la hauteur monde d'une icône qui se comporte comme un objet réel en distance moyenne mais reste bornée à l'écran : jamais sous minScreen (lisible de loin), jamais au-dessus de maxScreen (n'envahit pas la vue de près). Bornes exprimées en fraction de la hauteur de l'écran ; des bornes égales donnent une taille constante à l'écran. Utilise la caméra core_camera ; sans caméra, renvoie worldSize.

- `pos` (*vec3*) : Position de l'icône.
- `worldSize` (*number*) : Hauteur en mètres dans la plage intermédiaire.
- `minScreen` (*number|nil*) : Fraction minimale de la hauteur d'écran (défaut 0).
- `maxScreen` (*number|nil*) : Fraction maximale de la hauteur d'écran (défaut 1).
- **renvoie** : number Hauteur monde à passer à Icon:update.

## Classe `Icon`

Poignée d'icône renvoyée par getIcon. Chaque méthode d'état renvoie l'icône elle-même (sauf isLive, visibility, release).

| Méthode | Description | Ligne |
|---|---|---|
| `Icon:isLive()` | Faux si l'icône n'a pas de billboard : libérée, style impossible à construire, ou pas de renderer. | 450 |
| `Icon:release()` | Range le billboard dans le pool pour une icône du même style. La poignée est inutilisable ensuite. | 454 |
| `Icon:setPos(pos)` | Raccourci pour update(pos, nil, nil). | 431 |
| `Icon:setScale(scale)` | Raccourci pour update(nil, scale, nil). | 432 |
| `Icon:setVisible(visible, instant)` | Affiche ou masque l'icône avec fondu. Avec instant, saute le fondu et pousse le résultat tout de suite (utile pour un marqueur caché qu'on ne met plus à jour). | 436 |
| `Icon:sync()` | S'assure que l'icône possède un billboard de son apparence actuelle : reconstruit après reload ou après la perte de la scène, récupère un billboard du pool ou en crée un. | 369 |
| `Icon:update(pos, scale, dt)` | Appel par image. pos et scale gardent leur valeur actuelle quand ils sont nil ; dt fait avancer le fondu de visibilité (nil ou 0 le laisse en place). | 405 |
| `Icon:visibility()` | Avancement actuel du fondu entre 0 et 1, pour caler d'autres éléments visuels dessus. | 446 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

**Charge les extensions :** `core_skiaTemplate`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/skiaIcons.lua`.*
