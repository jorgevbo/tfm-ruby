class Course < ApplicationRecord
  has_and_belongs_to_many :competencies
  has_many :assignments

  def self.migrate
    courses = Api::Course.all

    courses.each do |item|
      c = Course.find_or_initialize_by(moodle_id: item['id'].to_s)
      c.moodle_id = item['id']
      c.moodle_shortname = item['shortname']
      c.moodle_fullname = item['fullname']
      c.name = item['displayname']
      c.startdate = Time.at(item['startdate'].to_i).to_datetime
      c.enddate = Time.at(item['enddate'].to_i).to_datetime

      c.save
    end

    # Asociar las competencias migradas
    Course.find_each do |course|
      course.associate_competencies
    end
  end

  def migrate_assignments
    moodle_assignments = Api::Assignment.by_course(moodle_id)
    moodle_assignments.each do |item|
      a = Assignment.find_or_initialize_by(moodle_id: item['id'].to_s)
      a.moodle_id = item['id'].to_s
      a.name = item['name'].to_s
      a.duedate = Time.at(item['duedate'].to_i).to_datetime

      # Agregar las referencias aqui
      a.course = self
      # @todo: Terminar referencias

      ap a
    end
  end

  def associate_competencies
    moodle_competencies = Api::Course.competencies(moodle_id)
    moodle_competencies.each do |item|
      c = Competency.find_by(moodle_id: item['competency']['id'].to_s)
      unless c.nil?
        competencies << c
      end
    end
    self.save
  end
end
