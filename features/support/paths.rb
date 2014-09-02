def path_to(page_name)
  case page_name

  when /home page/
    root_path
  else
    begin
      send("#{page_name}_path")
    rescue
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end
