---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteWater.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Eau stagnante et en chute d'un « site » (open space editor) : bassins d'une cascade, nappes qui débordent entre eux, jets, gerbes et jets d'écume (émetteur de particules BNGP_sprinkler). L'eau n'est pas un mesh et ne peut donc pas être cuite dans une coque ; le manifeste du site la porte sous forme de chiffres et tout ce qui monte le site recrée les objets (WaterBlock, River, ParticleEmitterNode). Tout part d'un enregistrement unique, exprimé dans le repère du site : un point d'ancrage et un angle règlent tout le placement.
--- Accès : extension `editor_toolUtilities_siteWater` : `extensions.load("editor_toolUtilities_siteWater")`, puis la globale `editor_toolUtilities_siteWater`
---@class editor_toolUtilities_siteWater
editor_toolUtilities_siteWater = {}

--- Inonde ce que le centre d'intérêt a posé (bassins), puis accroche une nappe sur chaque face de chaque bassin qui déborde, avec gerbes d'écume, puis les couronnes (jets et déversoirs). Vide d'abord le dossier.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:305
---@param ca table|nil Enregistrement de l'éditeur : pools, falls, crowns, flow, sprayPow, sprayVar, spraySeed.
---@param folder userdata|nil Dossier de scène (SimGroup) qui reçoit les objets.
---@param tag string|nil Nom du site qui monte l'eau, pour que deux sites identiques sur une carte n'aient pas les mêmes noms d'objets (défaut 'site').
---@return table|nil  Ids des objets créés (nil si pas de bassins ou de dossier).
---@return table|nil  Noms des objets créés.
function editor_toolUtilities_siteWater.build(ca, folder, tag) end

--- Passe chaque objet en persistant (canSave et cansave à true) et renvoie leurs noms, ce qui sert à l'annulation d'une gravure.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:338
---@param ids table|nil Ids renvoyés par build.
---@return table<integer, string>  Noms des objets retrouvés et nommés.
function editor_toolUtilities_siteWater.commit(ids) end

--- Produit l'enregistrement du manifeste, dans le repère du site : seulement ce que build lit (bassins, couronnes, nappes, débit, gerbes). Positions relatives à (ox, oy, oz), bassins et couronnes relatifs à l'ancre.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:356
---@param ca table|nil Enregistrement de l'éditeur (doit avoir pools non vide).
---@param ox number X de l'origine du site.
---@param oy number Y de l'origine du site.
---@param oz number Z de l'origine du site.
---@return table|nil  Enregistrement du manifeste, nil s'il n'y a pas de bassin.
function editor_toolUtilities_siteWater.localise(ca, ox, oy, oz) end

--- Opération inverse : place un enregistrement de manifeste à une position et un cap, prêt pour build. L'ancre pivote autour du placement et l'angle s'ajoute au sien. (ox, oy) est le point du repère du site autour duquel pivote le placement (le milieu de l'emprise).
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:391
---@param rec table|nil Enregistrement du manifeste (avec pools).
---@param px number X monde du placement.
---@param py number Y monde du placement.
---@param pz number Z monde de base.
---@param yaw number|nil Cap en radians (0 par défaut).
---@param ox number|nil X du point pivot dans le repère du site (0 par défaut).
---@param oy number|nil Y du point pivot dans le repère du site (0 par défaut).
---@return table|nil  Enregistrement monde, avec ct et sn (cosinus et sinus du cap) ; nil si rec invalide.
function editor_toolUtilities_siteWater.place(rec, px, py, pz, yaw, ox, oy) end

--- Supprime tout ce qui est mouillé sous un dossier : objets des classes WaterBlock, River et ParticleEmitterNode.
---Source : lua/ge/extensions/editor/toolUtilities/siteWater.lua:293
---@param folder userdata|nil Dossier de scène ; sans effet si nil.
function editor_toolUtilities_siteWater.remove(folder) end

