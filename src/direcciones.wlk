import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*

object arriba{
	const property dirOpuesta = abajo
	
	method avanzar(pacman) = if(game.height() < 12 && game.height() > 0) pacman.position().up(1) else pacman.position().up(0)
	
}
object derecha{
	const property dirOpuesta = izquierda
	
	method avanzar(pacman) = if(game.width() < 20 && game.width() > 0) pacman.position().right(1) else pacman.position().right(0)
}
object abajo{
	const property dirOpuesta = arriba
	
	method avanzar(pacman)= if(game.height() < 12 && game.height() > 0) pacman.position().down(1) else pacman.position().down(0)

}
object izquierda{
	const property dirOpuesta = derecha
	
	method avanzar(pacman) =  if(game.width() < 20 && game.width() > 0) pacman.position().left(1) else pacman.position().down(0)
} 