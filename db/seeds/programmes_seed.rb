class ProgrammesSeed
  def self.create_programmes
    programmes = ["Ruby", "Javascript", "HTML", "CSS", "Ruby on Rails", "React", "Sidekiq", "Hotwire (Turbo / Stimulus)",
                  "PostgreSQL", "Redis", "GitHub", "Honeybadger", "JIRA", "Figma", "Adobe Photoshop", "Adobe Illustrator" ]
    programmes.each do |name|
      if Programme.find_by(name:).blank?
        Programme.create!(name:)
        print "\nProgramme: #{name}\n"
      end
    end
  end
end
