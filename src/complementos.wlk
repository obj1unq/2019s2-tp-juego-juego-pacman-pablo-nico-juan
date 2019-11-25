import  wollok.game.*
import niveles.*
import pacman.*
import fantasma.*

//CLASE PADRE COMIDA.
class Comida{
	const posX = 0.randomUpTo(game.width()-1)
	const posY = 0.randomUpTo(game.height() -1)
	
	method position() = game.at(posX, posY)
	
	method image() 
	method meEncontro(pacman){ 
		self.serComido()
		game.removeVisual(self)
		game.sound("pacman-comercereza.mp3")
	}
	method puntaje()
	method serComido()
}

//Object FRUTA
class Fruta inherits Comida {
	override method puntaje() = 50
	
	override method image() = "fruta.png"
	
	override method serComido(){
		pacman.sumarPuntos(self.puntaje())
	}
}

//Object PASTILLA//
class Pastilla inherits Comida {
	override method puntaje() = 100
	
	override method image() = "pastilla.png"
	
	override method serComido(){
		pacman.sumarPuntos(self.puntaje())
		pacman.pasarAturbo()
		game.schedule(5000, {pacman.salirDeTurbo()})
	}
}