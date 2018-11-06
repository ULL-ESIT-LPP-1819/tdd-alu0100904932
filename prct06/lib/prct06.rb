require "prct06/version"

class InformacionNutricional
    attr_reader :nombre, :grasas, :grasasSat, :hidratos, :azucares, :proteinas, :sal
    
    def initialize (nombre, grasas, grasasSat, hidratos, azucares, proteinas, sal)
        @nombre = nombre
        @grasas = grasas
        @grasasSat = grasasSat
        @hidratos = hidratos
        @azucares = azucares
        @proteinas = proteinas
        @sal = sal
    end
end
