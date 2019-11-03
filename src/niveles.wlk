import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*

object nivel1 {
	
	method iniciar(){
	//Fantasmas
		const azul = new Azul(numero=1,position=game.at(10, 10))
		const rojo = new Rojo(numero=2,position=game.at(5, 14))
		const verde = new Verde(numero=3,position=game.at(12, 6))
		var fantasmas = [azul,rojo,verde]
	
	//Frutas
		const fruta1 = new Fruta(position=game.at(4,4))
		const fruta2 = new Fruta(position=game.at(9,10))
		const fruta3 = new Fruta(position=game.at(2,8))
		const fruta4 = new Fruta(position=game.at(11,3))
		const fruta5 = new Fruta(position=game.at(5,9))	
		const frutas = [fruta1,fruta2,fruta3,fruta4,fruta5]
	//Pastillas
		//const patilla1 = new Pastilla (position=game.at(10,10))
		//const pastila2 = new Pastilla (position=game.at(1,1))

	
		// Configurar fantasmas = Movimiento 
		fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick(1000, "movimiento", {fantasma.moverse()})
				}
		
		//Configurar Frutas & Colisiones
		frutas.forEach({fruta => game.addVisual(fruta)})
		game.whenCollideDo(pacman, {fruta => fruta.meComioPacman()})
		
		
		//Arranca el juego
		
		game.start()
		}
			
}


object nivel2{
	method iniciar(){
		
	}
}
