import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*
import direcciones.*

object nivel1 {
	const siguienteNivel = nivel2
	
	method iniciar(){
		//Fantasmas
		const rojo = new Pinky(position = game.at(19,2))
		const rosa = new Pinky(position = game.at(4,11))
		const verde = new Pinky(position = game.at(5,5))
		var fantasmas = [rojo,rosa,verde]
		//Configuraciones de juego
		config.configurarTeclas()
		game.addVisualCharacter(pacman)
		game.onTick(200,"Movimiento de Pacman",{if(pacman.vidas()>0)pacman.moverse()})
		
		// Configurar fantasmas = Movimiento 
		fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick( 1000, "movimiento", {if(pacman.vidas()>0)fantasma.moverse()})
				}
				
		//Configurar Colisiones
		var frutasComidas = 0
		game.addVisual(new Fruta())
		//Colision con comida
		game.whenCollideDo(pacman, {comida =>	
			comida.meEncontro(pacman)
			frutasComidas++
			if(frutasComidas % 3 == 0) game.addVisual(new Pastilla()) else game.addVisual(new Fruta())
			config.pasarDeNivel(siguienteNivel, 1500)
		})
		//Colision con fantasma
		game.whenCollideDo(pacman, {fantasma =>	fantasma.meEncontro(pacman)
			
		})
		
		
		//Arranca el juego
		game.start()
		}
			
}


object nivel2{
	const siguienteNivel = nivel3
	
	method iniciar(){
		const azul = new Pinky(position = game.at(19,2))
		const rojo = new Pinky(position = game.at(4,11))
		const verde = new Inky(position = game.at(5,5))
		const azul2 = new Inky(position = game.at(6,9))
		const rojo2= new Clyde(position = game.at(15,7))
		const verde2 = new Blinky(position = game.at(11,1))
		var fantasmas = [azul,rojo,verde,azul2,rojo2,verde2]
		//Configuraciones de juego
		pacman.position(game.center())
		game.addVisualCharacter(pacman)
		config.configurarTeclas()
		game.onTick(200,"Movimiento de Pacman",{if(pacman.vidas()>0)pacman.moverse()})
		 
		fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick( 1000, "movimiento", {if(pacman.vidas()>0)fantasma.moverse()})}
		
		var frutasComidas = 0
		game.addVisual(new Fruta())
		//Colision con comida
		game.whenCollideDo(pacman, {comida =>	
			comida.meEncontro(pacman)
			frutasComidas++
			if(frutasComidas % 5 == 0) game.addVisual(new Pastilla()) else game.addVisual(new Fruta())
			config.pasarDeNivel(siguienteNivel, 2900)
		})
		 
		//Colision con fantasma
		game.whenCollideDo(pacman, {fantasma =>	fantasma.meEncontro(pacman)
			
		})
		 
	}
}

object nivel3{
	method iniciar(){
		
		const azul = new Blinky(position = game.at(19,2))
		const rojo = new Blinky(position = game.at(4,11))
		const verde = new Inky(position = game.at(5,5))
		const azul2 = new Inky(position = game.at(6,9))
		const rojo2= new Pinky(position = game.at(15,7))
		const verde2 = new Clyde(position = game.at(11,1))
		var fantasmas = [azul,rojo,verde,azul2,rojo2,verde2]
		//Configuraciones de juego
		pacman.position(game.center())
		game.addVisualCharacter(pacman)
		config.configurarTeclas()
		game.onTick(200,"Movimiento de Pacman",{if(pacman.vidas()>0)pacman.moverse()})
		 
		fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick( 1000, "movimiento", {if(pacman.vidas()>0)fantasma.moverse()})}
		
		var frutasComidas = 0
		game.addVisual(new Fruta())
		//Colision con comida
		game.whenCollideDo(pacman, {comida =>	
			comida.meEncontro(pacman)
			frutasComidas++
			if(frutasComidas % 10 == 0) game.addVisual(new Pastilla()) else game.addVisual(new Fruta())
			if(pacman.puntos() >= 3500){
				game.say(pacman, "ganaste")
				finDelJuego.iniciar()
				
			}
		})
		 
		//Colision con fantasma
		game.whenCollideDo(pacman, {fantasma =>	fantasma.meEncontro(pacman)
			
		})
		 
	}
}




object config{
	
	method finDelJuego(){
		game.onTick(2000,"Pacman Murio", {game.stop()})
	}
	
	method pasarDeNivel(nivel, puntosRequeridos){
		if(pacman.puntos() >= puntosRequeridos){
				game.clear()
				game.sound("pacman-intro.mp3")
				pacman.modoTurbo(false)
				game.onTick(4500, "pasar de nivel", {nivel.iniciar()})
			}
	}

	method configurarTeclas(){
		keyboard.up().onPressDo{
			pacman.imagen("pacmanUp.png")
			pacman.direccion(arriba)
		}
		keyboard.down().onPressDo{
			pacman.imagen("pacmanDown.png")
			pacman.direccion(abajo)
		}
		keyboard.right().onPressDo{
			pacman.imagen("pacmanDer.png")
			pacman.direccion(derecha)
		}
		keyboard.left().onPressDo{
			pacman.imagen("pacmanIzq.png")
			pacman.direccion(izquierda)
		}
		keyboard.space().onPressDo{game.say(pacman,"puntos: "+ pacman.puntos().toString())}
		keyboard.v().onPressDo{game.say(pacman,"vidas: " + pacman.vidas().toString())}  
	}
	
}

object finDelJuego{
	method image()="win.png"
	
	method position()=game.at(3,1)
	
	method iniciar(){
		game.clear()
		game.addVisual(self)
		game.onTick(4000,"ganar",{game.stop()})
	}
}
