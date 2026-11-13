---@meta
-- tim19Atlas stub generated from lua/vehicle/sounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sons du véhicule autres que le moteur : bruits de roulement et de dérapage des pneus (selon le matériau du sol : asphalte, terre, gravier, herbe, glace…), projections de gravillons (kickup), impacts et casses de carrosserie, frottements (scrapes), grincements de suspension par poutre (soundFile dans le jbeam), vent, sons de soundscape, banque de sons .sbeam pilotée par electrics, filtre d'habitacle. Fournit aussi les fonctions utilitaires pour créer et jouer des sources FMOD depuis un contrôleur ou un moteur (createSoundObj, playSoundOnceAtNode…) ainsi que les conversions Hz <-> échelle FMOD.
--- Accès : globale `sounds`
---@class sounds
---@field engineNode integer Noeud d'émission des sons moteur : premier torqueReactionNodes du premier moteur, sinon le noeud ref. La déclaration initiale vaut nil, puis init() lui donne 0 ou un cid.
---@field objType integer Type d'objet audio courant : 0 joueur assis, 1 IA seule, 2 trafic ; -1 force une mise à jour.
---@field refNode integer Noeud de référence du véhicule (refNodes[0].ref ou leftCorner), 0 par défaut. Déclaré nil au départ, défini par init().
---@field scrapeLoosenessMap table<integer, number> Table matériau -> 'looseness' (0..0.9) du frottement : caoutchouc 0.05, roche 0.1, gravier 0.2, herbe 0.3, feuillage 0.4, feuillage fin 0.5, terre poussiéreuse 0.6, terre 0.7, boue 0.8, sable 0.9. Métal et bois valent 0 par défaut (absents).
---@field uiDebugging boolean Vrai si le rapport de debug audio vers l'UI est activé (setUIDebug).
---@field usesOldCustomSounds boolean Vrai si le véhicule a ses propres fichiers .sbeam (ancien système de sons personnalisés).
sounds = {}

--- Conversion inverse de hzToFMODHz : valeur FMOD 0..1000 vers Hz.
---Source : lua/vehicle/sounds.lua:1329
---@param fmodHzValue number Valeur sur l'échelle FMOD (bornée à 0..1000).
---@return number  Fréquence en Hz.
function sounds.FMODHzToHz(fmodHzValue) end

--- Gère le son de frottement (scrape) d'un noeud de carrosserie lors d'un contact : choisit l'événement selon le matériau (métal ou plastique), l'ignore sur les matériaux absorbants (caoutchouc, tissu, sable et boue pour les noeuds de roue) et règle volume, pitch, color et texture de la source.
---Source : lua/vehicle/sounds.lua:1045
---@param p table Données de collision du moteur (id1, slipVel, normalForce, materialID1, materialID2).
function sounds.bodyCollision(p) end

--- Crée une source audio brute (obj:createSFXSource) sans enveloppe soundObj. En cas d'échec, désactive playSoundOnceAtNode/FollowNode et logge un avertissement.
---Source : lua/vehicle/sounds.lua:195
---@param filename string Fichier ou événement.
---@param description string Descripteur audio.
---@param SFXProfileName string Nom du profil SFX.
---@param nodeID integer Noeud d'attache.
---@return any|nil  Identifiant de la source ou nil si échec.
function sounds.createSFXSource(filename, description, SFXProfileName, nodeID) end

--- Crée une source audio FMOD (obj:createSFXSource) et la retourne enveloppée dans un soundObj, avec cache des dernières valeurs pour éviter les appels inutiles. Si la création échoue, renvoie un objet factice dont setVolumePitch ne fait rien.
---Source : lua/vehicle/sounds.lua:209
---@param filename string Fichier ou événement FMOD (ex. 'event:>Surfaces>roll_rigid_v2').
---@param description string Nom du descripteur audio (ex. 'AudioDefaultLoop3D').
---@param SFXProfileName string Nom du profil SFX (peut être vide pour un événement FMOD).
---@param nodeID integer Noeud sur lequel la source est attachée.
---@return table  soundObj (méthodes setVolumePitch, setParameter) ou objet factice.
function sounds.createSoundObj(filename, description, SFXProfileName, nodeID) end

--- Crée la source d'un son de soundscape défini dans v.data.soundscape. Utilise le noeud du soundscape s'il est numérique, sinon refNode.
---Source : lua/vehicle/sounds.lua:104
---@param name string Nom du soundscape dans le jbeam.
---@return any|nil  Source audio, ou nil si le soundscape n'existe pas.
function sounds.createSoundscapeSound(name) end

--- Vide la banque de sons .sbeam et empêche son rechargement : appelé par les moteurs qui utilisent le nouveau système de sons moteur.
---Source : lua/vehicle/sounds.lua:1308
function sounds.disableOldEngineSounds() end

--- Debug : renvoie la liste des sons de suspension par poutre (avec impulse, pitch, volume du dernier frame).
---Source : lua/vehicle/sounds.lua:1404
---@return table  Liste de tables {beam, clip, volumeFactor, pitchFactor, impulse, pitch, volume…}.
function sounds.getBeamSounds() end

--- Debug (éditeur de sons) : parcourt les moteurs ayant getSoundConfiguration et renvoie leurs configurations sonores.
---Source : lua/vehicle/sounds.lua:1408
---@return table  Table indexée à partir de 0 : {reference, data, fundamentalFrequencyRPMCoef, engineIndex}.
---@return table  Liste de libellés 'nom (moteur) -> fichier blend'.
function sounds.getEngineSoundData() end

