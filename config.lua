Config = {}

-- Practice garages
Config.Garages = {
        ['mirror_park'] = {
            label = 'Mirror Park Garage',
            coords = vector3(1025.52, -764.34, 57.97),
            job = nil,      -- No job restriction
            gang = nil,     -- No gang restriction
            owner = nil     -- Owner can be dynamically set
        },
        ['police main'] = {
            label = 'SASP Motor Pool',
            coords = vector3(450.12, -975.51, 25.7),
            job = 'police',     -- Only police can access
            gang = nil,
            owner = nil 
        },
        ['vagos_hideout'] = {
            label = 'Vagos Garage', 
            coords = vector3(335.22, -2035.3, 21.0),
            job = nil,
            gang = 'vagos',
            owner = nil,
        }
}