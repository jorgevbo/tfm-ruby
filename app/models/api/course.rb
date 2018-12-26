module Api
  class Course

    # Funcion para llamar a la API core_course_get_courses
    # 
    # Ej: params = { options: [{ ids: [1, 2, 3] }] }
    # 
    # @param params Hash
    # - :options Array[Object] Object con formato { ids: Array[Integer] }
    def self.all(params = {})
      Moodle::Api.core_course_get_courses(params)
    end

    # Llamada a función API core_competency_list_course_competencies
    # 
    # @param moodle_course_id Integer ID del curso del cual obtener las Competencias asociadas
    # @return Array[Object]
    def self.competencies(moodle_course_id = 0)
      Moodle::Api.core_competency_list_course_competencies({ id: moodle_course_id.to_i })
    end

    # Llamada a función API tool_lp_data_for_course_competencies_page para obtener información
    # adicional sobre las asociaciones con competencias y tareas
    # 
    # @param moodle_course_id Integer ID del curso del cual se obtendra información
    # @return Array[Object]
    def self.detailed_competencies(moodle_course_id = 0)
      begin
        result = Moodle::Api.tool_lp_data_for_course_competencies_page({ courseid: moodle_course_id.to_i })
        result['competencies']
      rescue
        []
      end
    end
  end
end