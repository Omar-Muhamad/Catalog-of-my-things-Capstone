require_relative '../classes/label'

module LabelModule
  def list_all_labels(labels)
    if labels.length.zero?
      puts 'No labels found!'
    else
      labels.each do |label|
        puts "[#{label.id}]- Title: #{label.title}, color: #{label.color}"
      end
    end
  end

  def add_labels(labels)
    labels_names = [{title: 'Test', color: 'red'}, 
      {title: 'Test2', color: 'black'}, 
      {title: 'Test3', color: 'green'}]
      labels_names.each_with_index do |label, index|
      labels << Label.new(label[:title], label[:color], index)
    end
  end
end