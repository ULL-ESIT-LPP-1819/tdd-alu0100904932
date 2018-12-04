require "DatosAntropometricos"

# Clase individuo, un individuo solo dispone de nombre
# @author Jesús Ramos Álvarez <alu0100904932@ull.edu.es>
class Individuo
    attr_reader :nombre
    
    # Initialize del individuo
    # @param nombre [String] Nombre del individuo
    def initialize (nombre)
        @nombre = nombre
    end
    
    # Formatea un individuo en un String
    # @return [String] Individuo formateado
    def to_s
        s = ""
        s += "Nombre: " + nombre
        s
    end
end

# Clase paciente que hereda de individuo e incluye los datos antropometricos
# @author Jesús Ramos Álvarez <alu0100904932@ull.edu.es>
class Paciente < Individuo
    include Comparable
    attr_reader :datosAntropometricos
    
    # Initialize del paciente
    # @param nombre [String] Nombre del paciente
    # @param datosAntropometricos [DatosAntropometricos] Datos antropometricos del paciente
    def initialize (nombre, datosAntropometricos)
        super(nombre)
        @datosAntropometricos = datosAntropometricos
    end
    
    # Formatea un paciente en un String
    # @return [String] Paciente formateado
    def to_s
        s = ""
        s += "Nombre: " + nombre + "\n" + datosAntropometricos.to_s
        s
    end
    
    # Metodo para comparar dos pacientes segun su imc
    # @param another [Paciente] Paciente con el que comparar
    def <=> (another)
        self.datosAntropometricos.imc <=> another.datosAntropometricos.imc
    end
end