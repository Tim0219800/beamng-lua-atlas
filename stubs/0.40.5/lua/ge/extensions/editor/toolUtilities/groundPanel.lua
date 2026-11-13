---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundPanel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Panneau imgui des réglages du terraformage partagé (groundPass), dessiné à l'identique dans l'onglet Terrain de chaque outil de l'éditeur. Il lit et écrit groundPass.params (curseurs avec bouton de remise à la valeur par défaut, cases à cocher).
--- Accès : extension `editor_toolUtilities_groundPanel` : `extensions.load("editor_toolUtilities_groundPanel")`, puis la globale `editor_toolUtilities_groundPanel`
---@class editor_toolUtilities_groundPanel
editor_toolUtilities_groundPanel = {}

--- Dessine la case Terraform (décochée : restaure le terrain) et, si elle est cochée, les curseurs de fondu, marge, falloff, lissage, rugosité, échelle et culées de pont.
---Source : lua/ge/extensions/editor/toolUtilities/groundPanel.lua:49
function editor_toolUtilities_groundPanel.draw() end

--- Dessine la ligne 'Networks:' avec les cases Roads et Rail (réseaux couverts par Build).
---Source : lua/ge/extensions/editor/toolUtilities/groundPanel.lua:41
function editor_toolUtilities_groundPanel.drawNetworks() end

--- Dessine l'étiquette d'une ligne (texte vert avec infobulle) et place le curseur imgui à 90 px pour que les cases suivent sur la même ligne.
---Source : lua/ge/extensions/editor/toolUtilities/groundPanel.lua:28
---@param text string Texte de l'étiquette.
---@param tip string Infobulle.
function editor_toolUtilities_groundPanel.rowLabel(text, tip) end

