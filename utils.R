findFile = function(regex){

	list = list.files()
    return(unique(list[grepl(regex, list, ignore.case = T)]))
  }