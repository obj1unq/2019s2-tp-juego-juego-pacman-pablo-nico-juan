import wollok.game.*
import pacman.*
import fantasma.*



object nivel1 {
	
	method iniciar(){
	
	
	
	
	//Fantasmas
		const fantasmas = [new Fantasma(numero=1,position=game.at(14, 13)),
						   new Fantasma(numero=2,position=game.at(0, 16)),
						   new Fantasma(numero=3,position=game.at(8, 9))
						]
	//Frutas
		
		const frutas =[new Fruta(position=game.at(4,4)),
					  new Fruta(position=game.at(2,12)),
					  new Fruta(position=game.at(12,13))
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
