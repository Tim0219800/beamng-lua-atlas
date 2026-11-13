# `gameplay_achievement`

*Fichier : `lua/ge/extensions/gameplay/achievement.lua` · VM : Game Engine (GE) · 403 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_achievement` : `extensions.load("gameplay_achievement")`, puis la globale `gameplay_achievement`

Extension GE qui relie les statistiques de jeu (gameplay_statistic) aux succès et statistiques du fournisseur en ligne (OnlineServiceProvider : Steam, EOS…). Au démarrage elle lit lua/ge/extensions/gameplay/achievements.json, construit la liste des succès en attente et des statistiques à publier, puis s'abonne aux métriques correspondantes. Quand une métrique atteint le seuil unlockAt, le succès est débloqué. Elle gère aussi trois succès « manuels » (VEHICLE_EXPLORER, LEVEL_EXPLORER, VEHICLE_FAVOURITE). Un moddeur s'en sert surtout via unlockAchievement.

## Exemple

```lua
gameplay_achievement.unlockAchievement("VEHICLE_EXPLORER")
```

## Remarques

- Rien ne se passe si OnlineServiceProvider.isWorking est faux ou si aucune plateforme n'est mappée (startup retourne false, achievements inactifs).
- startup() n'est exécuté qu'une fois (drapeau started) ; il est appelé depuis onFirstUpdate, onOnlineServiceProviderReady et onClientStartMission.
- Les mises à jour de statistiques sont limitées : envoi si plus de 20 s depuis le dernier envoi ou si la variation atteint submitMinDelta.
- Seuils manuels : 15 véhicules avec odomètre >= 10000 (VEHICLE_EXPLORER), 5 niveaux avec temps >= 300 (LEVEL_EXPLORER), un odomètre >= 1000000 (VEHICLE_FAVOURITE). Unités des métriques déduites du code.
- Incohérence : dans maybeSubmitStat, watcher.valueLastSent reçoit timer:stop() (un temps) alors qu'il est aussi comparé à v (une valeur de stat) ; le test math.abs(v - valueLastSent) mélange donc temps et valeur. Dans statCallback, newvalue.career est lu avant de tester newvalue (erreur si nil).
- flushPendingOnlineStats (envoi des valeurs en file) n'est appelé qu'au déchargement de l'extension.

**Dépendances (chargées avant) :** `gameplay_statistic`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_achievement.onClientStartMission()` | Hook appelé au démarrage d'un niveau ; relance startup() (sans effet si déjà démarré). *(interne)* *(hook)* | 376 |
| `gameplay_achievement.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension ; envoie les statistiques et progressions encore en file d'attente. *(interne)* *(hook)* | 380 |
| `gameplay_achievement.onFirstUpdate()` | Hook appelé à la première mise à jour du jeu : lance startup() si le fournisseur en ligne fonctionne, sinon journalise un avertissement. *(interne)* *(hook)* | 364 |
| `gameplay_achievement.onOnlineServiceProviderReady()` | Hook appelé quand le fournisseur de service en ligne devient prêt ; lance startup(). *(interne)* *(hook)* | 372 |
| `gameplay_achievement.statCallback(key, oldvalue, newvalue)` | Callback enregistré auprès de gameplay_statistic pour chaque métrique suivie. Publie les statistiques en ligne correspondantes, pousse la progression des succès et débloque ceux dont la valeur atteint unlockAt (puis les retire de la liste en attente). Désabonne la métrique si plus personne ne l'utilise. *(interne)* | 108 |
| `gameplay_achievement.unlockAchievement(achievementId)` | Débloque un succès par son identifiant via OnlineServiceProvider.unlockAchievement. Ne le fait qu'une fois par session pour un même identifiant. | 385 |

### Détail des paramètres

#### `gameplay_achievement.statCallback(key, oldvalue, newvalue)`

Callback enregistré auprès de gameplay_statistic pour chaque métrique suivie. Publie les statistiques en ligne correspondantes, pousse la progression des succès et débloque ceux dont la valeur atteint unlockAt (puis les retire de la liste en attente). Désabonne la métrique si plus personne ne l'utilise.

- `key` (*string*) : Nom de la métrique modifiée.
- `oldvalue` (*table|nil*) : Ancienne entrée de la métrique (non utilisée).
- `newvalue` (*table*) : Nouvelle entrée : champs value (number) et career (boolean).

#### `gameplay_achievement.unlockAchievement(achievementId)`

Débloque un succès par son identifiant via OnlineServiceProvider.unlockAchievement. Ne le fait qu'une fois par session pour un même identifiant.

- `achievementId` (*string*) : Identifiant du succès côté plateforme.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : {"gameplay_statistic"}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/achievement.lua`.*
