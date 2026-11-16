# `editor_terraform_terraform`

*Fichier : `lua/ge/extensions/editor/terraform/terraform.lua` · VM : Game Engine (GE) · 1356 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terraform_terraform` : `extensions.load("editor_terraform_terraform")`, puis la globale `editor_terraform_terraform`

Moteur de terraformage du terrain de l'éditeur. Il modifie la heightmap du TerrainBlock pour l'aligner sur des 'sources' (bandes de route : liste de {pos, width, binormal}) ou des 'features' (quads et anneaux avec un mode par élément), avec un falloff par champ de distance (SDF), un lissage par relaxation, du bruit et un masque d'occupation par priorité (table PRIO). Il enregistre aussi des 'baselines' (hauteurs d'origine et écrites) pour pouvoir restaurer le terrain, et fournit une paire de boutons 'Terraform To X' / 'Restore Terrain' pour les outils de splines. Utilisé par editor_terraformTool et par les outils de routes, ponts et lieux.

## Exemple

```lua
local tc = require('editor/terraform/terraform')
local sources = require('editor/terraform/fetchSources').getAllSourcesInSelection()
tc.terraformToSources(100, 5, 1.5, 0.4, 0.5, sources)
```

## Remarques

- Dépend de editor_terrainEditor (getTerrainBlock, getTerrainEditor) ; sans terrain ou sans éditeur de terrain, les fonctions de terraformage retournent sans rien faire.
- Les hauteurs de la grille sont locales au bloc : z = hauteur monde - tb:getPosition().z ; les écritures sont bornées à max(0, z).
- gridDims renvoie le dernier indice valide (N-1) : l'indice N est repris à 0 par le moteur et écrirait sur le bord opposé de la carte.
- Constantes internes : doiMultFactor 2.5 (marge de la boîte englobante), smoothPasses 5 par défaut, relaxSweepsPerStep 14, relaxSweepsMax 400, relaxOmega 1.7, targetSweeps 24, spillBatterSlope 1/1.5.
- Une baseline (obj.terraBaseline) contient gx, gy (indices de cellules), z (hauteur d'origine), w (hauteur écrite), n et les bornes xMin..yMax. revertBaseline n'écrit que les cellules encore égales à w (tolérance 1e-3) : les cellules retouchées depuis sont laissées.
- Dans le code, deux fonctions locales restoreBaseline existent ; la première (sans paramètre, lignes ~117) est masquée par la seconde (obj, recordHistory) qui est celle exportée.
- Le code mentionne que le module perlin est inutilisé (le bruit simplex est préféré).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terraform_terraform.carvePad(DOI, margin, falloffExp, features, passes, baselineOut)` | Creuse des features dans le pad de travail d'un outil. Même creusement que terraformToQuads et même falloff, mais le niveau n'est pas marqué modifié et aucune étape d'annulation n'est créée ; l'appelant garde les hauteurs (baselineOut) et les restitue lui-même. Pas de bande de priorité. | 1191 |
| `editor_terraform_terraform.carveToQuads(obj, DOI, margin, falloffExp, roughness, scale, features, smoothPasses)` | Comme carveToSources, mais la surface est donnée en quads explicites (avec le Z bilinéaire exact par cellule) : une culée sur un tablier bombé arrive pile à la hauteur du tablier, sans creux. Annule la baseline précédente, vide le masque d'occupation, fait une passe terraformToQuads et mémorise la baseline. | 1201 |
| `editor_terraform_terraform.carveToSourceGroups(obj, DOI, margin, falloffExp, roughness, scale, groups, smoothPasses, clips)` | Comme carveToSources, mais chaque élément de 'groups' est une liste de runs terraformés ensemble en une seule passe (une seule capture de baseline sur leur fenêtre commune). À utiliser quand une zone est faite de bandes qui se chevauchent ; les groupes eux-mêmes doivent être disjoints. | 785 |
| `editor_terraform_terraform.carveToSources(obj, DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, clips)` | Terraformage avec mémoire de baseline : annule d'abord obj.terraBaseline, puis terraforme chaque 'run' de sources sur sa propre boîte serrée (utile pour deux culées de pont aux extrémités opposées) et fusionne les baselines dans obj.terraBaseline. | 766 |
| `editor_terraform_terraform.cellPriorityAt(gx, gy)` | Renvoie la bande de priorité qui possède une cellule dans le masque d'occupation (coordonnées de grille absolues), 0 si aucune. | 144 |
| `editor_terraform_terraform.claimFeatures(features, priority)` | Réserve toutes les cellules couvertes par un ensemble de features, à une priorité donnée, sans modifier aucune hauteur (appelle terraformToQuads en claimOnly). | 1180 |
| `editor_terraform_terraform.clampBelowDecks(features, marginM)` | Abaisse sans condition le terrain sous des empreintes de surface (tabliers de pont) : un sommet de grille est ramené à (dessus du tablier - marge) seulement s'il dépasse au-dessus du tablier. Enregistre l'historique des sommets abaissés. | 1247 |
| `editor_terraform_terraform.gridDims(tb)` | Renvoie le dernier indice de grille valide en X et Y du bloc de terrain (nombre de cellules moins 1). | 80 |
| `editor_terraform_terraform.groundBefore(baselines)` | Renvoie une fonction height(x, y) donnant le sol tel qu'il était avant les terraformages enregistrés dans 'baselines' (leurs hauteurs d'origine), et le terrain actuel ailleurs. Quand deux enregistrements contiennent la même cellule, le premier de la liste gagne. | 815 |
| `editor_terraform_terraform.heldReach(squareSize)` | Distance, au-delà du bord d'une empreinte, sur laquelle le sol est tenu : (0.5 + racine de 2) * squareSize (demi-cellule de peau plus anneau d'une cellule). | 37 |
| `editor_terraform_terraform.resetMask()` | Vide le masque d'occupation persistant (hauteurs et priorités par cellule). | 74 |
| `editor_terraform_terraform.restoreBaseline(obj, recordHistory)` | Restaure le terrain qu'un objet a creusé (l'objet reste en place) et oublie son enregistrement obj.terraBaseline. | 802 |
| `editor_terraform_terraform.revertBaseline(bl, recordHistory)` | Restaure une fenêtre capturée par terraformToSources(..., baselineOut) : réécrit les hauteurs d'origine, puis rafraîchit la grille une fois. Les cellules modifiées depuis (sculpture, autre route) ne sont pas touchées. | 680 |
| `editor_terraform_terraform.snapshotBaseline()` | Copie toutes les hauteurs du terrain (grille complète) et l'état du masque d'occupation pour pouvoir y revenir. Ne fait rien sans terrain. | 100 |
| `editor_terraform_terraform.swapBaseline(from, to)` | Remplace le terraformage 'from' par 'to' (chacun peut être nil) en n'écrivant que les cellules dont la hauteur change, pour limiter les appels moteur. | 707 |
| `editor_terraform_terraform.terraformButtons(obj, canTerraform, p, label, icons, cols, iconsBig, own)` | Dessine la paire de boutons 'Terraform To X' et 'Restore Terrain' partagée par les outils de splines. 'own' (optionnel) permet à un outil de fournir son propre terraformage ({run(obj, p), restore(obj), hasCarve(obj)}). | 844 |
| `editor_terraform_terraform.terraformToQuads(DOI, margin, falloffExp, roughness, scale, features, passes, protect, priority, baselineOut, claimOnly)` | Terraforme la heightmap à partir de features explicites (quads ou anneaux) avec support par anneau de cellules voisines et mode par feature. Avec claimOnly, s'arrête après la fusion : seul le masque d'occupation est écrit, aucune hauteur. | 968 |
| `editor_terraform_terraform.terraformToSources(DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, baselineOut, clips)` | Terraforme la heightmap d'après des poids de quads et un falloff par champ de distance : le sol sous les sources prend la hauteur de la source, puis se fond dans le terrain sur la marge et le DOI. Écrit dans le terrain, marque le niveau modifié et peut enregistrer une étape d'annulation. Retourne sans rien faire s'il n'y a pas de sources, de terrain block ou de terrain editor. | 572 |

