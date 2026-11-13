---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/styleValidator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vérifie la cohérence interne d'un style de compositeur de notes de rallye (fichier sous compositors/styles/). Il contrôle la table distance (callsEnabled, liens avec seuils croissants, unités base/large/point, arrondis, max), les composants componentTypes (corner avec numbering/intensité/longueurs/direction, caution, modifiers, modifierAliases) et les notes système via notebook/systemPacenotes. Il n'impose aucun schéma commun entre styles : chaque style peut définir ses propres types. Chaque erreur est journalisée (log 'E', tag styleValidator) et la validation s'arrête à la première erreur.
--- Accès : extension `gameplay_rally_compositors_helpers_styleValidator` : `extensions.load("gameplay_rally_compositors_helpers_styleValidator")`, puis la globale `gameplay_rally_compositors_helpers_styleValidator`
---@class gameplay_rally_compositors_helpers_styleValidator
gameplay_rally_compositors_helpers_styleValidator = {}

--- Valide un style. Appelé par textCompositor:load après application des calibrages ; en cas d'échec le style n'est pas chargé.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/styleValidator.lua:495
---@param style table Table du style (distance, componentTypes, system...).
---@param name string|nil Nom du style pour les messages d'erreur ('?' par défaut).
---@return boolean  true si le style est valide.
function gameplay_rally_compositors_helpers_styleValidator.validate(style, name) end

