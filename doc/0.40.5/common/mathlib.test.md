# `mathlib_test`

*Fichier : `lua/common/mathlib.test.lua` · VM : Commun (GE + véhicule) · 750 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("mathlib.test")`

Tests unitaires de mathlib (vec3, quat, helpers scalaires, courbes, géométrie, StackVec3/push3), à exécuter avec testFramework/TestManager. Contient aussi des tests de performance en boucle et des tests « sans garbage » qui vérifient que les opérations en place n'allouent pas de mémoire. Lancement : `require('testFramework/TestManager'):runTestFiles('mathlib')` dans la console GE. Utile à un moddeur comme catalogue d'exemples d'utilisation des fonctions mathlib.

## Exemple

```lua
require('testFramework/TestManager'):runTestFiles('mathlib')
```

## Remarques

- Chaque fonction prend un contexte `ctx` fourni par TestManager et n'est pas destinée à être appelée directement.
- Constante EPS = 1e-6 pour les comparaisons de flottants ; assertVec3 compare x, y, z et assertFinite rejette NaN et ±inf.
- Les tests « Perf » font 10000 itérations ; les tests « NoGarbage » imposent un budget d'allocation (allowGarbage 0 à 1024 octets, checkGarbage(0)).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mathlib_test.testMathlibCurves(ctx)` | Teste les helpers d'interpolation de courbes (familles spline, Catmull-Rom, Bézier). *(interne)* | 455 |
| `mathlib_test.testMathlibGeneric(ctx)` | Teste les helpers scalaires génériques : signe, clamp, interpolation, médianes, bornes. *(interne)* | 399 |
| `mathlib_test.testMathlibGeom(ctx)` | Teste les familles de helpers de chevauchement, d'inclusion et d'intersection géométriques. *(interne)* | 472 |
| `mathlib_test.testMathlibPush3(ctx)` | Teste StackVec3 (push3) : parité avec les opérations vec3 de base. *(interne)* | 271 |
| `mathlib_test.testMathlibQuat(ctx)` | Teste la construction de quaternions, l'algèbre, l'interpolation et les conversions. *(interne)* | 298 |
| `mathlib_test.testMathlibSpecialValuesAndOddities(ctx)` | Teste le comportement sur NaN, infini et division par zéro dans les helpers mathématiques. *(interne)* | 505 |
| `mathlib_test.testMathlibVec3Core(ctx)` | Teste les constructeurs de vec3, l'arithmétique de base, la normalisation et les helpers. *(interne)* | 33 |
| `mathlib_test.testMathlibVec3Geom(ctx)` | Teste les méthodes géométriques de vec3 : distances, coordonnées barycentriques, projection, base orthonormée, mutateurs. *(interne)* | 122 |
| `mathlib_test.testMathlibVec3NoiseAndHelpers(ctx)` | Teste les générateurs de bruit/aléatoire de vec3 et les helpers d'axes et de lignes. *(interne)* | 230 |
| `mathlib_test.testNoGarbageQuatInPlace(ctx)` | Vérifie que les opérations de quaternion en place (setMul2, setInvMul2, setMulInv2, normalize) n'allouent rien. *(interne)* | 712 |
| `mathlib_test.testNoGarbageScalarMathHelpers(ctx)` | Vérifie que la boucle de helpers scalaires (sign, clamp, lerp, smoothstep, biasFun…) n'alloue rien (budget 512 octets, checkGarbage(0)). *(interne)* | 662 |
| `mathlib_test.testNoGarbageScalarSingleShot(ctx)` | Vérifie que clamp, lerp, inverseLerp et smoothstep appelés une seule fois n'allouent aucune mémoire (budget 0). *(interne)* | 734 |
| `mathlib_test.testNoGarbageVec3InPlace(ctx)` | Vérifie que les opérations vec3 en place (setAdd2, setSub, setScaled, setComponentMul, setLerp, setCross) n'allouent rien. *(interne)* | 687 |
| `mathlib_test.testPerfGeometryBatch(ctx)` | Benchmark : requêtes géométriques représentatives en boucle serrée. *(interne)* | 636 |
| `mathlib_test.testPerfQuatBatch(ctx)` | Benchmark : opérations de quaternions sur 10000 itérations. *(interne)* | 591 |
| `mathlib_test.testPerfScalarBatch(ctx)` | Benchmark : helpers mathématiques scalaires en boucle serrée. *(interne)* | 617 |
| `mathlib_test.testPerfVec3Batch(ctx)` | Benchmark : arithmétique vec3 (dot, length, cross, normalized, somme) sur 10000 itérations. *(interne)* | 567 |

### Détail des paramètres

#### `mathlib_test.testMathlibCurves(ctx)`

Teste les helpers d'interpolation de courbes (familles spline, Catmull-Rom, Bézier).

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testMathlibGeneric(ctx)`

Teste les helpers scalaires génériques : signe, clamp, interpolation, médianes, bornes.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testMathlibGeom(ctx)`

Teste les familles de helpers de chevauchement, d'inclusion et d'intersection géométriques.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testMathlibPush3(ctx)`

Teste StackVec3 (push3) : parité avec les opérations vec3 de base.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testMathlibQuat(ctx)`

Teste la construction de quaternions, l'algèbre, l'interpolation et les conversions.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testMathlibSpecialValuesAndOddities(ctx)`

Teste le comportement sur NaN, infini et division par zéro dans les helpers mathématiques.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testMathlibVec3Core(ctx)`

Teste les constructeurs de vec3, l'arithmétique de base, la normalisation et les helpers.

- `ctx` (*table*) : Contexte de test (TestManager).

#### `mathlib_test.testMathlibVec3Geom(ctx)`

Teste les méthodes géométriques de vec3 : distances, coordonnées barycentriques, projection, base orthonormée, mutateurs.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testMathlibVec3NoiseAndHelpers(ctx)`

Teste les générateurs de bruit/aléatoire de vec3 et les helpers d'axes et de lignes.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testNoGarbageQuatInPlace(ctx)`

Vérifie que les opérations de quaternion en place (setMul2, setInvMul2, setMulInv2, normalize) n'allouent rien.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testNoGarbageScalarMathHelpers(ctx)`

Vérifie que la boucle de helpers scalaires (sign, clamp, lerp, smoothstep, biasFun…) n'alloue rien (budget 512 octets, checkGarbage(0)).

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testNoGarbageScalarSingleShot(ctx)`

Vérifie que clamp, lerp, inverseLerp et smoothstep appelés une seule fois n'allouent aucune mémoire (budget 0).

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testNoGarbageVec3InPlace(ctx)`

Vérifie que les opérations vec3 en place (setAdd2, setSub, setScaled, setComponentMul, setLerp, setCross) n'allouent rien.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testPerfGeometryBatch(ctx)`

Benchmark : requêtes géométriques représentatives en boucle serrée.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testPerfQuatBatch(ctx)`

Benchmark : opérations de quaternions sur 10000 itérations.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testPerfScalarBatch(ctx)`

Benchmark : helpers mathématiques scalaires en boucle serrée.

- `ctx` (*table*) : Contexte de test.

#### `mathlib_test.testPerfVec3Batch(ctx)`

Benchmark : arithmétique vec3 (dot, length, cross, normalized, somme) sur 10000 itérations.

- `ctx` (*table*) : Contexte de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/mathlib.test.lua`.*
