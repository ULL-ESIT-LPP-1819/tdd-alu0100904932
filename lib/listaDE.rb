# Estructura para representar los nodos de una lista
# Incluye el valor del nodo y los nodos siguiente y previo a este
Node = Struct.new(:value, :next, :prev)

# Clase lista doblemente enlazada
# @author Jesús Ramos Álvarez <alu0100904932@ull.edu.es>
class ListaDE
    include Enumerable
    attr_reader :head, :tail
    
    # Initialize de la lista, establece a nil la cabeza y la cola
    def initialize()
        @head = nil
        @tail = nil
    end
    
    # Inserta un nodo por la cabeza
    # @param value [value] Value del nodo a insertar
    def insertarHead(value)
        nodo = Node.new(value)
        if @head == nil and @tail == nil
            @head = nodo
            @tail = nodo
        else
            @head.next = nodo
            nodo.prev = @head
            @head = nodo
        end
    end
    
    # Inserta un nodo por la cola
    # @param value [value] Value del nodo a insertar
    def insertarTail(value)
        nodo = Node.new(value)
        if @head == nil and @tail == nil
            @head = nodo
            @tail = nodo
        else
            @tail.prev = nodo
            nodo.next = @tail
            @tail = nodo
        end
    end
    
    # Extrae un nodo por la cabeza de la lista
    # @return Nodo que se extrae
    def extraerHead ()
        extraer = @head
        headActual = @head.prev
        @head = headActual
        if headActual == nil
            @tail = nil
        else
            @head.next = nil
        end
        return extraer
    end
    
    # Extrae un nodo por la cola de la lista
    # @return Nodo que se extrae
    def extraerTail()
        extraer = @tail
        tailActual = @tail.next
        @tail = tailActual
        if tailActual == nil
            @head = nil
        else
            @tail.prev = nil
        end
        return extraer
    end
    
    # Metodo para recorrer cada elemento de la lista
    # @yield Cada nodo de la lista
    def each
        nodo=@tail
        while nodo != nil
            yield nodo.value
            nodo = nodo.next
        end
    end
    
    # Formatea la lista en un String
    # @return [String] Lista formateada
    def to_s
        s = ""
        each do
            |nodo| s += nodo.to_s + "\n"
        end
        s
    end
end