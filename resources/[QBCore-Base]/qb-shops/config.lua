Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.SellCasinoChips = {
    coords = vector4(950.37, 34.72, 71.87, 33.82),
    radius = 1.5,
    ped = 's_m_y_casino_01'
}

Config.Products = {
    ["normal"] = {
        [1] = {
            name = "tosti",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "kurkakola",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "twerks_candy",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "snikkel_candy",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "sandwich",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "beer",
            price = 7,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "whiskey",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "vodka",
            price = 12,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "bandage",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "rolling_paper",
            price = 2,
            amount = 5,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "chair1",
            price = 10,
            amount = 5000,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "metaldetector", 
            price = 500, 
            amount = 50, 
            info = {}, 
            type = "item", 
            slot = 1,
        },
    },
    ["liquor"] = {
        [1] = {
            name = "beer",
            price = 7,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "whiskey",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vodka",
            price = 12,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    ["hardware"] = {
        [1] = {
            name = "lockpick",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_wrench",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_hammer",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "repairkit",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
            requiredJob = { "mechanic", "police" }
        },
        [5] = {
            name = "screwdriverset",
            price = 350,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "phone",
            price = 850,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "radio",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "firework1",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "firework2",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "firework3",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "firework4",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "fitbit",
            price = 400,
            amount = 150,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "cleaningkit",
            price = 150,
            amount = 150,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "advancedrepairkit",
            price = 500,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
            requiredJob = { "mechanic" }
        },
    },
    ["weedshop"] = {
        [1] = {
            name = "joint",
            price = 200,
            amount = 1000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_poolcue",
            price = 100,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 20,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "empty_weed_bag",
            price = 2,
            amount = 2,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "rolling_paper",
            price = 2,
            amount = 5,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weed_purple-haze_seed",
            price = 2,
            amount = 15,
            info = {},
            type = "item",
            slot = 6,
        },
    },
    ["gearshop"] = {
        [1] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "fishingrod",
            price = 50,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "fishingbait",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    ["leisureshop"] = {
        [1] = {
            name = "parachute",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        -- [4] = {
        --     name = "smoketrailred",
        --     price = 250,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 4,
        -- },
    },
    ["weapons"] = {
        [1] = {
            name = "weapon_knife",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_bat",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_hatchet",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
            requiredJob = { "mechanic", "police" }
        },
        [4] = {
            name = "weapon_snspistol",
            price = 750,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
            requiresLicense = true
        },
        [5] = {
            name = "pistol_ammo",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 5,
            requiresLicense = true
        },
    },
    ["casino"] = {
        [1] = {
            name = 'casinochips',
            price = 1,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 1,
        }
    },
    ["huntingshop"] = {
        [1] = {
            name = 'weapon_musket',
            price = 1500,
            amount = 10,
            info = {},
            type = 'weapon',
            slot = 1,
            requiresLicense = true
        },
        [2] = {
            name = 'shotgun_ammo',
            price = 350,
            amount = 50,
            info = {},
            type = 'item',
            slot = 2,
            requiresLicense = true
        },
        [3] = {
            name = 'huntingbait',
            price = 150,
            amount = 150,
            info = {},
            type = 'item',
            slot = 3
        },
        [4] = {
            name = 'weapon_knife',
            price = 500,
            amount = 50,
            info = {},
            type = 'item',
            slot = 4
        }
    },
}

Config.Locations = {
    ["huntingshop"] = {
        ["label"] = "Avcılık Dükkanı",
        ["type"] = "weapon",
        ["coords"] = vector4(-679.47, 5834.49, 17.33, 127.62),
        ["ped"] = 'ig_hunter',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["huntingshop"],
        ["showblip"] = true,
        ["blipsprite"] = 626,
        ["blipcolor"] = 1
    },
    -- 24/7 Locations
    ["247supermarket"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(24.47, -1346.62, 29.5, 271.66),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket2"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(-3039.54, 584.38, 7.91, 17.27),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket3"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(-3242.97, 1000.01, 12.83, 357.57),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket4"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(1728.07, 6415.63, 35.04, 242.95),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket5"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(1959.82, 3740.48, 32.34, 301.57),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket6"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(549.13, 2670.85, 42.16, 99.39),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket7"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(2677.47, 3279.76, 55.24, 335.08),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket8"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(2556.66, 380.84, 108.62, 356.67),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket9"] = {
        ["label"] = "24/7 Supermarket",
        ["coords"] = vector4(372.66, 326.98, 103.57, 253.73),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- LTD Gasoline Locations
    ["ltdgasoline"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(-47.02, -1758.23, 29.42, 45.05),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["ltdgasoline2"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(-706.06, -913.97, 19.22, 88.04),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["ltdgasoline3"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(-1820.02, 794.03, 138.09, 135.45),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["ltdgasoline4"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(1164.71, -322.94, 69.21, 101.72),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["ltdgasoline5"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(1697.87, 4922.96, 42.06, 324.71),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- Rob's Liquor Locations
    ["robsliquor"] = {
        ["label"] = "Rob's Liqour",
        ["coords"] = vector4(-1221.58, -908.15, 12.33, 35.49),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor2"] = {
        ["label"] = "Rob's Liqour",
        ["coords"] = vector4(-1486.59, -377.68, 40.16, 139.51),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor3"] = {
        ["label"] = "Rob's Liqour",
        ["coords"] = vector4(-2966.39, 391.42, 15.04, 87.48),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor4"] = {
        ["label"] = "Rob's Liqour",
        ["coords"] = vector4(1165.17, 2710.88, 38.16, 179.43),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor5"] = {
        ["label"] = "Rob's Liqour",
        ["coords"] = vector4(1134.2, -982.91, 46.42, 277.24),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Marketi Aç",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- Hardware Store Locations
    ["hardware"] = {
        ["label"] = "Teknoloji Marketi",
        ["coords"] = vector4(45.68, -1749.04, 29.61, 53.13),
        ["ped"] = 'mp_m_waremech_01',
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-wrench",
        ["targetLabel"] = "Teknoloji Marketi",
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402,
        ["blipcolor"] = 0
    },

    ["hardware2"] = {
        ["label"] = "Teknoloji Marketi",
        ["coords"] = vector4(2747.71, 3472.85, 55.67, 255.08),
        ["ped"] = 'mp_m_waremech_01',
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-wrench",
        ["targetLabel"] = "Teknoloji Marketi",
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402,
        ["blipcolor"] = 0
    },

    ["hardware3"] = {
        ["label"] = "Teknoloji Marketi",
        ["coords"] = vector4(-421.83, 6136.13, 31.88, 228.2),
        ["ped"] = 'mp_m_waremech_01',
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-wrench",
        ["targetLabel"] = "Teknoloji Marketi",
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402,
        ["blipcolor"] = 0
    },
    ["ammunation"] = {
        ["label"] = "Silahcı",
        ["type"] = "weapon",
        ["coords"] = vector4(-1118.59, 2700.05, 18.55, 221.89),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Silahları Gör",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },

    -- Weedshop Locations
    ["weedshop"] = {
        ["label"] = "Bitki Dükkanı",
        ["coords"] = vector4(-1171.31, -1570.89, 4.66, 130.03),
        ["ped"] = 'a_m_y_hippy_01',
        ["scenario"] = "WORLD_HUMAN_AA_SMOKE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-cannabis",
        ["targetLabel"] = "Open Weed Shop",
        ["products"] = Config.Products["weedshop"],
        ["showblip"] = true,
        ["blipsprite"] = 140,
        ["blipcolor"] = 0
    },

    -- Sea Word Locations
    ["seaword"] = {
        ["label"] = "Balıkçı",
        ["coords"] = vector4(-1687.03, -1072.18, 13.15, 52.93),
        ["ped"] = 'a_m_y_beach_01',
        ["scenario"] = "WORLD_HUMAN_STAND_IMPATIENT",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-fish",
        ["targetLabel"] = "Balıkçı",
        ["products"] = Config.Products["gearshop"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- Leisure Shop Locations
    ["leisureshop"] = {
        ["label"] = "Eğlence Dükkanı",
        ["coords"] = vector4(-1505.91, 1511.95, 115.29, 257.13),
        ["ped"] = 'a_m_y_beach_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-leaf",
        ["targetLabel"] = "Eğlence Dükkanı",
        ["products"] = Config.Products["leisureshop"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },
}
