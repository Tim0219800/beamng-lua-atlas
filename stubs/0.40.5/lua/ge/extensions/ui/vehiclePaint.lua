---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehiclePaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite fenêtre imgui de débogage « Metallic paint » pour régler en direct les paramètres de peinture métallique du véhicule du joueur (3 peintures : métallique, rugosité, vernis, rugosité du vernis). Elle lit et écrit le champ objet `metallicPaintData` du véhicule sous forme de chaîne de 4 nombres.
--- Accès : extension `ui_vehiclePaint` : `extensions.load("ui_vehiclePaint")`, puis la globale `ui_vehiclePaint`
---@class ui_vehiclePaint
---@field dependencies string[] ui_imgui.
ui_vehiclePaint = {}

--- Modifie une composante de metallicPaintData de la peinture 0 du véhicule du joueur 0 et réécrit le champ.
---Source : lua/ge/extensions/ui/vehiclePaint.lua:91
---@param change number Nouvelle valeur.
---@param index integer Indice (1 à 4) dans le tableau de 4 valeurs.
function ui_vehiclePaint.changeData(change, index) end

--- Hook appelé au chargement : crée le pointeur booléen de visibilité (faux) et le pointeur flottant des curseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehiclePaint.lua:82
function ui_vehiclePaint.onExtensionLoaded() end

--- Hook appelé à chaque frame : si la fenêtre est ouverte et qu'un véhicule joueur existe, dessine les curseurs des peintures 0, 1 et 2 et applique les changements via setField.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehiclePaint.lua:41
function ui_vehiclePaint.onUpdate() end

--- Ouvre la fenêtre 'Metallic paint' (la fenêtre est dessinée dans onUpdate).
---Source : lua/ge/extensions/ui/vehiclePaint.lua:78
function ui_vehiclePaint.show() end

