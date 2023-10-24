class Casa {
	const habitaciones = []
	const familia = []
	
	method habitacionesOcupadas(){
		return habitaciones.filter{habitacion => habitacion.ocupantes().size() > 0}
	}
	
	method responsablesDeLaCasa(){
		return familia.filter{familiar => familiar == habitaciones.max({ocupante => ocupante.edad()})}
	}
	
	method nivelDeConfortFamilia(){
		return familia.sum({familiar => familiar.confort(self)} / familia.size())
	}
	method estanAGusto(){
		return self.nivelDeConfortFamilia() > 40
	}
}
