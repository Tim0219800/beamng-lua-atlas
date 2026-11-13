# `gameplay_tutorial_bounds`

*Fichier : `lua/ge/extensions/gameplay/tutorial/bounds.lua` · VM : Game Engine (GE) · 287 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_bounds` : `extensions.load("gameplay_tutorial_bounds")`, puis la globale `gameplay_tutorial_bounds`

Gère les limites de la zone du tutoriel de carrière. Il vérifie que le joueur reste dans les zones actives des sites du tutoriel ; sinon il affiche un avertissement avec un compte à rebours de 5 s dans la liste de tâches, puis déclenche un retour automatique via des callbacks (hooks onCareerTutorial...). Peut aussi dessiner les zones actives en debug.

## Exemple

```lua
gameplay_tutorial_bounds.setActiveZones({'evalZone'})
gameplay_tutorial_bounds.setDebugDrawBounds(true)
```

## Remarques

- Constantes : compte à rebours de 5 s (OOB_AUTO_RESET_SECONDS), message « retour automatique » affiché 1 s avant le callback de timeout.
- Callbacks par défaut : onOutOfBoundsStarted -> hook onCareerTutorialOutOfBoundsStarted ; onOutOfBoundsEnded -> onCareerTutorialOutOfBoundsEnded ; onOutOfBoundsTimedOut(stepId) -> hook onCareerTutorialOutOfBoundsTimedOut si l'étape courante est '04timeTrial', sinon onCareerTutorialLeftBounds ; onOutOfBoundsWhileNotAllowed -> onCareerTutorialLeftBounds.
- Sans zone active ou sans sites chargés, le joueur est toujours considéré dans les limites.
- Les textes d'avertissement sont en anglais et codés en dur (pas de clé de traduction).
- La position testée est celle du véhicule du joueur 0, ou de la caméra s'il n'y en a pas.
- Le suivi est inactif tant que le getter d'activité du runtime (setRuntimeActiveGetter) renvoie false.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_bounds.cleanup()` | Quitte l'état hors limites et remet à zéro sites, zones actives, zones désactivées et debug. | 278 |
| `gameplay_tutorial_bounds.getActiveZoneNames()` | Renvoie la liste triée des noms de zones actives. | 188 |
| `gameplay_tutorial_bounds.getDebugDrawBounds()` | Indique si le dessin debug des zones est actif. | 205 |
| `gameplay_tutorial_bounds.getEnabledZones()` | Renvoie la table interne zoneEnabled (nom -> booléen), référence directe. | 197 |
| `gameplay_tutorial_bounds.getZoneEnabled(zoneName)` | Indique si une zone est activée (true par défaut si jamais réglée). | 183 |
| `gameplay_tutorial_bounds.isInBounds()` | Indique si le joueur est dans les limites. Renvoie true si le tutoriel n'est pas actif. | 209 |
| `gameplay_tutorial_bounds.onPreRender(dtReal, dtSim, dtRaw)` | Hook de rendu appelé chaque frame ; dessine les zones actives si le debug est activé et le tutoriel actif. *(interne)* *(hook)* | 271 |
| `gameplay_tutorial_bounds.setActiveZones(names)` | Définit la liste des zones dans lesquelles le joueur est autorisé (remplace la liste précédente). | 170 |
| `gameplay_tutorial_bounds.setCallbacks(newCallbacks)` | Remplace tout ou partie des callbacks de sortie de limites ; les clés absentes conservent leur callback actuel. | 71 |
| `gameplay_tutorial_bounds.setCurrentStepGetter(getter)` | Définit la fonction qui renvoie l'identifiant de l'étape courante du tutoriel (transmis au callback de timeout). | 63 |
| `gameplay_tutorial_bounds.setDebugDrawBounds(enabled)` | Active ou coupe le dessin debug des zones actives (jaune semi-transparent), effectué dans onPreRender. | 201 |
| `gameplay_tutorial_bounds.setRuntimeActiveGetter(getter)` | Définit la fonction qui indique si le tutoriel est actif. Une valeur non fonctionnelle la remet à une fonction renvoyant false. | 55 |
| `gameplay_tutorial_bounds.setSites(newSites)` | Définit l'objet de sites (avec zones) utilisé pour tester les limites. S'il est nil, update le charge depuis gameplay_tutorial_setup. | 166 |
| `gameplay_tutorial_bounds.setZoneEnabled(zoneName, enabled)` | Active ou désactive temporairement une zone sans la retirer de la liste active. | 179 |
| `gameplay_tutorial_bounds.update(dtReal)` | À appeler chaque frame : si le tutoriel est actif, teste les limites ; hors limites, affiche l'avertissement avec compte à rebours, et après 5 s déclenche (via un job de 1 s de pause) le callback onOutOfBoundsTimedOut. Si le retour automatique n'est pas autorisé (gameplay_tutorial_setup.isOutOfBoundsResetAllowed), appelle seulement onOutOfBoundsWhileNotAllowed. | 214 |

