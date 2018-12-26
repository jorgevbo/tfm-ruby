class MoodleMigrator
  def self.start
    CompetencyFramework.migrate
    Competency.migrate

    Course.migrate    
  end

  def self.clean
    Assignment.destroy_all
    Course.destroy_all
    Competency.destroy_all
    CompetencyFramework.destroy_all
  end
end
