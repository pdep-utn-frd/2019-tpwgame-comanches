import wollok.game.*
import juego.*
import direcciones.*

class Perritos {	
	var property position = game.at(1.randomUpTo(game.width()-1).truncate(0),
								1.randomUpTo(game.height()-1).truncate(0))					
//	var property image = "perrito"
 	
 	method seMueve(direccion) {
		self.validarUnaPosicionVacia(direccion) 	
		position = direccion.siguiente(position)
	}
	method validarUnaPosicionVacia(direccion) {
		const posicionAdyacente = direccion.siguiente(position) 
		
		var posicionVacia = game.getObjectsIn(posicionAdyacente)
			.all{o => o.puedePisarte(self)} 
		
		if (!posicionVacia) 
			throw new Exception(message = "Algo no deja pasar al perro.") 
	}	
	method puedePisarte() = false
	method esPerrito() = true
}

object tina inherits Perritos {
	method image() = "tina.png"
	//var property image = "tina.png" 
}

object mora inherits Perritos {
	method image() = "mora.png" 
}

object liza inherits Perritos {
	method image() = "liza.png" 
}

object jana inherits Perritos {
	method image() = "jana.png" 
}

object ciro inherits Perritos {
	method image() = "ciro.png" 
}

object lola {
	var property position = game.at(7, 9)
	//const property image = "lola.png"
	var property perritosEnCorral = #{}
	var direccion = arriba 
	
	method image() = "lola.png"

	method empujar(elemento) {
		try {
			elemento.seMueve(direccion)
			self.perritosEnCorral(elemento)
		} catch e {
			console.println(e)
			self.retroceder()
		}
	}	
	method retroceder() {
		position = direccion.opuesto().siguiente(position)	
	}
	method moverseArriba() { 
		direccion = arriba
		if (self.position().y() != game.height()-1) 
			self.moverse()
	}
	method moverseAbajo() {
		direccion = abajo
		if (self.position().y() != 0) 
			self.moverse()
	}
	method moverseIzquierda() {
		direccion = izquierda
		if (self.position().x() != 0) 
			self.moverse()
	}
	method moverseDerecha() {
		direccion = derecha
		if (self.position().x() != game.width()-1) 
			self.moverse()
	}
	method moverse() {
		position = direccion.siguiente(position)
	}
	method perritosEnCorral(perrito) {
		if (perrito.position().x().between(5,9) and perrito.position().y().between(8,12)){ 
			//console.println(perrito)
			perritosEnCorral.add(perrito)
			console.println(perritosEnCorral.size())
			if (self.perritosEnCorral().size() == 5 and not game.hasVisual(salida)){
				console.println("salida agregada")
				game.addVisual(salida)
			}
		}
	}
	method fin(){
		console.println(":D")
		if (self.position().x() == 10 and self.position().y() == 12 and game.hasVisual(salida)){
			console.println("Juego terminado")
			game.addVisual(fin)
		}
	}
}

object superLola {
	var property position = lola.position()	
	
	method esCaja() = false
	
	method seMueve(direccion) {}
}

object salida {	
	var property position = game.at(10,12)	
	//var property image = "salida.png"

	method image() = "salida.png" 

	method esCaja() = false
	
	method seMueve(direccion) {}
}

object escenario {
	const property position = game.at(0,0)
	var property image = "escenario.jpg"
}

object fin {
	const property position = game.at(0,0)
	var property image = "fin.jpg"
}








