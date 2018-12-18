# Clase para representar los datos antropometricos de una persona
# @author Jesús Ramos Álvarez <alu0100904932@ull.edu.es>
class DatosAntropometricos
    
    attr_reader :peso, :talla, :sexo, :edad, :cintura, :cadera
    
    # Initialize para los datos antropometricos
    # @param peso [Numeric] Peso de la persona
    # @param talla [Numeric] Talla de la persona
    # @param sexo [Numeric] Sexo de la persona, 1 si es hombre, 0 si es mujer
    # @param edad [Numeric] Edad de la persona
    # @param cintura [Numeric] Medida de la cintura de la persona
    # @param cadera [Numeric] Medida de la cadera de la persona
    def initialize (peso, talla, sexo, edad, cintura, cadera)
        @peso = peso
        @talla = talla
        @sexo = sexo
        @edad = edad
        @cintura = cintura
        @cadera = cadera
    end

    # Calculo del indice de masa corporal de una persona
    # @return IMC de una persona
    def imc
        (@peso / (@talla * @talla)).round(1)
    end
    
    # Clasifica el IMC de una persona segun la OMS
    # @return [String] IMC de una persona segun la OMS
    def imcOMS
        case self.imc
            when 0..18.4 then "Bajo peso"
            when 18.5..24.9 then "Adecuado"
            when 25.0..29.9 then "Sobrepeso"
            when 30.0..34.9 then "Obesidad grado 1"
            when 35.0..39.9 then "Obesidad grado 2"
            else "Obesidad grado 3"
        end
    end
    
    # Clasifica el IMC de una persona segun lo popular
    # @return [String] IMC de una persona segun lo popular
    def imcPopular
        case self.imc
            when 0..18.4 then "Bajo peso"
            when 18.5..24.9 then "Adecuado"
            when 25.0..29.9 then "Sobrepeso"
            else "Obesidad"
        end
    end
    
    # Calculo del porcentaje de grasas de una persona
    # @return Porcentaje de grasa de una persona
    def porcGrasa
        (1.2 * self.imc + 0.23 * @edad - 10.8 * @sexo - 5.4).round(1)
    end
    
    # Calculo del RCC de una persona
    # @return RCC de una persona
    def rcc
        (@cintura / @cadera).round(2)
    end
    
    # Calcula el riesgo que puede tener una persona segun su RCC
    # @return [String] Riesgo de la persona
    # def rccRiesgo
    #     if @sexo == 1
    #         case self.rcc
    #             when 0.83..0.88 then "Bajo"
    #             when 0.89..0.95 then "Moderado"
    #             when 0.96..1.01 then "Alto"
    #             else "Muy alto"
    #         end
    #     elsif @sexo == 0
    #         case self.rcc
    #             when 0.72..0.75 then "Bajo"
    #             when 0.76..0.82 then "Moderado"
    #             else "Alto"
    #         end
    #     end
    # end
    
    # Formatea los datos antropometricos de una persona en un String
    # @return [String] Datos Antropometricos formateados
    def to_s
        "Peso: #{@peso}\n" +
        "Talla: #{@talla}\n" +
        "Sexo: #{@sexo}\n" +
        "Edad: #{@edad}\n" +
        "Cintura:  #{@cintura}\n" +
        "Cadera: #{@cadera}\n"
    end
    
end