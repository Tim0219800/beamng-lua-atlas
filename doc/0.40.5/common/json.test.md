# `json_test`

*Fichier : `lua/common/json.test.lua` · VM : Commun (GE + véhicule) · 223 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("json.test")`

Tests unitaires du module json de BeamNG (require('json')). Chaque fonction testXxx(ctx) reçoit un contexte de test avec assertEqual(a, b, message) et assertNear(a, b, tolérance, message) ; elles vérifient le décodage JSON/SJSON (commentaires, virgules facultatives, nombres, Infinity, échappements, affectations de niveau supérieur sans accolades, entrée depuis string.buffer), les erreurs sur entrées invalides, et l'aller-retour encode/decode (dont vec3 et quat). Utile à un moddeur pour savoir ce que le parseur accepte.

## Remarques

- Ce sont des tests : ils ne servent pas en jeu normal ; le lanceur de tests (non lu ici) appelle chaque fonction avec ctx.
- Le parseur accepte les virgules manquantes, les commentaires // et /* */ mais pas les commentaires imbriqués ni un '/' isolé.
- json.decode(nil) renvoie nil ; json.decode(123) (non-chaîne) et un JSON invalide lèvent une erreur (vérifiée par pcall).
- Les vec3 et quat encodés en JSON sont décodés comme tables avec champs x, y, z (et w pour quat).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `json_test.testJsonDecodeArrayString(ctx)` | Décode un tableau JSON simple. *(interne)* | 28 |
| `json_test.testJsonDecodeComments(ctx)` | Teste la gestion des commentaires dans les objets et les tableaux. *(interne)* | 85 |
| `json_test.testJsonDecodeEscapes(ctx)` | Teste le décodage des séquences d'échappement des chaînes. *(interne)* | 103 |
| `json_test.testJsonDecodeFromBuffer(ctx)` | Teste le décodage depuis une instance string.buffer. *(interne)* | 37 |
| `json_test.testJsonDecodeInfinityTokens(ctx)` | Teste les graphies d'Infinity acceptées par le parseur SJSON. *(interne)* | 121 |
| `json_test.testJsonDecodeInvalidInputType(ctx)` | Vérifie que json.decode(123) lève une erreur. *(interne)* | 194 |
| `json_test.testJsonDecodeInvalidNumberTokens(ctx)` | Vérifie le rejet de nombres/Infinity mal formés. *(interne)* | 129 |
| `json_test.testJsonDecodeInvalidString(ctx)` | Vérifie qu'un texte invalide (« {bad ») lève une erreur. *(interne)* | 186 |
| `json_test.testJsonDecodeMalformedCases(ctx)` | Liste de cas mal formés (« : » manquant, fermeture manquante, chaîne non terminée, tokens true/false/null invalides, exposant invalide, commentaires imbriqués) qui doivent tous échouer. *(interne)* | 202 |
| `json_test.testJsonDecodeMissingCommasAccepted(ctx)` | Vérifie que le parseur tolère les virgules omises. *(interne)* | 65 |
| `json_test.testJsonDecodeNil(ctx)` | Vérifie que json.decode(nil) renvoie nil. *(interne)* | 14 |
| `json_test.testJsonDecodeNumbers(ctx)` | Teste les variantes de nombres acceptées. *(interne)* | 112 |
| `json_test.testJsonDecodeObjectString(ctx)` | Décode un objet JSON simple et vérifie les champs. *(interne)* | 19 |
| `json_test.testJsonDecodeSjsonFeatures(ctx)` | Teste les fonctionnalités de type SJSON attendues par le parseur BeamNG. *(interne)* | 47 |
| `json_test.testJsonDecodeTopLevelAssignments(ctx)` | Vérifie le format clé/valeur de niveau supérieur sans accolades. *(interne)* | 76 |
| `json_test.testJsonEncodeDecodeRoundtrip(ctx)` | Aller-retour encode/decode d'une structure imbriquée (nombre, chaîne, booléen, tableau, objet). *(interne)* | 167 |
| `json_test.testJsonEncodeDecodeVec3Quat(ctx)` | Vérifie que vec3 et quat survivent à encode puis decode (tables x,y,z[,w], tolérance 1e-6). *(interne)* | 145 |

### Détail des paramètres

#### `json_test.testJsonDecodeArrayString(ctx)`

Décode un tableau JSON simple.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeComments(ctx)`

Teste la gestion des commentaires dans les objets et les tableaux.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeEscapes(ctx)`

Teste le décodage des séquences d'échappement des chaînes.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeFromBuffer(ctx)`

Teste le décodage depuis une instance string.buffer.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeInfinityTokens(ctx)`

Teste les graphies d'Infinity acceptées par le parseur SJSON.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeInvalidInputType(ctx)`

Vérifie que json.decode(123) lève une erreur.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeInvalidNumberTokens(ctx)`

Vérifie le rejet de nombres/Infinity mal formés.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeInvalidString(ctx)`

Vérifie qu'un texte invalide (« {bad ») lève une erreur.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeMalformedCases(ctx)`

Liste de cas mal formés (« : » manquant, fermeture manquante, chaîne non terminée, tokens true/false/null invalides, exposant invalide, commentaires imbriqués) qui doivent tous échouer.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeMissingCommasAccepted(ctx)`

Vérifie que le parseur tolère les virgules omises.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeNil(ctx)`

Vérifie que json.decode(nil) renvoie nil.

- `ctx` (*table*) : Contexte de test (assertEqual, assertNear).

#### `json_test.testJsonDecodeNumbers(ctx)`

Teste les variantes de nombres acceptées.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeObjectString(ctx)`

Décode un objet JSON simple et vérifie les champs.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeSjsonFeatures(ctx)`

Teste les fonctionnalités de type SJSON attendues par le parseur BeamNG.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonDecodeTopLevelAssignments(ctx)`

Vérifie le format clé/valeur de niveau supérieur sans accolades.

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonEncodeDecodeRoundtrip(ctx)`

Aller-retour encode/decode d'une structure imbriquée (nombre, chaîne, booléen, tableau, objet).

- `ctx` (*table*) : Contexte de test.

#### `json_test.testJsonEncodeDecodeVec3Quat(ctx)`

Vérifie que vec3 et quat survivent à encode puis decode (tables x,y,z[,w], tolérance 1e-6).

- `ctx` (*table*) : Contexte de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/json.test.lua`.*
