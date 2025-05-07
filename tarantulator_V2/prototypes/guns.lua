path = "__tarantulator_V2__"

data:extend({
{
    type = 'gun',
    name = 'tarantulator-railgun',
    icon = path .. '/graphics/icons/railgun.png',
    icon_size = 64, icon_mipmaps = 4,
    flags = {'not-stackable'},
    hidden = true,
    stack_size = 1,
    attack_parameters = {
        type = "projectile",
        range = 50,
        min_range = 8,
        cooldown = 140,
        ammo_category = "tarantulator-ammo",
        projectile_creation_distance = 8,
        projectile_center = {0, 0},
        sound = {
            {
                filename = path .. "/sound/big-gun.ogg",
                volume = 4,
                audible_distance_modifier = 10,
            }
        },
        projectile_tint = {0.3, 1, 0.3},
        explosion = "tarantulator-beam"
    }    
}
})