### Détail des paramètres

#### `gameplay_tutorial_bounds.getActiveZoneNames()`

Renvoie la liste triée des noms de zones actives.

- **renvoie** : string[] Noms triés par ordre alphabétique.

#### `gameplay_tutorial_bounds.getDebugDrawBounds()`

Indique si le dessin debug des zones est actif.

- **renvoie** : boolean État du dessin debug.

#### `gameplay_tutorial_bounds.getEnabledZones()`

Renvoie la table interne zoneEnabled (nom -> booléen), référence directe.

- **renvoie** : table<string, boolean> Zones explicitement activées/désactivées.

#### `gameplay_tutorial_bounds.getZoneEnabled(zoneName)`

Indique si une zone est activée (true par défaut si jamais réglée).

- `zoneName` (*string*) : Nom de la zone.
- **renvoie** : boolean État d'activation.

#### `gameplay_tutorial_bounds.isInBounds()`

Indique si le joueur est dans les limites. Renvoie true si le tutoriel n'est pas actif.

- **renvoie** : boolean true si dans une zone active et activée (ou si rien à contrôler).

#### `gameplay_tutorial_bounds.onPreRender(dtReal, dtSim, dtRaw)`

Hook de rendu appelé chaque frame ; dessine les zones actives si le debug est activé et le tutoriel actif.

- `dtReal` (*number*) : Delta temps réel.
- `dtSim` (*number*) : Delta temps de simulation.
- `dtRaw` (*number*) : Delta temps brut.

#### `gameplay_tutorial_bounds.setActiveZones(names)`

Définit la liste des zones dans lesquelles le joueur est autorisé (remplace la liste précédente).

- `names` (*string[]|nil*) : Noms de zones ; nil vide la liste (plus de limite).

#### `gameplay_tutorial_bounds.setCallbacks(newCallbacks)`

Remplace tout ou partie des callbacks de sortie de limites ; les clés absentes conservent leur callback actuel.

- `newCallbacks` (*table*) : Clés possibles : onOutOfBoundsStarted, onOutOfBoundsEnded, onOutOfBoundsTimedOut(currentStepId), onOutOfBoundsWhileNotAllowed.

#### `gameplay_tutorial_bounds.setCurrentStepGetter(getter)`

Définit la fonction qui renvoie l'identifiant de l'étape courante du tutoriel (transmis au callback de timeout).

- `getter` (*function*) : Fonction sans argument renvoyant l'id d'étape (string) ou nil.

#### `gameplay_tutorial_bounds.setDebugDrawBounds(enabled)`

Active ou coupe le dessin debug des zones actives (jaune semi-transparent), effectué dans onPreRender.

- `enabled` (*boolean*) : true pour dessiner.

#### `gameplay_tutorial_bounds.setRuntimeActiveGetter(getter)`

Définit la fonction qui indique si le tutoriel est actif. Une valeur non fonctionnelle la remet à une fonction renvoyant false.

- `getter` (*function*) : Fonction sans argument renvoyant un booléen.

#### `gameplay_tutorial_bounds.setSites(newSites)`

Définit l'objet de sites (avec zones) utilisé pour tester les limites. S'il est nil, update le charge depuis gameplay_tutorial_setup.

- `newSites` (*table|nil*) : Objet sites avec sites.zones.byName / sites.zones.objects ou la méthode getZonesForPosition.

#### `gameplay_tutorial_bounds.setZoneEnabled(zoneName, enabled)`

Active ou désactive temporairement une zone sans la retirer de la liste active.

- `zoneName` (*string*) : Nom de la zone.
- `enabled` (*boolean*) : false pour ignorer cette zone.

#### `gameplay_tutorial_bounds.update(dtReal)`

À appeler chaque frame : si le tutoriel est actif, teste les limites ; hors limites, affiche l'avertissement avec compte à rebours, et après 5 s déclenche (via un job de 1 s de pause) le callback onOutOfBoundsTimedOut. Si le retour automatique n'est pas autorisé (gameplay_tutorial_setup.isOutOfBoundsResetAllowed), appelle seulement onOutOfBoundsWhileNotAllowed.

- `dtReal` (*number*) : Delta temps réel en secondes.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCareerTutorialLeftBounds` — écouté par 8 module(s)
- `onCareerTutorialOutOfBoundsEnded` — écouté par 1 module(s)
- `onCareerTutorialOutOfBoundsStarted` — écouté par 1 module(s)
- `onCareerTutorialOutOfBoundsTimedOut` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/bounds.lua`.*
