# `unittests`

*Fichier : `lua/console/unittests.lua` · VM : Console · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("unittests")`

Tests unitaires de la console pour le type vec3 de mathlib : exactitude (constructeur, tostring, opérateurs + - * / et unaire, égalité) et performance (100001 itérations des quatre opérations). Les deux tests sont lancés à l'import.

## Remarques

- Le test de précision attend que vec3(0,133007.133,-1) s'affiche « (0, 133007.141, -1) », ce qui montre une perte de précision flottante à grande valeur.
- test_vec3_performance utilise les globales a et b laissées par test_vec3_function ; il journalise un avertissement si la durée dépasse 850 ms.
- Les assertions lèvent une erreur Lua si un test échoue.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `test_vec3_function()` | Vérifie par assert les constructeurs, l'affichage (tostring) et les opérateurs de vec3. | 19 |
| `test_vec3_performance()` | Chronomètre 100001 boucles d'addition, soustraction, multiplication et division de vec3 et loggue un avertissement (niveau D) au-delà de 850 ms. | 47 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/unittests.lua`.*
