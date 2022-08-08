![head.png](https://i.imgur.com/TYLJbjH.jpeg)
#
<h2 align="center"> MB Elevators:</h2>

<p align="center">
<a href="https://www.discord.gg/cHd2cvMYZF"><img src="https://img.shields.io/discord/979284356730327070?color=d63f50&label=Our%20Discord:&labelColor=000000&logo=discord&logoColor=FFFFFF&style=flat-square"></a>
<a href="https://github.com/MB-Development2022"><img src="https://img.shields.io/github/followers/MB-Development2022?color=d63f50&label=Follow:&labelColor=000000&logo=github&logoColor=FFFFFF&style=flat-square"></a>
<a href="https://https://github.com/MB-Development2022/mb-elevators"><img src="https://shields-io-visitor-counter.herokuapp.com/badge?page=MB-Development2022/mb-elevators&label=Visitors:&labelColor=000000&logo=GitHub&logoColor=FFFFFF&color=d63f50&style=flat-square"></a>
</p>

#
<h2 align="center"> Dependencies:</h2>

<p align="center">
<a href="https://github.com/qbcore-framework/qb-core"><img src="https://img.shields.io/badge/-QB%20Core-000000?style=flat-square&logo=github&logoColor=white"></a>
<a href="https://github.com/qbcore-framework/qb-menu"><img src="https://img.shields.io/badge/-QB%20Menu-000000?style=flat-square&logo=github&logoColor=white"></a>
<a href="https://github.com/qbcore-framework/PolyZone"><img src="https://img.shields.io/badge/-PolyZone-000000?style=flat-square&logo=github&logoColor=white"></a>
<a href="https://github.com/qbcore-framework/qb-target"><img src="https://img.shields.io/badge/-PolyZone-000000?style=flat-square&logo=github&logoColor=white"></a>
</p>

#

<p align="center">
A simple elevator script that's easy to configure and add new locations too. If you have any issues with the script, or just wanna come out hang out, join our discord above!
</p>

<p align="center">
* Toggles for deleting zones on script restart (Useful for adding new floors)  
* Toggle to show all elevator zones  
* Toggle vehicle teleport on/off  
* Toggle qb-target or radial menu use  
* There are 3 different elevator types, public floors, restricted floors (which you can lock to jobs/gangs/citizenids/items), and job/grade restricted floors  
</p>

#
<h2 align="center"> Making New Elevators:</h2>

#
<h2 align="center"> New PolyZones: </h2>
<p align="center"> To add new polyzones copy the template, change out all the coordinates, change the ZoneName, and the important part is the zone. That is used for determining what elevator zone you're using!</p>

    [1] = {coords = vector3(x, y, z), name = "ZoneName", length = 0, width = 0, heading = 0, minz = 0, maxz = 0, distance = 0,  zone = "Zone"},

#
<h2 align="center"> New Floors: </h2>
<p align="center"> To add new floors copy the template, change all the information to your liking and change the the number</p>

    [1] = {
        menuheader = "Change Me:",
        menutxt = "Take the elevator to Floor Name",
        pbmsg = "Taking Elevator to Floor Name",
        coords = vector3(x, y, z),
        heading = Heading,
    },

<h2 align="center"> Example: </h2>

    [1] = {
        menuheader = "Pillbox Main:",
        menutxt = "Take the elevator to Upper Pillbox",
        pbtxt = "Taking Elevator to Upper Pillbox",
        coords = vector3(332.17, -595.57, 43.28),
        heading = 70.51,
    },

#
<h2 align="center"> New Zones: </h2>
<p align="center"> To add a new zone copy the template, change all the information to your liking</p>

    ["ZoneName"] = {Name = "Change Me:", WaitTime = 5000, Floors = { 
            [1] = {
                menuheader = "Floor Name:",
                menutxt = "Take the elevator to Floor Name",
                pbtxt = "Taking Elevator to Floor Name",
                coords = vector3(x, y, z),
                heading = Heading,
            },
        }
    }

<h2 align="center"> Example: </h2>

        ["Casino"] = {Name = "Casino Elevator:", WaitTime = 5000, Floors = {
            [1] = {
                menuheader = "Casino Roof:",
                menutxt = "Take the elevator to Casino Roof",
                pbtxt = "Taking Elevator to Casino Roof",
                coords = vector3(965.01, 58.57, 112.55),
                heading = 59.46,
            },
        }
    }

#
<h2 align="center"> New Grade Zones: </h2>
<p align="center"> To add a new grade zone copy the template, change all the information to your liking</p>

        ["ZoneName"] = {
        [4] = {Locked = {"ambulance"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Floor Name:",
                    menutxt = "Take the elevator to Floor Name",
                    pbtxt = "Taking Elevator to Floor Name",
                    coords = vector3(x, y, z),
                    heading = Heading,
                },
            }
        },
        [3] = {Locked = {"ambulance"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Floor Name:",
                    menutxt = "Take the elevator to Floor Name",
                    pbtxt = "Taking Elevator to Floor Name",
                    coords = vector3(x, y, z),
                    heading = Heading,
                },
            }
        },
        [2] = {Locked = {"ambulance"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Floor Name:",
                    menutxt = "Take the elevator to Floor Name",
                    pbtxt = "Taking Elevator to Floor Name",
                    coords = vector3(x, y, z),
                    heading = Heading,
                },
            }
        },
        [1] = {Locked = {"ambulance"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Floor Name:",
                    menutxt = "Take the elevator to Floor Name",
                    pbtxt = "Taking Elevator to Floor Name",
                    coords = vector3(x, y, z),
                    heading = Heading,
                },
            }
        },
        [0] = {Locked = {"ambulance"}, WaitTime = 5000, Floors = {
                [1] = {
                    menuheader = "Floor Name:",
                    menutxt = "Take the elevator to Floor Name",
                    pbtxt = "Taking Elevator to Floor Name",
                    coords = vector3(x, y, z),
                    heading = Heading,
                },
            }
        },
    }

<h2 align="center"> Example: </h2>

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

#

<p align="center"> If you're using VehicleTeleport then you'll need to add vehcoods and vehheading to the floor:</p>

    [1] = {
        menuheader = "Pillbox Roof:",
        menutxt = "Take the elevator to Pillbox Roof",
        pbtxt = "Taking Elevator to Pillbox Roof",
        coords = vector3(338.55, -583.95, 74.16),
        vehcoords = vector3(338.55, -583.95, 74.16),
        vehheading = 245.23,
        heading = 245.23,
    },


<p align="center"> You can also lock the floors to items! Here's an example:</p>

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

#

<p align="center">  

[Preview:](https://i.imgur.com/TYLJbjH.jpeg)  

</p>











