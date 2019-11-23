import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*
import direcciones.*

object nivel1 {
	const property siguienteNivel = nivel2
	const property puntosRequeridos = 5000
	
	method iniciar(){
		//Fantasmas
		const azul = new Rojo(numero=1)
		const rojo = new Rosa(numero=2)
		const verde = new Verde(numero=3)
		var fantasmas = [azul,rojo,verde]
		
		
		// Configurar fantasmas = Movimiento 
		fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick( 1000, "movimiento", {if(pacman.vidas()>0)fantasma.moverse()})
				}
				
		//Configurar Colisiones
		var frutasComidas = 0
		game.addVisual(new Comida(tipo = fruta))
		//Colision con comida
		game.whenCollideDo(pacman, {comida =>	
			comida.meEncontroPacman()
			//if(pacman.puntos() == 5000)	config.pasarNivel(siguienteNivel)
			frutasComidas++
			config.siguienteComida(frutasComidas)
		})
		//Colision con fantasma
		game.whenCollideDo(pacman, {fantasma => 
			fantasma.meEncontro(pacman)
			if(pacman.vidas() == 2) game.say(pacman, "Te quedan 2 vidas")
			else if(pacman.vidas() == 1) game.say(pacman, "Te quedan 1 vidas")
			else if(pacman.vidas() == 0) game.say(self,"GAME OVER " + pacman.puntos().toString() + " Puntos")
		})
		
		
		//Arranca el juego
		game.start()
		}
			
}


object nivel2{
	method iniciar(){
		const azul = new Rojo(numero=1)
		const rojo = new Rosa(numero=2)
		const verde = new Verde(numero=3)
		const azul2 = new Rojo(numero=1)
		const rojo2= new Rosa(numero=2)
		const verde2 = new Verde(numero=3)
		var fantasmas = [azul,rojo,verde,azul2,rojo2,verde2]
		
		fantasmas.forEach {fantasma => game.addVisual(fantasma)
				game.onTick( 1000, "movimiento", {if(pacman.vidas()>0)fantasma.moverse()})}
		
		//Arrancar nivel2
		game.start()
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
		keyboard.up().onPressDo{pacman.imagen("pacmanUp.png")}
		keyboard.down().onPressDo{pacman.imagen("pacmanDown.png")}
		keyboard.right().onPressDo{pacman.imagen("pacmanDer.png")}
		keyboard.left().onPressDo{pacman.imagen("pacmanIzq.png")}
		keyboard.enter().onPressDo{game.say(pacman,"puntos: "+ pacman.puntos().toString())}
	}
	
	method siguienteComida(frutasComidas){ 
			if(frutasComidas % 3 == 0) game.addVisual(new Comida(tipo = pastilla))
			else game.addVisual(new Comida(tipo = fruta))}
}
