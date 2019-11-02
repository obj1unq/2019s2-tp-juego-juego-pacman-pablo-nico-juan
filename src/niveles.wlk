import wollok.game.*
import pacman.*
import fantasma.*



object nivel1 {
	
	method iniciar(){
	
	
	
	
	//Fantasmas
		const fantasmas = [new Fantasma(numero=1,position=game.at(10, 10)),
						   new Fantasma(numero=2,position=game.at(5, 14)),
						   new Fantasma(numero=3,position=game.at(12, 6))
						]
	//Frutas
		
		const frutas =[new Fruta(position=game.at(4,4)),
					  new Fruta(position=game.at(7,10))
		]	
		
	
	
		// Configurar fantasmas = Movimiento 
			fantasmas.forEach { fantasma => 
				
				game.addVisual(fantasma)
				game.onTick(1000, "movimiento", {fantasma.moverse() })
				
				}
		
		//Configurar Frutas & Colisiones
		frutas.forEach{fruta => 
			
			game.addVisual(fruta)
			game.whenCollideDo(pacman, {algo => pacman.chocarCon(algo)})
			
		}
		
			
		//Arranca el juego
		
		game.start()
		}
			
}


object nivel2{
	method iniciar(){
		
	}
}
