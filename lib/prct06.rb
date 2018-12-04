require "prct06/version"

# Clase para representar la información nutricional de un alimento
# @author Jesús Ramos Álvarez <alu0100904932@ull.edu.es>
class InformacionNutricional
    include Comparable
    attr_reader :nombre, :grasas, :grasasSat, :hidratos, :azucares, :proteinas, :sal
    
    # Initialize de la etiqueta de informacion nutricional
    # @param nombre [String] Nombre del alimento
    # @param grasas [Numeric] Grasas del alimento
    # @param grasasSat [Numeric] Grasas saturadas del alimento
    # @param hidratos [Numeric] Hidratos del alimento
    # @param azucares [Numeric] Azucares del alimento
    # @param proteinas [Numeric] Proteinas del alimento
    # @param sal [Numeric] Sal del alimento
    def initialize (nombre, grasas, grasasSat, hidratos, azucares, proteinas, sal)
        @nombre = nombre
        @grasas = grasas
        @grasasSat = grasasSat
        @hidratos = hidratos
        @azucares = azucares
        @proteinas = proteinas
        @sal = sal
    end
    
    # Calculo del valor energetico de un alimento en KJ
    # @return Valor energetico de un alimento en KJ
    def valorEnergeticoKJ
        (@grasas * 37) + (@hidratos * 17) + (@proteinas * 17)
    end
    
    # Calculo del valor energetico de un alimento en Kcal
    # @return Valor energetico de un alimento en Kcal
    def valorEnergeticoKcal
        (@grasas * 9) + (@hidratos * 4) + (@proteinas * 4)
    end
    
    # Formatea la informacion nutricional de un alimento en un String
    # @return [String] Informacion nutricional del alimento formateada
    def to_s
        "Nombre: #{@nombre}\n" +
        "Grasas: #{@grasas}\n" +
        "Grasas saturadas: #{@grasasSat}\n" +
        "Hidratos: #{@hidratos}\n" +
        "Azucares:  #{@azucares}\n" +
        "Proteinas: #{@proteinas}\n" +
        "Sal: #{@sal}\n"
    end
    
    # Metodo para comparar las etiquetas de dos alimentos segun sus Kcal
    # @param another [InformacionNutriciona] Etiqueta del alimento con el que comparar
    def <=> (another)
        self.valorEnergeticoKcal <=> another.valorEnergeticoKcal
    end
end
