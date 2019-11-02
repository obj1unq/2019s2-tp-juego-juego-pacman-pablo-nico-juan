import  wollok.game.*
import niveles.*
import pacman.*



//CLASE FANTASMA
class Fantasma inherits Posicion{
	
	const numero
	
	method image() = if(pacman.estaEnModoTurbo()){"fantasmaazul.png"}
					 else {"fantasma" + numero.toString() + ".png"}
	
	method moverse(){
		 var newX = position.x() -1
		 var newY = position.y() -1
		
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		if(pacman.vidas()>0) position = game.at(newX, newY)
		
	}
	
	
	
	method choqueConPacman(pacman){
		pacman.comerFantasma(self)
	}
	
	method meComioPacman(){
		game.removeVisual(self)
	}
		
}

//CLASE FRUTA
class Fruta inherits Posicion{
	
	method image() = "fruta.png"
	
	method choqueConPacman(pacman){
		pacman.comerFruta(self)
	}
}


	


