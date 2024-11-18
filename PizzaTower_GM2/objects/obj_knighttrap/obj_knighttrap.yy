{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_knighttrap",
  "spriteId": {
    "name": "spr_kingghost_spike",
    "path": "sprites/spr_kingghost_spike/spr_kingghost_spike.yy"
  },
  "spriteMaskId": {
    "name": "spr_kingghost_spike",
    "path": "sprites/spr_kingghost_spike/spr_kingghost_spike.yy"
  },
  "visible": true,
  "solid": false,
  "persistent": false,
  "managed": false,
  "parentObjectId": {
    "name": "obj_trap",
    "path": "objects/obj_trap/obj_trap.yy"
  },
  "eventList": [
    {
      "resourceType": "GMEvent",
      "resourceVersion": "1.0",
      "name": "",
      "isDnD": false,
      "eventNum": 0,
      "eventType": 0,
      "collisionObjectId": null
    },
    {
      "resourceType": "GMEvent",
      "resourceVersion": "1.0",
      "name": "",
      "isDnD": false,
      "eventNum": 2,
      "eventType": 3,
      "collisionObjectId": null
    },
    {
      "resourceType": "GMEvent",
      "resourceVersion": "1.0",
      "name": "",
      "isDnD": false,
      "eventNum": 0,
      "eventType": 4,
      "collisionObjectId": {
        "name": "obj_player",
        "path": "objects/obj_player/obj_player.yy"
      }
    }
  ],
  "properties": [],
  "parent": {
    "name": "Objects",
    "path": "folders/Objects.yy"
  }
}