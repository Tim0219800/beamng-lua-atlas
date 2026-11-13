---@meta
-- tim19Atlas stub generated from lua/common/json.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires du module json de BeamNG (require('json')). Chaque fonction testXxx(ctx) reçoit un contexte de test avec assertEqual(a, b, message) et assertNear(a, b, tolérance, message) ; elles vérifient le décodage JSON/SJSON (commentaires, virgules facultatives, nombres, Infinity, échappements, affectations de niveau supérieur sans accolades, entrée depuis string.buffer), les erreurs sur entrées invalides, et l'aller-retour encode/decode (dont vec3 et quat). Utile à un moddeur pour savoir ce que le parseur accepte.
--- Accès : `require("json.test")`
---@class json_test
local json_test = {}

--- Décode un tableau JSON simple.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:28
---@param ctx table Contexte de test.
function json_test.testJsonDecodeArrayString(ctx) end

--- Teste la gestion des commentaires dans les objets et les tableaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:85
---@param ctx table Contexte de test.
function json_test.testJsonDecodeComments(ctx) end

--- Teste le décodage des séquences d'échappement des chaînes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:103
---@param ctx table Contexte de test.
function json_test.testJsonDecodeEscapes(ctx) end

--- Teste le décodage depuis une instance string.buffer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:37
---@param ctx table Contexte de test.
function json_test.testJsonDecodeFromBuffer(ctx) end

--- Teste les graphies d'Infinity acceptées par le parseur SJSON.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:121
---@param ctx table Contexte de test.
function json_test.testJsonDecodeInfinityTokens(ctx) end

--- Vérifie que json.decode(123) lève une erreur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:194
---@param ctx table Contexte de test.
function json_test.testJsonDecodeInvalidInputType(ctx) end

--- Vérifie le rejet de nombres/Infinity mal formés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:129
---@param ctx table Contexte de test.
function json_test.testJsonDecodeInvalidNumberTokens(ctx) end

--- Vérifie qu'un texte invalide (« {bad ») lève une erreur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:186
---@param ctx table Contexte de test.
function json_test.testJsonDecodeInvalidString(ctx) end

--- Liste de cas mal formés (« : » manquant, fermeture manquante, chaîne non terminée, tokens true/false/null invalides, exposant invalide, commentaires imbriqués) qui doivent tous échouer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:202
---@param ctx table Contexte de test.
function json_test.testJsonDecodeMalformedCases(ctx) end

--- Vérifie que le parseur tolère les virgules omises.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:65
---@param ctx table Contexte de test.
function json_test.testJsonDecodeMissingCommasAccepted(ctx) end

--- Vérifie que json.decode(nil) renvoie nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:14
---@param ctx table Contexte de test (assertEqual, assertNear).
function json_test.testJsonDecodeNil(ctx) end

--- Teste les variantes de nombres acceptées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:112
---@param ctx table Contexte de test.
function json_test.testJsonDecodeNumbers(ctx) end

--- Décode un objet JSON simple et vérifie les champs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:19
---@param ctx table Contexte de test.
function json_test.testJsonDecodeObjectString(ctx) end

--- Teste les fonctionnalités de type SJSON attendues par le parseur BeamNG.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:47
---@param ctx table Contexte de test.
function json_test.testJsonDecodeSjsonFeatures(ctx) end

--- Vérifie le format clé/valeur de niveau supérieur sans accolades.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:76
---@param ctx table Contexte de test.
function json_test.testJsonDecodeTopLevelAssignments(ctx) end

--- Aller-retour encode/decode d'une structure imbriquée (nombre, chaîne, booléen, tableau, objet).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:167
---@param ctx table Contexte de test.
function json_test.testJsonEncodeDecodeRoundtrip(ctx) end

--- Vérifie que vec3 et quat survivent à encode puis decode (tables x,y,z[,w], tolérance 1e-6).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/json.test.lua:145
---@param ctx table Contexte de test.
function json_test.testJsonEncodeDecodeVec3Quat(ctx) end

return json_test
