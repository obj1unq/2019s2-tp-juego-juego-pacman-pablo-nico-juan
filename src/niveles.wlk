import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*
import direcciones.*

object nivel1 {
	const siguienteNivel = nivel2
	
	method iniciar(){
		//Fantasmas
		const rojo = new Rojo(position = game.at(19,2))
		const rosa = new Rosa(position = game.at(4,11))
		const verde = new Verde(position = game.at(5,5))
		var fantasmas = [rojo,rosa,verde]
		//Configuraciones de juego
		config.configurarTeclas()
		game.addVisualCharacter(pacman)
		game.onTick(200,"Movimiento de Pacman",{pacman.moverse()})
		
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
			config.siguienteComida(frutasComidas)
			if(pacman.puntos() >= 1000){
				game.clear()
				config.pasarNivel(siguienteNivel)
				pacman.modoTurbo(false)
			}
		})
		//Colision con fantasma
		game.whenCollideDo(pacman, {fantasma =>	fantasma.meEncontro(pacman)
			if(pacman.vidas() == 2) game.say(pacman, "Te quedan 2 vidas")
			else if(pacman.vidas() == 1) game.say(pacman, "Te quedan 1 vidas")
			else if(pacman.vidas() == 0) game.say(self,"GAME OVER " + pacman.puntos().toString() + " Puntos")
		})
		
		
		//Arranca el juego
		game.start()
		}
			
}


object nivel2{
	const siguienteNivel = nivel3
	
	method iniciar(){
		const azul = new Rojo(position = game.at(19,2))
		const rojo = new Rosa(position = game.at(4,11))
		const verde = new Verde(position = game.at(5,5))
		const azul2 = new Rojo(position = game.at(6,9))
		const rojo2= new Rosa(position = game.at(15,7))
		const verde2 = new Verde(position = game.at(11,1))
		var fantasmas = [azul,rojo,verde,azul2,rojo2,verde2]
		//Configuraciones de juego
		pacman.position(game.center())
		game.addVisualCharacter(pacman)
		config.configurarTeclas()
		game.onTick(200,"Movimiento de Pacman",{pacman.moverse()})
		 
		fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick( 1000, "movimiento", {if(pacman.vidas()>0)fantasma.moverse()})}
		
		var frutasComidas = 0
		game.addVisual(new Fruta())
		//Colision con comida
		game.whenCollideDo(pacman, {comida =>	
			comida.meEncontro(pacman)
			if(pacman.puntos() >= 5000){
				game.clear()
				config.pasarNivel(siguienteNivel)
			}
			frutasComidas++
			config.siguienteComida(frutasComidas)
		})
		 
		//Colision con fantasma
		game.whenCollideDo(pacman, {fantasma =>	fantasma.meEncontro(pacman)
			if(pacman.vidas() == 2) game.say(pacman, "Te quedan 2 vidas")
			else if(pacman.vidas() == 1) game.say(pacman, "Te quedan 1 vidas")
			else if(pacman.vidas() == 0) game.say(self,"GAME OVER " + pacman.puntos().toString() + " Puntos")
		})
		 
	}
}

object nivel3{
	method iniciar(){}
}




object config{
	
	method finDelJuego(){
		game.onTick(2000,"Pacman Murio", {game.stop()})
	}
	method pasarNivel(nivel){
		nivel.iniciar()
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
	
	method siguienteComida(frutasComidas){ 
			if(frutasComidas % 3 == 0) game.addVisual(new Pastilla())
			else game.addVisual(new Fruta())
			}
}
