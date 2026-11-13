# `editor_toolUtilities_siteAssets`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteAssets.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteAssets` : `extensions.load("editor_toolUtilities_siteAssets")`, puis la globale `editor_toolUtilities_siteAssets`

Les « étagères » (bibliothèque sur disque) d'où viennent les sites posés : bâtiments, espaces ouverts, parkings. Trois éditeurs y cuisent leurs sites et un placeur les lit tous ; ce module fixe une seule fois où ils vivent et comment s'appellent leurs fichiers. Un site est un dossier nommé d'après son slug, contenant le manifeste (<kind>.json : bornes, transformations du kit, plan du sol, lampes, plantes), model.json (le document éditable, pour rouvrir le site dans l'éditeur qui l'a créé) et shell.dae (géométrie unique, LODs et collision).

## Remarques

- Étagères (kinds) : building -> /assets/massingBuildings/ (manifeste building.json, éditeur editor_massingEditor) ; openSpace -> /assets/openSpaces/ (openSpace.json, editor_openSpaceEditor) ; carPark -> /assets/carParks/ (carPark.json, editor_parkingLotEditor). Chaque entrée a aussi id, noun, label, icon.
- kindOf renvoie l'étagère « building » pour un kind inconnu ou nil.
- Le manifeste est écrit compact (il contient des milliers de transformations) ; model.json est écrit indenté.
- wipe supprime aussi le cache .cdae voisin d'un .dae, sans quoi le moteur le charge à la place du nouveau fichier.
- Les fonctions disque utilisent FS (directoryExists, directoryCreate, directoryList, directoryRemove, findFiles, removeFile) : sans FS elles ne font rien et list renvoie une liste vide.
- La page auto signale une globale « i » : ce sont des variables de boucle.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteAssets.ensureRoot(kind)` | S'assure que le dossier de l'étagère existe. Le dialogue de fichiers ne fait que LISTER le chemin donné sans le créer : sans cet appel, la première cuisson d'une installation neuve ouvrirait le dialogue sur un dossier inexistant. | 64 |
| `editor_toolUtilities_siteAssets.exists(kind, slug)` | Le nom est-il déjà pris ? C'est ce que demande Save As avant d'écraser le travail de quelqu'un. | 108 |
| `editor_toolUtilities_siteAssets.folderFor(kind, slug)` | Dossier d'un site : racine + slug + '/'. | 56 |
| `editor_toolUtilities_siteAssets.kindOf(kind)` | Renvoie la définition de l'étagère pour un identifiant (building par défaut). | 40 |
| `editor_toolUtilities_siteAssets.list(kind)` | Tout ce qui est déjà sur une étagère, trié par nom. Ne lit que les manifestes (une petite lecture json par site, aucun maillage). Chaque entrée est le manifeste augmenté de dir (son dossier) et kind (son étagère), ce qui suffit au placeur pour le dresser. | 126 |
| `editor_toolUtilities_siteAssets.manifestPath(kind, dir)` | Chemin du manifeste d'un site dans son dossier dir. | 58 |
| `editor_toolUtilities_siteAssets.modelPath(dir)` | Chemin de model.json dans dir. | 59 |
| `editor_toolUtilities_siteAssets.onWritten(fn)` | Enregistre un observateur appelé chaque fois qu'un site est écrit sur une étagère. Les observateurs ne sont jamais retirés. *(hook)* | 95 |
| `editor_toolUtilities_siteAssets.prepare(kind, slug)` | Crée si besoin le dossier du site, le vide et le renvoie prêt à écrire. Toute cuisson commence ici. | 80 |
| `editor_toolUtilities_siteAssets.remove(kind, slug)` | Retire un site de l'étagère, dossier compris. Un renommage est une sauvegarde sous le nouveau nom suivie de cet appel sur l'ancien, ce qui garde honnête le nom stocké dans le manifeste. | 114 |
| `editor_toolUtilities_siteAssets.rootOf(kind)` | Dossier racine d'une étagère (par exemple /assets/openSpaces/). | 54 |
| `editor_toolUtilities_siteAssets.shellPath(dir)` | Chemin de shell.dae dans dir. | 60 |
| `editor_toolUtilities_siteAssets.slugify(kind, name)` | Nom de dossier tiré du nom de l'objet : minuscules, tout ce qui n'est pas alphanumérique devient un tiret bas, tirets bas de bord retirés. Une nouvelle cuisson d'un site renommé mais identique écrase donc son propre dossier. Un nom vide donne le nom commun du kind. | 46 |
| `editor_toolUtilities_siteAssets.wipe(dir)` | Vide un dossier avant réécriture, pour qu'une cuisson plus petite ne laisse rien de périmé ; supprime aussi les caches .cdae. | 72 |
| `editor_toolUtilities_siteAssets.writeManifest(kind, dir, manifest)` | Écrit le manifeste (compact), puis prévient les observateurs enregistrés par onWritten avec (kind, manifest.slug). | 101 |
| `editor_toolUtilities_siteAssets.writeModel(dir, tool, state)` | Écrit le document éditable à côté de ses maillages : { version = 1, tool, state }. tool est l'éditeur qui l'a écrit, pour qu'un dossier ouvert par le mauvais le signale. | 90 |

### Détail des paramètres

#### `editor_toolUtilities_siteAssets.ensureRoot(kind)`

S'assure que le dossier de l'étagère existe. Le dialogue de fichiers ne fait que LISTER le chemin donné sans le créer : sans cet appel, la première cuisson d'une installation neuve ouvrirait le dialogue sur un dossier inexistant.

- `kind` (*string|nil*) : Étagère.
- **renvoie** : string Chemin racine.

#### `editor_toolUtilities_siteAssets.exists(kind, slug)`

Le nom est-il déjà pris ? C'est ce que demande Save As avant d'écraser le travail de quelqu'un.

- `kind` (*string|nil*) : Étagère.
- `slug` (*string*) : Slug.
- **renvoie** : boolean true si le dossier existe.

#### `editor_toolUtilities_siteAssets.folderFor(kind, slug)`

Dossier d'un site : racine + slug + '/'.

- `kind` (*string|nil*) : Étagère.
- `slug` (*string*) : Slug du site.
- **renvoie** : string Chemin du dossier.

#### `editor_toolUtilities_siteAssets.kindOf(kind)`

Renvoie la définition de l'étagère pour un identifiant (building par défaut).

- `kind` (*string|nil*) : 'building', 'openSpace' ou 'carPark'.
- **renvoie** : table Entrée de kinds.

#### `editor_toolUtilities_siteAssets.list(kind)`

Tout ce qui est déjà sur une étagère, trié par nom. Ne lit que les manifestes (une petite lecture json par site, aucun maillage). Chaque entrée est le manifeste augmenté de dir (son dossier) et kind (son étagère), ce qui suffit au placeur pour le dresser.

- `kind` (*string|nil*) : Étagère.
- **renvoie** : table[] Manifestes (avec slug), augmentés de dir et kind.

#### `editor_toolUtilities_siteAssets.manifestPath(kind, dir)`

Chemin du manifeste d'un site dans son dossier dir.

- `kind` (*string|nil*) : Étagère.
- `dir` (*string*) : Dossier du site (avec barre oblique finale).
- **renvoie** : string Chemin du manifeste.

#### `editor_toolUtilities_siteAssets.modelPath(dir)`

Chemin de model.json dans dir.

- `dir` (*string*) : Dossier du site.
- **renvoie** : string Chemin.

#### `editor_toolUtilities_siteAssets.onWritten(fn)`

Enregistre un observateur appelé chaque fois qu'un site est écrit sur une étagère. Les observateurs ne sont jamais retirés.

- `fn` (*function*) : fn(kind, slug).

#### `editor_toolUtilities_siteAssets.prepare(kind, slug)`

Crée si besoin le dossier du site, le vide et le renvoie prêt à écrire. Toute cuisson commence ici.

- `kind` (*string|nil*) : Étagère.
- `slug` (*string*) : Slug du site.
- **renvoie** : string Dossier du site.

#### `editor_toolUtilities_siteAssets.remove(kind, slug)`

Retire un site de l'étagère, dossier compris. Un renommage est une sauvegarde sous le nouveau nom suivie de cet appel sur l'ancien, ce qui garde honnête le nom stocké dans le manifeste.

- `kind` (*string|nil*) : Étagère.
- `slug` (*string*) : Slug.
- **renvoie** : boolean true si supprimé, false si absent.
- **renvoie** : string Dossier supprimé, ou 'not in the library'.

#### `editor_toolUtilities_siteAssets.rootOf(kind)`

Dossier racine d'une étagère (par exemple /assets/openSpaces/).

- `kind` (*string|nil*) : Étagère.
- **renvoie** : string Chemin racine avec barre oblique finale.

#### `editor_toolUtilities_siteAssets.shellPath(dir)`

Chemin de shell.dae dans dir.

- `dir` (*string*) : Dossier du site.
- **renvoie** : string Chemin.

#### `editor_toolUtilities_siteAssets.slugify(kind, name)`

Nom de dossier tiré du nom de l'objet : minuscules, tout ce qui n'est pas alphanumérique devient un tiret bas, tirets bas de bord retirés. Une nouvelle cuisson d'un site renommé mais identique écrase donc son propre dossier. Un nom vide donne le nom commun du kind.

- `kind` (*string|nil*) : Étagère.
- `name` (*string|nil*) : Nom du site.
- **renvoie** : string Slug.

#### `editor_toolUtilities_siteAssets.wipe(dir)`

Vide un dossier avant réécriture, pour qu'une cuisson plus petite ne laisse rien de périmé ; supprime aussi les caches .cdae.

- `dir` (*string*) : Dossier à vider.

#### `editor_toolUtilities_siteAssets.writeManifest(kind, dir, manifest)`

Écrit le manifeste (compact), puis prévient les observateurs enregistrés par onWritten avec (kind, manifest.slug).

- `kind` (*string|nil*) : Étagère.
- `dir` (*string*) : Dossier du site.
- `manifest` (*table*) : Manifeste avec au moins le champ slug.
- **renvoie** : boolean false si l'écriture a échoué, true sinon.

#### `editor_toolUtilities_siteAssets.writeModel(dir, tool, state)`

Écrit le document éditable à côté de ses maillages : { version = 1, tool, state }. tool est l'éditeur qui l'a écrit, pour qu'un dossier ouvert par le mauvais le signale.

- `dir` (*string*) : Dossier du site.
- `tool` (*string*) : Identifiant de l'éditeur.
- `state` (*table*) : État sérialisé du document.
- **renvoie** : boolean true si l'écriture a réussi.

## Champs

| Champ | Type | Description |
|---|---|---|
| `kinds` | table[] | Liste des étagères : { id, noun, label, icon, root, manifest, editor }. |
| `modelFile` | string | Nom du fichier du document éditable : 'model.json'. |
| `shellFile` | string | Nom du fichier de géométrie unique : 'shell.dae'. |

**Globales affectées :** `i`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryList`, `directoryRemove`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteAssets.lua`.*
