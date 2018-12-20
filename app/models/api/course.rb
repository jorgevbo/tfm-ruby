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
  end
end