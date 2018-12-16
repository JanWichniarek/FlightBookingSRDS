package model

import ReservationId

data class ReservationData(val flight: Flight, val reservationId: ReservationId, val seat: Seat)