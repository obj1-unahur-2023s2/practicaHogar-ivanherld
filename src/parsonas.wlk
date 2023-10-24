import casas.*
import habitaciones.*

class Persona {
	var property edad
	var confort
	var property esCocinero
	
	method ocupaUnaHabitacion(unaHabitacion){
		return unaHabitacion.ocupantes().contains(self)
	}
	
	method habitacionQueOcupa(unaHabitacion){
		return unaHabitacion
	}
	
	method abandonarHabitacion(unaHabitacion){
		unaHabitacion.ocupantes().remove(self)
	}
	
	method estaEnUnaHabitacion(unaHabitacion){
		return self.ocupaUnaHabitacion(unaHabitacion)
	}
	
	method confort(unaCasa){
		return unaCasa.habitaciones().sum{habitacion => habitacion.confort()}
	}
	
	method seSienteAGusto(unaCasa){
		return unaCasa.habitaciones().any{habitacion => habitacion.puedeEntrar(self)}
	}

}

class Obsesivas inherits Persona{
	override method seSienteAGusto(unaCasa){
		return unaCasa.habitaciones().all({habitacion => habitacion.ocupantes().size() > 2}) and super(unaCasa)
	}

}

class Golosas inherits Persona{
	
	override method seSienteAGusto(unaCasa){
		return super(unaCasa) and unaCasa.familia().any({familiar => familiar.esCocinero()})
	}
}



class Sencillas inherits Persona{
	override method seSienteAGusto(unaCasa){
		return super(unaCasa) and unaCasa.habitaciones().size() > unaCasa.familia().size()
	}
}
