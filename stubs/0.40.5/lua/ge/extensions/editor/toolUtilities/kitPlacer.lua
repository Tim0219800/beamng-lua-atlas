---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/kitPlacer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Placeur partagé de pièces de kit (fichiers .dae cuits) pour les outils de construction de l'éditeur (rues, bâtiments, ponts). Une pièce peut être un TSStatic (aperçu transitoire, canSave = false) ou un item Forest (bien moins coûteux : une transformation et un pointeur vers un ForestItemData). Gère la réutilisation des pièces d'une reconstruction à la suivante, le « burn » (rendre les pièces persistantes dans le niveau), l'écriture des datablocks dans art/forest/managedItemData.json et le retrait des pièces vivantes du forest pendant une sauvegarde de niveau.
--- Accès : extension `editor_toolUtilities_kitPlacer` : `extensions.load("editor_toolUtilities_kitPlacer")`, puis la globale `editor_toolUtilities_kitPlacer`
---@class editor_toolUtilities_kitPlacer
---@field MASSING_ITEM_PREFIX string Préfixe 'massingKit_' des ForestItemData des pièces burnées (persistantes).
editor_toolUtilities_kitPlacer = {}

--- Met de côté les pièces du dernier passage pour le suivant : une file par forme, rendues dans l'ordre. La liste est vidée mais rien n'est supprimé. Un reconstruction identique retrouve chaque pièce à sa place sans travail.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:133
---@param list table|nil Liste du sink (la clé de réutilisation est la liste, pas le sink).
function editor_toolUtilities_kitPlacer.beginReuse(list) end

--- Remet au niveau une pièce vivante : même pose sur le datablock propre de la forme (celui qui collisionne), retire l'item vivant. Nil pour une entrée qui n'est pas un item Forest.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:468
---@param fd userdata ForestData.
---@param entry table Entrée vivante.
---@return userdata|nil  Nouvel item burné.
function editor_toolUtilities_kitPlacer.burnItem(fd, entry) end

--- Burn de toutes les entrées vivantes d'un pool : leurs items sont ajoutés à out et le pool est vidé.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:481
---@param fd userdata ForestData.
---@param list table|nil Pool d'entrées.
---@param out table Liste recevant les items burnés.
function editor_toolUtilities_kitPlacer.burnList(fd, list, out) end

--- Burn d'un sink : passe ses TSStatic en persistants (canSave = true), applique la collision 'Collision Mesh' si le sink est collidable, marque l'éditeur modifié et renvoie les noms d'objets comme manifeste. Ne supprime ni ne détache rien (l'appelant détache son pool). Les noms survivent à la sauvegarde.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:317
---@param sink table|nil Sink ou { list = ... }.
---@return string[]  Manifeste des noms d'objets.
function editor_toolUtilities_kitPlacer.commitSink(sink) end

--- Efface les pièces placées d'une liste : supprime chaque TSStatic, retire chaque item Forest, vide la liste (termine aussi une réutilisation abandonnée).
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:285
---@param list table|nil Liste d'entrées.
function editor_toolUtilities_kitPlacer.deleteList(list) end

--- Retire l'emplacement k de t du forest et de la table. fd peut être nil (le forest où la pièce se trouve est alors retrouvé).
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:452
---@param fd userdata|nil ForestData.
---@param t table Liste.
---@param k integer Indice.
function editor_toolUtilities_kitPlacer.dropLive(fd, t, k) end

--- Supprime ce que le passage n'a pas redemandé (ce qui reste dans les files) et renvoie combien ont disparu.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:118
---@param list table|nil Liste du sink.
---@return integer  Nombre d'objets supprimés.
function editor_toolUtilities_kitPlacer.endReuse(list) end

--- Indique si un emplacement de pool est une pièce vivante Forest plutôt qu'un TSStatic.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:449
---@param e table|nil Entrée.
---@return boolean  true si c'est une pièce Forest suivie.
function editor_toolUtilities_kitPlacer.isLive(e) end

