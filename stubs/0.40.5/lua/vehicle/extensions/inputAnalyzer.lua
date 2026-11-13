---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/inputAnalyzer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecteur de 'codes' à la manette/clavier : à 30 Hz il observe les entrées (accélérateur, frein, direction gauche/droite, embrayage, frein à main), construit une chaîne des 16 dernières pressions et appelle un callback quand la fin de la chaîne correspond à une séquence enregistrée (8 à 16 caractères). Sert à des easter eggs.
--- Accès : extension `inputAnalyzer` : `extensions.load (VM véhicule)("inputAnalyzer")`, puis la globale `inputAnalyzer`
---@class inputAnalyzer
inputAnalyzer = {}

--- Hook d'initialisation ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/inputAnalyzer.lua:136
function inputAnalyzer.onInit() end

--- Hook de reset ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/inputAnalyzer.lua:133
function inputAnalyzer.onReset() end

--- Enregistre une séquence à détecter et le callback appelé avec la chaîne courante quand elle est saisie.
---Source : lua/vehicle/extensions/inputAnalyzer.lua:91
---@param str string Séquence de 8 à 16 lettres parmi u, d, l, r, a, b.
---@param callback function function(inputString).
function inputAnalyzer.registerInputString(str, callback) end

--- Retire une séquence enregistrée (même chaîne et même callback) ; active/désactive updateGFX selon qu'il reste des séquences.
---Source : lua/vehicle/extensions/inputAnalyzer.lua:115
---@param string string Séquence enregistrée.
---@param callback function Callback enregistré.
function inputAnalyzer.unregisterInputString(string, callback) end

--- Appelé chaque frame : exécute l'analyse des entrées à 30 Hz (nop quand aucun code n'est enregistré après un (un)register).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/inputAnalyzer.lua:83
---@param dt number Pas de temps en secondes.
function inputAnalyzer.updateGFX(dt) end

