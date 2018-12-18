require "spec_helper"
require 'prct06'
require 'listaDE'
require 'individuo'
require 'DatosAntropometricos'
require 'orden'
require 'benchmark'

RSpec.describe Prct06 do
  
  before :all do
    # Info Nutricional
    @alimento1 = InformacionNutricional.new("Alimento 1", 10, 20, 30, 40, 50, 10) # Desayuno
    @alimento2 = InformacionNutricional.new("Alimento 2", 20, 10, 10, 20, 30, 20) # Desayuno
    @alimento3 = InformacionNutricional.new("Alimento 3", 10, 2, 2, 10, 20, 5) # Desayuno
    @alimento4 = InformacionNutricional.new("Alimento 4", 1, 30, 20, 10, 40, 15) # Desayuno
    @alimento5 = InformacionNutricional.new("Alimento 5", 3, 2, 3, 5, 5, 1) # Almuerzo
    @alimento6 = InformacionNutricional.new("Alimento 6", 10, 8, 5, 3, 30, 10) # Almuerzo
    @alimento7 = InformacionNutricional.new("Alimento 7", 20, 10, 15, 10, 50, 30) # Almuerzo
    @alimento8 = InformacionNutricional.new("Alimento 8", 10, 3, 10, 6, 20, 3) # Almuerzo
    @alimento9 = InformacionNutricional.new("Alimento 9", 10, 5, 5, 2, 15, 2) # Cena
    @alimento10 = InformacionNutricional.new("Alimento 10", 20, 10, 20, 15, 40, 10) # Cena
    @alimento11 = InformacionNutricional.new("Alimento 11", 5, 2, 3, 1, 20, 5) # Cena
    @alimento12 = InformacionNutricional.new("Alimento 12", 8, 5, 3, 2, 10, 3) # Cena
    # Lista doblemente enlazada
    @lista = ListaDE.new()
    @lista.insertarHead(@alimento1)
    @lista.insertarHead(@alimento2)
    @lista.insertarHead(@alimento3)
    @lista.insertarHead(@alimento4)
    @lista.insertarHead(@alimento5)
    # Pacientes y lista de pacientes
    datosAntropometricos = DatosAntropometricos.new(95.0, 1.83, 1, 25, 85.0, 82.0)
    @paciente1 = Paciente.new("paciente1", datosAntropometricos, "moderada")
    datosAntropometricos = DatosAntropometricos.new(60.0, 1.60, 0, 25, 65.0, 100.0)
    @paciente2 = Paciente.new("paciente2", datosAntropometricos, "ligera")
    datosAntropometricos = DatosAntropometricos.new(89.0, 1.80, 1, 21, 80.0, 78.0)
    @paciente3 = Paciente.new("paciente3", datosAntropometricos, "intensa")
    datosAntropometricos = DatosAntropometricos.new(70.0, 1.70, 0, 30, 70.0, 80.0)
    @paciente4 = Paciente.new("paciente4", datosAntropometricos, "moderada")
    datosAntropometricos = DatosAntropometricos.new(110.0, 1.80, 1, 41, 95.0, 93.0)
    @paciente5 = Paciente.new("paciente5", datosAntropometricos, "ligera")
    datosAntropometricos = DatosAntropometricos.new(85.0, 1.75, 1, 41, 83.0, 80.0)
    @paciente6 = Paciente.new("paciente6", datosAntropometricos, "moderada")
    datosAntropometricos = DatosAntropometricos.new(85.0, 1.80, 1, 21, 82.0, 80.0)
    @paciente7 = Paciente.new("paciente7", datosAntropometricos, "intensa")
    datosAntropometricos = DatosAntropometricos.new(65.0, 1.65, 0, 25, 65.0, 85.0)
    @paciente8 = Paciente.new("paciente8", datosAntropometricos, "ligera")
    datosAntropometricos = DatosAntropometricos.new(68.0, 1.60, 0, 30, 72.0, 82.0)
    @paciente9 = Paciente.new("paciente9", datosAntropometricos, "moderada")
    datosAntropometricos = DatosAntropometricos.new(63.0, 1.63, 0, 25, 70.0, 90.0)
    @paciente10 = Paciente.new("paciente10", datosAntropometricos, "ligera")
    datosAntropometricos = DatosAntropometricos.new(40.0, 1.63, 0, 25, 70.0, 90.0)
    @paciente11 = Paciente.new("paciente10", datosAntropometricos, "ligera")
    datosAntropometricos = DatosAntropometricos.new(150.0, 1.63, 0, 25, 70.0, 90.0)
    @paciente12 = Paciente.new("paciente10", datosAntropometricos, "ligera")
    datosAntropometricos = DatosAntropometricos.new(100.0, 1.63, 0, 25, 70.0, 90.0)
    @paciente13 = Paciente.new("paciente10", datosAntropometricos, "ligera")
    @listaPacientes = ListaDE.new();
    @listaPacientes.insertarHead(@paciente1)
    @listaPacientes.insertarHead(@paciente2)
    @listaPacientes.insertarHead(@paciente3)
    @listaPacientes.insertarHead(@paciente4)
    @listaPacientes.insertarHead(@paciente5)
    # Arrays de menus y pacientes
    @arrayMenu1 = [@alimento1, @alimento2, @alimento3, @alimento5, @alimento6, @alimento8, @alimento9]
    @arrayMenu2 = [@alimento1, @alimento2, @alimento4, @alimento6, @alimento7, @alimento8, @alimento10, @alimento11]
    @arrayMenu3 = [@alimento1, @alimento2, @alimento3, @alimento4, @alimento5, @alimento6, @alimento7, @alimento8, @alimento9, @alimento10, @alimento11, @alimento12]
    @arrayMenu4 = [@alimento2, @alimento3, @alimento4, @alimento5, @alimento7, @alimento8, @alimento9, @alimento12]
    @arrayMenu5 = [@alimento1, @alimento3, @alimento7, @alimento8, @alimento9, @alimento10, @alimento11, @alimento12]
    @arrayMenu6 = [@alimento1, @alimento2, @alimento3, @alimento7, @alimento8, @alimento9, @alimento10, @alimento11, @alimento12]
    @arrayMenu7 = [@alimento1, @alimento3, @alimento4, @alimento5, @alimento7, @alimento8, @alimento9, @alimento10, @alimento11]
    @arrayMenu8 = [@alimento1, @alimento7, @alimento8, @alimento9, @alimento11, @alimento12]
    @arrayMenu9 = [@alimento1, @alimento4, @alimento7, @alimento8, @alimento9, @alimento10, @alimento11, @alimento12]
    @arrayMenu10 = [@alimento3, @alimento7, @alimento8, @alimento9, @alimento10, @alimento11, @alimento12]
    @arrayPacientes = [@paciente1, @paciente2, @paciente3, @paciente4, @paciente5]
    # Practica 11
    @arrayMenus = [@arrayMenu1, @arrayMenu2, @arrayMenu3, @arrayMenu4, @arrayMenu5, @arrayMenu6, @arrayMenu7, @arrayMenu8, @arrayMenu9, @arrayMenu10]
    @listaPacientes2 = ListaDE.new();
    @listaPacientes2.insertarHead(@paciente1)
    @listaPacientes2.insertarHead(@paciente2)
    @listaPacientes2.insertarHead(@paciente3)
    @listaPacientes2.insertarHead(@paciente4)
    @listaPacientes2.insertarHead(@paciente5)
    @listaPacientes2.insertarHead(@paciente6)
    @listaPacientes2.insertarHead(@paciente7)
    @listaPacientes2.insertarHead(@paciente8)
    @listaPacientes2.insertarHead(@paciente9)
    @listaPacientes2.insertarHead(@paciente10)
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
  
  #################################
  # Pruebas Datos Antropometricos #
  #################################
  
  describe "Pruebas clase Datos Antropometricos" do
    it "Formato de los datos antropometricos" do
      expect(@paciente1.datosAntropometricos.to_s).to eq("Peso: #{@paciente1.datosAntropometricos.peso}\n" +
                                      "Talla: #{@paciente1.datosAntropometricos.talla}\n" +
                                      "Sexo: #{@paciente1.datosAntropometricos.sexo}\n" +
                                      "Edad: #{@paciente1.datosAntropometricos.edad}\n" +
                                      "Cintura:  #{@paciente1.datosAntropometricos.cintura}\n" +
                                      "Cadera: #{@paciente1.datosAntropometricos.cadera}\n")
    end
    it "imcPopular" do
      expect(@paciente11.datosAntropometricos.imcPopular).to eq("Bajo peso")
    end
    it "imcOMS" do
      expect(@paciente11.datosAntropometricos.imcOMS).to eq("Bajo peso")
      expect(@paciente1.datosAntropometricos.imcOMS).to eq("Sobrepeso")
      expect(@paciente2.datosAntropometricos.imcOMS).to eq("Adecuado")
      expect(@paciente5.datosAntropometricos.imcOMS).to eq("Obesidad grado 1")
      expect(@paciente13.datosAntropometricos.imcOMS).to eq("Obesidad grado 2")
      expect(@paciente12.datosAntropometricos.imcOMS).to eq("Obesidad grado 3")
    end
    it "Porcentaje de grasa" do
      expect(@paciente1.datosAntropometricos.porcGrasa).to eq(23.6)
    end
    it "rcc" do
      expect(@paciente1.datosAntropometricos.rcc).to eq(1.04)
    end
  end
  
  ##################################################
  # Pruebas practica 7 - Lista doblemente enlazada #
  ##################################################
  describe "Lista doblemente enlazada ordenando sus elementos con los modulos Comparable y Enumerable" do
    it "Los elementos se ordenan por su sal" do
      expect(@lista.sort_by { |nodo| nodo.sal }).to eq([@alimento5, @alimento3, @alimento1, @alimento4, @alimento2])
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
    # it "Los pacientes se ordenan por su imc" do
    #   expect(@listaPacientes.sort).to eq([@paciente2, @paciente4, @paciente3, @paciente1, @paciente5])
    # end
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
      @listaPacientes.insertarHead(@paciente1)
      @listaPacientes.insertarHead(@paciente2)
      @listaPacientes.insertarHead(@paciente3)
      @listaPacientes.insertarHead(@paciente4)
      @listaPacientes.insertarHead(@paciente5)
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
  
  # describe "Pruebas comparar la valoracion nutricional, por su imc" do
  #   it "imc paciente 1 > imc paciente 2" do
  #     expect(@paciente1 > @paciente2).to eq (true)
  #   end
  #   it "imc paciente 1 >= imc paciente 2" do
  #     expect(@paciente1 >= @paciente2).to eq (true)
  #   end
  #   it "imc paciente 2 < imc paciente 1" do
  #     expect(@paciente2 < @paciente1).to eq (true)
  #   end
  #   it "imc paciente 2 <= imc paciente 1" do
  #     expect(@paciente2 <= @paciente1).to eq (true)
  #   end
  #   it "imc paciente 1 != imc paciente 2" do
  #     expect(@paciente1 != @paciente2).to eq (true)
  #   end
  #   it "imc paciente 1 == imc paciente 2 - false" do
  #     expect(@paciente1 == @paciente2).to eq (false)
  #   end
  #   it "imc paciente 3 entre las del paciente 2 y 1" do
  #     expect(@paciente3.between?(@paciente2, @paciente1)).to eq (true)
  #   end
  # end
  
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
  
  # describe "Pruebas enumerable listas de valoraciones nutricionales de individuos" do
  #   it "Sort" do
  #     expect(@listaPacientes.sort).to eq([@paciente2, @paciente4, @paciente3, @paciente1, @paciente5])
  #   end
  #   it "Collect" do
  #     expect(@listaPacientes.collect { |paciente| paciente.datosAntropometricos.imcPopular}).to eq(["Sobrepeso", "Adecuado", "Sobrepeso", "Adecuado", "Obesidad"])
  #   end
  #   it "Select" do
  #     expect(@listaPacientes.select { |paciente| paciente.datosAntropometricos.imcPopular == "Sobrepeso"}).to eq([@paciente1, @paciente3])
  #   end
  #   it "Max" do
  #     expect(@listaPacientes.max).to eq(@paciente5)
  #   end
  #   it "Min" do
  #     expect(@listaPacientes.min).to eq(@paciente2)
  #   end
  # end
  
  ################################################
  # Pruebas practica 10 - Programacion Funcional #
  ################################################
  
  describe "Pruebas nuevo metodo clase Paciente" do
    it "Calculo del gasto energetico total del paciente 1" do
      expect(@paciente1.gastoEnergeticoTotal()).to eq(2704.04)
    end
    it "Calculo del gasto energetico total del paciente 2" do
      expect(@paciente2.gastoEnergeticoTotal()).to eq(1603.08)
    end
    it "Calculo del gasto energetico total del paciente 3" do
      expect(@paciente3.gastoEnergeticoTotal()).to eq(3140.6)
    end
    it "Calculo del gasto energetico total del paciente 4" do
      expect(@paciente4.gastoEnergeticoTotal()).to eq(1988.56)
    end
    it "Calculo del gasto energetico total del paciente 5" do
      expect(@paciente5.gastoEnergeticoTotal()).to eq(2470.5)
    end
  end
  
  describe "Pruebas calculo aporte energetico de los menus" do
    it "Aporte energetico menu 1" do
      expect((@arrayMenu1.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)).to eq(1597)
    end
    it "Aporte energetico menu 2" do
      expect((@arrayMenu2.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)).to eq(2436)
    end
    it "Aporte energetico menu 3" do
      expect((@arrayMenu3.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)).to eq(2967)
    end
    it "Aporte energetico menu 4" do
      expect((@arrayMenu4.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)).to eq(1770)
    end
    it "Aporte energetico menu 5" do
      expect((@arrayMenu5.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)).to eq(2089)
    end
  end
  
  describe "Pruebas comparacion aporte menus con el gastos de los pacientes" do
    it "Prueba Menu 1 - true en caso de que el menu sea adecuado" do
      aporteMenu1 = (@arrayMenu1.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
      arrayGastos = @arrayPacientes.collect { |paciente| paciente.gastoEnergeticoTotal }
      porcentajeMenu1 = aporteMenu1 * 0.1
      arrayCorrespondencia = arrayGastos.collect { |gastoEnergetico| gastoEnergetico.between?(aporteMenu1 - porcentajeMenu1, aporteMenu1 + porcentajeMenu1)}
      expect(@arrayPacientes.zip(arrayCorrespondencia)).to eq([[@paciente1, false], [@paciente2, true], [@paciente3, false], [@paciente4, false], [@paciente5, false]])
    end
    it "Prueba Menu 2 - true en caso de que el menu sea adecuado" do
      arrayGastos = @arrayPacientes.collect { |paciente| paciente.gastoEnergeticoTotal }
      aporteMenu2 = (@arrayMenu2.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
      porcentajeMenu2 = aporteMenu2 * 0.1
      arrayCorrespondencia = arrayGastos.collect { |gastoEnergetico| gastoEnergetico.between?(aporteMenu2 - porcentajeMenu2, aporteMenu2 + porcentajeMenu2)}
      expect(@arrayPacientes.zip(arrayCorrespondencia)).to eq([[@paciente1, false], [@paciente2, false], [@paciente3, false], [@paciente4, false], [@paciente5, true]])
    end
    it "Prueba Menu 3 - true en caso de que el menu sea adecuado" do
      arrayGastos = @arrayPacientes.collect { |paciente| paciente.gastoEnergeticoTotal }
      aporteMenu3 = (@arrayMenu3.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
      porcentajeMenu3 = aporteMenu3 * 0.1
      arrayCorrespondencia = arrayGastos.collect { |gastoEnergetico| gastoEnergetico.between?(aporteMenu3 - porcentajeMenu3, aporteMenu3 + porcentajeMenu3)}
      expect(@arrayPacientes.zip(arrayCorrespondencia)).to eq([[@paciente1, true], [@paciente2, false], [@paciente3, true], [@paciente4, false], [@paciente5, false]])
    end
    it "Prueba Menu 4 - true en caso de que el menu sea adecuado" do
      arrayGastos = @arrayPacientes.collect { |paciente| paciente.gastoEnergeticoTotal }
      aporteMenu4 = (@arrayMenu4.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
      porcentajeMenu4 = aporteMenu4 * 0.1
      arrayCorrespondencia = arrayGastos.collect { |gastoEnergetico| gastoEnergetico.between?(aporteMenu4 - porcentajeMenu4, aporteMenu4 + porcentajeMenu4)}
      expect(@arrayPacientes.zip(arrayCorrespondencia)).to eq([[@paciente1, false], [@paciente2, true], [@paciente3, false], [@paciente4, false], [@paciente5, false]])
    end
    it "Prueba Menu 5 - true en caso de que el menu sea adecuado" do
      arrayGastos = @arrayPacientes.collect { |paciente| paciente.gastoEnergeticoTotal }
      aporteMenu5 = (@arrayMenu5.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)
      porcentajeMenu5 = aporteMenu5 * 0.1
      arrayCorrespondencia = arrayGastos.collect { |gastoEnergetico| gastoEnergetico.between?(aporteMenu5 - porcentajeMenu5, aporteMenu5 + porcentajeMenu5)}
      expect(@arrayPacientes.zip(arrayCorrespondencia)).to eq([[@paciente1, false], [@paciente2, false], [@paciente3, false], [@paciente4, true], [@paciente5, false]])
    end
  end
  
  #############################################################
  # Pruebas practica 11 - Programacion Funcional - Benchmarks #
  #############################################################
  
  Benchmark.bm do |benchmark|
    benchmark.report ("for:") do
      describe "Orden por for" do
        it "La lista de pacientes se ordena usando el metodo con bucle for" do
          arrayOrdenado = @listaPacientes2.ordenFor()
          expect(arrayOrdenado).to eq([@paciente2, @paciente10, @paciente8, @paciente9, @paciente4, @paciente6, @paciente5, @paciente1, @paciente7, @paciente3])
          #puts arrayOrdenado.collect { |paciente| paciente.gastoEnergeticoTotal}
        end
        it "El array de menus se ordena usando el metodo con bucle for" do
          arrayOrdenado = ordenForMenus(@arrayMenus)
          expect(arrayOrdenado).to eq([@arrayMenu8, @arrayMenu1, @arrayMenu10, @arrayMenu4, @arrayMenu5, @arrayMenu9, @arrayMenu7, @arrayMenu6, @arrayMenu2, @arrayMenu3])
          #puts arrayOrdenado.collect { |menu| (menu.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+) }
        end
      end
    end
    
    benchmark.report ("each:") do
      describe "Orden por each" do
        it "La lista de pacientes se ordena usando el metodo each" do
          arrayOrdenado = @listaPacientes2.ordenEach()
          expect(arrayOrdenado).to eq([@paciente2, @paciente10, @paciente8, @paciente9, @paciente4, @paciente6, @paciente5, @paciente1, @paciente7, @paciente3])
          #puts arrayOrdenado.collect { |paciente| paciente.gastoEnergeticoTotal}
        end
        it "El array de menus se ordena usando el metodo each" do
          arrayOrdenado = ordenEachMenus(@arrayMenus)
          expect(arrayOrdenado).to eq([@arrayMenu8, @arrayMenu1, @arrayMenu10, @arrayMenu4, @arrayMenu5, @arrayMenu9, @arrayMenu7, @arrayMenu6, @arrayMenu2, @arrayMenu3])
          #puts arrayOrdenado.collect { |menu| (menu.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+) }
        end
      end
    end
    
    benchmark.report ("sort:") do
      describe "Orden por sort" do
        it "La lista de pacientes se ordena usando el metodo sort" do
          arrayOrdenado = @listaPacientes2.sort()
          expect(arrayOrdenado).to eq([@paciente2, @paciente10, @paciente8, @paciente9, @paciente4, @paciente6, @paciente5, @paciente1, @paciente7, @paciente3])
          #puts arrayOrdenado.collect { |paciente| paciente.gastoEnergeticoTotal}
        end
        it "El array de menus se ordena usando el metodo sort" do
          arrayOrdenado = @arrayMenus.sort_by { |menu| (menu.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+)}
          expect(arrayOrdenado).to eq([@arrayMenu8, @arrayMenu1, @arrayMenu10, @arrayMenu4, @arrayMenu5, @arrayMenu9, @arrayMenu7, @arrayMenu6, @arrayMenu2, @arrayMenu3])
          #puts arrayOrdenado.collect { |menu| (menu.collect { |alimento| alimento.valorEnergeticoKcal}).reduce(:+) }
        end
      end
    end
  end
end