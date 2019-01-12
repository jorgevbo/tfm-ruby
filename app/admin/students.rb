ActiveAdmin.register Student do
  actions :index, :show

  filter :firstname, label: 'Nombres'
  filter :lastname, label: 'Apellidos'
  filter :moodle_id, label: 'ID Moodle'
  filter :courses, label: 'Curso'

  index do
    id_column
    column 'Nombres', :firstname
    column 'Apellidos', :lastname
    column 'ID Moodle', :moodle_id
    actions do |item|
      item 'Reporte', report_admin_student_path(item)
    end
  end

  member_action :report, method: :get do
    report_result = Report.qualification_by_student(resource)

    ap report_result

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Competencias por alumno")
      names = []
      scores = []
      report_result.each do |key, item|
        names << item[:competency_framework_name]
        if item[:score_count] != 0
          scores << (item[:score_sum] / item[:score_count]).round(2)
        else
          scores << 0
        end
      end

      f.xAxis(categories: names)
      f.series(name: "Promedio de notas", yAxis: 0, data: scores)
       
      f.yAxis [
        {title: {text: "Promedio de notas", margin: 70} }
      ]
    
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'horizontal')
      f.chart({defaultSeriesType: "column"})
    end
  end
end
