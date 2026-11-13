# `ui_uiStateManager`

*Fichier : `lua/ge/extensions/ui/uiStateManager.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_uiStateManager` : `extensions.load("ui_uiStateManager")`, puis la globale `ui_uiStateManager`

Suit l'état de disponibilité des frameworks d'interface ('vue' et 'angular') et choisit l'écran initial. Quand les deux ont annoncé uiReady, il émet le hook onAllUiReady puis navigue vers l'écran de démarrage (consentement en ligne, disposition des boutons, jeu, onboarding ou menu) via ui_router. Il gère aussi la resynchronisation de la route après un rechargement F5 de l'UI.

## Remarques

- Le mode de déchargement est mis sur 'manual' au chargement : l'extension ne se décharge pas automatiquement.
- uiType inconnu (autre que 'vue' ou 'angular') : un avertissement est loggé et l'appel est ignoré.
- Après initialisation, un nouveau uiReady (rechargement F5) émet 'ui_router_routeRefresh' pour le framework annoncé et pour ceux déjà prêts.

**Dépendances (chargées avant) :** `ui_router`, `ui_router_routeManager`, `ui_menuManager`, `ui_legal`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_uiStateManager._checkAllUiReady()` | Si tous les frameworks sont prêts, passe initialized à true, émet onAllUiReady et lance navigateToInitialScreen. *(interne)* | 110 |
| `ui_uiStateManager.checkAndSyncRoute(uiType)` | Après un rechargement F5, renvoie à l'UI la route courante via guihooks 'ui_router_routeRefresh' ({request, resolved, refreshedBy}) pour chaque framework concerné. | 53 |
| `ui_uiStateManager.initialize(headlessMode)` | Point d'entrée. En mode headless, émet directement le hook onUiReady ; sinon charge l'extension ui_router. *(interne)* | 15 |
| `ui_uiStateManager.isUiReady(uiType)` | Indique si un framework donné, ou tous s'il n'y a pas d'argument, est prêt. | 39 |
| `ui_uiStateManager.navigateToInitialScreen()` | Choisit l'écran de départ. Sans licence valide : 'legal.onlineFeatures' si le consentement en ligne manque, puis 'buttonLayout' si la fenêtre de disposition (showedInputLayoutPopupV37) n'a pas été vue. Sinon 'play' si on entre en jeu (état freeroam ou chargement), 'onboarding' si non montré, sinon 'menu'. *(interne)* | 86 |
| `ui_uiStateManager.onExtensionLoaded()` | Hook appelé au chargement : désactive le déchargement automatique de l'extension. *(interne)* *(hook)* | 78 |
| `ui_uiStateManager.uiReady(uiType)` | Appelée par l'UI quand un framework est chargé. Émet onUiReady(uiType), marque le framework prêt, puis soit resynchronise la route (déjà initialisé), soit vérifie si tous sont prêts. | 23 |

### Détail des paramètres

#### `ui_uiStateManager.checkAndSyncRoute(uiType)`

Après un rechargement F5, renvoie à l'UI la route courante via guihooks 'ui_router_routeRefresh' ({request, resolved, refreshedBy}) pour chaque framework concerné.

- `uiType` (*string*) : Framework qui vient de se réannoncer.
- **renvoie** : boolean false si pas encore initialisé, sinon true.

#### `ui_uiStateManager.initialize(headlessMode)`

Point d'entrée. En mode headless, émet directement le hook onUiReady ; sinon charge l'extension ui_router.

- `headlessMode` (*boolean*) : true si le jeu tourne sans interface.

#### `ui_uiStateManager.isUiReady(uiType)`

Indique si un framework donné, ou tous s'il n'y a pas d'argument, est prêt.

- `uiType` (*string|nil*) : Framework à tester, ou nil pour tous.
- **renvoie** : boolean true si prêt.

#### `ui_uiStateManager.uiReady(uiType)`

Appelée par l'UI quand un framework est chargé. Émet onUiReady(uiType), marque le framework prêt, puis soit resynchronise la route (déjà initialisé), soit vérifie si tous sont prêts.

- `uiType` (*string*) : 'vue' ou 'angular'.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | ui_router, ui_router_routeManager, ui_menuManager, ui_legal. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAllUiReady`
- `onUiReady` — écouté par 6 module(s)

**Évènements UI (guihooks.trigger) :** `ui_router_routeRefresh`

**Charge les extensions :** `ui_router`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/uiStateManager.lua`.*
