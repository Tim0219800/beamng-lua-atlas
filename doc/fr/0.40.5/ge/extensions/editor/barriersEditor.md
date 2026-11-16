# `editor_barriersEditor`

*Fichier : `lua/ge/extensions/editor/barriersEditor.lua` · VM : Game Engine (GE) · 316 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_barriersEditor` : `extensions.load("editor_barriersEditor")`, puis la globale `editor_barriersEditor`

Fenêtre « Barriers Selector » (menu Gameplay > Barriers Editor) pour choisir les prefabs de barrières d'un niveau. Elle cherche dans /levels/<niveau>/ les fichiers .prefab correspondant à un motif (défaut *barrier*), les instancie temporairement pour relever la position des TSStatic, puis les affiche en deux listes (non sélectionnés / sélectionnés) avec des sphères de debug dans la vue. Un mode d'édition « Barriers Selection » permet de cliquer dans la vue (clic = bascule, Maj = ajouter seulement, Alt = retirer seulement). Des entrées de menu synchronisent la sélection avec l'éditeur de courses (editor_raceEditor, champ path.prefabs).

## Remarques

- Bug : dans le menu Prefabs > « Load Selected Prefabs », les variables filename et f ne sont pas définies dans cette portée (globales nil), donc spawnPrefab reçoit des arguments nil et l'entrée ne fonctionne pas correctement.
- Bug : M.onExtensionLoaded = onExtensionLoaded référence une variable non définie (vaut nil) : le champ exporté est donc nil.
- Dans « Add Selection to Race Editor » et « Set Selection exactly », path.prefabs est lu avant le test if path (erreur si getCurrentPath renvoie nil).
- onSerialize et onDeserialized sont des fonctions vides.
- Les prefabs sont indexés par chemin de fichier (prefabsIndex) : un fichier déjà chargé n'est pas rechargé tant que « Clear results » n'a pas été utilisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_barriersEditor.onDeserialized(data)` | Fonction vide. *(interne)* *(hook)* | 303 |
| `editor_barriersEditor.onEditorGui()` | Appelé chaque frame de l'éditeur : dessine la fenêtre (menus Load / Race Editor, deux listes de prefabs, boutons > et <) et les sphères de debug de chaque prefab. *(interne)* *(hook)* | 77 |
| `editor_barriersEditor.onEditorInitialized()` | Enregistre la fenêtre (1500x700), l'entrée de menu « Barriers Editor » (groupe Gameplay) et le mode d'édition « Barriers Selection » avec ses raccourcis souris. *(interne)* *(hook)* | 286 |
| `editor_barriersEditor.onSerialize()` | Fonction vide (ne renvoie rien). *(interne)* *(hook)* | 300 |
| `editor_barriersEditor.show()` | Désélectionne les objets de l'éditeur et affiche la fenêtre « Barriers Selector ». | 281 |

### Détail des paramètres

#### `editor_barriersEditor.onDeserialized(data)`

Fonction vide.

- `data` (*any*) : Non utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Vaut nil : référence à une variable locale jamais définie. ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `Sim.` `upcast`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `obj:` `getClassName`, `getPosition`, `getRotation`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/barriersEditor.lua`.*
