---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mapJsonEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur du fichier navgraph levels/<niveau>/map.json (menu Window > Roads > Map Json Editor). Ce fichier contient des segments de route manuels : chaînes ordonnées et nommées de BeamNGWaypoint avec surcharges de drivabilité, sens, voies, vitesse limite, etc. Les waypoints sont des objets de la scène, le fichier ne les référence que par nom. map.lua surveille le fichier et recharge le navgraph quand il est écrit. L'outil dessine les segments et waypoints en 3D (debugDrawer) et ajoute un mode d'édition « Edit Map Json ».
--- Accès : extension `editor_mapJsonEditor` : `extensions.load("editor_mapJsonEditor")`, puis la globale `editor_mapJsonEditor`
---@class editor_mapJsonEditor
editor_mapJsonEditor = {}

--- Lit un fichier map.json, remet la sélection à zéro et rescanne les waypoints de la scène.
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:133
---@param fp string|nil Chemin du fichier ; map.json du niveau courant si nil.
---@return boolean  true si le fichier a été lu, false sinon (pas de niveau ou lecture impossible).
function editor_mapJsonEditor.loadFile(fp) end

--- Restaure l'état après un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:798
---@param d table|nil Table renvoyée par onSerialize.
function editor_mapJsonEditor.onDeserialized(d) end

--- Appelé à la sortie du niveau : efface données, chemin, sélection et caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:784
function editor_mapJsonEditor.onEditorExitLevel() end

--- Dessine la fenêtre de l'outil (ouvrir/nouveau, SAVE, liste des segments et nœuds, options d'affichage) et le dessin 3D à chaque frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:659
function editor_mapJsonEditor.onEditorGui() end

--- Définit le mode d'édition mapJsonEditMode, enregistre la fenêtre et l'entrée de menu (groupe Roads).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:758
function editor_mapJsonEditor.onEditorInitialized() end

--- Quand la fenêtre de l'outil est masquée, revient au mode d'édition objectSelect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:772
---@param windowName string Nom de la fenêtre masquée.
function editor_mapJsonEditor.onEditorToolWindowHide(windowName) end

--- Appelé avant un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:794
---@return table  {data, filePath, dirty}.
function editor_mapJsonEditor.onSerialize() end

--- Quand la fenêtre de l'outil prend le focus, active le mode d'édition mapJsonEditMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:778
---@param windowName string Nom de la fenêtre.
function editor_mapJsonEditor.onWindowGotFocus(windowName) end

--- Écrit les segments dans le fichier (le navgraph se recharge au changement de fichier). Ne fait rien s'il n'y a pas de données ; journalise une erreur si l'écriture échoue.
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:200
---@param fp string|nil Chemin cible ; chemin courant ou map.json du niveau par défaut.
function editor_mapJsonEditor.saveFile(fp) end

--- Affiche la fenêtre, active le mode d'édition mapJsonEditMode, charge map.json du niveau s'il n'est pas déjà ouvert, puis rescanne les waypoints.
---Source : lua/ge/extensions/editor/mapJsonEditor.lua:745
function editor_mapJsonEditor.show() end

