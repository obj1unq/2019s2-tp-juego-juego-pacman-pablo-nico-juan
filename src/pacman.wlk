import wollok.game.*
import niveles.*
import fantasma.*



//OBJETO PACMAN

object pacman{
	var property position = self.posicionOriginal()
	var property vidas = 3
	var property modoTurbo = false 
	var property puntos = 0
	var property frutasComidas=0
	var property imagen = "pacmanUp.png"
	
	method posicionOriginal()=game.at(10,6)
	method pasarAturbo(){modoTurbo = true} //Cuando esta en turbo se puede comer los fantasmas, cambia a turbo cuando se come la pastilla
	method salirDeTurbo(){modoTurbo = false}
	method restarVida(){vidas -= 1}
	method comidoPorFantasma(){
		self.restarVida()
		self.resetPosicion()
		if(self.perderJuego()){
			game.sound("pacman-die.mp3")
			game.schedule(4000, {game.stop()})
		}
	}
	method resetPosicion(){ position = self.posicionOriginal()} //Devuelve a Pacman a su posicion inicial
	method perderJuego() = vidas == 0
	method image(){ 
		if(vidas>0) self.sonido()
		return imagen
		}
	method sonido(){
		if(modoTurbo) game.sound("pacman-fantasmas.mp3")
		else game.sound("pacman-waka.mp3")
	}
	method sumarPuntos(cantidad){puntos+=cantidad}
	
		
	}


