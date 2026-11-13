---@meta
-- tim19Atlas stub generated from lua/vehicle/backwardsCompatibility.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Convertit à l'initialisation les anciennes données de véhicule (v.data) vers le format actuel : ancienne chaîne de transmission (engine/differentials) vers un powertrain, ESC codé en dur (escConfig) vers un contrôleur 'esc', et détection heuristique des remorques pour limiter les niveaux d'allumage. Un moddeur n'a pas à l'appeler : il sert aux vieux véhicules/mods dont le jbeam n'a pas été migré. Il modifie v.data en place.
--- Accès : globale `backwardsCompatibility`
---@class backwardsCompatibility
backwardsCompatibility = {}

--- Applique toutes les conversions de rétrocompatibilité sur v.data (ESC, drivetrain, états d'allumage des remorques). Appelée par le chargement du véhicule avant l'initialisation des systèmes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/backwardsCompatibility.lua:393
function backwardsCompatibility.init() end

