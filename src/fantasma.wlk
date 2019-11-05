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
		
	method serComido(){
		if(!pacman.modoTurbo()){
			self.comerPacman()
		}
		else{
			pacman.sumarPuntos(puntaje)		
		}
	}
	method comerPacman(){ pacman.restarVida() }

}

class Azul inherits Fantasma{
		//pensar un movimiento para este fantasma
		
	/*method moverse(){
	var newX = position.x() -1
	var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	
	if(pacman.cantVidas()>0) position = game.at(newX, newY)
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
	}*/
}

class Rojo inherits Fantasma{
		//hacer seguir a pacman
	method moverse(){
	var newX = position.x() -1
	var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	if(pacman.cantVidas()>0) position = game.at(newX, newY)
		
	}
}
class Verde inherits Fantasma{
		// mov random por el tablero
	method moverse(){
	 var newX = position.x() -1
	 var newY = position.y() -1
		
	newX = newX.max(0).min(game.width() - 1)
	newY = newY.max(0).min(game.height() - 1)
	if(pacman.cantVidas()>0) position = game.at(newX, newY)
		
	}
}
