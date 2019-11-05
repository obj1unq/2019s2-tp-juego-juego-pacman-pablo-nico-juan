import wollok.game.*
import niveles.*
import fantasma.*

//OBJETO PACMAN
object pacman{
	var property position = game.origin()
	var property cantVidas = 3
	var property modoTurbo = false 
	var puntosTotales = 0
	
	method pasarAturbo(){modoTurbo = true} //Cuando esta en turbo se puede comer los fantasmas, cambia a turbo cuando se come la pastilla
	method salirDeTurbo(){modoTurbo = false}
	method restarVida(){cantVidas -= 1}
	method comer(comida){
		comida.serComido()
	}

	method image() = "pacman.png"
		
	method sonido(){
		if(modoTurbo) game.sound("pacman-fantasmas.mp3")
		else game.sound("pacman-waka.mp3")
	}

	method sumarPuntos(cantidad){ puntosTotales += cantidad }
	method puntosTotales() = puntosTotales
	
}

