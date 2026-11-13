---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/ropeVisualTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bac à sable de développement pour les cordes visuelles (rope visuals) du moteur : une interface ImGui permet de créer, cloner et régler des cordes (ancres A et B, directions, nombre de noeuds, diamètre, amortissement, rigidité de flexion, XPBD, collisions, limite d'étirement, module de Young, masse, gravité, vent, matériau), d'animer les ancres, de déplacer les noeuds à la souris et de mesurer les temps de simulation et de rendu. Il n'est pas destiné au gameplay : il sert à tester le système de cordes (fonctions globales createRopeVisual, getAllRopeVisuals, getRopeVisual).
--- Accès : extension `core_ropeVisualTest` : `extensions.load("core_ropeVisualTest")`, puis la globale `core_ropeVisualTest`
---@class core_ropeVisualTest
core_ropeVisualTest = {}

--- Hook appelé après rechargement : restaure l'état de l'interface depuis serializedData.uiState, remet à 0 le décalage de clonage, puis reprend les cordes déjà existantes dans le moteur (positions de base, réglages de debug désactivés) et sélectionne la première.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/ropeVisualTest.lua:2013
---@param serializedData {uiState: table}|nil Table produite par onSerialize.
function core_ropeVisualTest.onDeserialized(serializedData) end

--- Hook de déchargement : réinitialise les positions de base, les réglages de debug, le décalage de clonage et les statistiques de performance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/ropeVisualTest.lua:700
function core_ropeVisualTest.onExtensionUnloaded() end

--- Hook appelé avant un rechargement des extensions Lua : renvoie {uiState = ...} avec tout l'état de l'interface (ancres, directions, propriétés de corde, toggles, physique, rendu, animation, debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/ropeVisualTest.lua:617
---@return {uiState: table}  État de l'interface à restaurer.
function core_ropeVisualTest.onSerialize() end

--- Hook de mise à jour par image : met à jour les statistiques de performance, le temps d'animation, les positions de base de la corde sélectionnée, applique les animations d'ancre à toutes les cordes, gère l'interaction avec les noeuds et dessine l'interface ImGui et les aides de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/ropeVisualTest.lua:979
---@param dt number Durée de l'image en secondes.
function core_ropeVisualTest.onUpdate(dt) end

