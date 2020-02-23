import wollok.game.*
import elementos.*
import direcciones.*

object juego {
	var perritosARescatar = #{}
	const property perritos = [tina, mora, liza, jana, ciro]
		
	method start() {
		self.cargarFondo() 																	 
		self.cargarPerritos()
		self.cargarLola()
		self.cargarColisiones() 																														
		self.configurarTeclas()
	}
	
	method terminarSiCorresponde() {
		if (lola.perritosEnCorral().size() == 5 and lola.position().x() == 9 and lola.position().y() == 12) {
			game.clear()																
			game.addVisual(fin)	
			}	
}				

	method configurarTeclas() {	
		keyboard.up().onPressDo{lola.moverseArriba()}
		keyboard.down().onPressDo{lola.moverseAbajo()}
		keyboard.left().onPressDo{lola.moverseIzquierda()}
		keyboard.right().onPressDo{lola.moverseDerecha()}
		keyboard.n().onPressDo{self.terminarSiCorresponde()}
	}
	
	method cargarPerritos() {
		perritos.forEach ({c => game.addVisual (c)})
	}
	
	method cargarFondo() {
		game.addVisual(escenario)
	}
	
	method cargarLola() {
		game.addVisual(lola)
	}
	
	method cargarColisiones() {
		game.whenCollideDo(lola,{c => 
			lola.empujar(c)
			perritosARescatar.add(c)
			//console.println (perritosARescatar.size())
			//console.println (lola.perritosEnCorral().size())
		})
	}
	
	method cargarSalida() {
		if (lola.perritosEnCorral().size() == 5 and not game.hasVisual(salida))
			self.cargarSalida()
			game.addVisual(salida)
	}
}





