---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/viewDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit exemple d'utilisation des vues de rendu (RenderViewManagerInstance) : crée une vue nommée 'Demo view 1' rendue dans une texture nommée, déplace sa caméra en cercle et l'affiche dans une fenêtre ImGui. À charger à la main avec extensions.load('render_viewDemo') ; sert de modèle pour un moddeur qui veut une caméra virtuelle vers une texture.
--- Accès : extension `render_viewDemo` : `extensions.load("render_viewDemo")`, puis la globale `render_viewDemo`
---@class render_viewDemo
render_viewDemo = {}

--- Hook appelé à chaque image : crée la vue au premier appel, déplace la caméra (position sin/cos du temps simulé, hauteur 1.5), dessine un texte de debug et affiche la texture de la vue dans la fenêtre ImGui 'Render view test'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/viewDemo.lua:25
---@param dtReal number Durée réelle de l'image (s), non utilisée.
---@param dtSim number Durée simulée (s), ajoutée à un chronomètre local.
---@param dtRaw number Durée brute (s), non utilisée.
function render_viewDemo.onUpdate(dtReal, dtSim, dtRaw) end