--- Convertit une fréquence réelle en Hz (bornée à 20..22000) vers l'échelle FMOD 0..1000 (interpolation par segments de 100). Code dupliqué en C++ (trueforceDSP.cpp).
---Source : lua/vehicle/sounds.lua:1315
---@param hzValue number Fréquence en Hz.
---@return number  Valeur sur l'échelle FMOD (0..1000).
function sounds.hzToFMODHz(hzValue) end

--- Réinitialise toutes les sources audio du véhicule (deleteSFXSources), charge les banques .sbeam, crée les sons de suspension par poutre, les sons de scrape, les sons de pneus et lit la section jbeam 'sounds'. Appelée au chargement du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/sounds.lua:1075
function sounds.init() end

--- Hook de désérialisation après rechargement du Lua véhicule : remet objType à -1 (tout M est sérialisé et restauré).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/sounds.lua:1304
function sounds.onDeserialized() end

--- Joue un son une seule fois à la position (statique) d'un noeud. Ignoré si le volume est < 0.01 ou le pitch < 0.0039.
---Source : lua/vehicle/sounds.lua:162
---@param soundName string Événement FMOD.
---@param nodeID integer Noeud d'émission.
---@param volume number Volume 0..1.
---@param pitch number|nil Pitch normalisé (1 par défaut).
---@param color number|nil Paramètre 'color' (0 par défaut).
---@param texture number|nil Paramètre 'texture' (0 par défaut).
function sounds.playSoundOnceAtNode(soundName, nodeID, volume, pitch, color, texture) end

--- Comme playSoundOnceAtNode mais le son suit le noeud pendant sa lecture.
---Source : lua/vehicle/sounds.lua:169
---@param soundName string Événement FMOD.
---@param nodeID integer Noeud suivi.
---@param volume number Volume 0..1.
---@param pitch number|nil Pitch (1 par défaut).
---@param color number|nil Paramètre 'color' (0 par défaut).
---@param texture number|nil Paramètre 'texture' (0 par défaut).
function sounds.playSoundOnceFollowNode(soundName, nodeID, volume, pitch, color, texture) end

--- Rejoue une source existante (volume puis cut + play), sauf si aucun joueur n'est assis et que l'IA conduit (le son est alors sauté).
---Source : lua/vehicle/sounds.lua:150
---@param sound any Source audio obtenue par createSFXSource (déduit du code).
---@param volume number|nil Volume (1 par défaut).
function sounds.playSoundSkipAI(sound, volume) end

--- Remet à zéro les sons de vent et de suspension, renvoie les paramètres statiques des pneus (le cache du GE est vidé à chaque reset) et met à jour c_objType. Appelée au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/sounds.lua:1341
function sounds.reset() end

--- Active ou désactive le rapport de debug audio vers l'UI (coûteux en performance, à réserver au debug). Le paramètre data n'est pas utilisé.
---Source : lua/vehicle/sounds.lua:1299
---@param enabled boolean Activer le rapport.
---@param data any Non utilisé (todo dans le code).
function sounds.setUIDebug(enabled, data) end

--- Envoie au jeu (GE) la force du filtre d'habitacle de ce véhicule (cabinFilterCoef borné à 0..1) via core_sounds.setCabinFilterStrength.
---Source : lua/vehicle/sounds.lua:1069
function sounds.updateCabinFilter() end

--- Boucle principale des sons (chaque frame graphique) : détection d'impacts/casses toutes les 0,04 s (obj:getImpactDeformEnergyNode), banque .sbeam, sons de suspension, vent (au-dessus de 3 m/s de vitesse relative au vent) et sons de roulement/dérapage/kickup de chaque roue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/sounds.lua:219
---@param dt number Pas de temps de la frame (s).
function sounds.updateGFX(dt) end

--- Détermine le type d'objet audio (0 joueur assis, 1 IA, 2 trafic) et, s'il a changé, renvoie le paramètre c_objType à tous les sons de pneus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/sounds.lua:1380
function sounds.updateObjType() end

--- Enveloppe d'une source audio renvoyée par createSoundObj. Champs : obj (source brute), lastVol, lastPitch, lastColor, lastTexture.
---@class sounds_soundObj
local sounds_soundObj = {}

--- Règle un paramètre FMOD nommé (obj:setSFXparameter). Pour usage basse fréquence uniquement. La page automatique liste seulement 'value' mais la fonction prend (keyName, value).
---Source : lua/vehicle/sounds.lua:146
---@param keyName string Nom du paramètre FMOD (ex. 'c_objType').
---@param value number Valeur du paramètre.
function sounds_soundObj:setParameter(keyName, value) end

--- Règle volume, pitch, color et texture (RTPC) de la source en évitant les appels redondants (volume < 0.01 devient 0).
---Source : lua/vehicle/sounds.lua:122
---@param vol number Volume 0..1.
---@param pitch number Pitch normalisé.
---@param color number|nil Paramètre color (0 par défaut).
---@param texture number|nil Paramètre texture (0 par défaut).
---@return boolean  true si une valeur a été envoyée au moteur audio, false si ignorée.
function sounds_soundObj:setVolumePitch(vol, pitch, color, texture) end

