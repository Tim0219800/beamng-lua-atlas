# `utils_simpleProfiler_report`

*Fichier : `lua/common/utils/simpleProfiler/report.lua` · VM : Commun (GE + véhicule) · 285 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/simpleProfiler/report")`

Génère un rapport de profilage à partir du journal du 'simpleProfiler' du moteur (global simpleProfilerGetJournal) : une page HTML interactive (diagramme en barres/flammes, via un gabarit mustache) et un résumé Markdown 'AI summary' à côté. Accessible comme extension : extensions.utils_simpleProfiler_report.createReport('vehicle_spawn'). Un moddeur s'en sert pour analyser où le temps passe (ex. chargement d'un véhicule).

## Exemple

```lua
extensions.utils_simpleProfiler_report.createReport('vehicle_spawn', 'Spawn du pickup', {vehicleName = 'pickup', durationFilterSec = 0.001, topN = 20})
```

## Remarques

- Écrit deux fichiers : <filebasename>.html et <filebasename>.summary.md (via writeFile, donc relatifs au répertoire de travail ou chemin donné).
- Le gabarit lu est 'lua/common/utils/simpleProfiler/interactiveBarChart.mustache.html' ; s'il est introuvable une erreur est loguée et rien n'est écrit.
- Si simpleProfilerGetJournal n'existe pas (profiler non disponible), une erreur est loguée et la fonction retourne sans rien faire.
- Le commentaire en tête du fichier donne l'appel : extensions.utils_simpleProfiler_report.createReport('vehicle_spawn.html') ; attention, l'extension ajoute elle-même '.html' : passer 'vehicle_spawn.html' produirait 'vehicle_spawn.html.html' (déduit du code).
- Champs lus de meta : durationFilterSec (secondes, filtre de durée minimale des événements), vehicleName, topN (30 par défaut), jbeamCached, meshCacheSummary {percentLoaded, totalFiles, loadedFiles, filesAlreadyInCache, totalMeshes, loadedMeshes}. meta est modifiée (durationFilterSec y est écrit) et attachée à root.meta.
- Le résumé Markdown agrège par nom exact d'évènement : durée totale (inclusive), durée propre (selfDuration = totale moins enfants directs), nombre d'appels, maxima ; tableaux top N par self, total, appels, pics, et section I/O (noms commençant par readFile/readFiles).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_simpleProfiler_report.createReport(filebasename, reportTitle, meta)` | Récupère le journal du profiler (simpleProfilerGetJournal(true, filtre)), produit la page HTML via lustache et le résumé Markdown, puis loggue les chemins créés. | 241 |

### Détail des paramètres

#### `utils_simpleProfiler_report.createReport(filebasename, reportTitle, meta)`

Récupère le journal du profiler (simpleProfilerGetJournal(true, filtre)), produit la page HTML via lustache et le résumé Markdown, puis loggue les chemins créés.

- `filebasename` (*string|nil*) : Nom de base des fichiers de sortie (sans extension), 'profilerReport' par défaut
- `reportTitle` (*string|nil*) : Titre du rapport, 'Profiler Summary' par défaut
- `meta` (*table|nil*) : Métadonnées optionnelles (voir notes)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/simpleProfiler/report.lua`.*
