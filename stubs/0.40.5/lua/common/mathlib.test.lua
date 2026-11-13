---@meta
-- tim19Atlas stub generated from lua/common/mathlib.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de mathlib (vec3, quat, helpers scalaires, courbes, géométrie, StackVec3/push3), à exécuter avec testFramework/TestManager. Contient aussi des tests de performance en boucle et des tests « sans garbage » qui vérifient que les opérations en place n'allouent pas de mémoire. Lancement : `require('testFramework/TestManager'):runTestFiles('mathlib')` dans la console GE. Utile à un moddeur comme catalogue d'exemples d'utilisation des fonctions mathlib.
--- Accès : `require("mathlib.test")`
---@class mathlib_test
local mathlib_test = {}

--- Teste les helpers d'interpolation de courbes (familles spline, Catmull-Rom, Bézier).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:455
---@param ctx table Contexte de test.
function mathlib_test.testMathlibCurves(ctx) end

--- Teste les helpers scalaires génériques : signe, clamp, interpolation, médianes, bornes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:399
---@param ctx table Contexte de test.
function mathlib_test.testMathlibGeneric(ctx) end

--- Teste les familles de helpers de chevauchement, d'inclusion et d'intersection géométriques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:472
---@param ctx table Contexte de test.
function mathlib_test.testMathlibGeom(ctx) end

--- Teste StackVec3 (push3) : parité avec les opérations vec3 de base.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:271
---@param ctx table Contexte de test.
function mathlib_test.testMathlibPush3(ctx) end

--- Teste la construction de quaternions, l'algèbre, l'interpolation et les conversions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:298
---@param ctx table Contexte de test.
function mathlib_test.testMathlibQuat(ctx) end

--- Teste le comportement sur NaN, infini et division par zéro dans les helpers mathématiques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:505
---@param ctx table Contexte de test.
function mathlib_test.testMathlibSpecialValuesAndOddities(ctx) end

--- Teste les constructeurs de vec3, l'arithmétique de base, la normalisation et les helpers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:33
---@param ctx table Contexte de test (TestManager).
function mathlib_test.testMathlibVec3Core(ctx) end

--- Teste les méthodes géométriques de vec3 : distances, coordonnées barycentriques, projection, base orthonormée, mutateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:122
---@param ctx table Contexte de test.
function mathlib_test.testMathlibVec3Geom(ctx) end

--- Teste les générateurs de bruit/aléatoire de vec3 et les helpers d'axes et de lignes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:230
---@param ctx table Contexte de test.
function mathlib_test.testMathlibVec3NoiseAndHelpers(ctx) end

--- Vérifie que les opérations de quaternion en place (setMul2, setInvMul2, setMulInv2, normalize) n'allouent rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:712
---@param ctx table Contexte de test.
function mathlib_test.testNoGarbageQuatInPlace(ctx) end

--- Vérifie que la boucle de helpers scalaires (sign, clamp, lerp, smoothstep, biasFun…) n'alloue rien (budget 512 octets, checkGarbage(0)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:662
---@param ctx table Contexte de test.
function mathlib_test.testNoGarbageScalarMathHelpers(ctx) end

--- Vérifie que clamp, lerp, inverseLerp et smoothstep appelés une seule fois n'allouent aucune mémoire (budget 0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:734
---@param ctx table Contexte de test.
function mathlib_test.testNoGarbageScalarSingleShot(ctx) end

--- Vérifie que les opérations vec3 en place (setAdd2, setSub, setScaled, setComponentMul, setLerp, setCross) n'allouent rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:687
---@param ctx table Contexte de test.
function mathlib_test.testNoGarbageVec3InPlace(ctx) end

--- Benchmark : requêtes géométriques représentatives en boucle serrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:636
---@param ctx table Contexte de test.
function mathlib_test.testPerfGeometryBatch(ctx) end

--- Benchmark : opérations de quaternions sur 10000 itérations.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:591
---@param ctx table Contexte de test.
function mathlib_test.testPerfQuatBatch(ctx) end

--- Benchmark : helpers mathématiques scalaires en boucle serrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:617
---@param ctx table Contexte de test.
function mathlib_test.testPerfScalarBatch(ctx) end

--- Benchmark : arithmétique vec3 (dot, length, cross, normalized, somme) sur 10000 itérations.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/mathlib.test.lua:567
---@param ctx table Contexte de test.
function mathlib_test.testPerfVec3Batch(ctx) end

return mathlib_test
