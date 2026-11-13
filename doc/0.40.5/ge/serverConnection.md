# `serverConnection`

*Fichier : `lua/ge/serverConnection.lua` · VM : Game Engine (GE) · 86 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `serverConnection`

Déconnexion de la session locale (arrêt de la simulation, nettoyage) et passage de l'état de monde prêt. Il sert quand on quitte un niveau pour revenir au menu : arrêt de la physique, restauration du curseur, arrêt de l'éclairage de mission, destruction du serveur local et vidage du nom de mission. Il fait aussi passer worldReadyState de 0 à 1 une fois la première caméra définie.

## Exemple

```lua
serverConnection.disconnect(function() print('niveau quitté') end, true)
```

## Remarques

- worldReadyState est une variable globale (hors module) : 0 au chargement, passée à 1 par onCameraHandlerSetInitial ; l'étape suivante (2) est faite dans la mise à jour de frame (commentaire du code).
- disconnect (disconnectWrapper) passe par core_gamestate.requestEnterLoadingScreen quand loadingScreen est vrai : la déconnexion réelle (disconnectActual) n'a lieu qu'une fois l'écran de chargement affiché, de façon asynchrone. Le callback est appelé à la fin de disconnectActual.
- disconnectActual n'est pas exporté : le code précise qu'il ne faut pas l'appeler directement (état du jeu incohérent).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `serverConnection.disconnect(callback, loadingScreen, p)` | Quitte la session en cours : affiche l'écran de chargement (par défaut), puis arrête la physique, restaure le curseur, coupe l'éclairage de mission, détruit le serveur (server.destroy), vide le nom de mission, quitte l'écran de chargement et appelle callback. | 63 |
| `serverConnection.noLoadingScreenDisconnect(p)` | Déconnexion immédiate sans écran de chargement et sans callback (disconnect(nop, false, p)). Utilisée depuis du code externe (commentaire '.cs'). | 79 |
| `serverConnection.onCameraHandlerSetInitial()` | Hook appelé quand la première caméra/objet de contrôle est défini par le serveur. Si worldReadyState vaut 0, active le masquage du curseur inactif, met worldReadyState à 1 et diffuse le hook onWorldReadyState(1). *(interne)* *(hook)* | 8 |

### Détail des paramètres

#### `serverConnection.disconnect(callback, loadingScreen, p)`

Quitte la session en cours : affiche l'écran de chargement (par défaut), puis arrête la physique, restaure le curseur, coupe l'éclairage de mission, détruit le serveur (server.destroy), vide le nom de mission, quitte l'écran de chargement et appelle callback.

- `callback` (*function|nil*) : Fonction appelée à la fin de la déconnexion ; sa valeur de retour est ignorée (disconnectWrapper ne renvoie rien).
- `loadingScreen` (*boolean|nil*) : true par défaut (nil compte comme true). false : déconnecte tout de suite sans écran de chargement.
- `p` (*table|nil*) : Profileur optionnel (objet avec :add(label)) pour mesurer les étapes.

#### `serverConnection.noLoadingScreenDisconnect(p)`

Déconnexion immédiate sans écran de chargement et sans callback (disconnect(nop, false, p)). Utilisée depuis du code externe (commentaire '.cs').

- `p` (*table|nil*) : Profileur optionnel.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onWorldReadyState` — écouté par 4 module(s)

## Appels vers le moteur (C++)

- `be:` `physicsStopSimulation`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/serverConnection.lua`.*
