class MoodleMigrator
  def self.start
    CompetencyFramework.migrate
    Competency.migrate

    Course.migrate
    
  end

  def self.clean
  end

  def self.test(params = {})
    Moodle::Api.tool_lp_data_for_course_competencies_page(params)
  end
end