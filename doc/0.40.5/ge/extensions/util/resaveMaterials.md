# `util_resaveMaterials`

*Fichier : `lua/ge/extensions/util/resaveMaterials.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_resaveMaterials` : `extensions.load("util_resaveMaterials")`, puis la globale `util_resaveMaterials`

Outil de migration pour les développeurs : charge d'anciens fichiers de matériaux TorqueScript (materials.cs), puis les resauvegarde au nouveau format (JSON) via un PersistenceManager, en supprimant ensuite les objets chargés. Le traitement démarre dès le chargement de l'extension, dans un job asynchrone.

## Exemple

```lua
extensions.load('util_resaveMaterials')
```

## Remarques

- Au chargement, l'extension modifie les réglages IngameConsoleLogBlacklist et WinConsoleLogBlacklist (valeur "DA") pour réduire le bruit de la console ; ils ne sont pas restaurés.
- Le motif de recherche de fichiers est 'materials.cs\tmanaged*Data.csNOP' : le second motif (« .csNOP ») ne correspond à rien, donc seuls les fichiers materials.cs sont traités.
- Les fichiers materials.cs sont exécutés avec TorqueScriptLua.exec puis réécrits sur disque (saveDirtyNewFormat) : opération destructive à n'utiliser que sur une copie des données.
- L'appel shutdown(0) final est commenté : le jeu ne quitte pas automatiquement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_resaveMaterials.onExtensionLoaded()` | Appelé au chargement de l'extension : désactive des catégories de logs console et crée le job work (yield toutes les secondes). *(interne)* *(hook)* | 62 |
| `util_resaveMaterials.work(job)` | Corps du job : pour chaque materials.cs trouvé, exécute le script, repère les objets créés à partir de ce fichier, les marque modifiés, les sauvegarde au nouveau format puis les supprime. Logue DONE à la fin. | 25 |

### Détail des paramètres

#### `util_resaveMaterials.work(job)`

Corps du job : pour chaque materials.cs trouvé, exécute le script, repère les objets créés à partir de ce fichier, les marque modifiés, les sauvegarde au nouveau format puis les supprime. Logue DONE à la fin.

- `job` (*table*) : Objet job du core_jobsystem (non utilisé directement)

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `TorqueScriptLua.` `exec`
- `obj:` `delete`, `getClassName`, `getName`
- `scenetree.` `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/resaveMaterials.lua`.*
