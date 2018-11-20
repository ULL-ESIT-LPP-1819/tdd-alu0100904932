require "DatosAntropometricos"

class Individuo
    attr_reader :nombre
    
    def initialize (nombre)
        @nombre = nombre
    end
    
    def to_s
        s = ""
        s += "Nombre: " + nombre
        s
    end
end

class Paciente < Individuo
    include Comparable
    attr_reader :datosAntropometricos
    
    def initialize (nombre, datosAntropometricos)
        super(nombre)
        @datosAntropometricos = datosAntropometricos
    end
    
    def to_s
        s = ""
        s += "Nombre: " + nombre + "\n" + datosAntropometricos.to_s
        s
    end
    
    def <=> (another)
        self.datosAntropometricos.imc <=> another.datosAntropometricos.imc
    end
end