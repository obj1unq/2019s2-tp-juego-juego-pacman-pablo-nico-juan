import wollok.game.*
import niveles.*
import pacman.*
import fantasma.*


//CLASE FRUTA
class Fruta {
	method puntaje() = 500
	
	method position(){
		const posX = 0.randomUpTo(game.width()).truncate(0)
		const posY = 0.randomUpTo(game.width()).truncate(0)
		return game.at(posX,posY)
	}
	method image() = "fruta.png"
	
	method serComido(){
		pacman.sumarPuntos(self.puntaje())
		pacman.pasarAturbo()
	//	game.removeVisual(self)
	//	game.sound("pacman-comercereza.mp3")
	//	game.schedule(3000, {pacman.salirDeTurbo()})
	//	game.colliders(self)
		
	}
}

class Pastilla inherits Fruta{
	
	override method puntaje() = 1000
	
	override method image() = ""
	
}