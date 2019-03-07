.test_n3d <- function(n3d) {
  if(missing(n3d))
    stop("missing n3d", call. = FALSE)

  if(!inherits(n3d, "n3d"))
    stop("n3d must be an object of class n3d", call. = FALSE)
}

.text_proxy <- function(proxy){
  if(missing(proxy))
    stop("missing proxy", call. = FALSE)
  if(!inherits(proxy, "n3dProxy"))
    stop("proxy must be of class n3dProxy", call. = FALSE)
}

.get_n3d_opts <- function(x){
  opt <- getOption(x)
  if(is.null(opt))
    stop(paste("Invalid option:", x), call. = FALSE)
}

.select_as_list <- function(data, ...){
  row.names(data) <- NULL 
  data %>% 
    select(...) %>% 
    apply(1, as.list)
}