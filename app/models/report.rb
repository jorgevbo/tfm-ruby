class Report

  def self.qualification_by_student(student = nil)
    return [] if student.nil?

    # Obtener las notas del alunno dado
    notas = student.grades

    # Obtener todas las tareas asociadas a un framework
    competency_hash = {}
    CompetencyFramework.find_each do |cf|
      competency_hash[cf.id] = cf.assignments.uniq
    end

    notas.each do |nota|

    end


    [student.grades, hash]
  end
end


#A = [5, 5, 10, 10] = [3]
#B = [10, 10, 5, 5] = [1]
#C = [0, 0, 10, 10] = [3]


# F = [1, 0, 2, 0]


# 1 = 1
# 2 = 0
# 3 = 2