--- Renvoie le ForestItemData d'une forme de kit, créé au premier usage : celui du niveau ('burned', par défaut) ou une copie d'outil pour les pièces vivantes ('live', collidable = 0, ou 'solid'). Volontairement créé sans passer par editor.createDataBlock pour ne pas être confié au gestionnaire de persistance (writeItemDatas s'en charge). Le nom vient du chemin complet de la forme.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:383
---@param shapePath string|nil Chemin du .dae.
---@param kind string|nil 'burned' (défaut), 'live' ou 'solid'.
---@return userdata|nil  ForestItemData.
function editor_toolUtilities_kitPlacer.itemDataFor(shapePath, kind) end

--- Sort du forest toutes les pièces vivantes avant une sauvegarde de niveau (les leurs et celles qu'un outil aurait perdues de vue, identifiées par le préfixe liveKit_/liveSolid_ du datablock). À appeler depuis le hook de sauvegarde de chaque outil : le premier fait le travail, les suivants constatent que c'est déjà fait.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:500
function editor_toolUtilities_kitPlacer.liftLive() end

--- Renvoie les données du forest du niveau, en créant un Forest s'il n'y en a pas (foliageScatter.ensureForest).
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:633
---@return userdata|nil  ForestData.
function editor_toolUtilities_kitPlacer.liveForestData() end

--- Marque l'éditeur modifié pour que la sauvegarde soit proposée. Suffit pour un outil dont le burn est fait de statiques seules (objets de scène sauvegardés avec le niveau) ; un outil qui plante des items Forest doit aussi appeler writeItemDatas.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:611
function editor_toolUtilities_kitPlacer.markDirty() end

--- Déplace une pièce déjà dans la scène sur un nouveau repère, bien moins cher que la supprimer et la reconstruire. Pour un item Forest : retire puis replante (plus rapide que updateItem). Pour un TSStatic : setPosRot, l'échelle n'est réécrite que si elle a changé.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:259
---@param entry table Entrée { obj } ou { item, data }.
---@param ox number Origine x.
---@param oy number Origine y.
---@param oz number Origine z.
---@param ax number Along x.
---@param ay number Along y.
---@param az number Along z.
---@param ux number Up x.
---@param uy number Up y.
---@param uz number Up z.
---@param scl number|table|nil Échelle.
---@return boolean  true si la pièce a été déplacée.
function editor_toolUtilities_kitPlacer.moveOriented(entry, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Construit un « sink » pour un propriétaire. Un ownerId nil produit des pièces sans nom, pour un appelant qui ne les retrouve jamais par nom.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:98
---@param folder userdata SimGroup recevant les pièces.
---@param ownerId string|nil Identifiant du propriétaire, base des noms 'ownerId_N'.
---@param collidable boolean|nil Les pièces doivent collisionner (appliqué au commit pour les statiques).
---@param list table|nil Liste existante à remplir (partagée entre sinks) ; sinon nouvelle.
---@return table  Sink { folder, ownerId, collidable, list, n }.
function editor_toolUtilities_kitPlacer.newSink(folder, ownerId, collidable, list) end

--- Place une pièce de kit selon un repère local (origine, direction along, direction up). Un sink portant emitFrame reçoit le repère au lieu d'un objet de scène et sa valeur de retour est renvoyée.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:241
---@param sink table Sink.
---@param shapePath string Chemin du .dae.
---@param ox number Origine x.
---@param oy number Origine y.
---@param oz number Origine z.
---@param ax number Direction along x.
---@param ay number Direction along y.
---@param az number Direction along z.
---@param ux number Direction up x.
---@param uy number Direction up y.
---@param uz number Direction up z.
---@param scl number|table|nil Échelle.
---@return any  Résultat de sink.emitFrame, sinon rien.
function editor_toolUtilities_kitPlacer.placeOriented(sink, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Place une instance (position + quaternion) et ajoute son entrée à la liste du sink, en reprenant une pièce réutilisable de même forme si possible (ne réécrit la transformation que si elle a changé). Forme absente ou pas de dossier : entrée avec obj = nil.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:164
---@param sink table Sink.
---@param shapePath string|nil Chemin du .dae.
---@param px number Position x.
---@param py number Position y.
---@param pz number Position z.
---@param qx number Quaternion x.
---@param qy number Quaternion y.
---@param qz number Quaternion z.
---@param qw number Quaternion w.
---@param scl number|table|nil Échelle uniforme ou {x, y, z}.
function editor_toolUtilities_kitPlacer.placeTs(sink, shapePath, px, py, pz, qx, qy, qz, qw, scl) end

--- Plante une pièce vivante selon un repère local, comme item Forest. Renvoie l'entrée que garde la liste, ou nil s'il n'y a pas de forest ou pas de forme cuite, pour que l'appelant pose un TSStatic à la place.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:412
---@param fd userdata ForestData.
---@param shapePath string Chemin du .dae.
---@param ox number Origine x.
---@param oy number Origine y.
---@param oz number Origine z.
---@param ax number Along x.
---@param ay number Along y.
---@param az number Along z.
---@param ux number Up x.
---@param uy number Up y.
---@param uz number Up z.
---@param scl number|table|nil Échelle (par axe possible : la matrice du forest la porte).
---@return table|nil  Entrée { item, data, shape }.
function editor_toolUtilities_kitPlacer.plantOriented(fd, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Plante une pièce en item Forest directement depuis la pose d'un TSStatic (échelle par axe cuite dans les colonnes de la matrice), sur le datablock 'burned' de sa forme.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:529
---@param fd userdata ForestData.
---@param obj userdata TSStatic source.
---@return userdata|nil  Item créé, ou nil.
function editor_toolUtilities_kitPlacer.plantStatic(fd, obj) end

--- Pose l'emplacement i d'une liste en pièce vivante Forest : forme à une position, un quaternion et une échelle par axe ; solid pour une pièce qui collisionne comme son TSStatic. Un emplacement dont forme et pose n'ont pas changé est laissé tel quel. Une forme non cuite garde son emplacement sans item.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:427
---@param fd userdata ForestData.
---@param list table Pool d'entrées.
---@param i integer Indice de l'emplacement.
---@param shapePath string Chemin du .dae.
---@param solid boolean Datablock avec collision.
---@param px number Position x.
---@param py number Position y.
---@param pz number Position z.
---@param qx number Quaternion x.
---@param qy number Quaternion y.
---@param qz number Quaternion z.
---@param qw number Quaternion w.
---@param sx number Échelle x.
---@param sy number Échelle y.
---@param sz number Échelle z.
---@return table  L'entrée de l'emplacement.
function editor_toolUtilities_kitPlacer.poseLive(fd, list, i, shapePath, solid, px, py, pz, qx, qy, qz, qw, sx, sy, sz) end

--- À appeler chaque frame par chaque outil : le premier appel après une sauvegarde remet ce que liftLive avait retiré. Seulement dans une entrée qui tient toujours l'item levé, et seulement dans le forest d'où il est sorti.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:516
function editor_toolUtilities_kitPlacer.relayLive() end

--- Supprime par nom toutes les pièces burnées listées dans le manifeste (issu de commitSink), puis marque l'éditeur modifié. Manifeste nil ou vide : sans effet.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:338
---@param nameManifest string[]|nil Noms d'objets.
---@return integer  Nombre d'objets supprimés.
function editor_toolUtilities_kitPlacer.removeBurned(nameManifest) end

--- Compose prefix + id avec tout caractère non alphanumérique de l'id remplacé par '_'. Attention : string.gsub renvoie deux valeurs mais l'opérateur .. n'en garde qu'une.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:305
---@param prefix string Préfixe.
---@param id any Identifiant (converti par tostring).
---@return string  Nom sûr.
function editor_toolUtilities_kitPlacer.safeName(prefix, id) end

--- Colore une pièce lumineuse (instanceColor). Avec night, la confie aussi à la passe jour/nuit de core_environment (nightEmissive), qui met la couleur à noir de jour et la rétablit au crépuscule : un panneau ou une lentille de lampe est du verre sombre le jour. La couleur est écrite aussi ici.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:594
---@param obj userdata TSStatic.
---@param glow number[] Couleur {r, g, b} (défaut 1 par composante).
---@param night boolean|nil Enregistrer pour l'émissif nocturne (siteLights.markDirty).
function editor_toolUtilities_kitPlacer.setGlow(obj, glow, night) end

--- Renvoie le chemin d'une forme de kit si le fichier existe (résultat mis en cache), sinon nil avec un message d'erreur unique dans le log.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:38
---@param path string|nil Chemin du .dae cuit.
---@return string|nil  Le chemin, ou nil s'il est absent ou non cuit.
function editor_toolUtilities_kitPlacer.shapeOf(path) end

--- Crée une pièce isolée (TSStatic), hors de tout sink, pour un appelant qui gère ses propres emplacements. Remplace tout objet de même nom.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:251
---@param folder userdata SimGroup parent.
---@param shapePath string Chemin du .dae.
---@param name string|nil Nom d'objet de scène.
---@param collidable boolean|nil Collision 'Collision Mesh' sinon 'None'.
---@param ox number Origine x.
---@param oy number Origine y.
---@param oz number Origine z.
---@param ax number Along x.
---@param ay number Along y.
---@param az number Along z.
---@param ux number Up x.
---@param uy number Up y.
---@param uz number Up z.
---@param scl number|table|nil Échelle.
---@return userdata|nil  TSStatic créé, ou nil.
function editor_toolUtilities_kitPlacer.spawnOriented(folder, shapePath, name, collidable, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Retire du forest et de la liste tous les emplacements après le n-ième.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:462
---@param fd userdata|nil ForestData.
---@param list table Liste.
---@param n integer Nombre d'emplacements à garder.
function editor_toolUtilities_kitPlacer.trimLive(fd, list, n) end

--- Écrit les datablocks du kit dans art/forest/managedItemData.json du niveau, à appeler à la sauvegarde. Les clés massingKit_ sont reconstruites d'après ce qui est posé (ajout des nouvelles formes burnées, retrait de celles que rien n'utilise) ; le reste du fichier, propriété du Forest Editor, est laissé tel quel. Sans cela, un bâtiment burné se recharge avec des pièces pointant vers des datablocks inexistants. Ne touche pas au fichier s'il n'y a rien de ce kit.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:561
function editor_toolUtilities_kitPlacer.writeItemDatas() end

