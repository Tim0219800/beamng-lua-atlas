# `gameplay_lowPerformance`

*Fichier : `lua/ge/extensions/gameplay/lowPerformance.lua` · VM : Game Engine (GE) · 365 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_lowPerformance` : `extensions.load("gameplay_lowPerformance")`, puis la globale `gameplay_lowPerformance`

Détecteur de faible fréquence d'images en freeroam et en écran partagé (modes freeroam et multiseatGamemode uniquement ; missions, scénarios, carrière et tutoriels ne sont jamais contrôlés). Quand la moyenne lissée de FPS reste sous 25 pendant 5 s, il passe en état « low performance », affiche un toast d'avertissement et peut demander confirmation avant l'apparition d'un nouveau véhicule (confirmSpawn). Un moddeur qui spawne des véhicules peut passer par confirmSpawn pour respecter cet avertissement.

## Remarques

- Constantes : seuil 25 FPS, lissage 5 s, entrée après 5 s sous le seuil, sortie après 10 s au-dessus, période de grâce de 5 s, images de plus de 0.25 s ignorées (considérées comme des blocages de chargement).
- La détection est désactivée (gate) si aucun niveau n'est chargé, mode non contrôlé, premier trajet (isFirstDriveActive), session OpenXR active, ou limite de FPS activée à une valeur <= 25.
- Un échantillonnage n'a lieu que si l'écran n'est pas en fondu, le jeu n'est pas en pause, la fenêtre a le focus, l'éditeur est inactif et la route UI courante est « play » ; sinon la période de grâce redémarre.
- Le réglage notifyLowPerformance (false) coupe toasts, avertissement de spawn et pause-notice, mais la détection continue ; en menu simple (Engine.UI.isSimpleMenu) les notifications restent toujours actives.
- La fenêtre ImGui de debug (onDrawDebug) existe dans le fichier mais son affectation est commentée : elle est désactivée.
- Les callbacks du dialogue de confirmation sont référencés par chaîne Lua (luaCallback), ce qui rend ces quatre fonctions appelables depuis l'UI.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_lowPerformance.cancelPendingSpawn()` | Abandonne la fonction de spawn en attente (bouton Annuler). | 125 |
| `gameplay_lowPerformance.confirmPendingSpawn()` | Exécute la fonction de spawn en attente, si elle existe (bouton Continuer). | 119 |
| `gameplay_lowPerformance.confirmSpawn(spawnFn)` | Exécute spawnFn directement, sauf si l'état de faible performance est actif, l'avertissement pas encore montré pour cet épisode et les notifications activées : dans ce cas affiche un dialogue de confirmation (Annuler / Ne plus afficher / Continuer) et diffère spawnFn. | 93 |
| `gameplay_lowPerformance.getPauseNotice()` | Renvoie les textes traduits à afficher dans le menu pause quand la faible performance est active et les notifications autorisées. | 141 |
| `gameplay_lowPerformance.isLowPerformance()` | Indique si le jeu est actuellement considéré en faible performance, et si la détection est encore applicable (gate actif). | 88 |
| `gameplay_lowPerformance.muteAndConfirmPendingSpawn()` | Désactive les notifications (réglage notifyLowPerformance = false), affiche un toast d'information puis exécute le spawn en attente. | 129 |
| `gameplay_lowPerformance.onScreenFadeState(state)` | Hook d'état du fondu d'écran : l'échantillonnage est suspendu tant que l'état n'est pas 3 (fondu terminé). *(interne)* *(hook)* | 196 |
| `gameplay_lowPerformance.onUpdate(dtReal, dtSim, dtRaw)` | Hook de mise à jour chaque frame : vérifie périodiquement (1 s) le gate, gère la période de grâce, lisse les FPS et bascule l'état de faible performance. *(interne)* *(hook)* | 151 |
| `gameplay_lowPerformance.onVehicleSpawned()` | Hook d'apparition d'un véhicule : redémarre la période de grâce (le spawn fait chuter temporairement les FPS). *(interne)* *(hook)* | 192 |

### Détail des paramètres

#### `gameplay_lowPerformance.confirmSpawn(spawnFn)`

Exécute spawnFn directement, sauf si l'état de faible performance est actif, l'avertissement pas encore montré pour cet épisode et les notifications activées : dans ce cas affiche un dialogue de confirmation (Annuler / Ne plus afficher / Continuer) et diffère spawnFn.

- `spawnFn` (*function*) : Fonction qui effectue le spawn.
- **renvoie** : any Résultat de spawnFn si exécutée immédiatement (nil si elle ne renvoie rien), ou false tant que le joueur doit décider.

#### `gameplay_lowPerformance.getPauseNotice()`

Renvoie les textes traduits à afficher dans le menu pause quand la faible performance est active et les notifications autorisées.

- **renvoie** : table|nil {notice, hint, infoTitle, infoMessage} ou nil.

#### `gameplay_lowPerformance.isLowPerformance()`

Indique si le jeu est actuellement considéré en faible performance, et si la détection est encore applicable (gate actif).

- **renvoie** : boolean true si faible performance.

#### `gameplay_lowPerformance.onScreenFadeState(state)`

Hook d'état du fondu d'écran : l'échantillonnage est suspendu tant que l'état n'est pas 3 (fondu terminé).

- `state` (*integer*) : État du fondu ; 3 = terminé.

#### `gameplay_lowPerformance.onUpdate(dtReal, dtSim, dtRaw)`

Hook de mise à jour chaque frame : vérifie périodiquement (1 s) le gate, gère la période de grâce, lisse les FPS et bascule l'état de faible performance.

- `dtReal` (*number*) : Delta temps réel (non utilisé).
- `dtSim` (*number*) : Delta temps de simulation (non utilisé).
- `dtRaw` (*number*) : Delta temps brut en secondes, utilisé pour le chronométrage et les FPS.

**Évènements UI (guihooks.trigger) :** `showConfirmationDialog`, `toastrMsg`

## Appels vers le moteur (C++)

- `Engine.` `isProgramFocused`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/lowPerformance.lua`.*
