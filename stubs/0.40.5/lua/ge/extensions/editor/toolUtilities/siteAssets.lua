---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteAssets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Les « étagères » (bibliothèque sur disque) d'où viennent les sites posés : bâtiments, espaces ouverts, parkings. Trois éditeurs y cuisent leurs sites et un placeur les lit tous ; ce module fixe une seule fois où ils vivent et comment s'appellent leurs fichiers. Un site est un dossier nommé d'après son slug, contenant le manifeste (<kind>.json : bornes, transformations du kit, plan du sol, lampes, plantes), model.json (le document éditable, pour rouvrir le site dans l'éditeur qui l'a créé) et shell.dae (géométrie unique, LODs et collision).
--- Accès : extension `editor_toolUtilities_siteAssets` : `extensions.load("editor_toolUtilities_siteAssets")`, puis la globale `editor_toolUtilities_siteAssets`
---@class editor_toolUtilities_siteAssets
---@field kinds table[] Liste des étagères : { id, noun, label, icon, root, manifest, editor }.
---@field modelFile string Nom du fichier du document éditable : 'model.json'.
---@field shellFile string Nom du fichier de géométrie unique : 'shell.dae'.
editor_toolUtilities_siteAssets = {}

--- S'assure que le dossier de l'étagère existe. Le dialogue de fichiers ne fait que LISTER le chemin donné sans le créer : sans cet appel, la première cuisson d'une installation neuve ouvrirait le dialogue sur un dossier inexistant.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:64
---@param kind string|nil Étagère.
---@return string  Chemin racine.
function editor_toolUtilities_siteAssets.ensureRoot(kind) end

--- Le nom est-il déjà pris ? C'est ce que demande Save As avant d'écraser le travail de quelqu'un.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:108
---@param kind string|nil Étagère.
---@param slug string Slug.
---@return boolean  true si le dossier existe.
function editor_toolUtilities_siteAssets.exists(kind, slug) end

--- Dossier d'un site : racine + slug + '/'.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:56
---@param kind string|nil Étagère.
---@param slug string Slug du site.
---@return string  Chemin du dossier.
function editor_toolUtilities_siteAssets.folderFor(kind, slug) end

--- Renvoie la définition de l'étagère pour un identifiant (building par défaut).
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:40
---@param kind string|nil 'building', 'openSpace' ou 'carPark'.
---@return table  Entrée de kinds.
function editor_toolUtilities_siteAssets.kindOf(kind) end

--- Tout ce qui est déjà sur une étagère, trié par nom. Ne lit que les manifestes (une petite lecture json par site, aucun maillage). Chaque entrée est le manifeste augmenté de dir (son dossier) et kind (son étagère), ce qui suffit au placeur pour le dresser.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:126
---@param kind string|nil Étagère.
---@return table[]  Manifestes (avec slug), augmentés de dir et kind.
function editor_toolUtilities_siteAssets.list(kind) end

--- Chemin du manifeste d'un site dans son dossier dir.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:58
---@param kind string|nil Étagère.
---@param dir string Dossier du site (avec barre oblique finale).
---@return string  Chemin du manifeste.
function editor_toolUtilities_siteAssets.manifestPath(kind, dir) end

--- Chemin de model.json dans dir.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:59
---@param dir string Dossier du site.
---@return string  Chemin.
function editor_toolUtilities_siteAssets.modelPath(dir) end

--- Enregistre un observateur appelé chaque fois qu'un site est écrit sur une étagère. Les observateurs ne sont jamais retirés.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:95
---@param fn function fn(kind, slug).
function editor_toolUtilities_siteAssets.onWritten(fn) end

--- Crée si besoin le dossier du site, le vide et le renvoie prêt à écrire. Toute cuisson commence ici.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:80
---@param kind string|nil Étagère.
---@param slug string Slug du site.
---@return string  Dossier du site.
function editor_toolUtilities_siteAssets.prepare(kind, slug) end

--- Retire un site de l'étagère, dossier compris. Un renommage est une sauvegarde sous le nouveau nom suivie de cet appel sur l'ancien, ce qui garde honnête le nom stocké dans le manifeste.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:114
---@param kind string|nil Étagère.
---@param slug string Slug.
---@return boolean  true si supprimé, false si absent.
---@return string  Dossier supprimé, ou 'not in the library'.
function editor_toolUtilities_siteAssets.remove(kind, slug) end

--- Dossier racine d'une étagère (par exemple /assets/openSpaces/).
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:54
---@param kind string|nil Étagère.
---@return string  Chemin racine avec barre oblique finale.
function editor_toolUtilities_siteAssets.rootOf(kind) end

--- Chemin de shell.dae dans dir.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:60
---@param dir string Dossier du site.
---@return string  Chemin.
function editor_toolUtilities_siteAssets.shellPath(dir) end

--- Nom de dossier tiré du nom de l'objet : minuscules, tout ce qui n'est pas alphanumérique devient un tiret bas, tirets bas de bord retirés. Une nouvelle cuisson d'un site renommé mais identique écrase donc son propre dossier. Un nom vide donne le nom commun du kind.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:46
---@param kind string|nil Étagère.
---@param name string|nil Nom du site.
---@return string  Slug.
function editor_toolUtilities_siteAssets.slugify(kind, name) end

--- Vide un dossier avant réécriture, pour qu'une cuisson plus petite ne laisse rien de périmé ; supprime aussi les caches .cdae.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:72
---@param dir string Dossier à vider.
function editor_toolUtilities_siteAssets.wipe(dir) end

--- Écrit le manifeste (compact), puis prévient les observateurs enregistrés par onWritten avec (kind, manifest.slug).
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:101
---@param kind string|nil Étagère.
---@param dir string Dossier du site.
---@param manifest table Manifeste avec au moins le champ slug.
---@return boolean  false si l'écriture a échoué, true sinon.
function editor_toolUtilities_siteAssets.writeManifest(kind, dir, manifest) end

--- Écrit le document éditable à côté de ses maillages : { version = 1, tool, state }. tool est l'éditeur qui l'a écrit, pour qu'un dossier ouvert par le mauvais le signale.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:90
---@param dir string Dossier du site.
---@param tool string Identifiant de l'éditeur.
---@param state table État sérialisé du document.
---@return boolean  true si l'écriture a réussi.
function editor_toolUtilities_siteAssets.writeModel(dir, tool, state) end

---@type number
i = nil
