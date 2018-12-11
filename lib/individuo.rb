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
    attr_reader :datosAntropometricos, :nivelActividad
    
    # Initialize del paciente
    # @param nombre [String] Nombre del paciente
    # @param datosAntropometricos [DatosAntropometricos] Datos antropometricos del paciente
    # @param nivelActividad [String] Nivel actividad fisica del paciente
    def initialize (nombre, datosAntropometricos, nivelActividad)
        super(nombre)
        @datosAntropometricos = datosAntropometricos
        @nivelActividad = nivelActividad
    end
    
    # Formatea un paciente en un String
    # @return [String] Paciente formateado
    def to_s
        s = ""
        s += "Nombre: " + nombre + "\n" + datosAntropometricos.to_s + "\n Nivel actividad fisica: " + self.nivelActividad
        s
    end
    
    # Metodo para comparar dos pacientes segun su imc
    # @param another [Paciente] Paciente con el que comparar
    def <=> (another)
        self.datosAntropometricos.imc <=> another.datosAntropometricos.imc
    end
    
    # Calculo del peso teorico ideal
    # @return [Numeric] Peso teorico ideal
    def pesoTeoricoIdeal ()
        (self.datosAntropometricos.talla * 100 - 150) * 0.75 + 50
    end
    
    # Calculo del gasto energetico basal
    # @return [Numeric] Gasto energetico basal
    def gastoEnergeticoBasal ()
        if (self.datosAntropometricos.sexo == 0)
            (10 * self.datosAntropometricos.peso) + (6.25 * self.datosAntropometricos.talla  * 100) - (5 * self.datosAntropometricos.edad) - 161
        elsif (self.datosAntropometricos.sexo == 1)
            (10 * self.datosAntropometricos.peso) + (6.25 * self.datosAntropometricos.talla  * 100) - (5 * self.datosAntropometricos.edad) + 5
        end
    end
    
    # Calculo del efecto termogeno
    # @return [Numeric] Efecto termogeno
    def efectoTermogeno ()
        self.gastoEnergeticoBasal() * 0.10
    end
    
    # Calculo del gasto energetico segun actividad fisica
    # @return [Numeric] Gasto energetico segun actividad fisica
    def gastoActividadFisica ()
        case self.nivelActividad
            when "reposo" then self.gastoEnergeticoBasal() * 0.0
            when "ligera" then self.gastoEnergeticoBasal() * 0.12
            when "moderada" then self.gastoEnergeticoBasal() * 0.27
            when "intensa" then self.gastoEnergeticoBasal() * 0.54
        end
    end
    
    # Calculo del gasto energetico total
    # @return [Numeric] Gasto energetico total
    def gastoEnergeticoTotal()
        self.gastoEnergeticoBasal() + self.efectoTermogeno() + self.gastoActividadFisica()
    end
end