---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/generalSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de réglages « general » de la fenêtre de réglages multiseat. Il déclare les champs : même véhicule pour tous, rassembler les véhicules, replacer tous les joueurs, couleur automatique, marqueurs de joueurs et disposition de l'écran partagé pour 2 à 9+ joueurs ; puis il gère leurs actions, changements, validation et application via les hooks onXxxMultiseatGameSetting(s).
--- Accès : extension `ui_multiseat_generalSettings` : `extensions.load("ui_multiseat_generalSettings")`, puis la globale `ui_multiseat_generalSettings`
---@class ui_multiseat_generalSettings
ui_multiseat_generalSettings = {}

--- Enregistre couleur automatique et dispositions, rafraîchit render_splitScreen, rassemble les véhicules (gatherVehicles) et replace les joueurs (reseatAllPlayers) si demandé, puis remet ces deux champs à zéro via result.valueOverrides.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:201
---@param stagedSettings table Réglages préparés par fournisseur.
---@param _activeSettings table Réglages actifs (non utilisé).
---@param result table Table de résultat (valueOverrides).
function ui_multiseat_generalSettings.onApplyMultiseatGameSettings(stagedSettings, _activeSettings, result) end

--- Ajoute à providers le fournisseur « general » (placement afterVehicles, applyMode apply) avec tous ses champs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:107
---@param providers table[] Liste de fournisseurs de réglages à compléter.
function ui_multiseat_generalSettings.onGetMultiseatGameSettings(providers) end

--- Gère l'action du champ sameVehicleForEveryone : « selector » ouvre le sélecteur de véhicule pour tous les joueurs, sinon le véhicule choisi est préparé pour tous. Le résultat est écrit dans result.success. Ignoré pour les autres fournisseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:142
---@param providerId string Identifiant du fournisseur (« general »).
---@param fieldId string Identifiant du champ.
---@param result table Table de résultat (success).
---@param value any Valeur choisie.
function ui_multiseat_generalSettings.onMultiseatGameSettingAction(providerId, fieldId, result, value) end

--- Réagit à un changement de champ : automaticColor est préparé pour tous les joueurs ; showPlayerMarkers est appliqué immédiatement (core_multiseat.setPlayerMarkersEnabled, sinon réglage multiseatTags).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:153
---@param providerId string Identifiant du fournisseur.
---@param fieldId string Identifiant du champ.
---@param value any Nouvelle valeur.
function ui_multiseat_generalSettings.onMultiseatGameSettingChanged(providerId, fieldId, value) end

--- Valide les réglages préparés : présence du fournisseur, booléens showPlayerMarkers et automaticColor, dispositions valides pour chaque nombre de joueurs. Écrit result.success = false et result.reason en cas d'erreur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:166
---@param stagedSettings table Réglages préparés par fournisseur.
---@param _activeSettings table Réglages actifs (non utilisé).
---@param result table Table de résultat (success, reason).
function ui_multiseat_generalSettings.onValidateMultiseatGameSettings(stagedSettings, _activeSettings, result) end

