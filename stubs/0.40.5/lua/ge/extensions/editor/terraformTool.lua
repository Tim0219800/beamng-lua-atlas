---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraformTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Façade de l'outil Terraform de l'éditeur de monde. Elle stocke cinq réglages (domaine d'influence, marge, falloff, rugosité, échelle de bruit) comme préférences de l'éditeur, gère le polygone dessiné par l'utilisateur et déclenche le terraformage du terrain (editor/terraform/terraform) à partir de sources récupérées par editor/terraform/fetchSources (routes, etc.) dans un polygone ou dans la sélection. Un moddeur l'utilise pour terraformer par script ou pour lire/modifier les réglages.
--- Accès : extension `editor_terraformTool` : `extensions.load("editor_terraformTool")`, puis la globale `editor_terraformTool`
---@class editor_terraformTool
editor_terraformTool = {}

--- Efface le polygone courant.
---Source : lua/ge/extensions/editor/terraformTool.lua:49
function editor_terraformTool.clearPolygon() end

--- Renvoie le domaine d'influence (en mètres) du terraformage, lu dans la préférence terraformTool.general.domainOfInfluence (défaut 100).
---Source : lua/ge/extensions/editor/terraformTool.lua:29
---@return number  Domaine d'influence en mètres.
function editor_terraformTool.getDOI() end

--- Renvoie la distance de décroissance (falloff, en mètres), préférence terraformTool.general.falloff (défaut 1.5).
---Source : lua/ge/extensions/editor/terraformTool.lua:31
---@return number  Falloff en mètres.
function editor_terraformTool.getFalloff() end

--- Renvoie la marge latérale (en mètres) autour des sources, préférence terraformTool.general.margin (défaut 5.0).
---Source : lua/ge/extensions/editor/terraformTool.lua:30
---@return number  Marge en mètres.
function editor_terraformTool.getMargin() end

--- Renvoie le polygone courant (délègue à editor/toolUtilities/polygon).
---Source : lua/ge/extensions/editor/terraformTool.lua:43
---@return table  Polygone courant (structure définie par le module polygon).
function editor_terraformTool.getPolygon() end

--- Renvoie la rugosité du bruit, préférence terraformTool.general.roughness (défaut 0.4, plage [0, 1]).
---Source : lua/ge/extensions/editor/terraformTool.lua:32
---@return number  Rugosité.
function editor_terraformTool.getRoughness() end

--- Renvoie l'échelle du bruit, préférence terraformTool.general.scale (défaut 0.5, plage [0, 1]).
---Source : lua/ge/extensions/editor/terraformTool.lua:33
---@return number  Échelle du bruit.
function editor_terraformTool.getScale() end

--- À appeler à chaque frame de l'UI : gère le dessin du polygone par l'utilisateur et lance terraformPolygon quand il valide.
---Source : lua/ge/extensions/editor/terraformTool.lua:58
function editor_terraformTool.handleTerraformingPolygon() end

--- Indique si un polygone valide existe (poly.isPolygonValid).
---Source : lua/ge/extensions/editor/terraformTool.lua:46
---@return boolean  true si le polygone est valide.
function editor_terraformTool.isPolygonExist() end

--- Hook de l'éditeur : enregistre la catégorie de préférences terraformTool et sa sous-catégorie general (domainOfInfluence en int, margin, falloff, roughness, scale en float) avec leurs bornes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terraformTool.lua:67
---@param prefs table Registre de préférences de l'éditeur.
function editor_terraformTool.onEditorRegisterPreferences(prefs) end

--- Enregistre le domaine d'influence dans les préférences de l'éditeur.
---Source : lua/ge/extensions/editor/terraformTool.lua:36
---@param value number Domaine d'influence en mètres.
function editor_terraformTool.setDOI(value) end

--- Enregistre la distance de décroissance dans les préférences de l'éditeur.
---Source : lua/ge/extensions/editor/terraformTool.lua:38
---@param value number Falloff en mètres.
function editor_terraformTool.setFalloff(value) end

--- Enregistre la marge latérale dans les préférences de l'éditeur.
---Source : lua/ge/extensions/editor/terraformTool.lua:37
---@param value number Marge en mètres.
function editor_terraformTool.setMargin(value) end

--- Enregistre la rugosité du bruit dans les préférences de l'éditeur.
---Source : lua/ge/extensions/editor/terraformTool.lua:39
---@param value number Rugosité dans [0, 1].
function editor_terraformTool.setRoughness(value) end

--- Enregistre l'échelle du bruit dans les préférences de l'éditeur.
---Source : lua/ge/extensions/editor/terraformTool.lua:40
---@param value number Échelle dans [0, 1].
function editor_terraformTool.setScale(value) end

--- Récupère toutes les sources supportées dans le polygone (fetchSources.getAllSourcesInPolygon) puis appelle terraformToSources avec les réglages courants (DOI, marge, falloff, rugosité, échelle).
---Source : lua/ge/extensions/editor/terraformTool.lua:52
---@param polygon table Polygone dans lequel chercher les sources (déduit du code).
function editor_terraformTool.terraformPolygon(polygon) end

--- Récupère les objets supportés de la sélection de l'éditeur (fetchSources.getAllSourcesInSelection) et terraforme le terrain autour d'eux avec les réglages courants.
---Source : lua/ge/extensions/editor/terraformTool.lua:61
function editor_terraformTool.terraformSelection() end

