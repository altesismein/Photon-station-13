
//**************************************************************
// Map Datum -- Photon Station
//**************************************************************

/datum/map/active
	nameShort = "photonstation"
	nameLong = "Photon Station"
	map_dir = "photonstation"
	tDomeX = 128
	tDomeY = 69
	tDomeZ = 2
	zLevels = list(
		/datum/zLevel/station,
		/datum/zLevel/centcomm,
		/datum/zLevel/space{
			name = "spaceOldSat" ;
			},
		/datum/zLevel/space{
			name = "derelict" ;
			},
		/datum/zLevel/mining,
		/datum/zLevel/space{
			name = "spaceEmpty1" ;
			},
		/datum/zLevel/space{
			name = "spaceEmpty2" ;
			},
		)

////////////////////////////////////////////////////////////////
#include "photonstation.dmm"
