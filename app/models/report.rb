class Report

  def self.qualification_by_student(student = nil)
    return [] if student.nil?

    # Obtener las notas del alunno dado
    student_grades = student.grades

    # Proyectar solo el campo score
    student_assignment_score = {}
    student_grades.each do |i|
      student_assignment_score[i.assignment_id] = i.score.to_f
    end

    # Obtener los IDs de assignments con notas del estudiante
    student_grades_assignment_ids = student_assignment_score.keys

    # Obtener todas las tareas asociadas a un CompetencyFramework
    all_competency_frameworks = []
    CompetencyFramework.find_each do |cf|
      all_competency_frameworks << {
        object: cf,
        assignments: cf.assignments.uniq
      }
    end

    # Purgar y filtrar usando solo las notas obtenidas por el alumno
    competency_framework_grades = {}
    all_competency_frameworks.each do |cf|

      # Objeto auxiliar para contabilizar y agrupar las notas
      competency_framework_grades[cf[:object].id] = {
        competency_framework_id: cf[:object].id,
        competency_framework_name: cf[:object].name,
        score_sum: 0.0,
        score_count: 0
      }

      # Solo calcular CompetencyFrameworks que tengan tareas asociadas
      if !cf[:assignments].empty?
        # Obtener solo las tareas del estudiante
        found_assignments = cf[:assignments].select {|a| student_grades_assignment_ids.include? a.id }

        # Usar las tareas encontradas para realizar calculos
        found_assignments.each do |found|
          competency_framework_grades[cf[:object].id][:score_count] += 1
          competency_framework_grades[cf[:object].id][:score_sum] += student_assignment_score[found.id]
        end
      end
    end

    competency_framework_grades
  end
end


#A = [5, 5, 10, 10] = [3]
#B = [10, 10, 5, 5] = [1]
#C = [0, 0, 10, 10] = [3]


# F = [1, 0, 2, 0]


# 1 = 1
# 2 = 0
# 3 = 2