import  wollok.game.*
import niveles.*
import pacman.*
import fantasma.*


//CLASE FRUTA
class Fruta {
	var property position 
	const property puntaje = 500
	
	method image() = "fruta.png"
	
	method meEncontro(pacman){
		pacman.sumarPuntos(puntaje)
		game.removeVisual(self)
		game.sound("pacman-comercereza.mp3")
	}
}
//CLASE PASTILLA//
class Pastilla{
	var property position
	const property puntaje = 1000
	
	method image() = "pastilla.png"
	
	method meEncontro(pacman){
		pacman.sumarPuntos(puntaje)
		pacman.pasarAturbo()
		game.removeVisual(self)
		game.schedule(3000, {pacman.salirDeTurbo()})
		
		
	}
}