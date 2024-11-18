{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_pinballtrap",
  "spriteId": {
    "name": "spr_kingghost_pinball",
    "path": "sprites/spr_kingghost_pinball/spr_kingghost_pinball.yy"
  },
  "spriteMaskId": {
    "name": "spr_kingghost_pinball",
    "path": "sprites/spr_kingghost_pinball/spr_kingghost_pinball.yy"
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
    },
    {
      "resourceType": "GMEvent",
      "resourceVersion": "1.0",
      "name": "",
      "isDnD": false,
      "eventNum": 4,
      "eventType": 7,
      "collisionObjectId": null
    }
  ],
  "properties": [],
  "parent": {
    "name": "Objects",
    "path": "folders/Objects.yy"
  }
}