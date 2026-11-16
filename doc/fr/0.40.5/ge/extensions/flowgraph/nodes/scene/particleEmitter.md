# `flowgraph_nodes_scene_particleEmitter`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua` · VM : Game Engine (GE) · 153 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/particleEmitter")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Particle Emitter » (repeat_instant, auteur BeamNG). Cree un objet ParticleEmitterNode (emetteur BNGP_confetti, dataBlock lightExampleEmitterNodeData1) ajoute au MissionGroup et le positionne. Entrees : clear (impulsion), position (vec3), rotation (quat), color. Sortie : flow.

## Remarques

- Bug : _afterTrigger appelle self:hideobject() (minuscule) alors que la methode est hideObject : erreur Lua si cette branche s'execute.
- Bug : fillFields lit self.pinIn.radius, mais aucun pin 'radius' n'est declare dans pinSchema.
- Bug : setPosition teste self.object.objBase qui n'est jamais defini : la position n'est donc jamais appliquee.
- Les pins rotation et color ne sont pas utilises par le code.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Apres le declenchement : si le flow d'entree est false et que l'emetteur est affiche, tente de le cacher. | 77 |
| `C:_executionStopped()` | A l'arret : retire l'objet de l'arbre de l'editeur si possible, le supprime et remet l'etat a zero. | 83 |
| `C:createObject(objectName)` | Cree le ParticleEmitterNode (canSave = false) et l'enregistre sous le nom donne. | 33 |
| `C:destroy()` | Appele a la destruction du noeud : supprime l'emetteur. | 147 |
| `C:fillFields()` | Lit position/radius/color des pins avec des valeurs par defaut (rayon 2, couleur {1,0,0,0.8}). | 96 |
| `C:hideObject()` | Cache l'objet (hidden = true) et met shown a false. | 69 |
| `C:init(mgr, ...)` | Initialise position, radius, clr, object et shown. | 24 |
| `C:onClientEndMission()` | Hook de fin de mission : supprime l'emetteur. | 142 |
| `C:setPosition()` | Positionne et met a l'echelle (radius, radius, 50) l'objet. | 109 |
| `C:showObject()` | Affiche l'objet existant ou le cree (nom particles__<time>_<id>) et l'ajoute a scenetree.MissionGroup. | 49 |
| `C:work()` | Cree/affiche l'emetteur ; sur flow, le montre et le positionne (flow sortie true) ; sur clear, le cache (flow sortie false). | 122 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua`.*
