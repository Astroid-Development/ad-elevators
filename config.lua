Config = {}

-- Debug Options
DeleteZonesOnRestart = true -- For debuging, will delete the polyzones when you restart the script
ShowElevatorZones = true

-- Config Options
VehicleTeleport = true -- Allows Vehicle Teleportation
UseRadialMenu = true -- By default uses qb-target, or alternativly you can use the radial menu

TargetPolyZones = { -- zone is important, used to determine which elevator you're accessing, and the polyzone name is used to determine which floor you're currently on
    -- Pillbox Polyzones
    [1] = {coords = vector3(332.04, -597.24, 43.28), name = "Pillbox Upper", length = 0.2, width = 0.2, heading = 340, minz = 43.48, maxz = 43.73, distance = 2, zone = "Pillbox"}, -- Pillbox Medical Upper
    [2] = {coords = vector3(344.71, -584.69, 28.8), name = "Pillbox Lower", length = 0.2, width = 0.06, heading = 340, minz = 29.0, maxz = 29.25, distance = 2, zone = "Pillbox"}, -- Pillbox Medical Lower
    [3] = {coords = vector3(339.68, -586.2, 28.8), name = "Pillbox Garage", length = 0.2, width = 0.2, heading = 340, minz = 29.0, maxz = 29.25, distance = 2, zone = "Pillbox"}, -- Pillbox Medical Garage
    [4] = {coords = vector3(338.1, -583.7, 74.16), name = "Pillbox Roof", length = 3.4, width = 0.3, heading = 339, minz = 73.16, maxz = 75.46, distance = 2, zone = "Pillbox"}, -- Pillbox Medical Roof
    -- Casino Polyzones
    [5] = {coords = vector3(967.92, 8.09, 81.16), name = "Casino Garage", length = 0.15, width = 0.2, heading = 330, minz = 81.21, maxz = 81.51, distance = 2, zone = "Casino"}, -- Casino Garage
    [6] = {coords = vector3(964.51, 57.52, 112.55), name = "Casino Roof", length = 0.2, width = 0.2, heading = 329, minz = 112.45, maxz = 112.75, distance = 2, zone = "Casino"}, -- Casino Roof
    [7] = {coords = vector3(982.32, 53.72, 116.16), name = "Casino Penthouse", length = 0.2, width = 0.15, heading = 328, minz = 116.21, maxz = 116.51, distance = 2, zone = "Casino"}, -- Casino Roof
    -- Arcadius Polyzones
    [8] = {coords = vector3(-117.56, -604.32, 36.28), name = "Arcadius Main", length = 10.0, width = 1, heading = 340, minz = 35.28, maxz = 39.48, distance = 2,  zone = "Arcadius"}, -- Arcadius Lower
    [9] = {coords = vector3(-138.99, -619.8, 168.82), name = "Arcadius Office", length = 0.2, width = 0.6, heading = 5, minz = 168.82, maxz = 169.22, distance = 2,  zone = "Arcadius"}, -- Arcadius Office
    [10] = {coords = vector3(-140.19, -586.28, 167.0), name = "Arcadius Shop", length = 0.2, width = 0.2, heading = 311, minz = 167.05, maxz = 167.4, distance = 2,  zone = "Arcadius"}, -- ArcadiusShop
    [11] = {coords = vector3(-144.12, -576.46, 32.42), name = "Arcadius Garage Entrance", length = 8.4, width = 4.4, heading = 340, minz = 31.42, maxz = 34.62, distance = 10, zone = "Arcadius"}, -- ArcadiusGarage
    [12] = {coords = vector3(-198.89, -581.78, 136.0), name = "Arcadius Garage", length = 0.2, width = 0.2, heading = 10, minz = 136.05, maxz = 136.35, distance = 2, zone = "Arcadius"}, -- Arcadius Garage Upper
}

