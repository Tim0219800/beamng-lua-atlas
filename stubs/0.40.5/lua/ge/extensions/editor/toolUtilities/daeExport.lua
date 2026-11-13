---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/daeExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exporteur COLLADA (.dae 1.4.1) pour les pièces de kit « baked » des outils de l'éditeur. Sérialise des meshParts ({ verts, normals, uvs, faces, material, tint? }) en documents que le loader Torque de BeamNG lit comme une forme statique, pour les placer en TSStatic. Gère : forme simple, multi-matériaux, et multi-LOD avec mesh de collision (nœuds '<gid>_p<i>_L<taille>', 'Colmesh-1', 'nulldetail<taille>' sous une hiérarchie base00/start01 exigée par l'importeur). Les formes vont soit dans la racine publiée /assets/procedural_meshes/, soit dans la racine de travail /assets/procedural_meshes_wip/ (filtrée du build).
--- Accès : extension `editor_toolUtilities_daeExport` : `extensions.load("editor_toolUtilities_daeExport")`, puis la globale `editor_toolUtilities_daeExport`
---@class editor_toolUtilities_daeExport
---@field procRoot string Racine publiée des formes générées : '/assets/procedural_meshes/'.
---@field wipRoot string Racine de travail : '/assets/procedural_meshes_wip/' (exclue du build).
editor_toolUtilities_daeExport = {}

--- Démarre un run de bake : le prochain prepDir de chaque dossier le vide à nouveau.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:380
function editor_toolUtilities_daeExport.beginBake() end

--- Convertit une longueur en étiquette sûre pour nom de fichier/id : 16.0 -> "16", 0.5 -> "0_5", 0.125 -> "0_125".
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:33
---@param L number Longueur
---@return string  Étiquette.
function editor_toolUtilities_daeExport.lenTag(L) end

--- Dossier où vivent les formes baked d'un kit : racine publiée si RELEASED[folder] est vrai, sinon racine de travail. Prend le nom de dossier seul.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:407
---@param folder string Nom du dossier du kit
---@return string  Chemin se terminant par '/'.
function editor_toolUtilities_daeExport.outDir(folder) end

--- Prépare un dossier de sortie : le vide s'il existe, sinon le crée, et vide son équivalent sous /temp. Une seule fois par dossier et par run. Refuse (log erreur) un dossier hors procRoot/wipRoot ; sans effet si FS est absent.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:390
---@param dir string Dossier VFS sous procRoot ou wipRoot
function editor_toolUtilities_daeExport.prepDir(dir) end

--- Sérialise `part` et l'écrit au chemin VFS `path` comme forme statique simple (un nœud, matériau lié par nom).
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:342
---@param path string Chemin VFS du .dae
---@param part table meshPart { verts, normals, uvs, faces, tint? }
---@param matName string Nom du matériau du jeu
---@param gid string Id de géométrie/nœud (aussi le nom de base du fichier)
---@return boolean  true en cas de succès.
function editor_toolUtilities_daeExport.writeDae(path, part, matName, gid) end

--- Écrit une forme multi-LOD avec collision. lods = { {size=S, parts={...}}, ... } par S décroissant (LOD0 = S le plus grand) ; colParts = pièces du mesh de collision (nœud 'Colmesh-1') ; nullSize ajoute un nœud vide 'nulldetail<nullSize>' sous lequel la forme disparaît.
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:365
---@param path string Chemin VFS
---@param lods table Liste { size, parts } décroissante
---@param colParts table|nil Parts de collision (sans chanfrein)
---@param gid string Id de base
---@param ox number|nil Origine locale x
---@param oy number|nil Origine locale y
---@param oz number|nil Origine locale z
---@param nullSize number|nil Taille du détail nul (rien rendu en dessous)
---@return boolean  true en cas de succès.
function editor_toolUtilities_daeExport.writeDaeLODs(path, lods, colParts, gid, ox, oy, oz, nullSize) end

--- Écrit une liste de parts (chacune avec .material) dans un seul .dae multi-matériaux (un effect/material/geometry/node par part).
---Source : lua/ge/extensions/editor/toolUtilities/daeExport.lua:373
---@param path string Chemin VFS
---@param parts table Liste de meshParts avec .material
---@param gid string Base des ids de géométrie/nœud
---@param ox number|nil Origine locale x soustraite des sommets (défaut 0)
---@param oy number|nil Origine locale y
---@param oz number|nil Origine locale z
---@return boolean  true en cas de succès.
function editor_toolUtilities_daeExport.writeDaeParts(path, parts, gid, ox, oy, oz) end

