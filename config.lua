ADElevators = {
	Debug = {
		DeleteZonesOnRestart = true,
		ShowElevatorZones = false
	},
	Config = {
		Target = {
			UseTarget = false,
			DrawText = true
		},
		Teleport = {
			VehicleTeleport = true,
			WaitTime = 3000,
			Fade = 2000
		},
		Animation = {
			Dict = "anim@apt_trans@elevator",
			Anim = "elev_1"
		}
	},
	Elevators = {
		{
			Name = "Pillbox Medical Elevator:",
			Zone = "Pillbox",
			Zones = {
				{coords = vec4(331.22, -595.3, 43.28, 340), name = "Pillbox Upper", length = 2.6, width = 2.8, minz = 42.28, maxz = 44.68},
				{coords = vec4(345.61, -586.64, 28.8, 341), name = "Pillbox Lower", length = 2.6, width = 2.8, minz = 27.8, maxz = 30.2},
				{coords = vec4(339.61, -584.27, 74.16, 339), name = "Pillbox Roof", length = 2.6, width = 2.8, minz = 73.16, maxz = 75.56},
				{coords = vec4(338.75, -584.21, 28.8, 340), name = "Pillbox Garage", length = 2.6, width = 2.8, minz = 27.8, maxz = 30.2},
			},
			Floors = {
				{
					Header = "Pillbox Upper",
					Description = "Take the elevator to Upper Pillbox",
					Progressbar = "Taking Elevator to Upper Pillbox",
					TeleportCoords = vec4(331.56, -595.34, 43.28, 69.57),
				},
				{
					Header = "Pillbox Lower",
					Description = "Take the elevator to Lower Pillbox",
					Progressbar = "Taking Elevator to Lower Pillbox",
					TeleportCoords = vec4(344.6, -586.18, 28.8, 244.75),
				},
				{
					Header = "Pillbox Roof",
					Description = "Take the elevator to Pillbox Roof",
					Progressbar = "Taking Elevator to Pillbox Roof",
					TeleportCoords = vec4(338.93, -584.03, 74.16, 249.23),
					Locked = {["ambulance"] = 4, ["police"] = 4}
				},
				{
					Header = "Pillbox Garage",
					Description = "Take the elevator to Pillbox Garage",
					Progressbar = "Taking Elevator to Pillbox Garage",
					TeleportCoords = vec4(339.69, -584.52, 28.8, 69.11),
					Locked = {["ambulance"] = 4, ["police"] = 4}
				},
			}
		},
		{
			Name = "Casino Elevator:", 
			Zone = "Casino",
			Zones = {
				{coords = vec4(966.16, 8.07, 81.16, 330), name = "Casino Garage", length = 2.6, width = 2.8, minz = 80.16, maxz = 82.56},
				{coords = vec4(963.84, 59.24, 112.55, 330), name = "Casino Roof", length = 2.6, width = 2.8, minz = 111.55, maxz = 113.95},
				{coords = vec4(982.27, 55.25, 116.16, 328), name = "Casino Penthouse", length = 2.4, width = 2.0, minz = 115.16, maxz = 117.56},
			},
			Floors = {
				{
					Header = "Casino Roof",
					Description = "Take the elevator to Casino Roof",
					Progressbar = "Taking Elevator to Casino Roof",
					TeleportCoords = vec4(964.49, 58.96, 112.55, 55.62),
				},
				{
					Header = "Casino Garage",
					Description = "Take the elevator to Casino Garage",
					Progressbar = "Taking Elevator to Casino Garage",
					TeleportCoords = vec4(966.79, 7.82, 81.16, 60.78),
				},
				{
					Header = "Casino Penthouse",
					Description = "Take the elevator to Casino Penthouse",
					Progressbar = "Taking Elevator to Casino Penthouse",
				    TeleportCoords = vec4(981.78, 54.55, 116.16, 336.47),
				},
			}
		},
		{
			Name = "Arcadius Business Center:",
			Zone = "Arcadius",
			Zones = {
				{coords = vec4(-115.83, -605.05, 36.28, 340), name = "Arcadius Ground Floor", length = 2.6, width = 2.8, minz = 35.28, maxz = 39.28},
				{coords = vec4(-140.34, -620.85, 168.82, 275), name = "Arcadius Office", length = 2.6, width = 2.8, minz = 167.82, maxz = 170.42},
				{coords = vec4(-139.62, -588.97, 167.0, 40), name = "Arcadius Shop", length = 4.6, width = 2.8, minz = 166.0, maxz = 169.2},
				{coords = vec4(-144.11, -576.3, 32.42, 340), name = "Arcadius Garage 1A", length = 8.4, width = 4.4, minz = 31.22, maxz = 34.62},
				{coords = vec4(-197.45, -580.45, 136.0, 8), name = "Arcadius Parking Garage", length = 2.6, width = 2.8, minz = 135.0, maxz = 138.0},
			},
			Floors = {
				{
					Header = "Arcadius Office",
					Description = "Take the elevator to the office",
					Progressbar = "Taking Elevator to Arcadius Office",
				    TeleportCoords = vec4(-139.36, -620.55, 168.82, 102.58),
					Locked = {["arcadius"] = 4, ["bennys"] = 4},
					Items = {"security_card_01", "money"}
				},
				{
					Header = "Arcadius Ground Floor",
				    Description = "Take the elevator to lobby",
				    Progressbar = "Taking Elevator to Arcadius Lobby",
				    TeleportCoords = vec4(-116.51, -604.81, 36.28, 252.2),
				},
				{
					Header = "Arcadius Garage 1A",
				    Description = "Take the elevator to Garage 1A",
				    Progressbar = "Taking Elevator to Garage 1A",
				    TeleportCoords = vec4(-197.68, -580.62, 136.0, 280.08),
				    VehicleCoords = vec4(-190.51, -583.08, 136.0, 2.09),
					Locked = {["arcadius"] = 4, ["bennys"] = 4}
				},
				{
					Header = "Arcadius Parking Garage",
				    Description = "Take the elevator to Parking Garage",
				    Progressbar = "Taking Elevator to Parking Garage",
				    TeleportCoords = vec4(-144.09, -576.67, 31.78, 245.23),
				    VehicleCoords = vec4(-144.38, -576.88, 32.42, 155.17),
					Locked = {["arcadius"] = 4, ["bennys"] = 4}
				},
				{
					Header = "Arcadius Shop",
				    Description = "Take the elevator to Arcadius Shop",
				    Progressbar = "Taking Elevator to Arcadius Shop",
				    TeleportCoords = vec4(-139.25, -588.46, 167.0, 130.03),
				    VehicleCoords = vec4(-141.9, -590.69, 167.0, 127.19),
					Locked = {["arcadius"] = 4, ["bennys"] = 4}
				},
			}
		}
	}
}