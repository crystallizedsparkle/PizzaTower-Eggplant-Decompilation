{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_destructible_goblinraid",
  "spriteId": {
    "name": "sprite1030",
    "path": "sprites/sprite1030/sprite1030.yy"
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
      "eventType": 0,
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
        "name": "obj_canonexplosion",
        "path": "objects/obj_canonexplosion/obj_canonexplosion.yy"
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