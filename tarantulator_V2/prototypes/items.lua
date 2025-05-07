path = "__tarantulator_V2__"

data:extend({
    {
        type = "item-with-entity-data",
        name = 'tarantulator',
        icon = path .. '/graphics/icons/tarantulator.png',
        icon_size = 64,
        subgroup = "transport",
        order = "b[personal-transport]-b[vehicle-tier]-a[tarantulator]",
        place_result = 'tarantulator',
        stack_size = 1,
    },
    {
		type = 'item',
		name = 'tarantulator-reactor',
		flags = {'not-stackable', 'only-in-cursor'},
		icon = path .. '/graphics/icons/nothing.png',
		icon_size = 1,
		stack_size = 1,
		hitten = true,
	},
})