### Détail des paramètres

#### `editor_terraform_terraform.carvePad(DOI, margin, falloffExp, features, passes, baselineOut)`

Creuse des features dans le pad de travail d'un outil. Même creusement que terraformToQuads et même falloff, mais le niveau n'est pas marqué modifié et aucune étape d'annulation n'est créée ; l'appelant garde les hauteurs (baselineOut) et les restitue lui-même. Pas de bande de priorité.

- `DOI` (*number*) : Domaine d'influence (m).
- `margin` (*number*) : Marge (m).
- `falloffExp` (*number*) : Falloff.
- `features` (*table*) : Liste de features.
- `passes` (*integer|nil*) : Passes de lissage.
- `baselineOut` (*table|nil*) : Reçoit la baseline.

#### `editor_terraform_terraform.carveToQuads(obj, DOI, margin, falloffExp, roughness, scale, features, smoothPasses)`

Comme carveToSources, mais la surface est donnée en quads explicites (avec le Z bilinéaire exact par cellule) : une culée sur un tablier bombé arrive pile à la hauteur du tablier, sans creux. Annule la baseline précédente, vide le masque d'occupation, fait une passe terraformToQuads et mémorise la baseline.

- `obj` (*table*) : Objet qui reçoit terraBaseline.
- `DOI` (*number*) : Domaine d'influence (m).
- `margin` (*number*) : Marge (m).
- `falloffExp` (*number*) : Falloff.
- `roughness` (*number*) : Rugosité.
- `scale` (*number*) : Échelle du bruit.
- `features` (*table*) : Liste de features (avec quad ou rings, et un mode).
- `smoothPasses` (*integer|nil*) : Passes de lissage.

