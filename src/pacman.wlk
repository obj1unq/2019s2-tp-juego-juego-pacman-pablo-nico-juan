import wollok.game.*
import niveles.*
import fantasma.*




class Posicion{
	var property position 
}
//OBJETO PACMAN EN MODO NORMAL

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
}

//OBJETO PACMAN EN MODO TURBO
object pacmanTurbo{
	
	method comerFantasma(pacman,fantasma){
		fantasma.meComioPacman()
		game.sound("pacman-comerfantasma.mp3")
	}
}

//OBJETO PACMAN
object pacman inherits Posicion(position=game.at(7,0)) {
	
	var property vidas = 2
	var property frutaComida = 0
	var estado = pacmanNormal
	
	
	
	method image(){
		
		if(vidas>0)self.sonido()
		return "pacman.png"
	}
	
	method actualizarEstado(){estado=pacmanNormal}
		
	method sonido(){
		if(self.estaEnModoTurbo())game.sound("pacman-fantasmas.mp3")
		else game.sound("pacman-waka.mp3")
	}
	
	method restarVida(){vidas= vidas -1}
	
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
		
	}
	
	method perderJuego() = vidas == 0
	
	method resetiarPosicion(){
		position= game.at(7,0)
	}
	
	method estaEnModoTurbo()= estado==pacmanTurbo
	
}