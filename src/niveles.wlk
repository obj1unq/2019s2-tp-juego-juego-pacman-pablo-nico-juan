import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*

object nivel1 {
	
	method iniciar(){
	//Fantasmas
		const fantasmas = []
		fantasmas.add(new Azul(numero=1,position=game.at(10, 10)))
		fantasmas.add(new Rojo(numero=2,position=game.at(5, 14)))
		fantasmas.add(new Verde(numero=3,position=game.at(12, 6)))
		/*const fantasmas = [new Fantasma(numero=1,position=game.at(14, 13)),
						   new Fantasma(numero=2,position=game.at(0, 16)),
						   new Fantasma(numero=3,position=game.at(8, 9))
						]*/
	//Frutas
		
/*		const frutas =[new Fruta(position=game.at(4,4)),
					  new Fruta(position=game.at(2,12)),
					  new Fruta(position=game.at(12,13))
		]*/	
		
	//Frutas
		const frutas = []
		frutas.add(new Fruta())
		frutas.add(new Fruta())
		frutas.add(new Fruta())
		frutas.add(new Fruta())
		frutas.add(new Fruta())	
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
		
		frutas.forEach{fruta => 
			
			game.addVisual(fruta)
			game.whenCollideDo(pacman, {algo => algo.meEncontro(pacman)})
			
		}
			
		//Arranca el juego
		
		game.start()
		}
			
}


object nivel2{
	method iniciar(){
		
	}
}
