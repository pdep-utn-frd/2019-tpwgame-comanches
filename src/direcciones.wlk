import wollok.game.*
import juego.*
import elementos.*

class Direccion {
	method siguiente(position)
}

object izquierda inherits Direccion { 
	override method siguiente(position) = if (position.x() != 0) 
	position.left(1) else game.say(lola,"Frontera") 
	method opuesto() = derecha
}

object derecha inherits Direccion { 
	override method siguiente(position) = if (position.x() != game.width()-1) 
	position.right(1) else game.say(lola,"Frontera") 
	method opuesto() = izquierda
}

object abajo inherits Direccion { 
	override method siguiente(position) = if (position.y() != 0) 
	position.down(1) else game.say(lola,"Frontera") 
	method opuesto() = arriba
}

object arriba inherits Direccion { 
	override method siguiente(position) = if (position.y() != game.height()-1) 
	position.up(1) else game.say(lola,"Frontera")
	method opuesto() = abajo
}