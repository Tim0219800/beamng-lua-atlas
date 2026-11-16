# `gameplay_rally_tools_devTools`

*Fichier : `lua/ge/extensions/gameplay/rally/tools/devTools.lua` · VM : Game Engine (GE) · 1857 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/tools/devTools")` (fichier sous extensions/ mais pas une extension classique)

Panneau imgui d'outils de développement pour le rallye, destiné à l'éditeur de rallye. Il regroupe quatre sections : « Voicepack Tools » (génération d'un squelette de voicepack et export du script d'enregistrement en HTML ou TXT à partir des compositeurs de texte), « Pacenotes Tools » (détection de virages à partir de la driveline, génération de pacenotes, profil d'élévation avec export JSON), « Traffic » (zones d'exclusion de trafic, missions rallyLoop) et « Game Settings » (affiche rallyCodriverVoicepackMRU). Le module renvoie un constructeur. Les fichiers générés vont dans /temp/rally/.

## Remarques

- loadCompositors parcourt compositors/styles/*.lua, ne garde que les modules qui ressemblent à un compositeur (tables distance, componentTypes, system et fonctions composite, enumerate) et que TextCompositor peut charger ; ils sont regroupés par dossier de style.
- Fichiers produits : /temp/rally/voicepack_<style>/ (info.json, métadonnées et dossier audio vide), /temp/rally/beamng-voicepack-script_<empreinte>.html ou .txt, /temp/rally/elevation_profile_<horodatage>.json ; le dossier est ouvert dans l'explorateur (Engine.Platform.exploreFolder).
- generateVoicepackSkeleton supprime d'abord le dossier de sortie s'il existe déjà (FS:remove puis FS:directoryRemove).
- calculateCorners dépend de editor_rallyEditor (chemin courant, fenêtre des pacenotes, snaproad) : il faut que l'éditeur de rallye soit ouvert.
- Les paramètres de détection de virages (lookAheadContext, straightThreshold, mergeDistanceThreshold, maxSimplifyIterations) sont des pointeurs imgui initialisés avec PacenoteGenerator.defaultParams.
- Dans drawDrivelinePoints, la direction d'une section est comparée aux chaînes " left" et " right" avec une espace initiale (telles qu'écrites dans le code) ; une valeur sans espace serait dessinée en gris.
- onUpdate ne dessine les points d'élévation et de driveline que si pacenotesTools.sectionExpanded est vrai (champ absent de init, fixé par draw).

## Classe `C`

Objet d'outils de développement renvoyé par le constructeur.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_tools_devTools")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateCorners()` | Détecte les virages sur les points de la driveline du snaproad de l'éditeur avec PacenoteGenerator.detectCorners et les paramètres de l'interface, puis mémorise les points et le résultat. | 1286 |
| `C:clearDrivelinePoints()` | Efface les points de driveline, sections et virages mémorisés et masque leur affichage. | 1397 |
| `C:draw()` | Dessine l'interface imgui complète des quatre sections (Voicepack Tools, Pacenotes Tools, Traffic, Game Settings). | 1456 |
| `C:drawDrivelinePoints()` | Dessine les sections détectées (bleu pour gauche, rouge pour droite, gris pour droit) avec une sphère au début de chaque virage, ou à défaut la driveline brute en gris foncé. | 1352 |
| `C:drawElevationProfilePoints()` | Dessine le profil d'élévation en sphères (vert pour les points normaux, rouge pour les pathnodes de course) si l'option est activée. | 1221 |
| `C:drawGameSettings()` | Affiche en imgui la valeur du réglage rallyCodriverVoicepackMRU. | 1282 |
| `C:drawTrafficZones()` | Dessine les zones d'exclusion de trafic (sphère du rayon de la zone et petite sphère centrale) si activées. | 1407 |
| `C:enumerate()` | Raccourci qui appelle exportScriptReaderHtml. | 280 |
| `C:exportElevationProfileToJson()` | Écrit le profil d'élévation mémorisé et son résumé dans /temp/rally/elevation_profile_<horodatage>.json. | 1198 |
| `C:exportScriptReaderHtml()` | Exporte le script d'enregistrement du copilote en page HTML (/temp/rally/beamng-voicepack-script_<empreinte>.html) pour les styles cochés. | 1077 |
| `C:exportScriptReaderTxt()` | Exporte le même script en fichier texte (/temp/rally/beamng-voicepack-script_<empreinte>.txt). | 1117 |
| `C:generateVoicepackSkeleton()` | Crée un squelette de voicepack pour le compositeur sélectionné : info.json (persona, language et dialect vides, style et styleLabel), fichier de métadonnées vide et sous-dossier audio. Ouvre ensuite le dossier. | 174 |
| `C:getSelectedRallyLoopId()` | Identifiant de la mission rallyLoop sélectionnée, extrait de l'entrée « Nom (id) » de la liste. | 1435 |
| `C:init()` | Charge les compositeurs et initialise l'état des sections Pacenotes Tools (profil d'élévation, points de driveline, paramètres) et Traffic (rayon de zone 10, liste de missions rallyLoop). | 17 |
| `C:isPacenotesToolsSectionExpanded()` | Indique si la section « Pacenotes Tools » est dépliée. | 1846 |
| `C:loadCompositors()` | Recense les styles de compositeurs de texte valides, les trie, les regroupe et prépare les cases cochées et le style sélectionné pour le squelette (le premier par défaut). | 87 |
| `C:onUpdate()` | Appelé à chaque frame par l'éditeur : dessine les points d'élévation et de driveline (si la section Pacenotes Tools est dépliée) et les zones de trafic. | 1445 |
| `C:onVehicleResetted()` | Hook appelé quand le véhicule est remis en place ; corps vide (code commenté). | 1841 |
| `C:recordingCoverageEntries()` | Fusionne les entrées de script de tous les compositeurs cochés (enumerateScriptEntries), indexées par nom de fichier audio, avec la liste des styles et des contextes ; trie le résultat et numérote chaque entrée (order). | 228 |
| `C:refreshRallyLoopMissions()` | Recharge la liste des missions rallyLoop du niveau courant (précédée de « <none> ») et remet la sélection à zéro. | 1418 |
| `C:resetCornerDetectionParams()` | Remet les paramètres de détection aux valeurs de PacenoteGenerator.defaultParams. | 1342 |
| `C:selectedCompositors()` | Liste des compositeurs cochés dans l'interface. | 217 |
| `C:storeCornerDetection(detection)` | Mémorise les sections et virages détectés et loggue leur nombre. | 1319 |
| `C:storeDrivelinePoints(points)` | Copie les positions des points de la driveline et active leur affichage. | 1330 |
| `C:storeElevationProfile(elevationProfile)` | Mémorise un profil d'élévation et calcule un résumé (nombre de points, altitudes min et max, dénivelé, distance 2D, distances de début et fin, nombre de splits et de pathnodes de course). | 1152 |
| `C:voicepackSkeletonOutDir()` | Dossier de sortie du squelette de voicepack : /temp/rally/voicepack_<style avec '/' remplacés par '_'>. | 169 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryRemove`, `fileExists`, `findFiles`, `remove`
- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/tools/devTools.lua`.*
