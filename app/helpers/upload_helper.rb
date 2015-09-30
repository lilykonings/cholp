module UploadHelper

  UPLOADS_FOLDER = 'public'

  # writes file to rails project directory
  # returns path to uploaded file
  def write(directory, file)

    dir = Rails.root.join(UPLOADS_FOLDER, directory)
    unless File.directory? dir
      FileUtils::mkdir_p dir
    end

    path = Rails.root.join(UPLOADS_FOLDER, directory, file.original_filename)
    File.open(path, 'wb') do |f|
      f.write(file.read)
    end

    return '/' + directory + '/' + file.original_filename

  end

  # uploads file to creator directory with
  # file_name as the new file name
  def creator_upload(username, file_name, file)
    dir = "creators/#{username}"
    file.original_filename = file_name + (File.extname file.original_filename)
    return write(dir, file)
  end

  # uploads file to print directory with
  # file_name as the new file name
  def print_upload(id, file_name, file)
    dir = "prints/#{id}"
    file.original_filename = file_name + (File.extname file.original_filename)
    return write(dir, file)
  end

  # uploads file to home_features directory with
  # id as the new file name
  def feature_upload(id, file)
    dir = "home_features"
    file.original_filename = id.to_s + (File.extname file.original_filename)
    return write(dir, file)
  end

  def upload(p = nil)

    if !(params[:name] && params[:x] && params[:y] && 
      (params[:z] && params[:materials] && params[:printers]))
      return nil
    end

    if p == nil
      p = Print.create(name: params[:name],
                       description: params[:p][:description],
                       price: params[:price],
                       min_x: params[:x],
                       min_y: params[:y],
                       min_z: params[:z],
                       materials: params[:materials].map(&:inspect).join(', '),
                       color_supported: params[:p][:color_supported],
                       recommended_printers: params[:printers].map(&:inspect).join(', '),
                       resolution: params[:resolution],
                       tolerance: params[:tolerance])
    else
      p.update(name: params[:name],
                       description: params[:p][:description],
                       price: params[:price],
                       min_x: params[:x],
                       min_y: params[:y],
                       min_z: params[:z],
                       materials: params[:materials].map(&:inspect).join(', '),
                       color_supported: params[:p][:color_supported],
                       recommended_printers: params[:printers].map(&:inspect).join(', '),
                       resolution: params[:resolution],
                       tolerance: params[:tolerance])
    end

    unless params[:stl].nil?
      path = print_upload(p.id, 'stl', params[:stl])
      p.update(path: path)
    end

    unless params[:image].nil?
      path = print_upload(p.id, 'image', params[:image])
      p.update(picture_zero: path)
    end

    unless params[:image1].nil?
      path = print_upload(p.id, 'image1', params[:image1])
      p.update(picture_one: path)
    end

    unless params[:image2].nil?
      path = print_upload(p.id, 'image2', params[:image2])
      p.update(picture_two: path)
    end

    unless params[:image3].nil?
      path = print_upload(p.id, 'image3', params[:image3])
      p.update(picture_three: path)
    end

    unless params[:image4].nil?
      path = print_upload(p.id, 'image4', params[:image4])
      p.update(picture_four: path)
    end

    unless params[:image5].nil?
      path = print_upload(p.id, 'image5', params[:image5])
      p.update(picture_five: path)
    end

    return p
  end
end
