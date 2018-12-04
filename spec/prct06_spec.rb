require "spec_helper"
require 'prct06'
require 'listaDE'
require 'individuo'
require 'DatosAntropometricos'

RSpec.describe Prct06 do
  
  before :all do
    # Info Nutricional
    @alimento1 = InformacionNutricional.new("Alimento 1", 10, 20, 30, 40, 50, 10)
    @alimento2 = InformacionNutricional.new("Alimento 2", 20, 10, 10, 20, 30, 20)
    @alimento3 = InformacionNutricional.new("Alimento 3", 10, 2, 2, 10, 20, 5)
    @alimento4 = InformacionNutricional.new("Alimento 4", 1, 30, 20, 10, 40, 15)
    @alimento5 = InformacionNutricional.new("Alimento 5", 10, 20, 30, 40, 50, 50)
    # Lista doblemente enlazada
    @lista = ListaDE.new()
    @lista.insertarHead(@alimento1)
    @lista.insertarHead(@alimento2)
    @lista.insertarHead(@alimento3)
    @lista.insertarHead(@alimento4)
    @lista.insertarHead(@alimento5)
    # Pacientes y lista de pacientes
    datosAntropometricos = DatosAntropometricos.new(95.0, 1.83, 1, 25, 85.0, 82.0)
    @paciente1 = Paciente.new("paciente1", datosAntropometricos)
    datosAntropometricos = DatosAntropometricos.new(60.0, 1.60, 0, 25, 65.0, 100.0)
    @paciente2 = Paciente.new("paciente2", datosAntropometricos)
    datosAntropometricos = DatosAntropometricos.new(89.0, 1.80, 1, 21, 80.0, 78.0)
    @paciente3 = Paciente.new("paciente3", datosAntropometricos)
    datosAntropometricos = DatosAntropometricos.new(70.0, 1.70, 0, 30, 70.0, 80.0)
    @paciente4 = Paciente.new("paciente4", datosAntropometricos)
    datosAntropometricos = DatosAntropometricos.new(110.0, 1.80, 1, 41, 95.0, 93.0)
    @paciente5 = Paciente.new("paciente5", datosAntropometricos)
    @listaPacientes = ListaDE.new();
    @listaPacientes.insertarHead(@paciente1)
    @listaPacientes.insertarHead(@paciente2)
    @listaPacientes.insertarHead(@paciente3)
    @listaPacientes.insertarHead(@paciente4)
    @listaPacientes.insertarHead(@paciente5)
  end
  
  ################################################
  # Pruebas practica 6 - Informacion nutricional #
  ################################################

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
                                    "Sal: #{@alimento1.sal}\n")
    end
  end
  
  ##################################################
  # Pruebas practica 7 - Lista doblemente enlazada #
  ##################################################
  describe "Lista doblemente enlazada ordenando sus elementos con los modulos Comparable y Enumerable" do
    it "Los elementos se ordenan por su sal" do
      expect(@lista.sort_by { |nodo| nodo.sal }).to eq([@alimento3, @alimento1, @alimento4, @alimento2, @alimento5])
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
    end
  end
  
  #################################
  # Pruebas practica 8 - Herencia #
  #################################
  describe "Pruebas de jerarquía" do
    it "La clase del paciente es paciente" do
      expect(@paciente1.class).to eq(Paciente)
    end
    it "La superclase del paciente es individuo" do
      expect(@paciente1.class.superclass).to eq(Individuo)
    end
    it "El tipo del paciente es objeto" do
      expect(@paciente1.is_a?Object).to eq(true)
    end
    it "El tipo del paciente es individuo" do
      expect(@paciente1.is_a?Paciente).to eq(true)
    end
    it "El tipo del paciente es paciente" do
      expect(@paciente1.is_a?Individuo).to eq(true)
    end
  end
  
  describe "Pruebas de la lista de pacientes" do
    it "La lista de pacientes no esta vacia" do
      expect(@listaPacientes.head).not_to eq(nil)
      expect(@listaPacientes.tail).not_to eq(nil)
    end
    it "Los pacientes se ordenan por su imc" do
      expect(@listaPacientes.sort).to eq([@paciente2, @paciente4, @paciente3, @paciente1, @paciente5])
    end
    it "El paciente 1 tiene sobrepeso" do
      expect(@listaPacientes.extraerTail.value.datosAntropometricos.imcPopular).to eq("Sobrepeso")
    end
    it "El paciente 2 tiene peso adecuado" do
      expect(@listaPacientes.extraerTail.value.datosAntropometricos.imcPopular).to eq("Adecuado")
    end
    it "El paciente 3 tiene sobrepeso" do
      expect(@listaPacientes.extraerTail.value.datosAntropometricos.imcPopular).to eq("Sobrepeso")
    end
    it "El paciente 4 tiene peso adecuado" do
      expect(@listaPacientes.extraerTail.value.datosAntropometricos.imcPopular).to eq("Adecuado")
    end
    it "El paciente 5 tiene obesidad" do
      expect(@listaPacientes.extraerTail.value.datosAntropometricos.imcPopular).to eq("Obesidad")
    end
  end
  
  ################################
  # Pruebas practica 9 - Modulos #
  ################################
  describe "Pruebas comparar la informacion nutricional, por sus kcal" do
    it "kcal alimento 1 > kcal alimento 4" do
      expect(@alimento1 > @alimento4).to eq (true)
    end
    it "kcal alimento 1 >= kcal alimento 4" do
      expect(@alimento1 >= @alimento4).to eq (true)
    end
    it "kcal alimento 4 < kcal alimento 1" do
      expect(@alimento4 < @alimento1).to eq (true)
    end
    it "kcal alimento 4 <= kcal alimento 1" do
      expect(@alimento4 <= @alimento1).to eq (true)
    end
    it "kcal alimento 1 != kcal alimento 4" do
      expect(@alimento1 != @alimento4).to eq (true)
    end
    it "kcal alimento 1 == kcal alimento 4 - falso" do
      expect(@alimento1 == @alimento4).to eq (false)
    end
    it "kcal alimento 2 entre las del alimento 4 y 1" do
      expect(@alimento2.between?(@alimento4,@alimento1)).to eq (true)
    end
  end
  
  describe "Pruebas comparar la valoracion nutricional, por su imc" do
    it "imc paciente 1 > imc paciente 2" do
      expect(@paciente1 > @paciente2).to eq (true)
    end
    it "imc paciente 1 >= imc paciente 2" do
      expect(@paciente1 >= @paciente2).to eq (true)
    end
    it "imc paciente 2 < imc paciente 1" do
      expect(@paciente2 < @paciente1).to eq (true)
    end
    it "imc paciente 2 <= imc paciente 1" do
      expect(@paciente2 <= @paciente1).to eq (true)
    end
    it "imc paciente 1 != imc paciente 2" do
      expect(@paciente1 != @paciente2).to eq (true)
    end
    it "imc paciente 1 == imc paciente 2 - false" do
      expect(@paciente1 == @paciente2).to eq (false)
    end
    it "imc paciente 3 entre las del paciente 2 y 1" do
      expect(@paciente3.between?(@paciente2, @paciente1)).to eq (true)
    end
  end
  
  describe "Pruebas enumerable listas de etiquetas de informacion nutricional" do
    it "Sort" do
      expect(@lista.sort).to eq([@alimento3, @alimento2, @alimento1])
    end
    it "Collect" do
      expect(@lista.collect { |alimento| alimento.valorEnergeticoKcal}).to eq([340, 410, 178])
    end
    it "Select" do
      expect(@lista.select { |alimento| alimento.valorEnergeticoKcal >= 200}).to eq([@alimento2, @alimento1])
    end
    it "Max" do
      expect(@lista.max).to eq(@alimento1)
    end
    it "Min" do
      expect(@lista.min).to eq(@alimento3)
    end
  end
  
end