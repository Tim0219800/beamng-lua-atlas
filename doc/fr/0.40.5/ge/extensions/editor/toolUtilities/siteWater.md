# `editor_toolUtilities_siteWater`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteWater.lua` · VM : Game Engine (GE) · 438 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteWater` : `extensions.load("editor_toolUtilities_siteWater")`, puis la globale `editor_toolUtilities_siteWater`

Eau stagnante et en chute d'un « site » (open space editor) : bassins d'une cascade, nappes qui débordent entre eux, jets, gerbes et jets d'écume (émetteur de particules BNGP_sprinkler). L'eau n'est pas un mesh et ne peut donc pas être cuite dans une coque ; le manifeste du site la porte sous forme de chiffres et tout ce qui monte le site recrée les objets (WaterBlock, River, ParticleEmitterNode). Tout part d'un enregistrement unique, exprimé dans le repère du site : un point d'ancrage et un angle règlent tout le placement.

## Exemple

```lua
local sw = extensions.editor_toolUtilities_siteWater
local rec = sw.localise(ca, ox, oy, oz)      -- vers le manifeste
local ca2 = sw.place(rec, px, py, pz, yaw, ox, oy) -- depuis le manifeste
local ids, names = sw.build(ca2, folder, 'site1')
```

## Remarques

- build() commence par appeler remove(folder), donc reconstruit tout depuis zéro.
- remove() balaie par classe (WaterBlock, River, ParticleEmitterNode) plutôt que par liste d'ids, car l'annulation restaure un document dont les ids peuvent désigner des objets supprimés.
- Une nappe (fall) part de chacune des 8 arêtes du bord d'un bassin (4 plats et 4 coins coupés) ; le nombre de gerbes est plafonné à 8 par arête.
- Les valeurs flow, sprayPow et sprayVar sont bornées à 0..1 dans build ; flow vaut 0.55 par défaut, sprayPow et sprayVar 0.5.
- Les altitudes (z, jetZ, spoutZ, zTop, zBot) sont relatives à oz/pz dans le manifeste et absolues dans l'enregistrement de l'éditeur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteWater.build(ca, folder, tag)` | Inonde ce que le centre d'intérêt a posé (bassins), puis accroche une nappe sur chaque face de chaque bassin qui déborde, avec gerbes d'écume, puis les couronnes (jets et déversoirs). Vide d'abord le dossier. | 305 |
| `editor_toolUtilities_siteWater.commit(ids)` | Passe chaque objet en persistant (canSave et cansave à true) et renvoie leurs noms, ce qui sert à l'annulation d'une gravure. | 338 |
| `editor_toolUtilities_siteWater.localise(ca, ox, oy, oz)` | Produit l'enregistrement du manifeste, dans le repère du site : seulement ce que build lit (bassins, couronnes, nappes, débit, gerbes). Positions relatives à (ox, oy, oz), bassins et couronnes relatifs à l'ancre. | 356 |
| `editor_toolUtilities_siteWater.place(rec, px, py, pz, yaw, ox, oy)` | Opération inverse : place un enregistrement de manifeste à une position et un cap, prêt pour build. L'ancre pivote autour du placement et l'angle s'ajoute au sien. (ox, oy) est le point du repère du site autour duquel pivote le placement (le milieu de l'emprise). | 391 |
| `editor_toolUtilities_siteWater.remove(folder)` | Supprime tout ce qui est mouillé sous un dossier : objets des classes WaterBlock, River et ParticleEmitterNode. | 293 |

### Détail des paramètres

#### `editor_toolUtilities_siteWater.build(ca, folder, tag)`

Inonde ce que le centre d'intérêt a posé (bassins), puis accroche une nappe sur chaque face de chaque bassin qui déborde, avec gerbes d'écume, puis les couronnes (jets et déversoirs). Vide d'abord le dossier.

- `ca` (*table|nil*) : Enregistrement de l'éditeur : pools, falls, crowns, flow, sprayPow, sprayVar, spraySeed.
- `folder` (*userdata|nil*) : Dossier de scène (SimGroup) qui reçoit les objets.
- `tag` (*string|nil*) : Nom du site qui monte l'eau, pour que deux sites identiques sur une carte n'aient pas les mêmes noms d'objets (défaut 'site').
- **renvoie** : table|nil Ids des objets créés (nil si pas de bassins ou de dossier).
- **renvoie** : table|nil Noms des objets créés.

#### `editor_toolUtilities_siteWater.commit(ids)`

Passe chaque objet en persistant (canSave et cansave à true) et renvoie leurs noms, ce qui sert à l'annulation d'une gravure.

- `ids` (*table|nil*) : Ids renvoyés par build.
- **renvoie** : table<integer, string> Noms des objets retrouvés et nommés.

#### `editor_toolUtilities_siteWater.localise(ca, ox, oy, oz)`

Produit l'enregistrement du manifeste, dans le repère du site : seulement ce que build lit (bassins, couronnes, nappes, débit, gerbes). Positions relatives à (ox, oy, oz), bassins et couronnes relatifs à l'ancre.

- `ca` (*table|nil*) : Enregistrement de l'éditeur (doit avoir pools non vide).
- `ox` (*number*) : X de l'origine du site.
- `oy` (*number*) : Y de l'origine du site.
- `oz` (*number*) : Z de l'origine du site.
- **renvoie** : table|nil Enregistrement du manifeste, nil s'il n'y a pas de bassin.

#### `editor_toolUtilities_siteWater.place(rec, px, py, pz, yaw, ox, oy)`

Opération inverse : place un enregistrement de manifeste à une position et un cap, prêt pour build. L'ancre pivote autour du placement et l'angle s'ajoute au sien. (ox, oy) est le point du repère du site autour duquel pivote le placement (le milieu de l'emprise).

- `rec` (*table|nil*) : Enregistrement du manifeste (avec pools).
- `px` (*number*) : X monde du placement.
- `py` (*number*) : Y monde du placement.
- `pz` (*number*) : Z monde de base.
- `yaw` (*number|nil*) : Cap en radians (0 par défaut).
- `ox` (*number|nil*) : X du point pivot dans le repère du site (0 par défaut).
- `oy` (*number|nil*) : Y du point pivot dans le repère du site (0 par défaut).
- **renvoie** : table|nil Enregistrement monde, avec ct et sn (cosinus et sinus du cap) ; nil si rec invalide.

#### `editor_toolUtilities_siteWater.remove(folder)`

Supprime tout ce qui est mouillé sous un dossier : objets des classes WaterBlock, River et ParticleEmitterNode.

- `folder` (*userdata|nil*) : Dossier de scène ; sans effet si nil.

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteWater.lua`.*
