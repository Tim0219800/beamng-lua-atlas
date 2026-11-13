# `telemetry_trackers_session`

*Fichier : `lua/ge/extensions/telemetry/trackers/session.lua` · VM : Game Engine (GE) · 124 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_session` : `extensions.load("telemetry_trackers_session")`, puis la globale `telemetry_trackers_session`

Suiveur de télémétrie de session : marque le début et la fin de la session. Il se charge en premier et se décharge en dernier, donc encadre tous les autres évènements. Un rechargement Lua du moteur de jeu poursuit la session en cours. Au début : évènement « session » (type start) avec faits sur le client, langues, version de télémétrie, licence tech, fuseau horaire, identifiant anonyme, mode Big Picture, alimentation et VR. À la fin : « session » (type end) avec la durée.

## Remarques

- Toutes les heures locales peuvent être fausses de plusieurs heures. L'évènement « login » (émis dès que l'authentification est disponible) donne le décalage avec l'horloge serveur (clockOffset), l'heure UTC locale, l'heure ajustée et l'horodatage serveur tel que reçu, pour ancrer les autres évènements.
- Lors d'une session poursuivie après rechargement Lua, aucun nouvel évènement start n'est émis ; loginLogged est repris de l'état précédent.
- La fin de session n'est émise qu'une fois et pas pendant un rechargement Lua (onSerialize avec reason == « reload »).

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_session.onExtensionLoaded(previousState)` | Hook appelé au chargement : émet l'évènement de début de session (sauf session poursuivie), tente d'émettre le login et passe en déchargement manuel. *(interne)* *(hook)* | 59 |
| `telemetry_trackers_session.onExtensionUnloaded()` | Hook appelé au déchargement : émet l'évènement de fin de session avec la durée (hors rechargement Lua). *(interne)* *(hook)* | 95 |
| `telemetry_trackers_session.onOnlineStateChanged(connected)` | Hook appelé quand l'état de connexion en ligne change : une fois la connexion revenue (premier moment où l'horloge serveur est connue), émet l'évènement login. *(interne)* *(hook)* | 115 |
| `telemetry_trackers_session.onSerialize(reason)` | Hook appelé avant déchargement : retient si c'est un rechargement Lua et renvoie {loginLogged}. *(interne)* *(hook)* | 108 |

### Détail des paramètres

#### `telemetry_trackers_session.onExtensionLoaded(previousState)`

Hook appelé au chargement : émet l'évènement de début de session (sauf session poursuivie), tente d'émettre le login et passe en déchargement manuel.

- `previousState` (*table|nil*) : État renvoyé par onSerialize ({loginLogged}) lors d'un rechargement.

#### `telemetry_trackers_session.onOnlineStateChanged(connected)`

Hook appelé quand l'état de connexion en ligne change : une fois la connexion revenue (premier moment où l'horloge serveur est connue), émet l'évènement login.

- `connected` (*boolean*) : true si connecté.

#### `telemetry_trackers_session.onSerialize(reason)`

Hook appelé avant déchargement : retient si c'est un rechargement Lua et renvoie {loginLogged}.

- `reason` (*string*) : Raison (« reload » pour un rechargement).
- **renvoie** : table {loginLogged}

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Appels vers le moteur (C++)

- `Lua:` `getOSLanguage`, `getSelectedLanguage`
- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/session.lua`.*
