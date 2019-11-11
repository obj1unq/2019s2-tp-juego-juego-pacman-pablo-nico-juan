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
	
	method posicionOriginal()=game.at(10,0)
	method pasarAturbo(){modoTurbo = true} //Cuando esta en turbo se puede comer los fantasmas, cambia a turbo cuando se come la pastilla
	method salirDeTurbo(){modoTurbo = false}
	method restarVida(){vidas -= 1}
	method comidoPorFantasma(){
		self.restarVida()
		if(vidas==2) game.say(self,"Perdiste 1 vida")
		if(vidas==1) game.say(self,"Te queda 1 vida")
		self.resetPosicion()
		if(self.perderJuego()){
			game.say(self,"GAME OVER " + puntos.toString() + " Puntos")
			game.sound("pacman-die.mp3")
			game.schedule(4000, {game.stop()})
		}
	}
	method resetPosicion(){ position = self.posicionOriginal()} //Devuelve a Pacman a su posicion inicial
	method perderJuego() = vidas == 0
	method image(){ if(vidas>0) self.sonido()
		return "pacman.png"}
	method sonido(){
		if(modoTurbo) game.sound("pacman-fantasmas.mp3")
		else game.sound("pacman-waka.mp3")
	}
	method sumarPuntos(cantidad){puntos+=cantidad}
	
	
		
	}

