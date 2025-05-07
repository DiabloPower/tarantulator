local path = "__tarantulator_V2__"

data:extend({
    {
        name = 'tarantulator-ammo',
        type = 'ammo-category',
    },
    {
        type = 'ammo',
        name = 'tarantulator-railgun-shell',
        subgroup = 'ammo',
        icon = path .. '/graphics/icons/railgun-ammo.png',
        icon_size = 64, icon_mipmaps = 4,
        flags = nil,
        order = 'd[explosive-cannon-shell]-d[tarantulator]',
        stack_size = 100,
        magazine_size = 1,
        reload_time = 0,
        ammo_category = 'tarantulator-ammo',
        ammo_type = {
            action = {
                type = 'line',
                range = 200,
                width = 2,
                source_effects = {
                    entity_name = 'tarantulator-beam',
                    type = 'create-explosion',
                    offsets = {{-0.5, 2}},
                },
                action_delivery = {
                    type = 'projectile',
                    projectile = 'tarantulator-railgun-shell',
                    starting_speed = 4.0,
                    target_effects = {
                        {
                            entity_name = 'big-explosion',
                            type = 'create-entity',
                        },
                        {
                            type = 'damage',
                            damage = { amount = 4000, type = 'physical' },
                        },
                    }
                }
            }
        }
    }
})