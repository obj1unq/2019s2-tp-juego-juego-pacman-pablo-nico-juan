import  wollok.game.*
import niveles.*
import pacman.*

//CLASE FANTASMA
class Fantasma{
	var property position
	const puntaje = 100
		
	method image() = "fantasmaazul.png"
	
	method meEncontro(pacman){
		if(pacman.modoTurbo()){
			game.removeVisual(self)
			game.sound("pacman-comerfantasma.mp3")
			pacman.sumarPuntos(puntaje)
			self.resetPosicion()
			game.schedule(1500, {game.addVisual(self)})
		}
		else{
		pacman.comidoPorFantasma()
		if(pacman.vidas()==0)
		config.finDelJuego()		
		}
	}
	method resetPosicion()
}

//SE MUEVE POR EL TABLERO 
class Rosa inherits Fantasma{
	var numero = 1
	
	override method image() = if(pacman.modoTurbo()) super() else "fantasma" + numero.toString() + ".png"
	
	method posicionOriginal() = game.at(20,0)
	
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	
	method moverse(){
		
				var newX = self.position().x() + if(0.randomUpTo(4)>=2){1}else{-1}
				var newY = self.position().y() + if(0.randomUpTo(4)>=2){1}else{-1}
				// evitamos que se posicionen fuera del tablero
				newX = newX.max(0).min(game.width() - 1)
				newY = newY.max(0).min(game.height() - 1)
				position = game.at(newX, newY)
		
		}
}
//SIGUE A PACMAN
class Rojo inherits Fantasma{
	var numero = 2
	
	override method image() = if(pacman.modoTurbo()) super() else "fantasma" + numero.toString() + ".png"
	
	method posicionOriginal() = game.at(15,11)
	
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	
	method moverse(){
		
		var otroPosicion = pacman.position()
		var newX = self.position().x() + if (otroPosicion.x() > self.position().x()) 1 else -1
		var newY = self.position().y() + if (otroPosicion.y() > self.position().y()) 1 else -1
		// evitamos que se posicionen fuera del tablero
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		position = game.at(newX, newY)
	}
		
}
//OTRO MOVIMIENTO PERSIGUE A PACMAN CUANDO TIENE 1000 PUNTOS
class Verde inherits Fantasma{
	var numero = 3
	
	override method image() = if(pacman.modoTurbo()) super() else "fantasma" + numero.toString() + ".png"
	
	method posicionOriginal() = game.at(5,5)
	
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	
	method moverse(){
		
		if(pacman.puntos()<1000){
				var newX = self.position().x() + if(0.randomUpTo(4)>=2){1}else{-1}
				var newY = self.position().y() + if(0.randomUpTo(4)>=2){1}else{-1}
				// evitamos que se posicionen fuera del tablero
				newX = newX.max(0).min(game.width() - 1)
				newY = newY.max(0).min(game.height() - 1)
				position = game.at(newX, newY)
		}
		else{
			var otroPosicion = pacman.position()
			var newX = self.position().x() + if (otroPosicion.x() > self.position().x()) 1 else -1
			var newY = self.position().y() + if (otroPosicion.y() > self.position().y()) 1 else -1
			// evitamos que se posicionen fuera del tablero
			newX = newX.max(0).min(game.width() - 1)
			newY = newY.max(0).min(game.height() - 1)
			position = game.at(newX, newY)
		}
	}
	
	
	
	}
	
//OTRO MOVIMIENTO
class Amarillo inherits Fantasma{
	var numero = 4
	
	override method image() = if(pacman.modoTurbo()) super() else "fantasma" + numero.toString() + ".png"
	
	method posicionOriginal() = game.at(7,9)
	
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	
	method moverse(){
		
		var otroPosicion = pacman.position()
		var newX = self.position().x() + if (otroPosicion.x() > self.position().x()) 1 else -1
		var newY = self.position().y() + if (otroPosicion.y() > self.position().y()) 1 else -1
		// evitamos que se posicionen fuera del tablero
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		position = game.at(newX, newY)
	}
}



