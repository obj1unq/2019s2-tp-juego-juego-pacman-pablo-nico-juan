import  wollok.game.*
import config.*

object pacman {
	var property image = "pacman.jpg"
	var property position = game.origin()
	var vidas = 2
	
	method perderVida() {
		vidas-=1
		position = game.origin()	
	}
	
	method perderJuego() = vidas == 0
	
}

class Fantasma {
	
	const numero
	const posicionx
	const posiciony
	
	method image() = "fantasma" + numero.toString() + ".jpg"

	method position() = game.at(posicionx, posiciony)
}