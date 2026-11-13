---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/careerSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-fenêtre de configuration carrière.
---@class editor_missionEditor_careerSetup
local editor_missionEditor_careerSetup = {}

--- Dessine une petite liste déroulante « ... » des clés d'attribut possibles.
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:71
---@return string|nil  Clé choisie pendant cette image, sinon nil.
function editor_missionEditor_careerSetup:attributeDropdown() end

--- Point d'entrée de dessin : appelle drawCareerSetup.
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:240
function editor_missionEditor_careerSetup:draw() end

--- Dessine la zone d'ajout d'une récompense (champ clé, bouton +, liste de choix) et les boutons copier et coller de la liste de récompenses.
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:119
---@param key string Clé de la liste de récompenses.
---@param rewards table Liste de récompenses à compléter.
function editor_missionEditor_careerSetup:drawAddReward(key, rewards) end

--- Dessine le champ texte de la clé d'attribut d'une récompense avec la liste de choix ; met à jour re.attributeKey et marque la mission _dirty.
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:91
---@param re table Entrée de récompense (attributeKey, rewardAmount).
---@param idx integer Indice de la récompense (sert à nommer le tampon).
---@param key string Clé de la liste de récompenses.
function editor_missionEditor_careerSetup:drawAttributeInput(re, idx, key) end

--- Dessine le tableau principal : cases Freeroam et Career, liste Skill et Entry Fee ; chaque modification écrit dans mission.careerSetup et marque _dirty.
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:197
function editor_missionEditor_careerSetup:drawCareerSetup() end

--- Dessine l'édition des frais d'inscription de la mission (une ligne par frais avec un bouton « Rem » pour le retirer).
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:168
function editor_missionEditor_careerSetup:drawEntryFee() end

--- Dessine le champ entier du montant de récompense ; écrit re.rewardAmount et re._originalRewardAmount et marque la mission _dirty.
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:108
---@param re table Entrée de récompense.
---@param idx integer Indice de la récompense.
---@param key string Clé de la liste de récompenses.
function editor_missionEditor_careerSetup:drawRewardAmount(re, idx, key) end

--- Appelle setMission puis renvoie la liste des problèmes (toujours vide).
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:44
---@param m table Données de mission.
---@return table[]  Liste vide.
function editor_missionEditor_careerSetup:getMissionIssues(m) end

--- Constructeur : charge career_branches et construit les listes d'attributs (attributeOptions) et de compétences (skillOptions, triée, avec « (none) »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:20
---@param missionEditor table Module editor_missionEditor.
function editor_missionEditor_careerSetup:init(missionEditor) end

--- Sélectionne la mission : lit careerSetup (showInCareer, showInFreeroam), récupère les clés d'étoiles, vide les tampons et relie l'assistant d'édition du type de mission au conteneur « mission ».
---Source : lua/ge/extensions/editor/missionEditor/careerSetup.lua:50
---@param mission table Données de mission.
function editor_missionEditor_careerSetup:setMission(mission) end