#### `editor_terraform_terraform.carveToSourceGroups(obj, DOI, margin, falloffExp, roughness, scale, groups, smoothPasses, clips)`

Comme carveToSources, mais chaque élément de 'groups' est une liste de runs terraformés ensemble en une seule passe (une seule capture de baseline sur leur fenêtre commune). À utiliser quand une zone est faite de bandes qui se chevauchent ; les groupes eux-mêmes doivent être disjoints.

- `obj` (*table*) : Objet qui reçoit terraBaseline.
- `DOI` (*number*) : Domaine d'influence (m).
- `margin` (*number*) : Marge (m).
- `falloffExp` (*number*) : Falloff.
- `roughness` (*number*) : Rugosité.
- `scale` (*number*) : Échelle du bruit.
- `groups` (*table*) : Liste de groupes ; chaque groupe est une liste de runs.
- `smoothPasses` (*integer|nil*) : Passes de lissage.
- `clips` (*table|nil*) : Extrémités à ne pas dépasser.

#### `editor_terraform_terraform.carveToSources(obj, DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, clips)`

Terraformage avec mémoire de baseline : annule d'abord obj.terraBaseline, puis terraforme chaque 'run' de sources sur sa propre boîte serrée (utile pour deux culées de pont aux extrémités opposées) et fusionne les baselines dans obj.terraBaseline.

- `obj` (*table*) : Objet qui reçoit terraBaseline.
- `DOI` (*number*) : Domaine d'influence (m).
- `margin` (*number*) : Marge (m).
- `falloffExp` (*number*) : Falloff.
- `roughness` (*number*) : Rugosité.
- `scale` (*number*) : Échelle du bruit.
- `sources` (*table*) : Liste de runs (chaque run est une source).
- `smoothPasses` (*integer|nil*) : Passes de lissage.
- `clips` (*table|nil*) : Extrémités à ne pas dépasser.

