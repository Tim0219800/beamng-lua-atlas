# `core_supportReport`

*Fichier : `lua/ge/extensions/core/supportReport.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_supportReport` : `extensions.load("core_supportReport")`, puis la globale `core_supportReport`

Envoi d'un rapport de support au serveur BeamNG depuis l'UI. send déclenche Engine.SupportReport.send ; le moteur rappelle onSupportReportSent avec l'identifiant de support (ou une erreur). L'identifiant est gardé 15 minutes dans settings/lastSupportReport.json puis oublié. L'état est publié à l'UI par guihooks 'SupportReportState'.

## Remarques

- L'état envoyé à l'UI : {sending, supportId, expires, error, outdated}. expires est l'heure (os.time) d'expiration, 0 s'il n'y a pas d'identifiant.
- Les erreurs serveur contenant du HTML (ex. page 502 d'un proxy) sont réduites à leur titre ou à leur texte brut.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_supportReport.onExtensionLoaded()` | Hook de chargement : relit le dernier rapport sauvegardé et oublie celui qui a expiré. *(interne)* *(hook)* | 60 |
| `core_supportReport.onSupportReportSent(supportId, err, outdated)` | Callback du moteur quand l'envoi se termine. Si supportId n'est pas vide, le mémorise (fichier JSON) ; sinon mémorise l'erreur et l'indicateur outdated. Republie l'état. *(interne)* *(hook)* | 48 |
| `core_supportReport.requestState()` | Oublie le rapport expiré (supprime le fichier) puis envoie l'état courant à l'UI (guihooks SupportReportState). | 28 |
| `core_supportReport.send()` | Lance l'envoi du rapport (Engine.SupportReport.send) s'il n'y en a pas déjà un en cours, puis publie l'état. | 39 |

### Détail des paramètres

#### `core_supportReport.onSupportReportSent(supportId, err, outdated)`

Callback du moteur quand l'envoi se termine. Si supportId n'est pas vide, le mémorise (fichier JSON) ; sinon mémorise l'erreur et l'indicateur outdated. Republie l'état.

- `supportId` (*string*) : Identifiant de support, '' en cas d'échec.
- `err` (*string*) : Message d'erreur en cas d'échec.
- `outdated` (*boolean*) : Vrai si le jeu est trop ancien pour envoyer un rapport (déduit du code).

**Évènements UI (guihooks.trigger) :** `SupportReportState`

## Appels vers le moteur (C++)

- `FS:` `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/supportReport.lua`.*
