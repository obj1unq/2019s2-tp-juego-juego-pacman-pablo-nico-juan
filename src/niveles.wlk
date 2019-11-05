import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*

object nivel1 {
	
	method iniciar(){
	//Fantasmas
		const fantasmas = []
		fantasmas.add(new Fantasma(tipo = azul))
		fantasmas.add(new Fantasma(tipo = rojo))
		fantasmas.add(new Fantasma(tipo = verde))
		
		
	//Frutas
		const frutas = []
		frutas.add(new Fruta(comida = cereza))
		frutas.add(new Fruta(comida = cereza))
		frutas.add(new Fruta(comida = frutilla))
		frutas.add(new Fruta(comida = cereza))
		frutas.add(new Fruta(comida = cereza))	
		
	
		// Configurar fantasmas = Movimiento 
/* 	fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick(1000, "movimiento", {fantasma.moverse()})
				}*/
		
		//Configurar Frutas & Colisiones
	/* 	frutas.forEach({fruta => game.addVisual(fruta)})
		game.whenCollideDo(pacman, {fruta => fruta.serComido()})
		
		frutas.forEach{frutas=> 
			
			
			game.whenCollideDo(pacman, {algo => algo.comer()})
			
		}*/
			
		//Arranca el juego
		
		game.start()
		}
			
}


object nivel2{
	method iniciar(){
		
	}
}
