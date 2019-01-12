class Empresa < ApplicationRecord
  has_many :fcts

  def self.con_disponibilidad(competency_framework_name = '')
    empresas = Empresa.where(actividad: competency_framework_name)
    resultados = []
    empresas.find_each do |empresa|
      if empresa.cupos_disponibles > 0
        resultados << empresa
      end
    end
    resultados
  end

  def cupos_disponibles
    self.numeroalumnos - self.fcts.count
  end

  def tiene_cupos?
    self.fcts.count < self.numeroalumnos
  end
end
