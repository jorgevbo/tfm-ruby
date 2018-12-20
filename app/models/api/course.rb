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
  end
end