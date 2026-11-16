# `gameplay_rally_notebook_test_testNotebook`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/test/testNotebook.lua` · VM : Game Engine (GE) · 401 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_notebook_test_testNotebook` : `extensions.load("gameplay_rally_notebook_test_testNotebook")`, puis la globale `gameplay_rally_notebook_test_testNotebook`

Tests manuels du carnet de notes de rallye (notebook), à lancer depuis la console Lua du jeu. testAll() enchaîne dix tests avec une assertion maison (assertEqual : journalise 'I' si OK, log 'E' puis error() au premier échec) puis affiche les compteurs total/passed/failed. Les tests couvrent la migration du stockage structuré (schémas v1, v2, v3 vers six emplacements), la suppression des champs hérités (arcDegrees, intensity, direction, lengthFeel…), la projection de mesures vivantes (structuredForProjection) et l'ordre distance/modificateurs de compositorUtil.compositePhraseEntries.

## Exemple

```lua
extensions.unload('gameplay_rally_notebook_test_testNotebook') extensions.load('gameplay_rally_notebook_test_testNotebook') gameplay_rally_notebook_test_testNotebook.testAll()
```

## Remarques

- Le commentaire d'en-tête du fichier cite le nom d'extension 'gameplay_notebook_test_testNotebook', qui ne correspond pas au nom réel dérivé du chemin (gameplay_rally_notebook_test_testNotebook) : la commande du commentaire ne fonctionnerait pas telle quelle.
- Deux tests lisent /gameplay/missions/driver_training/rallyStage/aip-test3/rally/notebooks/test_v3_1.notebook.json et écrivent test_v3_1_out.notebook.json (notebook:save()) : ces fichiers de mission doivent exister.
- Le premier assertEqual en échec interrompt testAll via error() ; dump(assertCounts) n'est alors pas atteint.
- Fichier de test, pas destiné aux moddeurs ; sert surtout d'exemples du comportement attendu de Structured et Pacenote.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_notebook_test_testNotebook.testAll()` | Exécute tous les tests (structured : désérialisation, sérialisation, migration, lengthMode, v1 -> emplacements fixes, aller-retour v3, v2 avec emplacements vides, slotItem ; projection de mesure d'un Pacenote factice ; ordre distance/modificateurs du compositeur) et affiche les compteurs avec dump(). | 384 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/test/testNotebook.lua`.*
