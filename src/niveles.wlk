import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*

object nivel1 {
	const siguienteNivel = nivel2
	
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
		var contador = 0
		game.addVisual(new Comida(tipo = fruta))
		game.whenCollideDo(pacman, {comida =>
			comida.meEncontroPacman()
			if(pacman.puntos() == 5000) config.pasarAlNivel(siguienteNivel) 
			contador+=1
			if(contador % 3 == 0) game.addVisual(new Comida(tipo = pastilla))
			else game.addVisual(new Comida(tipo = fruta))
		})
		game.whenCollideDo(pacman, {fantasma => fantasma.meEncontro(pacman)})
		
		
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
	method pasarAlNivel(nivel){
		nivel.iniciar()	
	}
}
