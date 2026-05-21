object neo {
  var energia = 100

  method esElElegido() = true

  method saltar() {
    energia = energia / 2
  }

  method vitalidad() = energia * 0.10
}

object morfeo {
  var estaCansado = false
  var vitalidad = 8

  method esElElegido() = false
  
  method saltar() {
    vitalidad -= 1
    estaCansado = not estaCansado
  }

  method vitalidad() = vitalidad 
}

object trinity {
  method esElElegido() = false

  method vitalidad() = 0

  method saltar() {}
}

object nave {
  const pasajeros = []

  method cantPasajeros() = pasajeros.size()

  method pasajeroMayorVitalidad() = pasajeros.max({p => p.vitalidad()})

  method pasajeroMenorVitalidad() = pasajeros.min({p => p.vitalidad()})

  method vitalidadEstaEquilibrada() {
    (self.pasajeroMayorVitalidad().vitalidad() / self.pasajeroMenorVitalidad().vitalidad()) < 2
  }

  method estaElElegido() {
    pasajeros.any({p => p.esElElegido()})
  } 

  method chocar() {
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
  }

  method acelerar() {
    pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.saltar()})
  }
}