---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/statsFooter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pied de page de statistiques partagé par les outils « kit » de l'éditeur : affiche des stats « Libellé N » en ImGui et la ligne dynamique des triangles dessinés, de la distance et du nombre de pièces affichées (calculés par triLive). Utilise la palette 'crystal' de style.lua.
--- Accès : extension `editor_toolUtilities_statsFooter` : `extensions.load("editor_toolUtilities_statsFooter")`, puis la globale `editor_toolUtilities_statsFooter`
---@class editor_toolUtilities_statsFooter
editor_toolUtilities_statsFooter = {}

--- Dessine une stat « Libellé N » : libellé terne, nombre coloré, barre « | » ternie devant (sauf en début de ligne).
---Source : lua/ge/extensions/editor/toolUtilities/statsFooter.lua:16
---@param label string Libellé.
---@param val any Valeur affichée via tostring ; 0 si nil/false.
---@param col ImVec4 Couleur du nombre.
---@param lead boolean|nil Vrai : début de ligne, pas de barre.
---@param tip string|nil Infobulle.
function editor_toolUtilities_statsFooter.item(label, val, col, lead, tip) end

--- Affiche triangles dessinés (« Drawn tris »), portée (« Range », en mètres) et pièces dessinées sur placées (« Drawing »). `unique` est ajouté tel quel aux triangles car sans LOD. Met à jour triLive (note si fresh, scanStep, update).
---Source : lua/ge/extensions/editor/toolUtilities/statsFooter.lua:26
---@param instances table Entrées triLive.
---@param unique number Triangles de la géométrie unique, ajoutés en entier.
---@param fresh boolean|nil La liste a changé depuis la dernière fois (peut contenir une forme jamais mesurée).
function editor_toolUtilities_statsFooter.liveRow(instances, unique, fresh) end

