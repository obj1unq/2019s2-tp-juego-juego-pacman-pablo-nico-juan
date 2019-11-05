import wollok.game.*
import niveles.*
import pacman.*
import fantasma.*


//CLASE FRUTA
class Fruta {
	const comida
	method puntaje() = comida.puntaje()
	
	method position(){
		const posX = 0.randomUpTo(game.width()).truncate(0)
		const posY = 0.randomUpTo(game.width()).truncate(0)
		return game.at(posX,posY)
	}
	method image() = comida.image()
	
	method serComido(){
		pacman.sumarPuntos(self.puntaje())
		comida.efectoEnPacman()
	}
}

object frutilla {
	
	method puntaje() = 1000
	
	method image() = ""
	
	method efectoEnPacman() { pacman.pasarAturbo() }
	
}

object cereza {
	method puntaje() = 500
	
	method image() = ""
	
	method efectoEnPacman() { }
}