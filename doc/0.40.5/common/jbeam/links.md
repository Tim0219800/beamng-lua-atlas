# `jbeam_links`

*File: `lua/common/jbeam/links.lua` · VM: Common (GE + vehicle) · 254 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/links")`

Resolution of references between jbeam rows. In a jbeam file, a column whose name contains ':' (e.g. "id1:", "torqueArm:", or "links:") designates the name of a row in another section (nodes by default if nothing follows the colon, e.g. "nodeArm:"; "id1:nodes" explicit). This module finds these links (prepareLinksDestructive), replaces them with the numeric identifier cid of the target (resolveLinks), and handles the group links "[group]:section" which become the list of cids of the rows belonging to those groups (resolveGroupLinks). This is why beams reference their nodes by number in the final data.

## Notes

- Three forms of links: (a) row column 'name:section' = string value, replaced by the cid of the target (the key 'name:section' is removed and the column 'name' receives the cid); (b) column whose value is a table (list of names), each element is replaced by a cid; (c) section key 'name:section' with a list of names (e.g. torqueReactionNodes:) renamed 'name_section'.
- sectionRenames (e.g. triggers2 -> triggers) is applied to the target section names.
- When a target is not found: warning in the log unless the row carries optional = true (or the key is part of an internal list of optional links such as torqueArm:, nodeArm:, nodeCoupling:...), and the row is removed from its section (entry[rowKey] = nil).
- A non-existent target section causes a warning and the link data is dropped.
- resolveLinks also reindexes each section declared in vehicle.validTables by cid; vehicle.validTables must therefore exist.
- resolveGroupLinks: the column '[g1,g2]:nodes' (group field name in brackets) is replaced by a key '_<field>_<section>' containing the list of cids of the rows whose group field matches; a group field of type string is turned into a list of one string.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_links.prepareLinksDestructive(vehicle, sectionRenames)` | Walks all the vehicle's sections, detects the links, removes the link keys from the rows (modifies vehicle in place) and returns a flat journal of triplets (row or list, key, target row) so that resolveLinks writes the cids. *(internal)* | 15 |
| `jbeam_links.resolveGroupLinks(vehicle)` | Replaces the '[group]:section' columns with lists of cids of rows belonging to the cited groups (key '_group_section'). *(internal)* | 184 |
| `jbeam_links.resolveLinks(vehicle, links)` | Writes the cid of its target into each link then rebuilds the sections of vehicle.validTables by indexing them by cid. *(internal)* | 159 |

### Parameter details

#### `jbeam_links.prepareLinksDestructive(vehicle, sectionRenames)`

Walks all the vehicle's sections, detects the links, removes the link keys from the rows (modifies vehicle in place) and returns a flat journal of triplets (row or list, key, target row) so that resolveLinks writes the cids.

- `vehicle` (*table*) : Vehicle jbeam data (modified in place).
- `sectionRenames` (*table<string, string>*) : Section renames (old name -> new name).
- **returns**: table Flat list of triplets {container, key, targetRow, ...} (indices 1,2,3 then 4,5,6...).

#### `jbeam_links.resolveGroupLinks(vehicle)`

Replaces the '[group]:section' columns with lists of cids of rows belonging to the cited groups (key '_group_section').

- `vehicle` (*table*) : Vehicle jbeam data.
- **returns**: boolean Always true.

#### `jbeam_links.resolveLinks(vehicle, links)`

Writes the cid of its target into each link then rebuilds the sections of vehicle.validTables by indexing them by cid.

- `vehicle` (*table*) : Vehicle jbeam data (with validTables).
- `links` (*table*) : Journal returned by prepareLinksDestructive.
- **returns**: boolean Always true.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/links.lua`.*
