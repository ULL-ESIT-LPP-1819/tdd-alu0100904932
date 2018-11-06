task :default => :spec

desc "Ejecutar las espectativas de la clase InformacionNutricional"
task :spec do
  sh "rspec -I. spec/prct06_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
  sh "rspec -I. spec/prct06_spec.rb --format documentation"
end
