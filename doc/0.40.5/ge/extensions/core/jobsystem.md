# `core_jobsystem`

*Fichier : `lua/ge/extensions/core/jobsystem.lua` · VM : Game Engine (GE) · 204 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_jobsystem` : `extensions.load("core_jobsystem")`, puis la globale `core_jobsystem`

Extension GE `core_jobsystem` : mini ordonnanceur de tâches coopératives basé sur des coroutines Lua. Un moddeur y met un traitement long (scan de fichiers, calcul lourd) pour l'étaler sur plusieurs images au lieu de bloquer le jeu. La fonction du job reçoit un objet `job` avec `job.yield()` (rend la main si le budget de temps est dépassé) et `job.sleep(secondes)` (pause sans bloquer le jeu). Toutes les coroutines sont reprises une fois par image dans onUpdate.

## Exemple

```lua
local function work(job, path)
  for i = 1, 10000 do
    -- ... traitement ...
    job.yield()          -- rend la main si le budget maxdt est dépassé
  end
  job.sleep(3)           -- attend 3 s en laissant le jeu tourner
end
core_jobsystem.create(work, 1, 'some/path')   -- maxdt = 1 s : bien pour du fond

-- variante qui ne lance pas deux fois la même fonction en parallèle
local check = core_jobsystem.wrap(work, 0.5)
check('some/path')
```

## Remarques

- Unité de maxdt : l'en-tête du fichier et le code (dt = hp:stop()/1000 comparé à maxdt, défaut 0.01) indiquent des SECONDES ; le commentaire de create() dit 'milliseconds', ce qui est faux/trompeur. Défaut 0.01 s.
- job.yield() ne s'interrompt que si maxdt s'est écoulé depuis le dernier yield effectif ; sinon il ne fait rien. Il ne peut pas interrompre un code qui ne l'appelle pas : insérer des yield dans les boucles longues.
- job.yield et job.sleep ne font rien hors coroutine (coroutine.running() == nil).
- Les arguments passés à create sont donnés à la fonction à la première reprise : fct(job, ...). Sans argument, fct(job, dtTable) reçoit une table partagée {dtReal, dtSim, dtRaw} en second paramètre (mise à jour à chaque image : lire les champs, ne pas la conserver).
- Une erreur dans un job est loguée ('job error') et le job meurt si la coroutine est terminée ; elle n'arrête pas les autres jobs.
- Bug probable : dans onUpdate, extensions.hook('onJobDone', coroutines[ci], #coroutines) est appelé APRÈS table.remove(coroutines, ci), donc le premier argument est l'entrée qui a pris la place du job terminé (ou nil si c'était le dernier), pas le job fini. De plus, plusieurs terminaisons dans une même image utilisent des indices mémorisés puis supprimés en ordre inverse, ce qui reste correct pour la suppression.
- La variable locale disableBackgroundTasks vaut false et n'est jamais modifiée dans ce fichier : la branche 'exécution en avant-plan' de create() est inatteignable depuis l'extérieur.
- wrap() ne renvoie pas le job et empêche seulement de relancer la même fonction tant qu'elle tourne (clé = la fonction elle-même).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_jobsystem.cancelJob(jobHandle)` | Retire un job de la liste pour qu'il ne soit plus repris. N'appelle pas son exit callback ni onJobDone ; la coroutine est abandonnée. | 146 |
| `core_jobsystem.create(fct, maxdt, ...)` | Crée et enregistre un job (coroutine) exécuté par morceaux à chaque image. La fonction est appelée avec (job, ...). | 43 |
| `core_jobsystem.findFilesAsync(rootPath, pattern, yieldFn)` | Cherche des fichiers sous un dossier : correspondances directes à la racine, puis recherche récursive native par sous-dossier de premier niveau, avec un appel à yieldFn après chacun. À appeler depuis un job en passant job.yield. | 161 |
| `core_jobsystem.getRunningJobCount()` | Nombre de jobs actuellement en cours. | 140 |
| `core_jobsystem.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image (appelé avec les dt du jeu) : reprend chaque coroutine, loggue les erreurs, supprime les jobs terminés, appelle leur exitCallback puis émet onJobDone. *(interne)* *(hook)* | 102 |
| `core_jobsystem.wrap(fct, maxdt)` | Renvoie une fonction qui lance fct comme job, sauf si une instance de fct tourne déjà (dans ce cas l'appel est ignoré). | 89 |

### Détail des paramètres

#### `core_jobsystem.cancelJob(jobHandle)`

Retire un job de la liste pour qu'il ne soit plus repris. N'appelle pas son exit callback ni onJobDone ; la coroutine est abandonnée.

- `jobHandle` (*table*) : Objet renvoyé par create.
- **renvoie** : boolean true si le job a été trouvé et retiré.

#### `core_jobsystem.create(fct, maxdt, ...)`

Crée et enregistre un job (coroutine) exécuté par morceaux à chaque image. La fonction est appelée avec (job, ...).

- `fct` (*function*) : Fonction de travail, fct(job, ...).
- `maxdt` (*number|nil*) : Budget de temps en secondes entre deux yield effectifs ; défaut 0.01.
- `...` (*any*) : Arguments passés à fct après job.
- **renvoie** : table Objet job : {yield(), sleep(secs), setExitCallback(fn), running, fct, maxdt}. exitcbl est appelé avec le job à sa fin.

#### `core_jobsystem.findFilesAsync(rootPath, pattern, yieldFn)`

Cherche des fichiers sous un dossier : correspondances directes à la racine, puis recherche récursive native par sous-dossier de premier niveau, avec un appel à yieldFn après chacun. À appeler depuis un job en passant job.yield.

- `rootPath` (*string*) : Dossier racine.
- `pattern` (*string*) : Motif de fichier (ex. '*.json').
- `yieldFn` (*function|nil*) : Appelée avec un texte de debug après chaque sous-dossier ; défaut nop.
- **renvoie** : string[] Chemins trouvés.

#### `core_jobsystem.getRunningJobCount()`

Nombre de jobs actuellement en cours.

- **renvoie** : integer Nombre de jobs.

#### `core_jobsystem.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image (appelé avec les dt du jeu) : reprend chaque coroutine, loggue les erreurs, supprime les jobs terminés, appelle leur exitCallback puis émet onJobDone.

- `dtReal` (*number*) : Delta temps réel en secondes.
- `dtSim` (*number*) : Delta temps de simulation en secondes.
- `dtRaw` (*number*) : Delta temps brut en secondes.

#### `core_jobsystem.wrap(fct, maxdt)`

Renvoie une fonction qui lance fct comme job, sauf si une instance de fct tourne déjà (dans ce cas l'appel est ignoré).

- `fct` (*function*) : Fonction de travail du job.
- `maxdt` (*number|nil*) : Budget en secondes, comme pour create.
- **renvoie** : function function(...) qui crée le job ; ne renvoie rien.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onJobDone` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/jobsystem.lua`.*
