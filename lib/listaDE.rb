Node = Struct.new(:value, :next, :prev)

class ListaDE
    include Enumerable
    attr_reader :head, :tail
    
    def initialize()
        @head = nil
        @tail = nil
    end
    
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
    
    def each
        nodo=@tail
        while nodo != nil
            yield nodo.value
            nodo = nodo.next
        end
    end
    
    def to_s
        s = ""
        each do
            |nodo| s += nodo.to_s + "\n"
        end
        s
    end
end