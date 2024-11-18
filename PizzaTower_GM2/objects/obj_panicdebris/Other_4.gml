var lay_id, back_id, lay_id2, back_id2, lay_id3, back_id3;

lay_id = layer_get_id("Backgrounds_1");
back_id = layer_background_get_id(lay_id);
lay_id2 = layer_get_id("Backgrounds_2");
back_id2 = layer_background_get_id(lay_id2);
lay_id3 = layer_get_id("Backgrounds_3");
back_id3 = layer_background_get_id(lay_id3);

if (global.panic == true && layer_background_get_sprite(back_id) == 1766)
    layer_background_sprite(back_id, 1765);

if (global.panic == true && layer_background_get_sprite(back_id) == 1763)
    layer_background_sprite(back_id, 1764);

if (global.panic == true && layer_background_get_sprite(back_id3) == 1770)
    layer_background_sprite(back_id3, 1771);

if (global.panic == true && layer_background_get_sprite(back_id) == 1715)
    layer_background_sprite(back_id, 1717);

if (global.panic == true && layer_background_get_sprite(back_id) == 1719)
    layer_background_sprite(back_id, 1722);

if (global.panic == true && layer_background_get_sprite(back_id2) == 1723)
    layer_background_sprite(back_id2, 1724);

if (global.panic == true && layer_background_get_sprite(back_id) == 1824)
    layer_background_sprite(back_id, 1825);

if (global.panic == true && layer_background_get_sprite(back_id2) == 1822)
    layer_background_sprite(back_id2, 1823);

if (global.panic == true && layer_background_get_sprite(back_id3) == 1818)
    layer_background_sprite(back_id3, 1819);
