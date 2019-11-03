import wollok.game.*
import niveles.*
import fantasma.*

//OBJETO PACMAN EN MODO NORMAL
/*
object pacmanNormal{
	method comerFantasma(pacman,fantasma){
			pacman.restarVida()
			if(pacman.vidas()==1) game.say(pacman,"Perdiste 1 vida")
			pacman.resetiarPosicion()
			if(pacman.perderJuego()){
				game.say(pacman,"GAME OVER")
				game.sound("pacman-die.mp3")
				game.schedule(3500, {game.stop()})
			}
	}
} */

//OBJETO PACMAN EN MODO TURBO
/*
object pacmanTurbo{
	
	method comerFantasma(pacman,fantasma){
		fantasma.meComioPacman()
		game.sound("pacman-comerfantasma.mp3")
	}
}*/

//OBJETO PACMAN
object pacman{
	var property position = self.posicionOriginal()
	var property vidas = 3
	var property modoTurbo = false 
	var property puntos = 0
	
	method posicionOriginal()=game.at(7,10)
	method pasarAturbo(){modoTurbo = true} //Cuando esta en turbo se puede comer los fantasmas, cambia a turbo cuando se come la pastilla
	method salirDeTurbo(){modoTurbo = false}
	method restarVida(){vidas -= 1}
	method comidoPorFantasma(){
		self.restarVida()
		if(vidas>0) game.say(self,"Perdiste 1 vida")
		self.resetPosicion()
		if(self.perderJuego()){
			game.say(self,"GAME OVER" + puntos)
			game.sound("pacman-die.mp3")
			game.schedule(3500, {game.stop()})
		}
	}
	method resetPosicion(){ position = self.posicionOriginal()} //Devuelve a Pacman a su posicion inicial
	method perderJuego() = vidas == 0
	method image(){
		if(vidas>0)
		self.sonido()
		return "pacman.png"
	}
	method sonido(){
		if(modoTurbo) game.sound("pacman-fantasmas.mp3")
		else game.sound("pacman-waka.mp3")
	}
	method sumarPuntos(cantidad){puntos+=cantidad}
	
/*
	method chocarCon(algo) {
		algo.choqueConPacman(self)
	}
			
	method comerFantasma(fantasma){
		estado.comerFantasma(self,fantasma)
	}	

	method comerFruta(fruta){
		frutaComida+=1
		estado = pacmanTurbo
		game.removeVisual(fruta)
		game.sound("pacman-comercereza.mp3")
		game.schedule(3000, {self.actualizarEstado()})
		game.colliders(visual)
	}
*/}