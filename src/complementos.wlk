import  wollok.game.*
import niveles.*
import pacman.*
import fantasma.*

//CLASE PADRE COMIDA.
class Comida{
	const posX = 0.randomUpTo(game.width()-1)
	const posY = 0.randomUpTo(game.height() -1)
	const tipo
	
	method position() = game.at(posX, posY)
	
	method image() = tipo.image()
	method meEncontro(pacman){ 
		tipo.meEncontro(pacman)
		game.removeVisual(self)
		game.sound("pacman-comercereza.mp3")
	}
	method puntaje() = tipo.puntaje()
}

//Object FRUTA
object fruta {
	method puntaje() = 500
	
	method image() = "fruta.png"
	
	method meEncontro(pacman){
			pacman.sumarPuntos(self.puntaje())
			}
	}

//Object PASTILLA//
object pastilla {
	method puntaje() = 1000
	
	method image() = "pastilla.png"
	
	method meEncontro(pacman){
		pacman.sumarPuntos(self.puntaje())
		pacman.pasarAturbo()
		game.schedule(5000, {pacman.salirDeTurbo()})
	}
}