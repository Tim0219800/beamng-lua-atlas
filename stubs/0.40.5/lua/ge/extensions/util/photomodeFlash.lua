---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/photomodeFlash.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flash de mode photo : crée un projecteur (SpotLight, avec ombres, non sauvegardé dans le niveau) collé à la caméra pendant le mode photo, orienté vers le point visé (raycast depuis la caméra, sinon distance de mise au point DOF). Deux modes : « always » (allumé en continu) et « pulse » (allumé uniquement pendant la prise de capture). En mode pulse, runCapture attend 2 frames de préchauffage, déclenche la capture via le module screenshot, puis éteint le flash à la réception de onScreenshotAllDone (ou après 60 frames de secours). L'interface du mode photo appelle applyFromUi.
--- Accès : extension `util_photomodeFlash` : `extensions.load("util_photomodeFlash")`, puis la globale `util_photomodeFlash`
---@class util_photomodeFlash
---@field capturePulseActive boolean true pendant une impulsion de flash liée à une capture
---@field enabled boolean true si le flash est actif (le projecteur existe)
---@field hue integer Teinte de la couleur en degrés, 0 à 360 (défaut 0)
---@field intensity number Intensité du projecteur (défaut 25000, de 0 à 1 000 000)
---@field mode string "always" (continu) ou "pulse" (seulement pendant une capture)
---@field outerAngle integer Angle extérieur du cône en degrés (défaut 55, de 1 à 179)
---@field saturation integer Saturation en pourcentage, 0 à 100 (défaut 0 : lumière blanche)
util_photomodeFlash = {}

--- Applique les réglages issus de l'interface du mode photo : bornage des valeurs puis activation du flash (ou désactivation si enabled n'est pas true).
---Source : lua/ge/extensions/util/photomodeFlash.lua:330
---@param enabled boolean Active le flash (désactive sinon)
---@param fireOnCapture boolean true pour le mode pulse, sinon always
---@param intensity number Intensité (0 à 1 000 000)
---@param outerAngle number Angle extérieur en degrés (1 à 179)
---@param hue number Teinte en degrés (0 à 360)
---@param saturation number Saturation en pourcentage (0 à 100)
function util_photomodeFlash.applyFromUi(enabled, fireOnCapture, intensity, outerAngle, hue, saturation) end

--- Active ou désactive le flash : à l'activation crée le SpotLight dans MissionGroup et l'oriente ; à la désactivation le supprime. Annule toute impulsion en attente.
---Source : lua/ge/extensions/util/photomodeFlash.lua:268
---@param en boolean true pour activer (toute autre valeur désactive)
function util_photomodeFlash.enable(en) end

--- Hook appelé au déchargement : désactive le flash et supprime le projecteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/photomodeFlash.lua:402
function util_photomodeFlash.onExtensionUnloaded() end

--- Hook appelé chaque frame avant le rendu : replace le projecteur sur la caméra et fait avancer la machine à états de l'impulsion (préchauffage, capture, nettoyage, délai de secours).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/photomodeFlash.lua:346
---@param dtReal number Delta de temps réel (non utilisé)
---@param dtSim number Delta de temps de simulation (non utilisé)
---@param dtRaw number Delta de temps brut (non utilisé)
function util_photomodeFlash.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook appelé quand toutes les captures d'écran en cours sont terminées : démarre le nettoyage (extinction du flash) d'une impulsion en attente. Ignoré si le mode photo n'est pas ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/photomodeFlash.lua:394
function util_photomodeFlash.onScreenshotAllDone() end

--- Déclenche une capture d'écran en tenant compte du flash : direct si le flash est inactif ou en mode always, avec impulsion de lumière en mode pulse.
---Source : lua/ge/extensions/util/photomodeFlash.lua:291
---@param kind string Type de capture (voir notes)
---@param ... any Arguments transmis à la fonction du module screenshot correspondante (jusqu'à 6 selon le type)
---@return boolean  true si la capture est lancée ou planifiée
---@return string|nil  Code d'erreur : "capture_busy" ou "screenshot_request_failed"
function util_photomodeFlash.runCapture(kind, ...) end

