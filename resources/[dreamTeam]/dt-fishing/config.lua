Config = {}

Config.Debug = false
Config.JobBusy = false

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.MarkerData = {
    ["type"] = 6,
    ["size"] = vector3(2.0, 2.0, 2.0),
    ["color"] = vector3(0, 255, 150)
}

Config.FishingRestaurant = {
    ["name"] = "Mavi Cennet Restoran",
    ["blip"] = {
        ["sprite"] = 628,
        ["color"] = 3
    },
    ["ped"] = {
        ["model"] = 0xED0CE4C6,
        ["position"] = vector3(-1821.3996582031, -1219.5196533203, 12.017418861389),
        ["heading"] = 75.0
    }
}


Config.FishingItems = {
    ["rod"] = {
        ["name"] = "fishingrod",
        ["label"] = "Olta"
    },
    ["bait"] = {
        ["name"] = "fishingbait",
        ["label"] = "Yem"
    },
    ["fish"] = {
        ["price"] = 7 
    },
    ["stripedbass"] = {
        ["price"] = 6
    },
    ["bluefish"] = {
        ["price"] = 6
    },
    ["redfish"] = {
        ["price"] = 7
    },
    ["pacifichalibut"] = {
        ["price"] = 30
    },
    ["goldfish"] = {
        ["price"] = 75
    },
    ["largemouthbass"] = {
        ["price"] = 22
    },
    ["salmon"] = {
        ["price"] = 10
    },
    ["catfish"] = {
        ["price"] = 45
    },
    ["tigersharkmeat"] = {
        ["price"] = 55
    },
    ["stingraymeat"] = {
        ["price"] = 60
    },
    ["killerwhalemeat"] = {
        ["price"] = 80
    },
}

Config.FishingZones = {
    {
        ["name"] = "Beach Fishing",
        ["coords"] = vector3(-1948.1279296875, -749.79125976563, 2.5400819778442),
        ["radius"] = 50.0,
    },
    {
        ["name"] = "Beach Fishing",
        ["coords"] = vector3(-3428.44, 967.26, 8.35),
        ["radius"] = 50.0,
    },
    {
        ["name"] = "Sandy Fishing",
        ["coords"] = vector3(1525.0518798828, 3908.9050292969, 30.799766540527),
        ["radius"] = 50.0,
    },
    {
        ["name"] = "Sandy Fishing",
        ["coords"] = vector3(2223.6940917969, 4575.70703125, 31.233570098877),
        ["radius"] = 50.0,
    },
    {
        ["name"] = "Sandy Fishing",
        ["coords"] = vector3(31.989250183105, 4294.7797851563, 31.231893539429),
        ["radius"] = 50.0,
    },
    {
        ["name"] = "ocean Fishing",
        ["coords"] = vector3(-1835.0385742188, -1820.4168701172, 3.6758048534393),
        ["radius"] = 200.0,
    },
    {
        ["name"] = "ocean Fishing",
        ["coords"] = vector3(-722.52124023438, 7188.6108398438, 1.8514842987061),
        ["radius"] = 200.0,
    },
    {
        ["name"] = "ocean Fishing",
        ["coords"] = vector3(3469.1770019531, 1271.2962646484, 1.366447687149),
        ["radius"] = 200.0,
    },
    {
        ["name"] = "ocean Fishing",
        ["coords"] = vector3(-3277.4191894531, 2613.3405761719, 1.6248697042465),
        ["radius"] = 200.0,
    },
    {
        ["name"] = "special0",
        ["coords"] = vector3(7040.34, 8172.63, 204.435),
        ["radius"] = 500.0,
        ["secret"] = true,
    },
    {
        ["name"] = "special1",
        ["coords"] = vector3(3194.11121337885, 906.8347851562501, 442.03224151611005),
        ["radius"] = 10.0,
        ["secret"] = true,
    },
    {
        ["name"] = "special2",
        ["coords"] = vector3(-3081.5139697266004, 4007.4116894532, 201.00122415304185),
        ["radius"] = 10.0,
        ["secret"] = true,
    },
    {
        ["name"] = "special3",
        ["coords"] = vector3(-2523.3720629883, 7160.87897460945, 200.27662748873234),
        ["radius"] = 10.0,
        ["secret"] = true,
    },
    {
        ["name"] = "special4",
        ["coords"] = vector3(250.32162254333554, 1483.387672119135, 496.65704315185496),
        ["radius"] = 10.0,
        ["secret"] = true,
    }
}
