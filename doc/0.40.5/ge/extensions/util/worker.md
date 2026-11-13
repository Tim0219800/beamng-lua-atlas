# `util_worker`

*Fichier : `lua/ge/extensions/util/worker.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_worker` : `extensions.load("util_worker")`, puis la globale `util_worker`

Exécuteur de tâches hors ligne : lit un fichier JSON `/work.json` contenant une liste d'éléments de travail ({type=..., ...}) et les exécute un par un (compilation de maillages .dae en .cdae, compilation d'imposteurs, rendu d'aperçus de véhicules, test de mods, mesures de performances, calibrage de l'ESC), puis quitte le jeu avec `shutdown(0)` quand plus aucun job n'est en cours. Prévu pour des lancements automatisés (ligne de commande), pas pour le jeu normal.

## Exemple

```lua
-- ligne de commande du jeu : -lua extensions.load('util_worker') -console -nouserpath
```

## Remarques

- Le travail ne démarre qu'après 120 images de rendu (compteur frame dans onPreRender).
- Types de tâche reconnus : compileMesh, testImage, compileImposters, testMod, renderVehiclePreview, testVehiclesPerformances, calibrateESC. Un type inconnu ou absent est journalisé en erreur.
- L'extension se met en déchargement manuel (setExtensionUnloadMode(M, 'manual')).
- Bug : dans loadWork, si /work.json est illisible, workItems vaut nil et `#workItems` provoque ensuite une erreur Lua.
- Le fichier contient aussi des fonctions locales (loadMaterialsInPath, compileDae) non exportées : compileDae appelle compileCollada puis Engine.Render.updateImposters(false).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_worker.onExtensionLoaded()` | Passe l'extension en déchargement manuel, charge les extensions test/renderVehiclePreview, util/saveDynamicData, util/calibrateESC et util/compileImposters, puis lit le fichier de tâches. *(interne)* *(hook)* | 115 |
| `util_worker.onJobDone(job, totalRunning)` | Hook appelé quand un job du système de jobs se termine : si les tâches ont déjà été mises en file et qu'il ne reste plus aucun job, quitte le jeu (shutdown(0)). *(interne)* *(hook)* | 97 |
| `util_worker.onPreRender(dt)` | Après 120 images, exécute tous les éléments de travail via la table N, puis, quand core_jobsystem n'a plus de job en cours, arrête le jeu. *(interne)* *(hook)* | 126 |

### Détail des paramètres

#### `util_worker.onJobDone(job, totalRunning)`

Hook appelé quand un job du système de jobs se termine : si les tâches ont déjà été mises en file et qu'il ne reste plus aucun job, quitte le jeu (shutdown(0)).

- `job` (*any*) : job terminé (non utilisé)
- `totalRunning` (*integer*) : nombre de jobs encore en cours

#### `util_worker.onPreRender(dt)`

Après 120 images, exécute tous les éléments de travail via la table N, puis, quand core_jobsystem n'a plus de job en cours, arrête le jeu.

- `dt` (*number*) : temps écoulé (non utilisé)

## Classe `N`

Table des gestionnaires de tâches, indexée par le champ `type` d'un élément de work.json. Chaque méthode reçoit l'élément `w` (table JSON).

| Méthode | Description | Ligne |
|---|---|---|
| `N.calibrateESC(w)` | Lance util_calibrateESC.work(w.pcFile, w.vehicle) pour calibrer l'ESC. | 91 |
| `N.compileImposters(w)` | Met en file la compilation des imposteurs des niveaux w.levels via util_compileImposters. | 70 |
| `N.compileMesh(w)` | Charge les matériaux du dossier de w.filename, puis compile ce fichier .dae en .cdae (avec un fichier *meshes.json). Erreur si w.filename est absent. | 50 |
| `N.renderVehiclePreview(w)` | Affiche w.vehicles dans le journal puis lance test_renderVehiclePreview.renderVehiclePreview. | 80 |
| `N.testImage(w)` | Vérifie que w.filename existe ; le test réel n'est pas implémenté (TODO dans le code). | 60 |
| `N.testMod(w)` | Appelle extensions.test_testMods.work avec w.tagid, w.resource_version_id et w.disableSpinScr. | 76 |
| `N.testVehiclesPerformances(w)` | Lance util_saveDynamicData.work(w.pcFile, w.vehicle) pour mesurer les performances des véhicules. | 85 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `TorqueScriptLua.` `exec`

**Charge les extensions :** `test/renderVehiclePreview`, `util/calibrateESC`, `util/compileImposters`, `util/saveDynamicData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/worker.lua`.*
