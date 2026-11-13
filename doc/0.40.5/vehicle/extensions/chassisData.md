# `chassisData`

*Fichier : `lua/vehicle/extensions/chassisData.lua` · VM : Véhicule · 114 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `chassisData` : `extensions.load (VM véhicule)("chassisData")`, puis la globale `chassisData`

Extension qui calcule l'empattement (wheelBase) et la largeur de voie (trackWidth) du véhicule à partir des positions des nœuds de roues dans les données jbeam, puis les renvoie par commande Lua à un autre objet (véhicule ou VM). Utilisée par des outils qui ont besoin de la géométrie du châssis.

## Exemple

```lua
-- demander les données au véhicule 12, résultat renvoyé à une fonction nommée
extensions.chassisData.requestChassisData(objID, 'maFonctionReception', false)
-- la fonction recevra une chaîne JSON : {trackWidth, wheelBase, objectID, vehicleName}
```

## Remarques

- Le résultat est mis en cache après le premier calcul réussi ; forceRefresh = true le recalcule.
- Le calcul identifie les roues avant gauche, avant droite et arrière gauche par la position relative de node1 par rapport au centre des roues, dans le repère des refNodes. Si une de ces trois roues est introuvable (véhicule à moins de 3 roues, etc.), getChassisData renvoie nil et rien n'est envoyé.
- Unités : mètres (positions jbeam). trackWidth = distance entre bords extérieurs des roues avant moins la demi-largeur d'un nœud de roue à l'autre, donc voie entre centres de bande de roulement. wheelBase = écart en Y entre les roues avant gauche et arrière gauche.
- L'envoi se fait par obj:queueObjectLuaCommand(objID, "<callback>(<json>)") : la cible doit disposer d'une fonction globale accessible portant ce nom et recevoir une chaîne JSON entre guillemets.
- Le nom de l'export est requestChassisData (alias de sendChassisData).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `chassisData.requestChassisData(objID, callback, forceRefresh)` | Calcule (ou lit du cache) les données de châssis et les envoie à l'objet objID en appelant la fonction Lua callback avec le JSON des données en argument. | 101 |

### Détail des paramètres

#### `chassisData.requestChassisData(objID, callback, forceRefresh)`

Calcule (ou lit du cache) les données de châssis et les envoie à l'objet objID en appelant la fonction Lua callback avec le JSON des données en argument.

- `objID` (*integer*) : Identifiant de l'objet destinataire.
- `callback` (*string*) : Nom de la fonction Lua à appeler sur le destinataire.
- `forceRefresh` (*boolean|nil*) : true pour ignorer le cache.

## Appels vers le moteur (C++)

- `obj:` `queueObjectLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/chassisData.lua`.*
