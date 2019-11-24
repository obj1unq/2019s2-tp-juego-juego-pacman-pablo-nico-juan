import wollok.game.*
import pacman.*
import fantasma.*
import complementos.*

object arriba{
	const property dirOpuesta = abajo
	
	method avanzar(pacman) = pacman.position().up(1)
	
}
object derecha{
	const property dirOpuesta = izquierda
	
	method avanzar(pacman) = pacman.position().right(1)
}
object abajo{
	const property dirOpuesta = arriba
	
	method avanzar(pacman)= pacman.position().down(1)

}
object izquierda{
	const property dirOpuesta = derecha
	
	method avanzar(pacman) = pacman.position().left(1)
} 