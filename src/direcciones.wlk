import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*

class Direcciones{
	
	method estaDentroDelJuego()= (game.height() < 12 and game.height() > 0) or (game.width() < 20 and game.width() > 0)
}

object arriba inherits Direcciones{
	
	method estaEnElBorde() = (pacman.position().y() == 11)
	
	method avanzar(pacman) = if (self.estaDentroDelJuego() or not self.estaEnElBorde()) pacman.position().up(1) else pacman.position().up(0)
	
}
object derecha inherits Direcciones{
	method estaEnElBorde() = (pacman.position().x() == 19)
		
	method avanzar(pacman) = if (self.estaDentroDelJuego() or not self.estaEnElBorde()) pacman.position().right(1) else pacman.position().right(0)
}
object abajo inherits Direcciones{
	
	method estaEnElBorde() = (pacman.position().y() == 0)
		
	method avanzar(pacman)= if(self.estaDentroDelJuego() or not self.estaEnElBorde()) pacman.position().down(1) else pacman.position().down(0)

}
object izquierda inherits Direcciones{
	
	method estaEnElBorde() = (pacman.position().x() == 0)
	
	method avanzar(pacman) =  if(self.estaDentroDelJuego() or not self.estaEnElBorde()) 
		pacman.position().left(1) else pacman.position().left(0)
} 