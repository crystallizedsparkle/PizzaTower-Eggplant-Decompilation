if (global.timeattack == true)
    instance_destroy();

if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy();

if (content == 539 && global.shroomfollow)
    instance_destroy();

if (content == 540 && global.cheesefollow)
    instance_destroy();

if (content == 541 && global.tomatofollow)
    instance_destroy();

if (content == 542 && global.sausagefollow)
    instance_destroy();

if (content == 543 && global.pineapplefollow)
    instance_destroy();

if (global.snickchallenge == true)
    instance_destroy();