RadialPolyZones = { -- These are for radial menu usage/draw text. Same as above zone, and the name determines which elevator is being opened and floor. If you're not using the radial menu option and don't really care about the draw text, then you don't need to add the zones here
    -- Pillbox BoxZones
    [1] = {coords = vector3(331.22, -595.3, 43.28), name = "Pillbox Upper", length = 2.6, width = 2.8, heading = 340, minz = 42.28, maxz = 44.68, zone = "Pillbox"}, -- Pillbox Medical Upper
    [2] = {coords = vector3(345.61, -586.64, 28.8), name = "Pillbox Lower", length = 2.6, width = 2.8, heading = 341, minz = 27.8, maxz = 30.2, zone = "Pillbox"}, -- Pillbox Medical Lower
    [3] = {coords = vector3(339.61, -584.27, 74.16), name = "Pillbox Roof", length = 2.6, width = 2.8, heading = 339, minz = 73.16, maxz = 75.56, zone = "Pillbox"}, -- Pillbox Medical Roof
    [4] = {coords = vector3(338.75, -584.21, 28.8), name = "Pillbox Garage", length = 2.6, width = 2.8, heading = 340, minz = 27.8, maxz = 30.2, zone = "Pillbox"}, -- Pillbox Medical Garage
    -- Casino Polyzones
    [5] = {coords = vector3(966.16, 8.07, 81.16), name = "Casino Garage", length = 2.6, width = 2.8, heading = 330, minz = 80.16, maxz = 82.56, zone = "Casino"}, -- Casino Garage
    [6] = {coords = vector3(963.84, 59.24, 112.55), name = "Casino Roof", length = 2.6, width = 2.8, heading = 330, minz = 111.55, maxz = 113.95, zone = "Casino"}, -- Casino Roof
    [7] = {coords = vector3(982.27, 55.25, 116.16), name = "Casino Penthouse", length = 2.4, width = 2.0, heading = 328, minz = 115.16, maxz = 117.56, zone = "Casino"}, -- Casino Roof
    -- Arcadius Polyzones
    [8] = {coords = vector3(-115.83, -605.05, 36.28), name = "Arcadius Main", length = 2.6, width = 2.8, heading = 340, minz = 35.28, maxz = 39.28, zone = "Arcadius"}, -- Arcadius Lower
    [9] = {coords = vector3(-140.34, -620.85, 168.82), name = "Arcadius Office", length = 2.6, width = 2.8, heading = 275, minz = 167.82, maxz = 170.42, zone = "Arcadius"}, -- Arcadius Office (Fix min/max)
    [10] = {coords = vector3(-139.62, -588.97, 167.0), name = "Arcadius Shop", length = 4.6, width = 2.8, heading = 40, minz = 166.0, maxz = 169.2, zone = "Arcadius"}, -- Arcadius Shop
    [11] = {coords = vector3(-144.11, -576.3, 32.42), name = "Arcadius Garage Entrance", length = 8.4, width = 4.4, heading = 340, minz = 31.22, maxz = 34.62, zone = "Arcadius"}, -- Arcadius Garage Lower
    [12] = {coords = vector3(-197.45, -580.45, 136.0), name = "Arcadius Entrance", length = 2.6, width = 2.8, heading = 8, minz = 135.0, maxz = 138.0, zone = "Arcadius"}, -- Arcadius Garage Upper
}

Elevators = {
    ["Pillbox"] = {Name = "Pillbox Medical Elevator:", WaitTime = 5000, Floors = {
            [1] = {
                menuheader = "Pillbox Main:",
                menutxt = "Take the elevator to Upper Pillbox",
                pbtxt = "Taking Elevator to Upper Pillbox",
                coords = vector3(331.56, -595.34, 43.28),
                heading = 69.57,
            },
            [2] = {
                menuheader = "Pillbox Lower:",
                menutxt = "Take the elevator to Lower Pillbox",
                pbtxt = "Taking Elevator to Lower Pillbox",
                coords = vector3(344.6, -586.18, 28.8),
                heading = 244.75,
            },
        }
    },
    ["Casino"] = {Name = "Casino Elevator:", WaitTime = 5000, Floors = {
            [1] = {
                menuheader = "Casino Roof:",
                menutxt = "Take the elevator to Casino Roof",
                pbtxt = "Taking Elevator to Casino Roof",
                coords = vector3(964.49, 58.96, 112.55),
                heading = 55.62,
            },
            [2] = {
                menuheader = "Casino Garage:",
                menutxt = "Take the elevator to Casino Garage",
                pbtxt = "Taking Elevator to Casino Garage",
                coords = vector3(966.79, 7.82, 81.16),
                heading = 60.78,
            },
        }
    }
}

