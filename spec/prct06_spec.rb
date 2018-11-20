require "spec_helper"
require 'lib/prct06'

RSpec.describe Prct06 do
  
  before :all do
    @alimento1 = InformacionNutricional.new("Alimento 1", 10, 20, 30, 40, 50, 10)
    @alimento2 = InformacionNutricional.new("Alimento 2", 10, 20, 30, 40, 50, 20)
    @alimento3 = InformacionNutricional.new("Alimento 3", 10, 20, 30, 40, 50, 5)
    @alimento4 = InformacionNutricional.new("Alimento 4", 10, 20, 30, 40, 50, 15)
    @alimento5 = InformacionNutricional.new("Alimento 5", 10, 20, 30, 40, 50, 50)
    @lista = ListaDE.new()
    @lista.insertarHead(@alimento1)
    @lista.insertarHead(@alimento2)
    @lista.insertarHead(@alimento3)
    @lista.insertarHead(@alimento4)
    @lista.insertarHead(@alimento5)
  end

  describe "El alimento se inicializa correctamente y se puede acceder a sus atributos" do
    it "Se almacena y se accede correctamente al atributo nombre" do
      expect(@alimento1.nombre).to eq("Alimento 1")
    end
    it "Se almacena y se accede correctamente al atributo grasas" do
      expect(@alimento1.grasas).to eq(10)
    end
    it "Se almacena y se accede correctamente al atributo grasasSat" do
      expect(@alimento1.grasasSat).to eq(20)
    end 
    it "Se almacena y se accede correctamente al atributo hidratos" do
      expect(@alimento1.hidratos).to eq(30)
    end
    it "Se almacena y se accede correctamente al atributo azucares" do
      expect(@alimento1.azucares).to eq(40)
    end
    it "Se almacena y se accede correctamente al atributo proteinas" do
      expect(@alimento1.proteinas).to eq(50)
    end
    it "Se almacena y se accede correctamente al atributo sal" do
      expect(@alimento1.sal).to eq(10)
    end
  end
  
  describe "Calculo del valor energetico" do
    it "Se calcula el valor energetico en KJ correctamente" do
      expect(@alimento1.valorEnergeticoKJ).to eq(1730)
    end
    it "Se calcula el valor energetico en kcal correctamente" do
      expect(@alimento1.valorEnergeticoKcal).to eq(410)
    end
  end
  
  describe "Formato de la informacion" do
    it "Se muestra la informacion de forma correcta" do
      expect(@alimento1.to_s).to eq("Nombre: #{@alimento1.nombre}\n" +
                                    "Grasas: #{@alimento1.grasas}\n" +
                                    "Grasas saturadas: #{@alimento1.grasasSat}\n" +
                                    "Hidratos: #{@alimento1.hidratos}\n" +
                                    "Azucares:  #{@alimento1.azucares}\n" +
                                    "Proteinas: #{@alimento1.proteinas}\n" +
                                    "Sal: #{@alimento1.sal}")
    end
  end
  
  # Pruebas para la lista doblemente enlazada
  describe "Lista doblemente enlazada ordenando sus elementos con los modulos Comparable y Enumerable" do
    it "Los elementos se ordenan por su sal" do
      expect(@lista.sort).to eq([@alimento3, @alimento1, @alimento4, @alimento2, @alimento5])
    end
    it "Los elementos se ordenan por su nombre" do
      expect(@lista.sort_by { |nodo| nodo.nombre }).to eq([@alimento1, @alimento2, @alimento3, @alimento4, @alimento5])
    end
    it "Se extrae elemento de head" do
      expect(@lista.extraerHead.value).to eq(@alimento5)
    end
    it "Se extrae elemento de tail" do
      expect(@lista.extraerTail.value).to eq(@alimento1)
    end
    it "Se extrae elemento de head" do
      expect(@lista.extraerHead.value).to eq(@alimento4)
    end
    it "Se extrae elemento de tail" do
      expect(@lista.extraerTail.value).to eq(@alimento2)
    end
    it "Se extrae elemento de head" do
      expect(@lista.extraerHead.value).to eq(@alimento3)
    end
    it "La lista está vacía" do
      expect(@lista.head).to eq(nil)
      expect(@lista.tail).to eq(nil)
    end
    it "Se le añade el alimento 1 a una lista vacía" do
      @lista.insertarHead(@alimento1)
      expect(@lista.head.value).to eq(@alimento1)
      expect(@lista.tail.value).to eq(@alimento1)
    end
    it "Se añade el alimento 2 por tail" do
      @lista.insertarTail(@alimento2)
      expect(@lista.head.value).to eq(@alimento1)
      expect(@lista.tail.value).to eq(@alimento2)
    end
    it "Se añade el alimento 3 por head" do
      @lista.insertarHead(@alimento3)
      expect(@lista.head.value).to eq(@alimento3)
      expect(@lista.tail.value).to eq(@alimento2)
      @lista.to_s
    end
  end
end
