---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/tools/devTools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet d'outils de développement renvoyé par le constructeur.
---@class gameplay_rally_tools_devTools
local gameplay_rally_tools_devTools = {}

--- Détecte les virages sur les points de la driveline du snaproad de l'éditeur avec PacenoteGenerator.detectCorners et les paramètres de l'interface, puis mémorise les points et le résultat.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1286
function gameplay_rally_tools_devTools:calculateCorners() end

--- Efface les points de driveline, sections et virages mémorisés et masque leur affichage.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1397
function gameplay_rally_tools_devTools:clearDrivelinePoints() end

--- Dessine l'interface imgui complète des quatre sections (Voicepack Tools, Pacenotes Tools, Traffic, Game Settings).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1456
function gameplay_rally_tools_devTools:draw() end

--- Dessine les sections détectées (bleu pour gauche, rouge pour droite, gris pour droit) avec une sphère au début de chaque virage, ou à défaut la driveline brute en gris foncé.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1352
function gameplay_rally_tools_devTools:drawDrivelinePoints() end

--- Dessine le profil d'élévation en sphères (vert pour les points normaux, rouge pour les pathnodes de course) si l'option est activée.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1221
function gameplay_rally_tools_devTools:drawElevationProfilePoints() end

--- Affiche en imgui la valeur du réglage rallyCodriverVoicepackMRU.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1282
function gameplay_rally_tools_devTools:drawGameSettings() end

--- Dessine les zones d'exclusion de trafic (sphère du rayon de la zone et petite sphère centrale) si activées.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1407
function gameplay_rally_tools_devTools:drawTrafficZones() end

--- Raccourci qui appelle exportScriptReaderHtml.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:280
function gameplay_rally_tools_devTools:enumerate() end

--- Écrit le profil d'élévation mémorisé et son résumé dans /temp/rally/elevation_profile_<horodatage>.json.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1198
function gameplay_rally_tools_devTools:exportElevationProfileToJson() end

--- Exporte le script d'enregistrement du copilote en page HTML (/temp/rally/beamng-voicepack-script_<empreinte>.html) pour les styles cochés.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1077
function gameplay_rally_tools_devTools:exportScriptReaderHtml() end

--- Exporte le même script en fichier texte (/temp/rally/beamng-voicepack-script_<empreinte>.txt).
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1117
function gameplay_rally_tools_devTools:exportScriptReaderTxt() end

--- Crée un squelette de voicepack pour le compositeur sélectionné : info.json (persona, language et dialect vides, style et styleLabel), fichier de métadonnées vide et sous-dossier audio. Ouvre ensuite le dossier.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:174
function gameplay_rally_tools_devTools:generateVoicepackSkeleton() end

--- Identifiant de la mission rallyLoop sélectionnée, extrait de l'entrée « Nom (id) » de la liste.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1435
---@return string|nil  Id de mission, nil si « <none> »
function gameplay_rally_tools_devTools:getSelectedRallyLoopId() end

--- Charge les compositeurs et initialise l'état des sections Pacenotes Tools (profil d'élévation, points de driveline, paramètres) et Traffic (rayon de zone 10, liste de missions rallyLoop).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:17
function gameplay_rally_tools_devTools:init() end

--- Indique si la section « Pacenotes Tools » est dépliée.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1846
---@return boolean  true si dépliée
function gameplay_rally_tools_devTools:isPacenotesToolsSectionExpanded() end

--- Recense les styles de compositeurs de texte valides, les trie, les regroupe et prépare les cases cochées et le style sélectionné pour le squelette (le premier par défaut).
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:87
function gameplay_rally_tools_devTools:loadCompositors() end

--- Appelé à chaque frame par l'éditeur : dessine les points d'élévation et de driveline (si la section Pacenotes Tools est dépliée) et les zones de trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1445
function gameplay_rally_tools_devTools:onUpdate() end

--- Hook appelé quand le véhicule est remis en place ; corps vide (code commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1841
function gameplay_rally_tools_devTools:onVehicleResetted() end

--- Fusionne les entrées de script de tous les compositeurs cochés (enumerateScriptEntries), indexées par nom de fichier audio, avec la liste des styles et des contextes ; trie le résultat et numérote chaque entrée (order).
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:228
---@return table[]  Entrées triées
---@return string[]  Styles sélectionnés
function gameplay_rally_tools_devTools:recordingCoverageEntries() end

--- Recharge la liste des missions rallyLoop du niveau courant (précédée de « <none> ») et remet la sélection à zéro.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1418
function gameplay_rally_tools_devTools:refreshRallyLoopMissions() end

--- Remet les paramètres de détection aux valeurs de PacenoteGenerator.defaultParams.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1342
function gameplay_rally_tools_devTools:resetCornerDetectionParams() end

--- Liste des compositeurs cochés dans l'interface.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:217
---@return string[]  Noms de styles
function gameplay_rally_tools_devTools:selectedCompositors() end

--- Mémorise les sections et virages détectés et loggue leur nombre.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1319
---@param detection table|nil {sections, corners}
function gameplay_rally_tools_devTools:storeCornerDetection(detection) end

--- Copie les positions des points de la driveline et active leur affichage.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1330
---@param points table[]|nil Points avec champ pos
function gameplay_rally_tools_devTools:storeDrivelinePoints(points) end

--- Mémorise un profil d'élévation et calcule un résumé (nombre de points, altitudes min et max, dénivelé, distance 2D, distances de début et fin, nombre de splits et de pathnodes de course).
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:1152
---@param elevationProfile table[]|nil Points {x, y, z, distFromStart, splitLabel, isRacePathnode}
function gameplay_rally_tools_devTools:storeElevationProfile(elevationProfile) end

--- Dossier de sortie du squelette de voicepack : /temp/rally/voicepack_<style avec '/' remplacés par '_'>.
---Source : lua/ge/extensions/gameplay/rally/tools/devTools.lua:169
---@return string  Chemin, ou chaîne vide si aucun style n'est sélectionné
function gameplay_rally_tools_devTools:voicepackSkeletonOutDir() end

