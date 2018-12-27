class MoodleMigrator

  def self.start
    self.clean
    self.migrate
  end

  def self.migrate
    CompetencyFramework.migrate
    Competency.migrate
    Course.migrate
    Assignment.migrate_grades
  end

  def self.clean
    Grade.destroy_all
    Student.destroy_all
    Assignment.destroy_all
    Course.destroy_all
    Competency.destroy_all
    CompetencyFramework.destroy_all
  end
end
