data:extend({
    {
        type = "bool-setting",
        name = "tarantulator-enable-friendly-fire",
        setting_type = "startup",
        default_value = false,
        order = "a-a"
    },
    {
        type = "string-setting",
        name = "tarantulator-disable-burner-engine",
        setting_type = "startup",
        allowed_values = {"void", "burner"},
        default_value = "burner",
        order = "a-b"
    },
    {
        type = "int-setting",
        name = "tarantulator-engine-efficiency",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 1,
        maximum_value = 1000,
        order = "a-b"
    },
    {
        type = "int-setting",
        name = "tarantulator-energy-grid-efficiency",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 1,
        maximum_value = 1000,
        order = "a-c"
    },
    {
        type = "string-setting",
        name = "tarantulator-tech-option",
        setting_type = "startup",
        allowed_values = {"default", "early-tarantulator"},
        default_value = "default",
        order = "a-d"
    },
    {
        type = "string-setting",
        name = "tarantulator-assauslt-spidertron-integration",
        setting_type = "startup",
        allowed_values = {"default", "assault-spidertron"},
        default_value = "default",
        order = "a-f"
    },  
    {
        type = "string-setting",
        name = "tarantulator-cycle-weapons",
        setting_type = "startup",
        allowed_values = {"no", "yes"},
        default_value = "no",
        order = "a-g"
    },
    {
        type = "bool-setting",
        name = "tarantulator-enable-gun-rocket-launcher",
        setting_type = "startup",
        default_value = true,
        order = "b-a"
    },
    {
        type = "string-setting",
        name = "tarantulator-rocket-launcher-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "4",
        order = "b-b"
    },
    {
        type = "bool-setting",
        name = "tarantulator-enable-gun-railgun",
        setting_type = "startup",
        default_value = true,
        order = "b-c"
    },
    {
        type = "string-setting",
        name = "tarantulator-railgun-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-d"
    },
})