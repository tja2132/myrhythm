class Routine < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :completions, dependent: :destroy
  validates :title, presence: true

  def self.all_recurrence
    ['Daily', 'Weekly', 'None']
  end

  # three day abbreviations consistent with strftime("%a")
  def self.get_full_days_of_week()
     ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end

  def self.get_short_days_of_week()
    ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  end

  def self.get_tags()
    ['work', 'school', 'home']
  end

  def self.get_routine_recurrence(routine)

    alldaysofweek = Routine.get_short_days_of_week()
    alldaysofweek = alldaysofweek.map { |day| day.downcase }
    days = Routine.where(id: routine.id).pick(alldaysofweek)
    days_str = days.join(',')

    if !days_str.include?("false")
      return "Daily"
    elsif days_str.include?("true") and days_str.include?("false")
      return "Weekly"
    else
      "None"
    end
  end

  def self.get_routine_days_of_week_short_str(routine)

    alldaysofweek = Routine.get_short_days_of_week()
    alldaysofweek = alldaysofweek.map { |day| day.downcase }
    
    daysofweek = []
    alldaysofweek.each do |day| 
      if routine.read_attribute(day)
        daysofweek.append(day.capitalize)
      end
    end

    return daysofweek.join(', ')

  end

  def self.get_routine_days_of_week_short_list(routine)

    alldaysofweek = Routine.get_short_days_of_week()
    alldaysofweek = alldaysofweek.map { |day| day.downcase }
    
    daysofweek = []
    alldaysofweek.each do |day| 
      if routine.read_attribute(day)
        daysofweek.append(day.capitalize)
      end
    end

    return daysofweek

  end

  def self.get_tag_str(routine)

    tags = Routine.get_tags()
    tags = tags.map { |tag| tag.downcase }

    selectedTags = []
    tags.each do |tag|
      if routine.read_attribute(tag)
        selectedTags.append(tag.capitalize)
      end
    end

    return selectedTags.join(', ')

  end

  def self.total_duration(routine)
    total_duration = 0
    tasks = routine.tasks
    if !tasks.nil? and tasks.size > 0
      tasks.each do | task |
        if task.duration?
          total_duration += task.duration
        end
      end
    end
    return total_duration
  end

  def self.end_time(routine)
    unless routine.start_time.nil?
      return routine.start_time + Routine.total_duration(routine).minutes
    end
  end

  def self.with_tags(tag_list)
    if tag_list.empty?
      return Routine.where(:is_public => true)
    else
      routines_with_tags = []
      tag_list.each do |tag|
        routines_with_tags.concat(Routine.where("#{tag} = true AND is_public = true"))
      end
      return routines_with_tags
    end
  end

  def self.with_recurrence(routines, recurrence_list)
    if recurrence_list.empty?
      return Routine.where(:is_public => true)
    else
      routines_with_recurrence = []
      routines.each do |routine_select|
        recurrence_val = Routine.get_routine_recurrence(routine_select)
        if recurrence_list.include?(recurrence_val)
          routines_with_recurrence.concat(Routine.where(id: routine_select.id))
        end
      end
      return routines_with_recurrence
    end
  end

end
