---@meta
-- tim19Atlas stub generated from lua/vehicle/props.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pilote les props animés du véhicule (section jbeam "props" : aiguilles, volant, pièces articulées, lumières de props). À chaque frame, chaque prop lit la valeur electrics.values[prop.func], la convertit (multiplier, min, max, offset) et l'envoie au moteur via obj:propUpdate. Gère aussi le masquage des props quand un groupe de casse (breakGroup) ou de déformation (deformGroup) est cassé.
--- Accès : globale `props`
---@class props
---@field updateGFX function nop par défaut ; remplacée par la mise à jour des props lors de reset()/init() si le véhicule a des props. ⚠ nop est défini ailleurs (global du jeu).
props = {}

--- Désactive et cache tous les props rattachés au groupe de déformation donné, puis les remet à 0 côté moteur. Appelée par la gestion de dégâts (beamstate) quand un groupe se déforme.
---Source : lua/vehicle/props.lua:41
---@param deformGroup string Nom du groupe de déformation.
function props.disablePropsInDeformGroup(deformGroup) end

--- Désactive et cache tous les props rattachés au groupe de casse donné, puis les remet à 0 côté moteur. Appelée quand un groupe de poutres casse.
---Source : lua/vehicle/props.lua:54
---@param breakGroup string Nom du groupe de casse.
function props.hidePropsInBreakGroup(breakGroup) end

--- Identique à reset() (M.init = reset). Lit v.data.props, construit les tables breakGroup/deformGroup, normalise la config lightScaling.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/props.lua:68
function props.init() end

--- Réinitialise l'état de chaque prop (disabled=false, hidden=false, lastVal=math.huge), reconstruit les index de groupes et active updateGFX s'il y a des props.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/props.lua:68
function props.reset() end

