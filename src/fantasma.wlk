import  wollok.game.*
import niveles.*
import pacman.*

//CLASE FANTASMA
class Fantasma{
	const tipo
	var property position  = game.center()
	const puntaje = 2000
	
	method image() = if(pacman.modoTurbo()){"fantasmaazul.png"}
					 else {"fantasma" + tipo.nombre() + ".png"}
		
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

object azul{
	//pensar un movimiento para este fantasma
	const property nombre = 1
	
}

object rojo {
	//hacer seguir a pacman
	const property nombre = 2
}
object verde {
	// mov random por el tablero
	const property nombre = 3
}
