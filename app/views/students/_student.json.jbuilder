json.extract! student, :id, :name, :email, :grade_level, :created_at, :updated_at
json.url student_url(student, format: :json)
