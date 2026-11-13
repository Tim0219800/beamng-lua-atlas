---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/objectives.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du panneau Objectives. Champs : missionEditor, mission, missionInstance (gameplay_missions_missions.getMissionById), careerSetup, attributeOptions, skillOptions, copiedStars (presse-papiers par type de mission), starKeysSorted.
---@class editor_missionEditor_objectives
local editor_missionEditor_objectives = {}

--- Petit combo « ... » listant attributeOptions.
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:171
---@return string|nil  Clé d'attribut choisie ce frame, sinon nil.
function editor_missionEditor_objectives:attributeDropdown() end

--- Dessine l'en-tête « Career Setup » (case Raw, copier/coller de la configuration par type de mission) puis drawCareerSetup ou l'éditeur JSON brut de mission.careerSetup.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:505
function editor_missionEditor_objectives:draw() end

--- Contrôles d'ajout d'une récompense (texte, combo, +) et boutons copier/coller des récompenses.
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:219
---@param key string Clé de l'étoile.
---@param rewards table[]|nil Liste de récompenses actuelle.
---@return table[]|nil  Nouvelle liste si elle a changé, sinon nil.
function editor_missionEditor_objectives:drawAddReward(key, rewards) end

--- Champ texte + combo pour l'attributeKey d'une récompense ; met à jour re.attributeKey.
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:191
---@param re table Récompense {attributeKey, rewardAmount}.
---@param idx integer Indice de la récompense.
---@param key string Clé de l'étoile.
function editor_missionEditor_objectives:drawAttributeInput(re, idx, key) end

--- Dessine toute la configuration : liste des étoiles avec cases à cocher, emplacement, éditeur du type, récompenses, textes de fin, puis résumé (étoiles par défaut, bonus, totaux de récompenses).
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:371
function editor_missionEditor_objectives:drawCareerSetup() end

--- Combo pour choisir quelle étoile active occupe l'emplacement d'étoile par défaut donné. Non appelée dans ce fichier.
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:148
---@param defaultIndex integer Numéro d'emplacement (1 à 3).
function editor_missionEditor_objectives:drawDefaultStar(defaultIndex) end

--- Ligne d'édition du texte de fin d'une étoile (ou « noStarUnlocked »), avec icônes d'état de la traduction par défaut et de la traduction actuelle.
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:328
---@param key string Clé de l'étoile ou « noStarUnlocked ».
function editor_missionEditor_objectives:drawOutroText(key) end

--- Champ entier pour rewardAmount ; mémorise aussi _originalRewardAmount.
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:208
---@param re table Récompense.
---@param idx integer Indice de la récompense.
---@param key string Clé de l'étoile.
function editor_missionEditor_objectives:drawRewardAmount(re, idx, key) end

--- Affiche et édite la liste des récompenses d'une étoile (suppression par bouton « Rem », ajout).
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:268
---@param key string Clé de l'étoile.
function editor_missionEditor_objectives:drawStarRewards(key) end

--- Appelle setMission(m) puis renvoie les problèmes d'étoiles, de textes et de récompenses de la mission.
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:46
---@param m table Mission à vérifier.
---@return table[]  Liste d'éléments {label, severity}.
function editor_missionEditor_objectives:getMissionIssues(m) end

--- Renvoie le libellé traduit (_tr) de l'étoile, en gérant les libellés sous forme de fonction, de chaîne ou de table {txt}.
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:133
---@param key string Clé de l'étoile.
---@return string  Libellé traduit, ou chaîne vide.
function editor_missionEditor_objectives:getStarLabel(key) end

--- Constructeur : charge career_branches et construit les listes attributeOptions et skillOptions (branches avec isSkill).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:20
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_objectives:init(missionEditor) end

--- Définit la mission courante, récupère son instance de jeu, les clés d'étoiles triées et l'éditeur du type de mission (setContainer(mission, 'mission')).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:113
---@param mission table Mission éditée.
function editor_missionEditor_objectives:setMission(mission) end

--- Combo pour placer l'étoile en « Bonus Star » ou en « Default Star N ».
---Source : lua/ge/extensions/editor/missionEditor/objectives.lua:300
---@param key string Clé de l'étoile.
function editor_missionEditor_objectives:starSlotSelector(key) end

