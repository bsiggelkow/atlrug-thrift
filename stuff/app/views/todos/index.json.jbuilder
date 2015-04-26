json.array!(@todos) do |todo|
  json.extract! todo, :id, :name, :description, :due_by, :completed
  json.url todo_url(todo, format: :json)
end
