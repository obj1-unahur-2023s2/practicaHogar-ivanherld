import parsonas.*

class Habitacion {
	
	var ocupantes = []
	
	method puedeEntrar(unaPersona){
		return false
	}
	
	method confort(unaPersona) = confort.nivel()
	
	method entrar(unaPersona){
		if (unaPersona.estaEnUnaHabitacion(self))
			unaPersona.abandonarHabitacion(self)
			
		if (self.puedeEntrar(unaPersona)){
			ocupantes.add(unaPersona)
			unaPersona.habitacionQueOcupa(self)
		}
		else
			console.println("sea como sea aquí no entran feas")
	}
	
	method ocupantes() = ocupantes
}

class UsoGeneral inherits Habitacion{
	override method puedeEntrar(unaPersona){
		return true
	}
}

class Dormitorio inherits Habitacion{
	
	const property personasQueDuermen = []
	
	override method confort(unaPersona,confort){
	if (personasQueDuermen.any{persona => persona == unaPersona})
		return super(unaPersona,confort) + 10/personasQueDuermen.size()
	else
		return super(unaPersona)
	}
	
	override method puedeEntrar(unaPersona){
		return (personasQueDuermen.any{persona => persona == unaPersona} or (personasQueDuermen.all{persona => persona != unaPersona} and ocupantes.all{ocupante => personasQueDuermen.contains(ocupante)}))		
	}
	
}


class Banio inherits Habitacion{
	override method confort(unaPersona){
	if (unaPersona.edad() >= 4)
		return super(unaPersona) + 2
	else
		return super(unaPersona)+4
	}
	
	override method puedeEntrar(unaPersona){
		return (ocupantes.any{persona => persona.edad() <= 4})		
	}	
}

class Cocina inherits Habitacion{
	const metrosCuadrados
	
	override method confort(unaPersona){
	if (unaPersona.esCocinero())
		return super(unaPersona) + metrosCuadrados*porcentaje.valor()/100
	else
		return super(unaPersona)
	}
	
	override method puedeEntrar(unaPersona){
		
		return (!unaPersona.esCocinero() or (unaPersona.esCocinero() and ocupantes.any({persona => !persona.esCocinero()})))
	}
	
}

object confort{
	method nivel() = 10
}

object porcentaje{
	var property valor = 10
}





