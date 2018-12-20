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
  end

  def migrate_assignments
    assignments = Api::Assignment.by_course(moodle_id)
    assignments.each do |item|
      a = Assignment.find_or_initialize_by(moodle_id: item['id'].to_s)
      a.moodle_id = item['id'].to_s
      a.name = item['name'].to_s
      a.duedate = Time.at(item['duedate'].to_i).to_datetime

      # Agregar las referencias aqui
      a.course = self

      ap a
    end
  end
end
