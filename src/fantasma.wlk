import  wollok.game.*
import niveles.*
import pacman.*

//CLASE FANTASMA
class Fantasma{
	const numero
	const puntaje = 2000
	
	
	
	
	method image() = if(pacman.modoTurbo()){"fantasmaazul.png"}
					 else {"fantasma" + numero.toString() + ".png"}
	method meEncontro(pacman){
		if(pacman.modoTurbo()){
			game.removeVisual(self)
			game.sound("pacman-comerfantasma.mp3")
			pacman.sumarPuntos(puntaje)
			self.resetPosicion()
			game.addVisual(self)
		}
		else{
		pacman.comidoPorFantasma()
		if(pacman.vidas()==0)
		config.finDelJuego()		
		}
	}
	method resetPosicion()
}

class Azul inherits Fantasma{
	
	var property position = self.posicionOriginal()
	method posicionOriginal() = game.at(17,11)
	override method resetPosicion() {position = self.posicionOriginal()}	
	
	method moverse(){
	var newX = self.position().x() -1
	var newY = self.position().y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	
	//if(pacman.vidas()>0) self.position() = game.at(newX, newY)
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
	}
}

class Rojo inherits Fantasma{
	
	var property position = self.posicionOriginal()
	method posicionOriginal() = game.at(3,3)
	override method resetPosicion() {position = self.posicionOriginal()}
		
	method moverse(){
	var newX = position.x() -1
	var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	if(pacman.vidas()>0) position = game.at(newX, newY)
		
	}
}
class Verde inherits Fantasma{
	
	var property position = self.posicionOriginal()
	method posicionOriginal() = game.at(17,3)
	override method resetPosicion() {position = self.posicionOriginal()}
	
	method moverse(){
	 var newX = position.x() -1
	 var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	if(pacman.vidas()>0) position = game.at(newX, newY)
		
	}
	
	}
class Amarillo inherits Fantasma{
	var property position = self.posicionOriginal()
	method posicionOriginal() = game.at(17,3)
	override method resetPosicion() {position = self.posicionOriginal()}
	
	method moverse(){
	 var newX = position.x() -1
	 var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	if(pacman.vidas()>0) position = game.at(newX, newY)
		
	}
}
