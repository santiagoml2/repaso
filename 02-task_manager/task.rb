class Task
  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def self.find(id)
    result = DB.execute('SELECT * FROM tasks WHERE id = ?', id).first
    result.nil? ? nil : build_task(result)
  end

  def self.build_task(result)
    Task.new(
      id: result['id'],
      title: result['title'],
      description: result['description'],
      done: result['done'] == 1
    )
  end

  def save
    DB.execute('INSERT INTO tasks (id, title, description, done)
      VALUES(?,?,?,?)', @id, @title, @description, @done ? 1 : 0)
      @id = DB.last_insert_row_id
  end
end
