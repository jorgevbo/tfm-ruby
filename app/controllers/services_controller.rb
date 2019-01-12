class ServicesController < ApplicationController

  def asignar_empresa
    student_id = params[:student_id]
    empresa_id = params[:empresa_id]

    student = Student.find(student_id)
    empresa = Empresa.find(empresa_id)

    fct = nil
    if !student.fct?
      fct = Fct.create(student_moodle_id: student.moodle_id, empresa: empresa)
    end

    render json: { result: fct }
  end
end
