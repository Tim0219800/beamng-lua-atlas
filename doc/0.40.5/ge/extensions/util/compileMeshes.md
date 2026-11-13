# `util_compileMeshes`

*Fichier : `lua/ge/extensions/util/compileMeshes.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_compileMeshes` : `extensions.load("util_compileMeshes")`, puis la globale `util_compileMeshes`

Outil de build hors-ligne : compile les maillages .dae (Collada) en .cdae (chargement plus rapide) pour les dossiers art/, assets/, vehicles/, levels/, content/ et /core/art/. Chaque sous-dossier est traité isolément (matériaux et objets temporaires dans ObjectsTempGroup). Un cache dans collada_cache/ (clé = SHA1 du .dae) évite de recompiler. À la fin, le jeu s'arrête avec un code de sortie (0 = tout compilé, 1 = fichiers manqués). Il se lance dès le chargement de l'extension.

## Remarques

- Les .cdae existants sont réutilisés : les supprimer avant pour repartir de zéro.
- Arguments de ligne de commande reconnus : -compileMeshesNoCache (désactive collada_cache), -compileMeshesCustomPaths "a/;b/" (remplace la liste de dossiers, séparés par ;), -compileMeshesScanPathBaseDirs (traite aussi les fichiers à la racine de chaque dossier de base), -compileMeshesNoCompileOnlyCheck (ne compile pas : vérifie seulement que les .cdae existent), -compileMeshesNoCheck (saute la vérification finale des fichiers manqués).
- Chemins ignorés pour la vérification finale : débutant par /DevTools/ ou /projects/.
- Écrit cdae_compilation_hardlink_todo.json : liste de paires {nomCache.cdae, destination} à lier en dur après compilation.
- Un fichier .dae vide est considéré comme déjà couvert en mode -compileMeshesNoCompileOnlyCheck.
- Bug mineur : le bilan final divise par (cacheHits + cacheMisses) ; sans cache (-compileMeshesNoCache) ce total est nul et le pourcentage affiché n'est pas défini (division par zéro en nombre flottant).
- L'extension s'exécute dans un job (core_jobsystem.create(work, 1)) qui cède la main à chaque fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_compileMeshes.onExtensionLoaded()` | Hook de chargement : crée le job work (core_jobsystem.create(work, 1)). *(interne)* *(hook)* | 238 |
| `util_compileMeshes.work(job)` | Boucle principale de compilation, exécutée comme job : trouve tous les .dae, compile ou récupère depuis le cache, écrit la liste des liens en dur, vérifie les fichiers manqués, puis appelle shutdown(code). *(interne)* | 51 |

### Détail des paramètres

#### `util_compileMeshes.work(job)`

Boucle principale de compilation, exécutée comme job : trouve tous les .dae, compile ou récupère depuis le cache, écrit la liste des liens en dur, vérifie les fichiers manqués, puis appelle shutdown(code).

- `job` (*table*) : Job de core_jobsystem (job.yield est appelé à chaque fichier).

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`, `requestShutdown`
- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `fileExists`, `fileSize`, `findFiles`, `hashFileSHA1`
- `TorqueScriptLua.` `exec`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/compileMeshes.lua`.*
