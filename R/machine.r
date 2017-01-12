#' machine
#' 
#' Remote machine configuration settings. 
#' 
#' @param exec.type
#' either "ssh" or "plink" in character. Windows will force to use "plink".
#' @param args
#' further arguments to "ssh" or "plink" for connecting to the server
#' in addition to port, user id, and host name.
#' @param pport
#' ssh port opened on the server.
#' @param user
#' user id for logging to the server.
#' @param hostname
#' the server ip or host name.
#' @param priv.key,priv.key.ppk
#' location of the private key for user authentication, the file will be
#' checked first then \code{-i priv.key} will be added to \code{args}
#' when the file exists.
#' \code{priv.key.ppk} is only used when \code{plink} is called.
#' 
#' @return
#' An object of class \code{machine}.
#' 
#' @name machine
#' @export
machine <- function(user, hostname, exec.type = .pbd_env$RPC.LI$exec.type,
  args = .pbd_env$RPC.LI$args, pport = .pbd_env$RPC.LI$pport,
  # user = .pbd_env$RPC.LI$user, hostname = .pbd_env$RPC.LI$hostname,
  priv.key = .pbd_env$RPC.LI$priv.key,
  priv.key.ppk = .pbd_env$RPC.LI$priv.key.ppk)
{
  m <- list(args=args, pport=pport, user=user, hostname=hostname, priv.key=priv.key, priv.key.ppk=priv.key.ppk)
  class(m) <- "machine"
  return(m)
}

check.is.machine <- function(machine)
{
  if (!inherits(machine, "machine"))
    stop("argument 'machine' seemingly not generated via call to machine()")
}



#' @title print-machine
#' @description Printing for machine class objects.
#' @param x machine class object
#' @param ... ignored
#' @rdname print-machine
#' @name print-machine
#' @method print machine
#' @export
print.machine <- function(x, ...)
{
  cat(paste0("Machine config for ", x$user, "@", x$hostname, "\n"))
  cat(paste0("    pport = ", x$pport, "\n"))
  cat(paste0("    type = ", x$exec.type, "\n"))
  cat(paste0("    args = \"", x$args, "\"\n"))
  cat(paste0("    priv.key = ", x$priv.key, "\n"))
  cat(paste0("    priv.key.ppk = ", x$priv.key.ppk, "\n"))
}