#### `editor_terraform_terraform.cellPriorityAt(gx, gy)`

Renvoie la bande de priorité qui possède une cellule dans le masque d'occupation (coordonnées de grille absolues), 0 si aucune.

- `gx` (*integer*) : Indice de grille X.
- `gy` (*integer*) : Indice de grille Y.
- **renvoie** : number Priorité de la cellule.

#### `editor_terraform_terraform.claimFeatures(features, priority)`

Réserve toutes les cellules couvertes par un ensemble de features, à une priorité donnée, sans modifier aucune hauteur (appelle terraformToQuads en claimOnly).

- `features` (*table*) : Liste de features.
- `priority` (*number*) : Bande de priorité.

#### `editor_terraform_terraform.clampBelowDecks(features, marginM)`

Abaisse sans condition le terrain sous des empreintes de surface (tabliers de pont) : un sommet de grille est ramené à (dessus du tablier - marge) seulement s'il dépasse au-dessus du tablier. Enregistre l'historique des sommets abaissés.

- `features` (*table*) : Empreintes de tablier.
- `marginM` (*number|nil*) : Marge sous le tablier en mètres (0.4 par défaut).
- **renvoie** : integer Nombre de sommets abaissés (0 si rien à faire ou pas de terrain).

#### `editor_terraform_terraform.gridDims(tb)`

Renvoie le dernier indice de grille valide en X et Y du bloc de terrain (nombre de cellules moins 1).

- `tb` (*userdata*) : TerrainBlock.
- **renvoie** : integer Dernier indice en X.
- **renvoie** : integer Dernier indice en Y.

#### `editor_terraform_terraform.groundBefore(baselines)`

Renvoie une fonction height(x, y) donnant le sol tel qu'il était avant les terraformages enregistrés dans 'baselines' (leurs hauteurs d'origine), et le terrain actuel ailleurs. Quand deux enregistrements contiennent la même cellule, le premier de la liste gagne.

- `baselines` (*table*) : Liste de baselines (terraBaseline).
- **renvoie** : function function(x, y) renvoyant la hauteur monde (nil hors terrain selon le code).

#### `editor_terraform_terraform.heldReach(squareSize)`

Distance, au-delà du bord d'une empreinte, sur laquelle le sol est tenu : (0.5 + racine de 2) * squareSize (demi-cellule de peau plus anneau d'une cellule).

- `squareSize` (*number*) : Taille d'une cellule du terrain en mètres.
- **renvoie** : number Portée en mètres.

#### `editor_terraform_terraform.restoreBaseline(obj, recordHistory)`

Restaure le terrain qu'un objet a creusé (l'objet reste en place) et oublie son enregistrement obj.terraBaseline.

- `obj` (*table*) : Objet portant terraBaseline.
- `recordHistory` (*boolean|nil*) : true pour que la restauration soit annulable (Ctrl+Z) ; les chemins de suppression passent false.
- **renvoie** : boolean true s'il y avait un terraformage à défaire (utile pour griser un bouton).

#### `editor_terraform_terraform.revertBaseline(bl, recordHistory)`

Restaure une fenêtre capturée par terraformToSources(..., baselineOut) : réécrit les hauteurs d'origine, puis rafraîchit la grille une fois. Les cellules modifiées depuis (sculpture, autre route) ne sont pas touchées.

- `bl` (*table|nil*) : Baseline.
- `recordHistory` (*boolean|nil*) : true pour enregistrer une étape annulable 'Restore Terrain'.

#### `editor_terraform_terraform.swapBaseline(from, to)`

Remplace le terraformage 'from' par 'to' (chacun peut être nil) en n'écrivant que les cellules dont la hauteur change, pour limiter les appels moteur.

- `from` (*table|nil*) : Baseline à retirer.
- `to` (*table|nil*) : Baseline à poser.