Restricted = {
    ["Pillbox"] = {
        Locked = {"ambulance", "police"}, WaitTime = 5000, Floors = {
            [1] = {
                menuheader = "Pillbox Roof:",
                menutxt = "Take the elevator to Pillbox Roof",
                pbtxt = "Taking Elevator to Pillbox Roof",
                coords = vector3(338.93, -584.03, 74.16),
                heading = 249.23,
            },
            [2] = {
                menuheader = "Pillbox Garage:",
                menutxt = "Take the elevator to Pillbox Garage",
                pbtxt = "Taking Elevator to Pillbox Garage",
                coords = vector3(339.69, -584.52, 28.8),
                heading = 69.11,
            },
        }
    },
    ["Casino"] = {Item = {"casino_vip"}, WaitTime = 5000, Floors = {
            [1] = {
                menuheader = "Casino Penthouse:",
                menutxt = "Take the elevator to Casino Penthouse",
                pbtxt = "Taking Elevator to Casino Penthouse",
                coords = vector3(981.78, 54.55, 116.16),
                heading = 336.47,
            },
        }
    },
    ["Arcadius"] = {Locked = {"importgarage"}, WaitTime = 5000, Floors = {
            [1] = {
                menuheader = "Arcadius Office:",
                menutxt = "Take the elevator to the office",
                pbtxt = "Taking Elevator to Arcadius Office",
                coords = vector3(-139.36, -620.55, 168.82),
                heading = 102.58,
            },
            [2] = {
                menuheader = "Arcadius Ground Floor:",
                menutxt = "Take the elevator to lobby",
                menutxt = "Taking Elevator to Arcadius Lobby",
                coords = vector3(-116.51, -604.81, 36.28),
                heading = 252.2,
            },
            [3] = {
                menuheader = "Arcadius Garage 1A:",
                menutxt = "Take the elevator to Garage 1A",
                pbtxt = "Taking Elevator to Garage 1A",
                coords = vector3(-197.68, -580.62, 136.0),
                heading = 280.08,
                vehcoords = vector3(-190.51, -583.08, 136.0),
                vehheading = 2.09,
            },
            [4] = {
                menuheader = "Arcadius Parking Garage:",
                menutxt = "Take the elevator to Parking Garage",
                pbtxt = "Taking Elevator to Parking Garage",
                coords = vector3(-144.09, -576.67, 31.78),
                heading = 245.23,
                vehcoords = vector3(-144.38, -576.88, 32.42),
                vehheading = 155.17,
            },
            [5] = {
                menuheader = "Arcadius Shop:",
                menutxt = "Take the elevator to Arcadius Shop",
                pbtxt = "Taking Elevator to Arcadius Shop",
                coords = vector3(-139.25, -588.46, 167.0),
                heading = 130.03,
                vehcoords = vector3(-141.9, -590.69, 167.0),
                vehheading = 127.19,
            },
        }
    },
}

GradedAccess = {
    ["Pillbox"] = {
        [4] = {Locked = {"ambulance", "police"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Chief Floor:",
                    menutxt = "Take the elevator to Pillbox Roof",
                    pbtxt = "Taking Elevator to Pillbox Roof",
                    coords = vector3(338.55, -583.95, 74.16),
                    heading = 245.23,
                },
            }
        },
        [3] = {Locked = {"ambulance", "police"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Surgeon Floor:",
                    menutxt = "Take the elevator to Pillbox Roof",
                    pbtxt = "Taking Elevator to Pillbox Roof",
                    coords = vector3(338.55, -583.95, 74.16),
                    heading = 245.23,
                },
            }
        },
        [2] = {Locked = {"ambulance", "police"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Doctor Floor:",
                    menutxt = "Take the elevator to Pillbox Roof",
                    pbtxt = "Taking Elevator to Pillbox Roof",
                    coords = vector3(338.55, -583.95, 74.16),
                    heading = 245.23,
                },
            }
        },
        [1] = {Locked = {"ambulance", "police"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Paramedic Floor:",
                    menutxt = "Take the elevator to Pillbox Roof",
                    pbtxt = "Taking Elevator to Pillbox Roof",
                    coords = vector3(338.55, -583.95, 74.16),
                    heading = 245.23,
                },
            }
        },
        [0] = {Locked = {"ambulance", "police"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Recruit Floor:",
                    menutxt = "Take the elevator to Pillbox Roof",
                    pbtxt = "Taking Elevator to Pillbox Roof",
                    coords = vector3(338.55, -583.95, 74.16),
                    heading = 245.23,
                },
            }
        },
    }
}