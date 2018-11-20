class DatosAntropometricos
    
    attr_reader :peso, :talla, :sexo, :edad, :cintura, :cadera
    
    def initialize (peso, talla, sexo, edad, cintura, cadera)
        @peso = peso
        @talla = talla
        @sexo = sexo
        @edad = edad
        @cintura = cintura
        @cadera = cadera
    end

    def imc
        (@peso / (@talla * @talla)).round(1)
    end
    
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
    
    def imcPopular
        case self.imc
            when 0..18.4 then "Bajo peso"
            when 18.5..24.9 then "Adecuado"
            when 25.0..29.9 then "Sobrepeso"
            else "Obesidad"
        end
    end
    
    def porcGrasa
        (1.2 * self.imc + 0.23 * @edad - 10.8 * @sexo - 5.4).round(1)
    end
    
    def rcc
        (@cintura / @cadera).round(2)
    end
    
    def rccRiesgo
        if @sexo == 1
            case self.rcc
                when 0.83..0.88 then "Bajo"
                when 0.89..0.95 then "Moderado"
                when 0.96..1.01 then "Alto"
                else "Muy alto"
            end
        elsif @sexo == 0
            case self.rcc
                when 0.72..0.75 then "Bajo"
                when 0.76..0.82 then "Moderado"
                else "Alto"
            end
        end
    end
    
    def to_s
        "Peso: #{@peso}\n" +
        "Talla: #{@talla}\n" +
        "Sexo: #{@sexo}\n" +
        "Edad: #{@edad}\n" +
        "Cintura:  #{@cintura}\n" +
        "Cadera: #{@cadera}\n"
    end
    
end