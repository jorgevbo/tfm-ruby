class MoodleMigrator
  def self.start
    CompetencyFramework.migrate
    Competency.migrate

    Course.migrate
    
  end

  def self.clean
  end
end