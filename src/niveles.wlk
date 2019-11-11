import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*

object nivel1 {
	
	method iniciar(){
	//Fantasmas
		const azul = new Rojo(numero=1)
		const rojo = new Rosa(numero=2)
		const verde = new Verde(numero=3)
		var fantasmas = [azul,rojo,verde]
		
	//Frutas
		const fruta1 = new Fruta(position=game.at(4,4))
		const fruta2 = new Fruta(position=game.at(9,10))
		const fruta3 = new Fruta(position=game.at(2,8))
		const fruta4 = new Fruta(position=game.at(11,3))
		const fruta5 = new Fruta(position=game.at(5,9))	
		const frutas = [fruta1,fruta2,fruta3,fruta4,fruta5]
	
	//Pastillas
		const pastilla1 = new Pastilla (position=game.at(10,10))
		const pastilla2 = new Pastilla (position=game.at(1,1))
		const pastillas=[pastilla1,pastilla2]
	
		// Configurar fantasmas = Movimiento 
		fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick( 1000, "movimiento", {if(pacman.vidas()>0)fantasma.moverse()})
				}
		
		//Configurar Frutas
		frutas.forEach({fruta => game.addVisual(fruta)})
		
		//Configurar Pastillas
		pastillas.forEach({pastilla => game.addVisual(pastilla)})
		
		//Configurar Colisiones
		game.whenCollideDo(pacman, {fruta => fruta.meEncontro(pacman)})
		game.whenCollideDo(pacman, {fantasma => fantasma.meEncontro(pacman)})
		game.whenCollideDo(pacman, {pastilla =>pastilla.meEncontro(pacman)})
			
		//Arranca el juego
		
		game.start()
		}
			
}


object nivel2{
	method iniciar(){
		
	}
}
object config{
	method finDelJuego(){
		game.onTick(2000,"Pacman Murio", {game.stop()})
	}
	method pasarNivel(){
		
	}
}
