import  wollok.game.*
import niveles.*
import pacman.*
import fantasma.*


//CLASE FRUTA
class Fruta {
	var property position 
	const property puntaje = 500
	
	method image() = "fruta.png"
	
	method meComioPacman(){
		pacman.sumarPuntos(puntaje)
		pacman.pasarAturbo()
		game.removeVisual(self)
		game.sound("pacman-comercereza.mp3")
		game.schedule(3000, {pacman.salirDeTurbo()})
		game.colliders(self)
		
	}
}

class Pastilla{
	var property position
	const property puntaje = 1000
	
	method image() = ""
	
}