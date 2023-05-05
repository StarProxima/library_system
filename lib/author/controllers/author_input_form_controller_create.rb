# frozen_string_literal: true

require 'win32api'

class AuthorInputFormControllerCreate
  def initialize(parent_controller)
    @parent_controller = parent_controller
    @author_rep = AuthorDBDataSource.new
  end

  def set_view(view)
    @view = view
  end

  def on_view_created
    # begin
    #   @student_rep = StudentRepository.new(DBSourceAdapter.new)
    # rescue Mysql2::Error::ConnectionError
    #   on_db_conn_error
    # end
  end

  def process_fields(fields)
    begin
      first_name = fields.delete(:first_name)
      last_name = fields.delete(:last_name)

      return if  first_name.nil? || last_name.nil?

      item = Author.new(-1, first_name, last_name)
      @author_rep.add(item)
      @view.close
    rescue ArgumentError => e
      api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
      api.call(0, e.message, 'Error', 0)
    end
  end

  private

  def on_db_conn_error
    api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
    api.call(0, "No connection to DB", "Error", 0)
    @view.close
  end
end
