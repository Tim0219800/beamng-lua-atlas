# `ui_legal`

*Fichier : `lua/ge/extensions/ui/legal.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_legal` : `extensions.load("ui_legal")`, puis la globale `ui_legal`

Vérifie si l'utilisateur a répondu à l'assistant de consentement en ligne (réglages `onlineFeatures` et `telemetry`, valeur "ask" = pas encore répondu). Sert au routeur d'UI pour interdire de quitter l'écran de consentement tant qu'il n'est pas validé.

## Remarques

- En menu simple (Engine.UI.isSimpleMenu()), si le consentement n'est pas donné, le module active automatiquement onlineFeatures et telemetry ("enable"), demande la sauvegarde des réglages et considère le consentement comme donné (les CGU sont supposées acceptées).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_legal.canLeaveOnlineConsent(route)` | Indique si la navigation hors de la route courante est permise : toujours true à l'intérieur de l'arbre de routes `legal.*` (pour finir l'assistant), sinon dépend de isOnlineConsentSet(). | 35 |
| `ui_legal.isOnlineConsentSet()` | Renvoie true si telemetry et onlineFeatures sont tous deux différents de "ask". Effet de bord en menu simple : active les deux réglages et sauvegarde. | 18 |

### Détail des paramètres

#### `ui_legal.canLeaveOnlineConsent(route)`

Indique si la navigation hors de la route courante est permise : toujours true à l'intérieur de l'arbre de routes `legal.*` (pour finir l'assistant), sinon dépend de isOnlineConsentSet().

- `route` (*table*) : Route de l'UI (champ name de type « legal.xxx »).
- **renvoie** : boolean true si on peut quitter.

#### `ui_legal.isOnlineConsentSet()`

Renvoie true si telemetry et onlineFeatures sont tous deux différents de "ask". Effet de bord en menu simple : active les deux réglages et sauvegarde.

- **renvoie** : boolean Consentement renseigné.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/legal.lua`.*
