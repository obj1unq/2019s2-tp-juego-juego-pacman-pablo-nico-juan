import wollok.game.*
import objetospersonajes.*




object nivel1 {
	
	method iniciar(){
	
	
	//Limites Del Juego
	game.width(15)
	game.height(17)
	
	// fondo
	game.boardGround("fondopacman.jpg")
	
	// Personaje principal-pacman
	
	game.addVisualCharacter(pacman)
	
	//Fantasmas
		const fantasmas = [new Fantasma(numero =1,posicionx=10,posiciony=15), new Fantasma(numero =2,posicionx=5,posiciony=13),
						   new Fantasma(numero =3 ,posicionx=7,posiciony=7)
		]
	
	
	
			fantasmas.forEach { rival => 
				game.addVisual(rival)
				game.whenCollideDo(rival, { personaje => personaje.perderVida() 
																	if (personaje.perderJuego()) 
																			{game.stop()}})
										}
		
		//Arranca el juego
		
		game.start()
		}
			
}
