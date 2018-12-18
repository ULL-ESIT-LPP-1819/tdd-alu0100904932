# Metodo para ordenar una array mediante for con ordenamiento por insercion
# @return [Array] Array ordenado
def ordenForMenus (array)
    ordenado = []
    for nodo in array
        if ordenado.empty?
            ordenado.push(nodo)
        else
            indice = 0
            while indice < ordenado.length
                aporteActual = (nodo.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
                aporteSiguiente = (ordenado[indice].collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
                if aporteActual <= aporteSiguiente
                    ordenado.insert(indice, nodo)
                    break
                elsif indice == ordenado.length-1
                    ordenado.insert(indice+1, nodo)
                    break
                end
                indice+=1
            end
        end
    end
    return ordenado
end

# Metodo para ordenar una array mediante each con ordenamiento por insercion
# @return [Array] Array ordenado
def ordenEachMenus (array)
    ordenado = []
    array.each do
        |nodo|
        if ordenado.empty?
            ordenado.push(nodo)
        else
            indice = 0
            while indice < ordenado.length
                aporteActual = (nodo.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
                aporteSiguiente = (ordenado[indice].collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
                if aporteActual <= aporteSiguiente
                    ordenado.insert(indice, nodo)
                    break
                elsif indice == ordenado.length-1
                    ordenado.insert(indice+1, nodo)
                    break
                end
                indice+=1
            end
        end
    end
    return ordenado
end