#### `editor_terraform_terraform.terraformButtons(obj, canTerraform, p, label, icons, cols, iconsBig, own)`

Dessine la paire de boutons 'Terraform To X' et 'Restore Terrain' partagée par les outils de splines. 'own' (optionnel) permet à un outil de fournir son propre terraformage ({run(obj, p), restore(obj), hasCarve(obj)}).

- `obj` (*table*) : Objet terraformé.
- `canTerraform` (*boolean*) : Affiche le bouton de terraformage ou un espace vide.
- `p` (*table*) : Paramètres : doi, margin, falloff, roughness, scale, smooth.
- `label` (*string*) : Nom affiché dans les info-bulles et les identifiants.
- `icons` (*table*) : Icônes (terrainToLine, settings_backup_restore).
- `cols` (*table*) : Couleurs (blueB, blueD).
- `iconsBig` (*any*) : Taille des icônes (ImVec2).
- `own` (*table|nil*) : Terraformage propre à l'outil.

#### `editor_terraform_terraform.terraformToQuads(DOI, margin, falloffExp, roughness, scale, features, passes, protect, priority, baselineOut, claimOnly)`

Terraforme la heightmap à partir de features explicites (quads ou anneaux) avec support par anneau de cellules voisines et mode par feature. Avec claimOnly, s'arrête après la fusion : seul le masque d'occupation est écrit, aucune hauteur.

- `DOI` (*number*) : Domaine d'influence (m).
- `margin` (*number*) : Marge (m).
- `falloffExp` (*number*) : Falloff.
- `roughness` (*number*) : Rugosité.
- `scale` (*number*) : Échelle du bruit.
- `features` (*table*) : Liste de features.
- `passes` (*integer|nil*) : Passes de lissage.
- `protect` (*any*) : Protection de zones (déduit du code, non détaillé).
- `priority` (*number|nil*) : Bande de priorité (voir PRIO), 0 par défaut.
- `baselineOut` (*table|nil*) : Reçoit la baseline des cellules déplacées.
- `claimOnly` (*boolean|nil*) : true : n'écrit que le masque.

#### `editor_terraform_terraform.terraformToSources(DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, baselineOut, clips)`

Terraforme la heightmap d'après des poids de quads et un falloff par champ de distance : le sol sous les sources prend la hauteur de la source, puis se fond dans le terrain sur la marge et le DOI. Écrit dans le terrain, marque le niveau modifié et peut enregistrer une étape d'annulation. Retourne sans rien faire s'il n'y a pas de sources, de terrain block ou de terrain editor.

- `DOI` (*number*) : Domaine d'influence en mètres (minimum 1).
- `margin` (*number*) : Marge latérale (apron) en mètres, convertie en cellules.
- `falloffExp` (*number*) : Exposant/distance de décroissance du falloff (valeur 'falloff' de l'outil).
- `roughness` (*number*) : Rugosité du bruit dans [0, 1].
- `scale` (*number*) : Échelle du bruit dans [0, 1].
- `sources` (*table*) : Liste de sources ; chaque source est une liste de {pos, width, binormal}.
- `smoothPasses` (*integer|nil*) : Nombre de passes de flou sur l'apron (défaut 5).
- `baselineOut` (*table|nil*) : Si fourni, rempli avec la baseline (gx, gy, z, w, n, xMin, yMin, xMax, yMax).
- `clips` (*table|nil*) : Extrémités de route dont le falloff ne doit pas déborder vers l'avant (le tablier reste tenu).

## Champs

| Champ | Type | Description |
|---|---|---|
| `PRIO` | table<string, number> | Bandes de priorité du masque d'occupation : LAKE 1, CARPARK 1.5, OPENSPACE 1.75, BUILDING 2, PAVING 2.5, PATH 3, STRUCTURE 4, RIM 4.2, AREAWAY 4.3, GROUND 5, RAIL 5.5. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terraform/terraform.lua`.*
