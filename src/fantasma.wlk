import  wollok.game.*
import niveles.*
import pacman.*

//CLASE FANTASMA
class Fantasma{
	var property position
	const puntaje = 100
		
	method image() = if(pacman.modoTurbo()) "fantasmaazul.png" else self.imagenPropia()
		
	method imagenPropia()
	
	method meEncontro(pacman){
		if(pacman.modoTurbo()){
			game.removeVisual(self)
			game.sound("pacman-comerfantasma.mp3")
			pacman.sumarPuntos(puntaje)
			self.resetPosicion()
			game.schedule(1500, {game.addVisual(self)})
		}
		else{
			//TODO: Delegar en el pacman
		pacman.comidoPorFantasma()
		if(pacman.vidas()==0)
		config.finDelJuego()		
		}
	}
	method resetPosicion()
}

//SE MUEVE POR EL TABLERO 
class Pinky inherits Fantasma{
	var numero = 2
	
	override method imagenPropia() = "fantasma" + numero.toString() + ".png"
	
	method posicionOriginal() = game.at(20,0)
	
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	
	method moverse(){
		
				var newX = position.x() + if(0.randomUpTo(4)>=2){1}else{-1}
				var newY = position.y() + if(0.randomUpTo(4)>=2){1}else{-1}
				// evitamos que se posicionen fuera del tablero
				newX = newX.max(0).min(game.width() - 1)
				newY = newY.max(0).min(game.height() - 1)
				position = game.at(newX, newY)
		
		}
}
//SIGUE A PACMAN
class Blinky inherits Fantasma{
	var numero = 1
	
	override method imagenPropia() = "fantasma" + numero.toString() + ".png"
	
	method posicionOriginal() = game.at(15,11)
	
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	
	method moverse(){
		
		var otroPosicion = pacman.position()
		var newX = position.x() + if (otroPosicion.x() > position.x()) 1 else -1
		var newY = position.y() + if (otroPosicion.y() > position.y()) 1 else -1
		// evitamos que se posicionen fuera del tablero
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		position = game.at(newX, newY)
	}
		
}
//PERSIGUE A PACMAN CUANDO TIENE MAS DE 2000 PUNTOS
class Inky inherits Fantasma{
	var numero = 4
	
	override method imagenPropia() = "fantasma" + numero.toString() + ".png"
	
	method posicionOriginal() = game.at(5,5)
	
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	
	method moverse(){
		
		if(pacman.puntos()<3000){
				var newX = position.x() + if(0.randomUpTo(4)>=2){1}else{-1}
				var newY = position.y() + if(0.randomUpTo(4)>=2){1}else{-1}
				// evitamos que se posicionen fuera del tablero
				newX = newX.max(0).min(game.width() - 1)
				newY = newY.max(0).min(game.height() - 1)
				position = game.at(newX, newY)
		}
		else{
			var otroPosicion = pacman.position()
			var newX = position.x() + if (otroPosicion.x() > position.x()) 1 else -1
			var newY = position.y() + if (otroPosicion.y() > position.y()) 1 else -1
			// evitamos que se posicionen fuera del tablero
			newX = newX.max(0).min(game.width() - 1)
			newY = newY.max(0).min(game.height() - 1)
			position = game.at(newX, newY)
		}
	}
	
	
	
	}
	
//APARECE POR EL TABLERO EN DIFERENTES POSICIONES
class Clyde inherits Fantasma{
	var numero = 3
	
	override method imagenPropia() = "fantasma" + numero.toString() + ".png"
	
	method posicionOriginal() = game.at(7,9)
	
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	
	method moverse(){
		
		
		var newX = 0.randomUpTo(game.width()-1)
		var newY = 0.randomUpTo(game.width()-1)
		
		position = game.at(newX, newY)
	}
}



