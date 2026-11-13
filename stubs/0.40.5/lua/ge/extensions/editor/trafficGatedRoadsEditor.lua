---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficGatedRoadsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur « Traffic Gated Roads » (menu Traffic) : place des sphères (affichées comme des cylindres verticaux de 20 m de haut, rayon réglable) dans le monde et les enregistre dans un JSON, par défaut /gameplay/trafficGatedRoads.json. Chaque sphère a id, name, pos {x,y,z}, quat {x,y,z,w} et radius (10 par défaut). Ctrl+clic ajoute une sphère, Maj+clic duplique la sélection, clic sélectionne, Suppr supprime ; un gizmo déplace, tourne ou redimensionne. Le rôle de ces données dans le trafic n'est pas défini dans ce fichier.
--- Accès : extension `editor_trafficGatedRoadsEditor` : `extensions.load("editor_trafficGatedRoadsEditor")`, puis la globale `editor_trafficGatedRoadsEditor`
---@class editor_trafficGatedRoadsEditor
editor_trafficGatedRoadsEditor = {}

--- Vrai quand le mode d'édition courant est « Edit Traffic Gated Roads » : le gizmo n'est alors autorisé.
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:441
---@return boolean  Mode d'édition actif.
function editor_trafficGatedRoadsEditor.allowGizmo() end

--- Charge un fichier JSON de sphères (jsonReadFile). En cas d'échec, logue une erreur et ne change rien. Sinon remplace les données, mémorise le chemin, efface la sélection et recalcule nextId.
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:209
---@param fp string|nil Chemin du fichier ; sans effet si nil.
function editor_trafficGatedRoadsEditor.loadData(fp) end

--- Hook appelé après un rechargement Lua : restaure l'état renvoyé par onSerialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:423
---@param d table|nil État sérialisé.
function editor_trafficGatedRoadsEditor.onDeserialized(d) end

--- Hook appelé chaque frame d'interface : dessine la fenêtre (menu File, SAVE, liste de sphères, nom, position, rayon, case Snap to Terrain), traite la souris, dessine les cylindres avec debugDrawer:drawCylinder et le gizmo (déplacement, rotation, échelle).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:230
function editor_trafficGatedRoadsEditor.onEditorGui() end

--- Hook de l'éditeur : crée le mode d'édition trafficGatedRoadsEditMode (clic gauche = Select), enregistre la fenêtre (400x500) et l'entrée de menu Traffic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:389
function editor_trafficGatedRoadsEditor.onEditorInitialized() end

--- Hook appelé quand une fenêtre d'outil est masquée : si c'est celle-ci, revient au mode objectSelect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:402
---@param windowName string Nom de la fenêtre masquée.
function editor_trafficGatedRoadsEditor.onEditorToolWindowHide(windowName) end

--- Hook appelé avant un rechargement Lua : renvoie l'état à conserver.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:414
---@return table  { data, filePath, selectedIdx, nextId }.
function editor_trafficGatedRoadsEditor.onSerialize() end

--- Hook appelé quand une fenêtre prend le focus : si c'est celle-ci, réactive le mode d'édition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:408
---@param windowName string Nom de la fenêtre.
function editor_trafficGatedRoadsEditor.onWindowGotFocus(windowName) end

--- Écrit les données dans un fichier JSON (jsonWriteFile, mise en forme lisible) et mémorise le chemin.
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:203
---@param fp string|nil Chemin ; par défaut le chemin courant.
function editor_trafficGatedRoadsEditor.saveData(fp) end

--- Efface la sélection d'objets, affiche la fenêtre et passe en mode d'édition trafficGatedRoadsEditMode.
---Source : lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:375
function editor_trafficGatedRoadsEditor.show() end

