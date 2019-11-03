import  wollok.game.*
import niveles.*
import pacman.*

//CLASE FANTASMA
class Fantasma{
	const numero
	var property position
	const puntaje = 2000
	
	method image() = if(pacman.modoTurbo()){"fantasmaazul.png"}
					 else {"fantasma" + numero.toString() + ".png"}
		
	method meEncontro(pacman){
		if(pacman.modoTurbo()){
			game.removeVisual(self)
		}
		else{
		game.say(pacman, "Perdi")
		config.finDelJuego()		
		}
	
}

class Azul inherits Fantasma{
	
		
	method moverse(){
	var newX = position.x() -1
	var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	if(pacman.vidas()>0) position = game.at(newX, newY)
		
	}
}
class Rojo inherits Fantasma{
		
	method moverse(){
	var newX = position.x() -1
	var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	if(pacman.vidas()>0) position = game.at(newX, newY)
		
	}
}
class Verde inherits Fantasma{

	method moverse(){
	 var newX = position.x() -1
	 var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	if(pacman.vidas()>0) position = game.at(newX, newY)
		
	}
}
	


