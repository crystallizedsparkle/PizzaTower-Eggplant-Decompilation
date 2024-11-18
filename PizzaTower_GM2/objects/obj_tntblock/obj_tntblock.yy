{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_tntblock",
  "spriteId": {
    "name": "spr_tntblock",
    "path": "sprites/spr_tntblock/spr_tntblock.yy"
  },
  "spriteMaskId": null,
  "visible": true,
  "solid": false,
  "persistent": false,
  "managed": false,
  "parentObjectId": {
    "name": "obj_solid",
    "path": "objects/obj_solid/obj_solid.yy"
  },
  "eventList": [
    {
      "resourceType": "GMEvent",
      "resourceVersion": "1.0",
      "name": "",
      "isDnD": false,
      "eventNum": 0,
      "eventType": 1,
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
        "name": "obj_bombexplosion",
        "path": "objects/obj_bombexplosion/obj_bombexplosion.yy"
      }
    },
    {
      "resourceType": "GMEvent",
      "resourceVersion": "1.0",
      "name": "",
      "isDnD": false,
      "eventNum": 0,
      "eventType": 4,
      "collisionObjectId": {
        "name": "obj_firemouth_projectile",
        "path": "objects/obj_firemouth_projectile/obj_firemouth_projectile.yy"
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