class Report

  def self.qualification_by_student(student = nil)
    return [] if student.nil?

    # Obtener las notas del alunno dado
    notas = student.grades

    # Obtener todas las tareas asociadas a un framework
    hash = {}
    CompetencyFramework.find_each do |cf|
      hash[cf.name] = cf.assignments
    end

    hash
  end
end