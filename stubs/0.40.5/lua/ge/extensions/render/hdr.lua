---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/hdr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crée au premier frame la chaîne d'effets de post-traitement HDR (exposition automatique/locale) : PostEffectBrightPass (rendu AfterPostFX à échelle 0.5) avec ses enfants PostEffectDownScale, PostEffectLuminance et PostEffectCombinePass, plus PostEffectLocalExposure (échelle 0.25) dont le biais d'exposition en EV vient du réglage GraphicEVCompensation. Aucun usage direct par un moddeur ; global : render_hdr.
--- Accès : extension `render_hdr` : `extensions.load("render_hdr")`, puis la globale `render_hdr`
---@class render_hdr
render_hdr = {}

--- Après rechargement Lua : restaure le drapeau initialized.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/hdr.lua:61
---@param data table Table renvoyée par onSerialize.
function render_hdr.onDeserialized(data) end

--- Hook du premier update du jeu : crée (si absents) les objets de post-traitement HDR décrits ci-dessus et applique le biais d'exposition GraphicEVCompensation (réglage, en EV, 0 par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/hdr.lua:9
function render_hdr.onFirstUpdate() end

--- Avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/hdr.lua:57
---@return table  {initialized = true}
function render_hdr.onSerialize() end

