class MoodleMigrator

  def self.start
    self.clean
    self.migrate
  end

  def self.migrate
    CompetencyFramework.migrate
    Competency.migrate

    Course.migrate    
  end

  def self.clean
    Student.destroy_all
    Assignment.destroy_all
    Course.destroy_all
    Competency.destroy_all
    CompetencyFramework.destroy_all
  end
end
