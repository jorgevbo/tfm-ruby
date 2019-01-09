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
    @result = Report.qualification_by_student(resource)

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Este es el titulo del grafico")
      f.xAxis(categories: ["A", "B", "C", "D", "E"])
      f.series(name: "Cantidad de números C", yAxis: 0, data: [100, 200, 50, 150, 75])
    
    
      f.yAxis [
        {title: {text: "GDP in Billions", margin: 70} },
        {title: {text: "Population in Millions"}, opposite: true},
      ]
    
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'horizontal')
      f.chart({defaultSeriesType: "column"})
    end
  end
end
