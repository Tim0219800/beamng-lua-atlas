# `dynoClient`

*Fichier : `lua/vehicle/extensions/dynoClient.lua` · VM : Véhicule · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `dynoClient` : `extensions.load (VM véhicule)("dynoClient")`, puis la globale `dynoClient`

Client de banc de puissance (dyno) côté véhicule : après initDyno, il envoie chaque frame le régime moteur, le rapport engagé et les rapports de transmission à une texture HTML (JUI) appartenant à l'objet du banc, via queueJSUITexture exécuté dans le GE Lua.

## Exemple

```lua
extensions.dynoClient.initDyno(dynoObjectID, 'dynoScreenTexture')
```

## Remarques

- Les appels JS sont 'client_init' ({vehicle = nom du dossier du véhicule, id}) et 'client_data' ({rpm, gear, gearRatio, finalRatio}) ; les guillemets JSON sont remplacés par \' pour tenir dans la chaîne JS.
- rpm vient de drivetrain.rpm (couche de compatibilité) et gear de electrics.values.gear_M. gearRatio = v.data.engine.gears[gear] (1 si 0 ou absent), finalRatio = v.data.engine.differential (1 si 0 ou absent) : suppose l'ancien format jbeam de moteur.
- Anomalie : initDyno calcule frontAxis et rearAxis (positions Y des roues) mais ne s'en sert pas.
- Si gear est nil ou absent de la table gears, gearRatio vaut nil (envoyé tel quel).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `dynoClient.initDyno(_dynoObjectID, _textureName)` | Mémorise l'objet du banc et sa texture, puis lui envoie un message d'initialisation 'client_init'. Sans identifiant d'objet, ne fait rien. | 16 |
| `dynoClient.updateGFX(dt)` | Appelé chaque frame : envoie 'client_data' au banc si initDyno a été appelé. *(interne)* | 36 |

### Détail des paramètres

#### `dynoClient.initDyno(_dynoObjectID, _textureName)`

Mémorise l'objet du banc et sa texture, puis lui envoie un message d'initialisation 'client_init'. Sans identifiant d'objet, ne fait rien.

- `_dynoObjectID` (*integer*) : Identifiant de l'objet banc de puissance.
- `_textureName` (*string*) : Nom de la texture JUI sur cet objet.

#### `dynoClient.updateGFX(dt)`

Appelé chaque frame : envoie 'client_data' au banc si initDyno a été appelé.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Appels vers le moteur (C++)

- `obj:` `getId`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/dynoClient.lua`.*
