//asignar valores a las variables

object link{
	var vida
	var ataque
	var defensa
	
	method vida(){
		return vida
	}
	method vida(hp){
		vida = hp
	}
	method defensa(){
		return defensa
	}
	method defensa(def){
		defensa = def
	}
	
	method serAtacado(danio){
		vida = (vida - danio).max(0)
	}
	method estaSano(){
		return self.vida() >= 10
	}
	method recuperarVida(){
		self.vida(10)
	}
}

object octorokRojo{
	var vida
	var defensa
	
	method vida(){
		return vida
	}
	method vida(hp){
		vida = hp
	}
	method defensa(){
		return defensa
	}
	method defensa(def){
		defensa = def
	}
	
	method atacarA(alguien){
		alguien.serAtacado(0.25)
	}
}

object ganon{
	var vida
	var ataque
	var defensa
	
	method vida(){
		return vida
	}
	method vida(hp){
		vida = hp
	}
	method defensa(){
		return defensa
	}
	method defensa(def){
		defensa = def
	}
	
	method aumentarSalud(salud){
		vida = vida + salud
	}
	method atacarA(alguien){
		var danio = ataque/alguien.defensa()
		alguien.serAtacado(danio)
	}
	method movimientoEspecial(alguien){
		self.atacarA(alguien)
		self.aumentarSalud(1)
	}
}

object zelda{
	var vida
	var ataque
	var defensa
	var titulo = 'Zelda'
	var arco = arcoSagrado //se puede declarar tanto arcoSagrado como arcoSeno, ver mas abajo, concepto de Interfaz
	
	method titulo(){
		return titulo
	}
	method vida(){
		return vida
	}
	method vida(hp){
		vida = hp
	}
	method defensa(){
		return defensa
	}
	method defensa(def){
		defensa = def
	}
	
//	method mitigarDanio(){
//		return (self.defensa()*self.titulo().size())/500
//	}
	method danioMitigado(danio){
		return danio*(self.defensa()*self.titulo().size())/500
	}
	method perderVida(vidaPerdida){
		vida = 0.max(vida-vidaPerdida)
	}
	method serAtacado(danio){
//		vida = self.vida() - (danio*self.mitigarDanio()) (v1) *conviene usar los getters para acceder a ciertos atributos*
//		self.perderVida(danio*self.mitigarDanio())       (v2)
		self.perderVida(self.danioMitigado(danio))    // (v3) *tratar de mitigar el danio en mitigarDanio*
	}
	
	method curarA(personaje){
		if(!personaje.estaSano()){
			personaje.recuperarVida()
		}
	}
	
	method atacarA(alguien){
		alguien.serAtacado(arco.calcularDanio(self,alguien))
	}
}

object arcoSagrado{
	method calcularDanio(atacante,atacado){
		return (atacante.vida() - atacado.ataque()).abs()
	}
}

object arcoSeno{
	method calcularDanio(atacante,atacado){
		return 0
	}
}
















