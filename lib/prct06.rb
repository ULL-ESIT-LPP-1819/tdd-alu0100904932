require "prct06/version"

class InformacionNutricional
    include Comparable
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
    
    def valorEnergeticoKJ
        (@grasas * 37) + (@hidratos * 17) + (@proteinas * 17)
    end
    
    def valorEnergeticoKcal
        (@grasas * 9) + (@hidratos * 4) + (@proteinas * 4)
    end
    
    def to_s
        "Nombre: #{@nombre}\n" +
        "Grasas: #{@grasas}\n" +
        "Grasas saturadas: #{@grasasSat}\n" +
        "Hidratos: #{@hidratos}\n" +
        "Azucares:  #{@azucares}\n" +
        "Proteinas: #{@proteinas}\n" +
        "Sal: #{@sal}"
    end
    
    def <=> (another)
        self.sal <=> another.sal
    end
end

Node = Struct.new(:value, :next, :prev)

class ListaDE
    include Enumerable
    attr_reader :head, :tail
    
    def initialize(value)
        nodo = Node.new(value)
        @head = nodo
        @tail = nodo
    end
    
    def insertarHead(value)
        nodo = Node.new(value)
        @head.next = nodo
        nodo.prev = @head
        @head = nodo
    end
    
    def insertarTail(value)
        nodo = Node.new(value)
        @tail.prev = nodo
        nodo.next = @tail
        @tail = nodo
    end
    
    def extraerHead ()
        @head = @head.prev
        @head.next = nil
    end
    
    def extraerTail()
        @tail = @tail.next
        @tail.prev = nil
    end
    
    def each
        nodo=@tail
        while nodo != nil
            yield nodo.value
            nodo = nodo.next
        end
    end
end
